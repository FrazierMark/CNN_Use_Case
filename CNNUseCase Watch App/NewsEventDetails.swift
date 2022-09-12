//
//  NewsEventDetails.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//

import SwiftUI
import ClockKit

struct DetailView: View {
    var item:NewsEvent
//    @Binding var selectedItem:Int!
//    @Binding var selectedRow:Int!
    @State private var isRatingPresented = false
    @State private var isZooming = false
    
    func reloadTimeLine(){
        // let now = Date()
        let server = CLKComplicationServer.sharedInstance()
        if let active = server.activeComplications{
            for complication in active{
                server.reloadTimeline(for:complication)
            }
        }
    }
    
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Text(item.name)
                        .fontWeight(.heavy)
                    Spacer()
                }
                Image("\(item.id)_100w")
                    .cornerRadius(10)
                    .onTapGesture{
                        self.isZooming.toggle()
                        WKInterfaceDevice.current().play(.click)
                    }
                    .sheet(isPresented: $isZooming, content:{
                        ZoomView(item:item)
                    })
                SaveButton(action:{
                    reloadTimeLine()
                    WKInterfaceDevice.current().play(.success)
                  //  self.selectedItem = self.item.id
                   // self.selectedRow = nil //pop
                    
                })
                ScrollView{
                    Text(item.description)
                }
//                NavigationLink(destination:RatingsDetailView(item: item)){
//                    Text("Ratings")
//                }
                Button(action:{
                    self.isRatingPresented = true
                }){
                    Text("Ratings")
                }
            }.navigationBarTitle(item.name)
        }
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(item:NewsModel.event[2],selectedItem:.constant(2),selectedRow:.constant(2))
//    }
//}

