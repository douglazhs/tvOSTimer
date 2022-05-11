//
//  TimerView.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 10/05/22.
//

import SwiftUI

enum ButtonTitle {
    case start
    case reset
    case stop
    case resume
    var description: String {
        switch self {
        case .start:
            return "Start"
        case .reset:
            return "Reset"
        case .stop:
            return "Stop"
        case .resume:
            return "Resume"
        }
    }
}

struct TimerView: View {
    @StateObject var viewModel = TimerViewModel()
    @State var stopped: Bool = false
    @State var text: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack{
            
            Text(String(format: "%.0f", viewModel.secondsElapsed))
                .font(.title)
            
            HStack{
                ButtonBuilder.createButton(stopped: $stopped, title:  stopped ? .stop : .start, viewModel: viewModel)
                    .tint(.blue)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                
                ButtonBuilder.createButton(stopped: $stopped, title: .reset, viewModel: viewModel)
                    .tint(.red)
                    .foregroundColor(.red)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
            }
        }
    }
}

struct ButtonBuilder {
    @ViewBuilder
    static func createButton(stopped: Binding<Bool>, title: ButtonTitle, viewModel: TimerViewModel) -> some View {
        Button {
            if title == .start{
                stopped.wrappedValue = true
                viewModel.start()
            }else if title == .stop{
                stopped.wrappedValue = false
                viewModel.pause()
            } else{
                viewModel.stop()
            }
        } label: {
            Text("\(title.description)")
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
