//
//  ContentView.swift
//  TrafficLight
//
//  Created by Сергей Корнев on 27.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    enum Status: Int {
        case red
        case yellow
        case green
        case none
    }
    
    @State private var buttonCaption = "Start"
    @State private var lights: [Bool] = [false, false, false]
    
    private var currentLidht: Status {
        if lights[0] {
            return .red
        } else if lights[1] {
            return .yellow
        } else if lights[2] {
            return .green
        }
        return .none
    }
    
    var body: some View {
        VStack {
            Light(color: .red, isOn: lights[Status.red.rawValue])
            Light(color: .yellow, isOn: lights[Status.yellow.rawValue])
            Light(color: .green, isOn: lights[Status.green.rawValue])
            Spacer()
            VStack {
                Button(action: { pressButton() }) {
                    Text(buttonCaption)
                        .font(.title)
                }
            }
            Spacer()
        }
       
    }
    
    private func pressButton() {
                
        switch currentLidht {
        case .red:
            lights[Status.red.rawValue] = false
            lights[Status.yellow.rawValue] = true
            lights[Status.green.rawValue] = false
        case .yellow:
            lights[Status.red.rawValue] = false
            lights[Status.yellow.rawValue] = false
            lights[Status.green.rawValue] = true
        case .green:
            lights[Status.red.rawValue] = true
            lights[Status.yellow.rawValue] = false
            lights[Status.green.rawValue] = false
        case .none: break
        }

        if buttonCaption == "Start" {
            buttonCaption = "Next"
            lights[Status.red.rawValue] = true
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
