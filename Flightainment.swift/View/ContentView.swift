//
//  ContentView.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 12/10/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FlightAinmentViewModel()
    @State private var search = ""
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.airports) { item in
                    ForEach(item.data) { data in
                        NavigationLink(destination: AirportInfoView(aiportName: data.airportName, countryName: data.countryName ?? "", iataCode: data.iataCode, latitude: data.latitude, longitude: data.longitude)) {
                            Text(data.airportName)
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Airports")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
