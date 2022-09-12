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
        NewsEvent(id: 4,name: "'Art has always been a reflection of the time that we live in': David LaChapelle on navigating turbulent times", description: "For photographer David LaChapelle, signs are pointing to the end of days-- the Thwaites Glacier, or 'doomsday glacier', is barely hanging on; raging fire seasons have brutalized the Amazon; and critical changes in jet streams are causing extreeme weather condidition worldwide, he said in a phone call."),
        NewsEvent(id: 5,name: "Tigrayan forces accept immediate ceaefire and AU-led peace talks with Ethiopia", description: "Forces in Ethiopia's Tigray region said they are ready to observe an immediate ceasefire and accept an African Union-led peace process to end a conflict with federal forces that has stretche over nearly two years."),
        NewsEvent(id: 6,name: "'Irresponsible': Maine officials push back after lobster is place on 'red' list.", description: "A prominent advocacy group has called on consumers to avoid lobster because of major threats to the critically endangered North Atlantic white whale, but Maine politicians are not happy about the guidance."),
        NewsEvent(id: 7,name: "3 things to watch as the House returns to Washington", description: "The House of Representatives will return to work in Washington this week following the August recess with a government shutdown deadline loomingat the end of the month and the midterms -- where a major flight is underway for control of the chamber -- fast approaching in November."),
    ]
}
