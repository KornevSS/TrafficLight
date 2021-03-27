//
//  ContentView.swift
//  TrafficLight
//
//  Created by Сергей Корнев on 27.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    enum Lights: Int {
        case red
        case yellow
        case green
        case none
    }
    
    @State private var buttonCaption = "Start"
    @State private var lights: [Bool] = [false, false, false]
    
    
    private var currentLidht: Lights {
        for index in 0..<lights.count {
            if lights[index] {
                return Lights(rawValue: index) ?? .none
            }
        }
        return .none
    }
    
    var body: some View {
        VStack {
            Light(color: .red, isOn: lights[Lights.red.rawValue])
            Light(color: .yellow, isOn: lights[Lights.yellow.rawValue])
            Light(color: .green, isOn: lights[Lights.green.rawValue])
            Spacer()
            VStack {
                Button(action: { pressButton() }, label: {
                    Text(buttonCaption)
                        .font(.title)
                }
            )}
            Spacer()
        }
       
    }
    
    private func pressButton() {
                
        switch currentLidht {
        case .red:
            lights[Lights.red.rawValue] = false
            lights[Lights.yellow.rawValue] = true
            lights[Lights.green.rawValue] = false
        case .yellow:
            lights[Lights.red.rawValue] = false
            lights[Lights.yellow.rawValue] = false
            lights[Lights.green.rawValue] = true
        case .green:
            lights[Lights.red.rawValue] = true
            lights[Lights.yellow.rawValue] = false
            lights[Lights.green.rawValue] = false
        case .none: break
        }

        if buttonCaption == "Start" {
            buttonCaption = "Next"
            lights[Lights.red.rawValue] = true
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
