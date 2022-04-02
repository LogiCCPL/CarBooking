//
//  CarList.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 01.04.22.
//

import SwiftUI

struct CarList: View {
    @EnvironmentObject var viewModel: CarViewModel
    var body: some View {
        List{
            ForEach(viewModel.cars, id: \.self) { car in
                VStack{
                    Text("\(car.name)")
                        .bold()
                        .foregroundColor(Color.theme.accent)
                    Text("\(car.shortDescription ?? "")")
                        .foregroundColor(Color.theme.secondary)
                }
            }
        }
        .listStyle(PlainListStyle())
        .onAppear {
            viewModel.fetchCars()
        }
    }
}

struct CarList_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
