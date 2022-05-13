//
//  TimezoneView.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 10/05/22.
//

import SwiftUI

struct TimezoneView: View {
    @StateObject var viewModel = TimezoneViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            TextField("Place", text: $viewModel.place)
                .keyboardType(.default)
                .onSubmit {
                    Task{
                        await viewModel.fetchCities()
                    }
                }
            
            ScrollView{
                ForEach(viewModel.places?.data ?? [], id: \.self){ place in
                    Button {
                        Task{
                            await viewModel.fetchDetails(place.id)
                        }
                    } label: {
                        Text("\(place.city), \(place.region), \(place.country)")
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                }
            }
            
            VStack{
                Text(viewModel.currentTime)
                    .font(.title)
                    .onReceive(timer) { _ in
                        viewModel.getCurrentrime()
                    }
                
                HStack{
                    Text(viewModel.timezone?.data.name ?? "Unknown")
                        .font(.title3)
                    
                    Rectangle()
                        .stroke(lineWidth: 0.5)
                        .fill(.white)
                        .frame(width: 0.5, height: 30)
                    
                    Text("\(Int(viewModel.timezone?.data.rawUtcOffsetHours ?? 0))")
                        .font(.title3)
                }
            }
            Spacer()
        }
    }
}

struct TimezoneView_Previews: PreviewProvider {
    static var previews: some View {
        TimezoneView()
    }
}
