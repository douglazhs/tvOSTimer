//
//  HourViewModel.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 11/05/22.
//

import Foundation
import SwiftUI

class HourViewModel: ObservableObject{
    @Published var currentTime: String = ""
    
    func getCurrentrime(){
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        let dateString = formatter.string(from: Date())
        self.currentTime = dateString
    }
}
