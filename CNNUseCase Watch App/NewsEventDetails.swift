//
//  NewsEventDetails.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//

import SwiftUI
import AEPCore
import AEPAssurance

struct DetailView: View {
    var item:NewsEvent
    @State private var assuranceSessionUrl: String = "sampleappmarkdeeplink://default?adb_validation_sessionid=b13d7462-7cdb-41b2-a3dd-5ca8ae05cccf"
    @State private var isZooming = false
    @State private var isPresented = false

    
    var body: some View {
        ScrollView{
            VStack {
//                HStack {
//                    Text(item.name)
//                        .fontWeight(.heavy)
//                    Spacer()
//                }
                Image("\(item.id)_100w")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .overlay{
                        Text(item.name)
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .padding()
                    }
                
                    .onTapGesture{
                        self.isZooming.toggle()
                        WKInterfaceDevice.current().play(.click)
                    }
                    .sheet(isPresented: $isZooming, content:{
                        ZoomView(item:item)
                    })

                ScrollView{
                    Text(item.description)
                        .font(.system(size: 15))
                }
                
                SaveButton(action:{                    WKInterfaceDevice.current().play(.success)
                    let event = Event(name: "Save Article For Later", type: "type", source: "source", data: ["platform" : "watchOS"])
                    MobileCore.dispatch(event: event)
                    
                })
                Button(action:{
                let event = Event(name: "Share Article Event", type: "type", source: "source", data: ["platform" : "watchOS"])
                    MobileCore.dispatch(event: event)
                }){
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
        }
            Button(action:{self.isPresented = true
            callAssurance(pin: "3860")
        }){
            Text("Assurance - Connect")
                .fontWeight(.light)
                .font(.system(size: 11))
        }.sheet(isPresented:$isPresented){
            SettingsView()
        }
            Spacer()
            
            Button(action:{self.isPresented = true
        }){
            Text("Get Consent")
                .fontWeight(.light)
                .font(.system(size: 11))
        }.sheet(isPresented:$isPresented){
            ConsentView()
        }

        }
    }
    func callAssurance(pin: String) {
        if let url = URL(string: self.assuranceSessionUrl) {
            Assurance.startSession(url: url, pin: pin)
        }
    }
}
