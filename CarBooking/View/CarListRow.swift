//
//  CarListRow.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 02.04.22.
//

import SwiftUI

struct CarListRow: View {
    
    let car: Car
    @Binding var showDetail: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            VStack(alignment: .leading){
                Text("Name:")
                    .font(.footnote)
                    .foregroundColor(Color.theme.secondary)
                Text("\(car.name)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .padding(.leading)
            }
            VStack(alignment: .leading){
                Text("Short Description:")
                    .font(.footnote)
                    .foregroundColor(Color.theme.secondary)
                Text("\(car.shortDescription ?? "-")")
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.subheadline)
                    .foregroundColor(Color.theme.accent)
                    .padding(.leading)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top)
        .onTapGesture {
            showDetail.toggle()
        }
        .frame(width: UIScreen.main.bounds.width - 30 ,height: 120, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 3, y: 5))
    }
}

struct CarListRow_Previews: PreviewProvider {
    static var previews: some View {
        CarListRow(car: DeveloperPreview.instance.car, showDetail: .constant(false))
    }
}
