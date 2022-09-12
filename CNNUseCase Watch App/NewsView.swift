//
//  NewsView.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//


import SwiftUI

struct NewsView: View {
    @State var selectedItem:Int!
    @State var selectedRow:Int!
    var eventItem = NewsModel.event
    var body: some View {
        GeometryReader{ geometry in
        VStack {
             Text(self.selectedItem != nil ? NewsModel.event[self.selectedItem!].name :"Pick a Pizza")
                .font(.body)
            List{
                ForEach(self.eventItem){ item in
                    NavigationLink(
                        destination:DetailView(item:item,selectedItem: self.$selectedItem, selectedRow: self.$selectedRow),
                        tag:item.id,
                        selection: self.$selectedRow
                        
                    ){
                        RowView(newsItem: item)
                            .animation(.easeInOut(duration:0.75))
                    }
//                        .onTapGesture {
//                            self.selectedItem = item.id
//                    }// tapGesture
                    .listRowPlatterColor(Color(red: 0, green: (self.selectedItem == item.id ? 0.5 : 0.3), blue: 0))
                }//foreach
                  
                
            }//list
            .listStyle(CarouselListStyle())
            
        }//Vstack
        }//GeometryReader
    }
}

struct PizzaOrderView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

