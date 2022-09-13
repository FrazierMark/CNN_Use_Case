//
//  NewsEventDetails.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//

import SwiftUI
import AEPCore
import AEPAssurance
import AEPEdgeConsent
import AEPEdge

struct DetailView: View {
    var item: NewsEvent
    @State private var assuranceSessionUrl: String = "sampleappmarkdeeplink://default?adb_validation_sessionid=b13d7462-7cdb-41b2-a3dd-5ca8ae05cccf"
    @State private var isZooming = false
    @State private var isPresented = false

    // set this property to forward the product reviews to your dataset
    private let PRODUCT_REVIEW_DATASET_ID = "5"

    // set this property to your org as shown in your custom product reviews schema
    private let TENANT_ID = "_aemonacpprodcampaign"

    /// Email address as string,  used as the product reviewer identifier
    @State private var reviewerEmail: String = "TEST@TEST.com"

    /// Product rating as integer from 1 to 5
    @State private var reviewRating: Int = 5


    var body: some View {
        ScrollView {
            VStack {
                Image("\(item.id)_100w")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .overlay {
                    Text(item.name)
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding()
                }

                    .onTapGesture {
                    self.isZooming.toggle()
                    WKInterfaceDevice.current().play(.click)
                }
                    .sheet(isPresented: $isZooming, content: {
                    ZoomView(item: item)
                })

                ScrollView {
                    Text(item.description)
                        .font(.system(size: 15))
                }

                SaveButton(action: {

                    let event = Event(name: "Save Article For Later", type: "type", source: "source", data: ["platform": "watchOS"])
                    MobileCore.dispatch(event: event)
                    self.sendShareArticleXDMEvent()

                })
                Button(action: {
                    WKInterfaceDevice.current().play(.success)
                    let event = Event(name: "Share Article Event", type: "type", source: "source", data: ["platform": "watchOS"])
                    MobileCore.dispatch(event: event)
                }) {
                    Text("Share")
                }
            }.navigationBarTitle(item.name)

            VStack {
                Text("MORE ON YOUR IPHONE")
                    .font(.system(size: 11))
                    .multilineTextAlignment(.center)
                Divider()
                Spacer()
                Text("CNN - The full article")
                    .font(.system(size: 12))
                Spacer()
                    .frame(height: 50)
            }
            VStack {
                Button(action: { self.isPresented = true
                    callAssurance(pin: "3860")
                }) {
                    Text("Assurance - Connect")
                        .fontWeight(.light)
                        .font(.system(size: 11))
                }.sheet(isPresented: $isPresented) {
                    SettingsView()
                }
                Button("Set default collect consent = y") {
                    let defaultsConsents = ["collect": ["val": "y"]]
                    let defaultConsent = ["consent.default": ["consents": defaultsConsents]]
                    MobileCore.updateConfigurationWith(configDict: defaultConsent)
                }.font(.system(size: 11, weight: .light))
            }
        }
    }
    func callAssurance(pin: String) {
        if let url = URL(string: self.assuranceSessionUrl) {
            Assurance.startSession(url: url, pin: pin)
        }
    }


    /// Build a review event using a standard Dictionary datatype and send to the Adobe Experience Edge.
    /// Remember to tell Edge where the data should land by overriding the dataset ID
    func sendShareArticleXDMEvent() {
        print("Sending XDM share article event")
        var xdmData: [String: Any] = [:]

        // 1. Add Email to the IdentityMap.
        // Note: this app does not implement a logging system, so authenticatedState ambiguous is used
        // in this case. The other authenticatedState values are: authenticated, loggedOut
        xdmData["identityMap"] = ["Email": [["id": reviewerEmail,
            "authenticatedState": "ambiguous"]]]

        // 2. Add product review details in the custom mixin
        // Note: set the TENANT_ID as specified in the Product Reviews Schema in Adobe Experience Platform
        let articleInfo = "Article SKU"
        let reviewText = "Article Text"

        xdmData[TENANT_ID] = ["productSku": articleInfo,
            "rating": reviewRating,
            "reviewText": reviewText,
            "reviewerId": reviewerEmail]

        // 3. Send the XDM data using the Edge extension, by specifying Product Reviews Dataset identifiers as
        // shown in Adobe Experience Platform
        // Note: the Dataset identifier specified at Event level overrides the Experience Event Dataset specified in the
        // Edge configuration in Adobe Launch
        let eventType = "product.review"
        xdmData["eventType"] = eventType
        let experienceEvent = ExperienceEvent(xdm: xdmData)
        Edge.sendEvent(experienceEvent: experienceEvent)
    }


}




