//
//  Light.swift
//  TrafficLight
//
//  Created by Сергей Корнев on 27.03.2021.
//

import SwiftUI

struct Light: View {
    
    let color: Color
    let isOn: Bool
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
            .brightness(isOn ? 0.0 : 0.5)

    }
    
    func getInfo() -> Color {
        color
    }
    
}

struct Light_Previews: PreviewProvider {
    static var previews: some View {
        Light(color: .red, isOn: false)
    }
}
