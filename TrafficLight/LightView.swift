//
//  Light.swift
//  TrafficLight
//
//  Created by Сергей Корнев on 27.03.2021.
//

import SwiftUI

struct LightView: View {
    
    let color: Color
    var status: LightState
        
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
            .opacity(status.rawValue)

    }
    
}

struct Light_Previews: PreviewProvider {
    static var previews: some View {
        LightView(color: .green, status: .off)
    }
}
