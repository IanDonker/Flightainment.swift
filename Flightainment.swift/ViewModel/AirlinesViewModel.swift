//
//  AirlinesViewModel.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 26/10/2021.
//

import SwiftUI

class AirlinesViewModel: ObservableObject {
    @Published var airlines: [Airlines] = []
    
    init() {
        fetchAirlinesInfo { (result) in
            switch result {
            case .success(let airlinesData):
                DispatchQueue.main.async {
                    self.airlines.append(airlinesData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchAirlinesInfo(completion: @escaping (Result<Airlines, Error>) -> Void) {
        let urlComponents = URLComponents(string: "http://api.aviationstack.com/v1/airlines?access_key=06a7a5d7408cfe57434db59f05e919ce")!
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) {
            (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let airlinesInfo = try jsonDecoder.decode(Airlines.self, from: data)
                    completion(.success(airlinesInfo))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
