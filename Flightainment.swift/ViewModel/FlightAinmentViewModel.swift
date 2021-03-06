//
//  FlightAinmentViewModel.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 28/10/2021.
//

import SwiftUI
import Combine


class FlightAinmentViewModel: ObservableObject {
    @Published var flights: [FlightData] = []
    @Published var allData = data
    
    let api = "http://api.aviationstack.com/v1/"
    static let data = ["flights", "airports", "airlines", "airplanes", "cities", "countries"]
    let apiKey = "?access_key=06a7a5d7408cfe57434db59f05e919ce"
    
    var allflightData: URLComponents {
        get {
            URLComponents(string: api + FlightAinmentViewModel.data[0] + apiKey)!
        }
    }
    
    init() {
        fetchFlightData { (result) in
            switch result {
            case .success(let flightData):
                DispatchQueue.main.async {
                    self.flights.append(flightData)
                  }
                
            case .failure(let error):
                print("Fetched FlightData with Error: \(error)")
            }
        }
    }
    
    func fetchFlightData(completion: @escaping (Result<FlightData , Error>) -> Void) {
    let urlComponents = allflightData

    let task = URLSession.shared.dataTask(with: urlComponents.url!) {
        (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data {
            do {
                let flightData = try jsonDecoder.decode(FlightData.self, from: data)
                completion(.success(flightData))
            } catch {
                completion(.failure(error))
            }
        }
           
        
    }
    task.resume()
    }
    
    
}

