//
//  Home.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 01.04.22.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = CarViewModel()
    var body: some View {
        NavigationView{
            CarList()
            
            
            
            
            .navigationTitle("Car Booking")
        }
        .environmentObject(viewModel)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(DeveloperPreview.instance.viewModel)
    }
}
