//
//  ContentView.swift
//  TrafficLight
//
//  Created by Сергей Корнев on 27.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonCaption = "Start"
    @State private var lightState: (LightState, LightState, LightState) = (
        .off, .off, .off)

    var body: some View {
        VStack {
            LightView(color: .red, status: lightState.0)
            LightView(color: .yellow, status: lightState.1)
            LightView(color: .green, status: lightState.2)
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
    
    private func switchLight() {
        switch lightState {
        case (.on, .off, .off): lightState = (.off, .on, .off)
        case (.off, .on, .off): lightState = (.off, .off, .on)
        case (.off, .off, .on): lightState = (.on, .off, .off)
        default: lightState = (.on, .off, .off)
            
        }
    }
    
    private func pressButton() {
        switchLight()
        if buttonCaption == "Start" {
            buttonCaption = "Next"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
