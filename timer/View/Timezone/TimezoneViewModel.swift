//
//  TimezoneViewModel.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 10/05/22.
//

import Foundation
import SwiftUI

class TimezoneViewModel: ObservableObject{
    @Published var place: String = ""
    @Published var places: Places?
    @Published var timezoneId: String = ""
    @Published var timezone: Timezone?
    @Published var currentTime: String = ""
    
    func fetchCities() async {
        do{
            let places = try await API.fetchPlaces(self.place)
            DispatchQueue.main.async {
                self.places = places
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func fetchDetails(_ id: Int) async{
        do{
            let place = try await API.fetchCity(id)
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            await fetchTimezone(place.data.timezone)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func fetchTimezone(_ id: String) async{
        do{
            let timezone = try await API.fetchTimezone(id)
            DispatchQueue.main.async {
                self.timezone = timezone
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func getCurrentrime(){
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        let modifiedDate = Calendar.current.date(byAdding: .hour, value: Int(timezone?.data.rawUtcOffsetHours ?? 0), to: Date()) ?? Date()
        let dateString = formatter.string(from: modifiedDate)
        self.currentTime = dateString
    }
}


