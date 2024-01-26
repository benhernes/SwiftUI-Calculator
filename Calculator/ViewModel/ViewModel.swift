//
//  ViewModel.swift
//  Calculator
//
//  Created by Ben Hernes on 9/10/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var decimals: Int = 3
    @Published var vibration = "Standard"
    
}
