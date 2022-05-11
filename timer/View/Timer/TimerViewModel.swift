//
//  TimerViewModel.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 10/05/22.
//

import Foundation

enum TimerMode{
    case stopped
    case running
    case paused
}

class TimerViewModel: ObservableObject{
    @Published var secondsElapsed = 0.0
    @Published var timer = Timer()
    var timerMode: TimerMode = .stopped
    
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            self.secondsElapsed += 0.1
        })
        timerMode = .running
    }
    
    func pause(){
        timer.invalidate()
        timerMode = .paused
    }
    
    func stop(){
        timer.invalidate()
        timerMode = .stopped
        secondsElapsed = 0.0
    }
}
