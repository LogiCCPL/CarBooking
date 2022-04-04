//
//  CarViewModel.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 02.04.22.
//

import Foundation

class CarViewModel: ObservableObject {
    
    @Published var cars: [Car] = []
    @Published var carDetail: CarDetail?
    @Published var showDetail = false
    
    // Booking Car
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var days7inSec: Double = 7 * 86400
    
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
                    self?.cars.sort {
                        $0.name.uppercased() < $1.name.uppercased()
                    }
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchCarDetail(id: String) {
        guard let url = URL(string: "http://job-applicants-dummy-api.kupferwerk.net.s3.amazonaws.com/api/cars/\(id).json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let car = try JSONDecoder().decode(CarDetail.self, from: data)
                DispatchQueue.main.async {
                    self?.carDetail = car
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func setDefaultStartDate(){
        startDate = Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: startDate) ?? Date()
        startDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate) ?? Date()
    }
    
}
