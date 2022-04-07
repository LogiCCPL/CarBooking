//
//  CarViewModel.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 02.04.22.
//
import CoreData
import Foundation

class CarViewModel: ObservableObject {
    
    @Published var cars: [Car] = []
    @Published var carDetail: CarDetail?
    @Published var showDetail = false
    @Published var idSelected: Int?
    
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
    
    func fetchCarDetail() {
        guard let id = idSelected else { return }
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
    
    func saveCar(moc: NSManagedObjectContext) {
        guard let carDetail = carDetail else { return }
        let car = CarCD(context: moc)
        car.id = Int16(carDetail.id)
        car.name = carDetail.name
        car.start = startDate
        car.end = endDate
        
        try? moc.save()
    }
    
}
