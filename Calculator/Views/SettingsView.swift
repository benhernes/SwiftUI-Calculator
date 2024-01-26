//
//  SettingsView.swift
//  Calculator
//
//  Created by Ben Hernes on 9/10/23.


import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
                
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                HStack {
                    Text("# of decimals: ")
                        .font(.headline)
                    Text("\(viewModel.decimals)")
                        .font(.title3).bold()
                        .foregroundStyle(.blue)
                }
                
                Spacer()
                
                Stepper("", value: $viewModel.decimals, in: 0...8)
            }
            
            Divider()
            
            HStack {
                Text("vibration: ")
                    .font(.headline)
                
                Spacer()
                
                Picker("", selection: $viewModel.vibration) {
                    Text("Off")
                        .tag("Off")
                    Text("Standard")
                        .tag("Standard")

                }
                .font(.title3).bold()
            }
            
            Spacer()
            
        }
        .padding()
        .padding(.top, 50)
    }
}


//#Preview {
//    SettingsView()
//}
