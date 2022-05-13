//
//  API.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 11/05/22.
//

import Foundation

enum RequestError: Error{
    case urlNotFound
}

class API{
    
    static func fetchPlaces(_ place: String) async throws -> Places {
        let urlString = "https://wft-geo-db.p.rapidapi.com/v1/geo/cities?limit=10&namePrefix=\(place)"
        
        guard let url = URL(string: urlString) else {
            throw RequestError.urlNotFound
        }

        //Headers
        let headers = [
            "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
            "x-rapidapi-key": "31abf4f759msh288f5d1240a3260p13e47bjsn5acd5c8342a6"
        ]

        var request = URLRequest(url: url,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let decoder = JSONDecoder()
        let (data, _) = try await URLSession.shared.data(for: request)
        let results = try decoder.decode(Places.self, from: data)
        return results
    }
    
    static func fetchCity(_ cityId: Int) async throws -> City{
        let urlString = "https://wft-geo-db.p.rapidapi.com/v1/geo/cities/\(cityId)"
        guard let url = URL(string: urlString) else {
            throw RequestError.urlNotFound
        }

        //Headers
        let headers = [
            "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
            "x-rapidapi-key": "31abf4f759msh288f5d1240a3260p13e47bjsn5acd5c8342a6"
        ]

        var request = URLRequest(url: url,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        //Doing the request
        let decoder = JSONDecoder()
        let (data, _) = try await URLSession.shared.data(for: request)
        let results = try decoder.decode(City.self, from: data)
        return results
    }
    
    static func fetchTimezone(_ timezoneId: String) async throws -> Timezone{
        let urlString = "https://wft-geo-db.p.rapidapi.com/v1/locale/timezones/\(timezoneId)"
        guard let url = URL(string: urlString) else {
            throw RequestError.urlNotFound
        }

        //Headers
        let headers = [
            "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
            "x-rapidapi-key": "31abf4f759msh288f5d1240a3260p13e47bjsn5acd5c8342a6"
        ]

        var request = URLRequest(url: url,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        //Doing the request
        let decoder = JSONDecoder()
        let (data, _) = try await URLSession.shared.data(for: request)
        let results = try decoder.decode(Timezone.self, from: data)
        return results
    }
}
