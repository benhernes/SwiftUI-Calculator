//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Ben Hernes
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
