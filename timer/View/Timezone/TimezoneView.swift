//
//  TimezoneView.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 10/05/22.
//

import SwiftUI

struct TimezoneView: View {
    @StateObject var viewModel = TimezoneViewModel()
    
    var body: some View {
        VStack{
            TextField("Place", text: $viewModel.place)
                .keyboardType(.default)
            
            Spacer()
        }
    }
}

struct TimezoneView_Previews: PreviewProvider {
    static var previews: some View {
        TimezoneView()
    }
}
