//
//  TimerView.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 10/05/22.
//

import SwiftUI

struct TimerView: View {
    @StateObject var viewModel = TimerViewModel()
    @State var stopped: Bool = false
    @State var text: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack{
            Text("00:00:00")
                .font(.title)
            
            Button {
                stopped.toggle()
            } label: {
                Text(stopped ? "Start" : "Stop")
                    .font(.headline)
            }
            .tint(.blue)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .focusable(isFocused)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
