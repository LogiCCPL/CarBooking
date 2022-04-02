//
//  CarViewModel.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 02.04.22.
//

import Foundation

class CarViewModel: ObservableObject {
    
    @Published var cars: [Car] = []
    
    
    func fetchCars() {
        guard let url = URL(string: "http://job-applicants-dummy-api.kupferwerk.net.s3.amazonaws.com/api/cars.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let cars = try JSONDecoder().decode([Car].self, from: data)
                DispatchQueue.main.async {
                    self?.cars = cars
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
