//
//  AirportInfoView.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 25/10/2021.
//

import SwiftUI
import MapKit

struct AirportInfoView: View {
    var aiportName: String
    var countryName: String
    var iataCode: String
    var latitude: String
    var longitude: String
    
    
    
    var body: some View {
        
        VStack {
            Text(countryName)
            Text(iataCode)
            TrackerMapView(lat: lat, lon: lon)
        }
        .padding()
        .navigationBarTitle(aiportName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var lat: Double {
        let lat = Double(latitude) ?? 0
        return lat
    }
    var lon: Double {
        let lon = Double(longitude) ?? 0
        return lon
    }
    
    
//    func stringToDouble(name: String) -><Double> {
//        let formatter = NumberFormatter()
//        formatter.locale = Locale.current
//        formatter.numberStyle = .decimal
//
//        return lon = formatter.number(from: name)
//
//    }
}

//struct AirportInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            AirportInfoView(aiportName: "Amsterdam", countryName: "Netherlands", iataCode: "Ams", latitude: .constant(51.9436445), longitude: .constant(4.4704739))
//
//        }
//    }
//}
