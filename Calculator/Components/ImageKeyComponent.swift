//
//  ImageKeyComponent.swift
//  Calculator
//
//  Created by Ben Hernes on 9/10/23.
//

import SwiftUI

struct ImageKeyComponent: View {
    public var buttonImage: String
    public var buttonOpacity: Double
    
    var body: some View {
        Image(systemName: buttonImage)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            .frame(width: 80, height: 80)
            .background(Color.blue.opacity(buttonOpacity))
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ImageKeyComponent(buttonImage: "delete.backward.fill", buttonOpacity: 0.05)
}
