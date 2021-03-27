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
    
    
    private var currentLight: Lights {
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
    
    private func switchLight(_ light: Lights) {
        for index in 0..<lights.count {
            lights[index] = false
        }
        lights[light.rawValue] = true
    }
    
    private func pressButton() {
        
        switch (currentLight, buttonCaption) {
        case (.red, _): switchLight(.yellow)
        case (.yellow, _): switchLight(.green)
        case (.green, _): switchLight(.red)
        case (_, "Start"):
            buttonCaption = "Next"
            switchLight(.red)
        case (.none, _): break
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
