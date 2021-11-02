//
//  AirportsView.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 26/10/2021.
//

import SwiftUI

struct AirportsView: View {
    @StateObject var viewModel = AirporstViewModel()
    @State private var search = ""
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.airports) { item in
                    ForEach(item.data) { data in
                        NavigationLink(destination: AirportInfoView(airportName: data.airportName, countryName: data.countryName ?? "", iataCode: data.iataCode, lat: data.latitude, long: data.longitude)) {
                            Text(data.airportName)
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Airports")
        }
    }

}

struct AirportsView_Previews: PreviewProvider {
    static var previews: some View {
        AirportsView()
    }
}
