//
//  NewsModel.swift
//  CNNUseCase Watch App
//
//  Created by Mark Frazier on 9/11/22.
//

import Foundation


class SelectedItem{
    static var current = SelectedItem()
    private init(){}
    var selected:NewsEvent!
}




///A basic description of a menu item
///`name` the name of the food item
///`description` the decription of the food item
///`price` the base price for the menu item
///`rating` the rating for the menu item
struct NewsEvent:Identifiable{
    var id:Int
    var name:String
    var description:String
}

let testNewsEvent =  NewsEvent(id: 1, name: "Huli Chicken", description: "Our original Hawaiian street food pizza, with Huli Huli chicken, onions, ginger, crushed macadamia nuts, tomato sauce, and cheese on a classic crust.", price: 14.00, rating: 6)


struct NewsModel{
   static var menu:[NewsEvent] = [
        NewsEvent(id: 0,name: "Queen's corgis to live with the Duke and Duchess of York", description: "Queen Elizabeth II's corgis will live with the Duke and Duchess of York, Andrew and Sarah, a source close to the Duke of York told CNN on Sunday."),
        NewsEvent(id: 1,name: "Why major marriers are giving out free iPhones", description: "The unveiling of the latest iPhone 14 lineup earlier this week has already spurred a flurry of new promotions from wireless giants including AT&T, T-Mobile and Verizon."),
        NewsEvent(id: 2,name: "Quattro Formaggi", description: "A blend of Asiago, Parmesan, buffalo mozzarella, and Gorgonzola on a thin crust."),
        NewsEvent(id: 3,name: "Longboard", description: "A very long flatbread for vegetarians and vegans, made with olive oil, mushrooms, garlic, fresh ginger, and macadamias, sweetened with lilikoi."),
        NewsEvent(id: 4,name: "The Big Island", description: "A meaty calzone exploding like a volcano. Beef and pork combined with vegetables, pineapple, and a special \"lava sauce\" leaking out the top crater. Definitely share this one."),
        NewsEvent(id: 5,name: "Pepperoni", description: "The New York Classic version. A thin crust with pizza sauce, cheese, and pepperoni."),
        NewsEvent(id: 6,name: "Chicago Deep Dish", description: "The classic deep dish cheese pizza. 2\"Thick and filled with sauce and cheese. "),
        NewsEvent(id: 7,name: "Meat Lovers", description: "A deep dish for the carnivore. Sausage and pepperoni in the classic Chicago deep dish."),
        NewsEvent(id: 8,name: "BBQ Chicken", description: "Grilled chicken with barbecue sauce, red onions, and peppers."),
        NewsEvent(id: 9,name: "Hawaiian", description: "It may be from the mainland, but we make it our own. Pineapple, SPAM, cheese, onions, and tomato sauce on a thin crust.")
    ]
}
