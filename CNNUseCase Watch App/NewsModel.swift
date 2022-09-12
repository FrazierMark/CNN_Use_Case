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


struct NewsModel{
   static var event:[NewsEvent] = [
        NewsEvent(id: 0,name: "Queen's corgis to live with the Duke and Duchess of York", description: "Queen Elizabeth II's corgis will live with the Duke and Duchess of York, Andrew and Sarah, a source close to the Duke of York told CNN on Sunday."),
        NewsEvent(id: 1,name: "Why major carriers are giving out free iPhones", description: "The unveiling of the latest iPhone 14 lineup earlier this week has already spurred a flurry of new promotions from wireless giants including AT&T, T-Mobile and Verizon."),
        NewsEvent(id: 2,name: "Border agency chief condems retreets of 'offensive' comments by ex-Trump adviser from official CBP account", description: "The head of US Customs and Border Protection on Saturday condemned several retweets from an official CBP regional Twitter account of 'offensive' tweets made earlier that day by former top advisor in the Trump administration."),
        NewsEvent(id: 3,name: "The rise and fall of a virtual rapper reignites old questions about art-- with a new twist.", description:"On its surface, the saga of FN Meka appeared to be a cautionary tale about the pitfalls of music powered by artificcial intelligence."),
        NewsEvent(id: 4,name: "The Big Island", description: "A meaty calzone exploding like a volcano. Beef and pork combined with vegetables, pineapple, and a special \"lava sauce\" leaking out the top crater. Definitely share this one."),
        NewsEvent(id: 5,name: "Pepperoni", description: "The New York Classic version. A thin crust with pizza sauce, cheese, and pepperoni."),
        NewsEvent(id: 6,name: "Chicago Deep Dish", description: "The classic deep dish cheese pizza. 2\"Thick and filled with sauce and cheese. "),
        NewsEvent(id: 7,name: "Meat Lovers", description: "A deep dish for the carnivore. Sausage and pepperoni in the classic Chicago deep dish."),
        NewsEvent(id: 8,name: "BBQ Chicken", description: "Grilled chicken with barbecue sauce, red onions, and peppers."),
        NewsEvent(id: 9,name: "Hawaiian", description: "It may be from the mainland, but we make it our own. Pineapple, SPAM, cheese, onions, and tomato sauce on a thin crust.")
    ]
}
