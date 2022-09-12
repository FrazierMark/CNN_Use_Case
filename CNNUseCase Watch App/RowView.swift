//
//  RowView.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//


import SwiftUI

struct RowView: View {
    var newsItem:NewsEvent
    @State private var eventZoom:Bool = false
    var body: some View {
        VStack {
            HStack {
                Image(String(format:"%i_100w",newsItem.id))
                .resizable()
                    .frame(width:eventZoom ? 60 : 30,height:eventZoom ? 60: 30)
                    .onTapGesture{
                        eventZoom.toggle()
                    }
                    .animation(.interpolatingSpring(stiffness: 12, damping: 3.0))
                .scaledToFit()
                    .clipShape(Circle())
                Text(newsItem.name)
                    .font(.caption).fontWeight(.bold)
                    .minimumScaleFactor(0.85)
                Spacer()
            }
        }
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(newsItem: NewsModel.event[1])
    }
}

