//
//  CarDetailView.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 02.04.22.
//

import SwiftUI

struct CarDetailView: View {
    @EnvironmentObject var viewModel: CarViewModel
    let url = "http://job-applicants-dummy-api.kupferwerk.net.s3.amazonaws.com/api/"
    var body: some View {
        ScrollView{
            if let carDetail = viewModel.carDetail {
                VStack{
                    AsyncImage(url: URL(string: url + carDetail.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }
                    .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 0)
                    .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("\(carDetail.name)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("\(carDetail.shortDescription ?? "")")
                            .foregroundColor(Color.theme.secondary)
                        Divider()
                        Text("\(carDetail.description)")
                            .font(.subheadline)
                            .foregroundColor(Color.theme.secondary)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text("Book your car")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        DatePicker("Start:", selection: $viewModel.startDate, in: Date.now...)
                        
                        DatePicker("End:", selection: $viewModel.endDate, in:
                                    viewModel.startDate.addingTimeInterval(86400)...viewModel.startDate.addingTimeInterval(viewModel.days7inSec))
                        
                        HStack{
                            Spacer()
                            Button(action:{
                                
                            }){
                                Text("Confirm")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding()
                                    .padding(.horizontal)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.theme.accent)
                                    )
                            }
                        }
                        Divider()
                    }
                    .padding(.horizontal)
                }
            }
        }
        .background(Color.gray.opacity(0.04))
        .onAppear{
            viewModel.fetchCarDetail()
            viewModel.setDefaultStartDate()
        }
        
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView()
            .environmentObject(DeveloperPreview.instance.viewModel)
    }
}
