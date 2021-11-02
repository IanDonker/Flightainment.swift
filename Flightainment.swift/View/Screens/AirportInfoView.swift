//
//  AirportInfoView.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 25/10/2021.
//

import SwiftUI
import MapKit

struct AirportInfoView: View {
    var airportName: String
    var countryName: String
    var iataCode: String
    var lat: String
    var long: String
    
    var latitude: Double {
        let latitude = Double(lat)
        return latitude ?? 0.0
    }
    
    var longitude: Double {
        let longitude = Double(long)
        return longitude ?? 0.0
    }
    
    var body: some View {
        VStack {
            Text(iataCode)
            Text(countryName)
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))), interactionModes: [])
        }
        .padding()
        .navigationBarTitle(airportName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
    

struct AirportInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AirportInfoView(airportName: "Amsterdam", countryName: "Netherlands", iataCode: "Ams", lat: "", long: "")

        }
    }
}
