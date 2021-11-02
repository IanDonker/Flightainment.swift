//
//  AirportsViewModel.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 28/10/2021.
//

import SwiftUI

class AirporstViewModel: ObservableObject {
    @Published var airports: [Airports] = []
    

    
    let api = "http://api.aviationstack.com/v1/"
    static let data = ["flights", "airports", "airlines", "airplanes", "cities", "countries"]
    let apiKey = "?access_key=06a7a5d7408cfe57434db59f05e919ce"
    
    var allflightData: URLComponents {
        get {
            URLComponents(string: api + FlightAinmentViewModel.data[1] + apiKey)!
        }
    }
    
    init() {
        fetchFlightData { (result) in
            switch result {
            case .success(let airports):
                DispatchQueue.main.async {
                    self.airports.append(airports)
                  }
                
            case .failure(let error):
                print("Fetched FlightData with Error: \(error)")
            }
            
        }
    }
    
    
    func fetchFlightData(completion: @escaping (Result<Airports , Error>) -> Void) {
    let urlComponents = allflightData

    let task = URLSession.shared.dataTask(with: urlComponents.url!) {
        (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data {
            do {
                let flightData = try jsonDecoder.decode(Airports.self, from: data)
                completion(.success(flightData))
            } catch {
                completion(.failure(error))
            }
        }
           
        
    }
    task.resume()
    }
}
