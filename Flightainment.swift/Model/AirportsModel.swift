//
//  AirportsModel.swift
//  Flightainment.swift
//
//  Created by Ian Donker on 25/10/2021.
//

import Foundation

struct Airports: Identifiable, Codable {
    var id = UUID()
    let pagination: AirportsPagination
    let data: [AirportsData]
    
    
    enum CodingKeys: CodingKey {
        case pagination, data
    }
}

// MARK: - Datum
struct AirportsData: Identifiable, Codable, Comparable {
    let id: String
    let gmt: String?
    let airportID, iataCode: String
    let cityIataCode, icaoCode, countryIso2, geonameID: String
    let latitude, longitude: String
    let airportName: String
    let countryName: String?
    let phoneNumber: String?
    let timezone: String
    
    static func < (lhs: AirportsData, rhs: AirportsData) -> Bool {
        lhs.airportName < rhs.airportName
    }
    
    enum CodingKeys: String, CodingKey {
        case id, gmt
        case airportID = "airport_id"
        case iataCode = "iata_code"
        case cityIataCode = "city_iata_code"
        case icaoCode = "icao_code"
        case countryIso2 = "country_iso2"
        case geonameID = "geoname_id"
        case latitude, longitude
        case airportName = "airport_name"
        case countryName = "country_name"
        case phoneNumber = "phone_number"
        case timezone
    }
}

// MARK: - Pagination
struct AirportsPagination: Codable {
    let offset, limit, count, total: Int
}

