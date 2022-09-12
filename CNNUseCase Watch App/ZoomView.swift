//
//  ZoomView.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//

import SwiftUI

struct ZoomView: View {
    var item:NewsEvent
    @State var width:CGFloat = 40
    
    var body: some View {
        VStack {
            Text(item.name)
            Image("\(item.id)_100w")
                .resizable()
                .scaledToFit()
                .frame(height:width)
                .cornerRadius(width * 0.15)
                .focusable(true)
                .digitalCrownRotation($width, from: 40, through: 130)
                Spacer()
        }
        .animation(.interpolatingSpring(stiffness: 10, damping: 2))
    }
}

struct ZoomView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomView(item: NewsModel.event[3])
    }
}

