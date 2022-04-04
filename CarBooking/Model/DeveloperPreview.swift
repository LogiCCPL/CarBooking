//
//  DeveloperPreview.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 01.04.22.
//

import Foundation

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let viewModel = CarViewModel()
    
    let car = Car(id: 1, name: "intive_Kupferwerk 1", shortDescription: "Limousine with 5 Seats")
    
    let carList: [Car] = [
        Car(id: 1, name: "intive_Kupferwerk 1", shortDescription: "Limousine with 5 Seats"),
        Car(id: 1, name: "intive_Kupferwerk 1", shortDescription: "Limousine with 5 Seats"),
        Car(id: 1, name: "intive_Kupferwerk 1", shortDescription: "Limousine with 5 Seats"),
        Car(id: 1, name: "intive_Kupferwerk 1", shortDescription: "Limousine with 5 Seats")
    ]
    
    let carDetail = CarDetail(
        id: 1,
        name: "intive_Kupferwerk",
        shortDescription: "Limousine with 5 Seats",
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        image: "http://job-applicants-dummy-api.kupferwerk.net.s3.amazonaws.com/api/images/automotive.jpg")
}

/*
 
 "id" : 1,
   "name" : "intive_Kupferwerk 1",
   "shortDescription" : "Limousine with 5 Seats",
   "description" : "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
   "image" : "images/automotive.jpg"
 
 */
