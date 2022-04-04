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
        ScrollView(showsIndicators: false){
            Spacer(minLength: 20)
            ForEach(viewModel.cars, id: \.self) { car in
                CarListRow(car: car, showDetail: $viewModel.showDetail)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
        }
        .onAppear {
            viewModel.fetchCars()
        }
        .sheet(isPresented: $viewModel.showDetail) {
            CarDetailView(carDetail: DeveloperPreview.instance.carDetail)
        }
    }
}

struct CarList_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
