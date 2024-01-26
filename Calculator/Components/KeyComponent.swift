//
//  Button.swift
//  Calculator
//
//  Created by Ben Hernes on 9/10/23.
//

import SwiftUI

struct KeyComponent: View {
    public var buttonValue: String
    public var buttonOpacity: Double
    public var wideButton: Bool = false
    
    var body: some View {
        if !wideButton {
            Text(buttonValue)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                .frame(width: 80, height: 80)
                .background(Color.blue.opacity(buttonOpacity))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        } else {
            Text(buttonValue)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                .frame(width: 165, height: 80)
                .background(Color.blue.opacity(buttonOpacity))
                .clipShape(Capsule())
        }
    }
}

#Preview {
    KeyComponent(buttonValue: "5", buttonOpacity: 0.1, wideButton: false)
}
