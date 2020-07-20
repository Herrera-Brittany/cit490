//
//  Members.swift
//  GoToTheTemple
//
//  Created by owner on 7/13/20.
//  Copyright © 2020 owner. All rights reserved.
//
import SwiftUI
import Foundation
import UIKit
import Combine

struct Member : Identifiable {
var showhelpMemberOnly = false
//var member = memberData
var id = UUID()
var name: String
var city: String
var state: String
var ward: String
var details: String
//var templeDate = Date()
//var pickerDate = Date()
var templeDate = Date()
var needsCarride: Bool = false
var needsChildcare: Bool = false
var helpMember: Bool = false
var imageName: String { return name }
var thumbnailName: String { return name + "Thumb" }
//var date: Date
// var information: String
var calendar = Calendar.current
var dateComponents = DateComponents()
//   static let dateFormatter: DateFormatter = {
// let dateFormatter = DateFormatter()
//return dateFormatter }()
}

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}
//var selectedDate = Date()

#if DEBUG
let testData = [
    
    Member(name: "Henry", city: "Austin", state: "Texas", ward: "Hill Country ward", details: "Henry needs a car ride to the San Antonio Temple on: August 28th, 2020", templeDate: Date(), needsCarride: true, needsChildcare: false, helpMember: true),
    Member(name: "The Smith Family", city: "Houston", state: "Texas", ward: "Katy ward", details: "The Smith Family needs a car ride & childcare to attend the Houston Temple on: July 29, 2020 ", templeDate: Date(), needsCarride : true, needsChildcare: true, helpMember: true),
    Member(name: "Abe", city: "Houston", state: "Texas", ward: "Galveston ward", details: "Abe needs a car ride to attend the Houston Temple on: September 12, 2020", templeDate: Date(), needsCarride: true, needsChildcare: false, helpMember: true),
    Member(name: "Sally", city: "Austin", state: "Texas", ward: "Barton Creek ward", details: "Sally needs a car ride & childcare to attend the San Antontio Temple on: November 10, 2020", templeDate: Date(), needsCarride: true,  needsChildcare: true, helpMember: true),
    Member(name: "Tom", city: "Dallas", state: "Texas", ward: "Hillsboro ward", details: "Tom needs childcare to attend the Dallas Temple on: August 30, 2020", templeDate: Date(), needsCarride: false, needsChildcare: true, helpMember: false),
    Member(name: "Martha", city: "Dallas", state: "Texas", ward: "Dallas ward", details: "Martha needs childcare to attend the Dallas Temple on: July 19, 2020", templeDate: Date(), needsCarride: false, needsChildcare: true, helpMember: false),
    Member(name: "Harold", city: "Austin", state: "Texas", ward: "Hill Country ward",details: "Harold needs a car ride to attend the San Antonio temple on: August 5, 2020", templeDate: Date(), needsCarride: true, needsChildcare: false, helpMember: true),
    Member(name: "The Sanchez Family", city: "Dallas", state: "Texas", ward: "Plum Creek ward", details: "The Sanchez Family needs a car ride to attend the temple on: September 20, 2020", templeDate: Date(), needsCarride: true, needsChildcare: false, helpMember: true)
    
]
#endif

struct Member_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
