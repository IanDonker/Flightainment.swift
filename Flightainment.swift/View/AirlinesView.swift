//
//  AirlinesView.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 26/10/2021.
//

import SwiftUI

struct AirlinesView: View {
    @StateObject var airlineModel = AirlinesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(airlineModel.airlines) { item in
                    ForEach(item.data) { data in
                        NavigationLink(destination: AirlineInfoView(airlineName: data.airlineName, fleetSize: data.fleetSize, countryName: data.countryName)) {
                            Text(data.airlineName)
                    }
                    }
                }
            }
            
            .navigationBarTitle("Airlines")
        }
    }
}

struct AirlinesView_Previews: PreviewProvider {
    static var previews: some View {
        AirlinesView()
    }
}
