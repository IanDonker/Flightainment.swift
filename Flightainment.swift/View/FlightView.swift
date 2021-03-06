//
//  FlightView.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 28/10/2021.
//

import SwiftUI

struct FlightView: View {
    @StateObject var viewModel = FlightAinmentViewModel()
    @State private var searchText = ""
    @State private var searching = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBar(searchText: $searchText, searching: $searching)
                List {
                    Section(header: Text("Flights")) {
                        ForEach(viewModel.flights) { item in
                            ForEach(item.data.filter ({ "\($0)".contains(searchText) || searchText.isEmpty })) { ita in
                                TableCellViewCell(image: "paperplane", depature: ita.departure.icao ?? "", flightNumber: ita.flight.icao ?? "")
                            }
                    }
                    .listStyle(GroupedListStyle())
                }
                .navigationBarTitle("Flight Scanner")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    if searching {
                        Button("Cancel") {
                            searchText = ""
                            withAnimation {
                                searching = false
                            }
                        }
                    }
                }
                }
            }
        }
    }
}

struct FlightView_Previews: PreviewProvider {
    static var previews: some View {
        FlightView()
    }
}
