//
//  HourView.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 10/05/22.
//

import SwiftUI

struct HourView: View {
    @StateObject var viewModel = HourViewModel()
    @State var stopped: Bool = false
    @State var text: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack{
            
            Text(viewModel.currentTime)
                .font(.title)
                .onReceive(timer) { _ in
                    viewModel.getCurrentrime()
                }
        }
        .onAppear {
            viewModel.getCurrentrime()
        }
    }
}

struct HourView_Previews: PreviewProvider {
    static var previews: some View {
        HourView()
    }
}
