//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Ben Hernes on 9/10/23.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
