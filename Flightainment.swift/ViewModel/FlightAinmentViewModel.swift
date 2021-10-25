//
//  FlightAinmentViewModel.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 25/10/2021.
//

import SwiftUI

class FlightAinmentViewModel: ObservableObject {
    @Published var airports: [Airports] = []
    
    init() {
        fetchFlightInfo { (result) in
            switch result {
            case .success(let flightData):
                DispatchQueue.main.async {
                    self.airports.append(flightData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchFlightInfo(completion: @escaping (Result<Airports, Error>) -> Void) {
        let urlComponents = URLComponents(string: "http://api.aviationstack.com/v1/airports?access_key=06a7a5d7408cfe57434db59f05e919ce")!
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) {
            (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let flightInfo = try jsonDecoder.decode(Airports.self, from: data)
                    completion(.success(flightInfo))
                } catch {
                    completion(.failure(error))
                }
            }
           
        }
        task.resume()
    }
}

