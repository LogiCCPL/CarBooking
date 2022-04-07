//
//  Home.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 01.04.22.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = CarViewModel()
    @StateObject private var dataController = DataController()
    var body: some View {
        TabView{
            NavigationView{
                CarList()
                
                    .navigationTitle("Available Cars")
            }
            .tabItem {
                Image(systemName: "car.fill")
                Text("Available Cars")
            }
            NavigationView{
                Text("test")
                
                    .navigationTitle("Recently Booked")
            }
            .tabItem {
                Image(systemName: "book.fill")
                Text("Recently Booked")
            }
        }
        
        .environmentObject(viewModel)
        .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(DeveloperPreview.instance.viewModel)
    }
}
