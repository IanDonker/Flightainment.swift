//
//  ContentView.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 12/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FlightView()
                .tabItem {
                    Label("Flights", systemImage: "paperplane")
                }
            
            AirportsView()
                .tabItem {
                    Label("Airports", systemImage: "mappin.and.ellipse")
                }
            
            AirlinesView()
                .tabItem {
                    Label("Airlines", systemImage: "briefcase")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
