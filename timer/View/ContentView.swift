//
//  ContentView.swift
//  timer
//
//  Created by Douglas Henrique de Souza Pereira on 10/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 1
    
    var body: some View {
        
        NavigationView{
            
            TabView(selection: $selection) {
                
                TimerView()
                    .tabItem {
                        Label {
                            Text("Timer")
                        } icon: {
                            Image(systemName: "clock")
                        }
                    }
                    .tag(1)
                
                HourView()
                    .tabItem {
                        Label {
                            Text("Hour")
                        } icon: {
                            Image(systemName: "clock")
                        }
                    }
                    .tag(2)
                
                TimezoneView()
                    .tabItem {
                        Label {
                            Text("Timezone")
                        } icon: {
                            Image(systemName: "globe")
                        }
                    }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
