//
//  MenuView.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//

import SwiftUI


struct MenuView: View {

    var body: some View {
        TabView {
            ForEach(NewsModel.event) { item in
                DetailView(item: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.black)
    }
}
    
    struct MenuView_Previews: PreviewProvider {
        static var previews: some View {
            MenuView()
        }
    }

