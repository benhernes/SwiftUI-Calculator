//
//  ContentView.swift
//  Calculator
//
//  Created by Ben Hernes on 9/10/23.
//

import SwiftUI


enum Tabs: String {
    case calculator = "Calculator"
    case settings = "Settings"
}


struct ContentView: View {
    @State private var currentTab: Tabs = .calculator
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            TabView(selection: $currentTab) {
                CalculatorView(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "number.square")
                    }
                    .tag(Tabs.calculator)
                
                
                SettingsView(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                    }
                    .tag(Tabs.settings)

            }
            .navigationTitle(currentTab.rawValue)
        }
    }
}

//#Preview {
//    ContentView()
//}
