//
//  Car.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 01.04.22.
//

import Foundation
struct Car: Codable, Hashable, Identifiable{
    var id: Int
    var name: String
    var shortDescription: String?
}

struct CarDetail: Codable{
    var id: Int
    var name: String
    var shortDescription: String?
    var description: String
    var image: String
}
