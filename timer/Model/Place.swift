//
//  Place.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 11/05/22.
//

import Foundation

struct Places: Codable{
    var data: [PlacesData]
}

struct PlacesData: Codable, Hashable{
    var id: Int
    var city: String
    var country: String
    var countryCode: String
    var region: String
}

struct City: Codable{
    var data: CityData
}

struct CityData: Codable{
    var id: Int
    var timezone: String
}

struct Timezone: Codable{
    var data: TimezoneData
}

struct TimezoneData: Codable{
    var id: String
    var name: String
    var rawUtcOffsetHours: Int64
}
