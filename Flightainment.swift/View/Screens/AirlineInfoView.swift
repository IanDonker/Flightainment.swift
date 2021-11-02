//
//  AirlineInfoView.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 26/10/2021.
//

import SwiftUI

struct AirlineInfoView: View {
    var airlineName: String
    var fleetSize: String
    var countryName: String
    
    var body: some View {
        NavigationView {
            VStack {
                Text(airlineName)
                Text(fleetSize)
                Text(countryName)
            }
            .navigationBarTitle(airlineName)
        }
    }
}

struct AirlineInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AirlineInfoView(airlineName: "Transavia", fleetSize: "40", countryName: "Netherlands")
    }
}
