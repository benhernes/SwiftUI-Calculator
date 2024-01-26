//
//  CalculatorView.swift
//  Calculator
//
//  Created by Ben Hernes on 9/10/23.
//

import SwiftUI
import Foundation
import UIKit


struct CalculatorView: View {
    @ObservedObject var viewModel: ViewModel

    @State private var console = ""
    @State private var result = 0.0
    @State private var leftParenthesis = true
    @State private var decimalOk = true
    @State private var isAnimate = false
    @State private var decimalMultiplier: Double = 1000
    @State private var consoleYOffset = 0.0
    @State private var consoleXOffset = 0.0
    @State private var resetOnType = false
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Text(console)
                    .font(.title).bold()
                    .padding()
                    .frame(height: 80)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    .background(Color.clear)
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .offset(x: consoleXOffset, y: consoleYOffset)
                      
                Capsule()
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.gray.opacity(0.2))
                    .padding(.vertical)
                    .padding(.horizontal, 20)
            }
            
//            Text(console)
//                .font(.title).bold()
//                .padding()
//                .frame(height: 80)
//                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
//                .background(Color.gray.opacity(0.1))
//                .clipShape(Capsule())
//                .padding(.vertical)
//                .padding(.horizontal, 30)
        
            Spacer()
            
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Button {
                        vibrateStrong()
                        console = ""
                        leftParenthesis = true
                        decimalOk = true
                    } label: {
                        KeyComponent(buttonValue: "AC", buttonOpacity: 0.05)
                    }
                    
                    Button {
                        if console.last == "." {
                            decimalOk = true
                        }
                        console = String(console.dropLast())
                        vibrate()
                    } label: {
                        ImageKeyComponent(buttonImage: "delete.backward.fill", buttonOpacity: 0.05)
                    }
                    
                    Button {
                        vibrateNegative()
                        withAnimation(.bouncy(duration: 0.2, extraBounce: 0.3)) {
                            isAnimate.toggle()
                        }
                        
                        // Axed parenthsis code
//                        if leftParenthesis {
//                            if console.last != ")" {
//                                vibrate()
//                                console.append("(")
//                                leftParenthesis.toggle()
//                            } else {
//                                vibrateNegative()
//                            }
//                        } else {
//                            if addOperator() {
//                                vibrate()
//                                console.append(")")
//                                leftParenthesis.toggle()
//                            } else {
//                                vibrateNegative()
//                            }
//                        }
                    } label: {
                        KeyComponent(buttonValue: isAnimate ? ":)" : "(:", buttonOpacity: isAnimate ? 0.05 : 0.05)
                    }
                    
                    Button {
                        if addOperator() {
                            addToConsole(opp: "/")
                            decimalOk = true
                        } else {
                            vibrateNegative()
                        }
                    } label: {
                        KeyComponent(buttonValue: "/", buttonOpacity: 0.5)
                    }

                }
                HStack {
                    Button {
                        addToConsole(num: "7")
                    } label: {
                        KeyComponent(buttonValue: "7", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        addToConsole(num: "8")
                    } label: {
                        KeyComponent(buttonValue: "8", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        addToConsole(num: "9")
                    } label : {
                        KeyComponent(buttonValue: "9", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        if addOperator() {
                            addToConsole(opp: "*")
                            decimalOk = true
                        } else {
                            vibrateNegative()
                        }
                    } label: {
                        KeyComponent(buttonValue: "*", buttonOpacity: 0.5)
                    }

                }
                HStack {
                    Button {
                        addToConsole(num: "4")
                    } label: {
                        KeyComponent(buttonValue: "4", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        addToConsole(num: "5")
                    } label: {
                        KeyComponent(buttonValue: "5", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        addToConsole(num: "6")
                    } label : {
                        KeyComponent(buttonValue: "6", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        if addOperator() {
                            addToConsole(opp: "-")
                            decimalOk = true
                        } else {
                            vibrateNegative()
                        }
                    } label: {
                        KeyComponent(buttonValue: "-", buttonOpacity: 0.5)
                    }

                }
                HStack {
                    Button {
                        addToConsole(num: "1")
                    } label: {
                        KeyComponent(buttonValue: "1", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        addToConsole(num: "2")
                    } label: {
                        KeyComponent(buttonValue: "2", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        addToConsole(num: "3")
                    } label: {
                        KeyComponent(buttonValue: "3", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        if addOperator() {
                            addToConsole(opp: "+")
                            decimalOk = true
                        } else {
                            vibrateNegative()
                        }
                    } label: {
                        KeyComponent(buttonValue: "+", buttonOpacity: 0.5)
                    }

                }
                HStack {
                    Button {
                        addToConsole(num: "0")
                    } label: {
                        KeyComponent(buttonValue: "0", buttonOpacity: 0.2, wideButton: true)
                    }
                    
                    Button {
                        if addOperator() {
                            if decimalOk {
                                addToConsole(opp: ".")
                                decimalOk.toggle()
                            } else {
                                vibrateNegative()
                            }
                        } else {
                            vibrateNegative()
                        }
                    } label: {
                        KeyComponent(buttonValue: ".", buttonOpacity: 0.2)
                    }
                    
                    Button {
                        decimalMultiplier = pow(10,Double(viewModel.decimals))
                        
                        if addOperator() && !console.isEmpty {
                            vibrateNegative()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                if !console.contains(".") {
                                    console.append(".0")
                                }
                                result = evaluateExpression(console) ?? 0
                                result = ((result * decimalMultiplier).rounded()) / decimalMultiplier
                                console = "\(String(format: "%.\(viewModel.decimals)f", result))"
                            }
                            
                            withAnimation(Animation.bouncy(duration: 0.2, extraBounce: 0.2).repeatCount(1, autoreverses: true)) {
                                consoleYOffset = 10
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    self.consoleYOffset = 0
                                }
                            }
                            
                            leftParenthesis = true
                            resetOnType = true
                            
                            if viewModel.decimals == 0 {
                                decimalOk = true
                            } else {
                                decimalOk = false
                            }
                        } else {
                            vibrateNegative()
                            shakeAnimation()
                        }
                    } label: {
                        KeyComponent(buttonValue: "=", buttonOpacity: 0.5)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 15)
        }
    }
    
    
    func evaluateExpression(_ expression: String) -> Double? {
        let expression = NSExpression(format: expression)
        guard let result = expression.expressionValue(with: nil, context: nil) as? NSNumber else {
            return nil
        }
        return result.doubleValue
    }
    
    func addOperator() -> Bool {
        guard let lastCharacter = console.last else {
            return false // If the console is empty, you can append to it
        }
        
        let disallowedCharacters: [Character] = ["+", "-", "*", "/", ".", "("]
        return !disallowedCharacters.contains(lastCharacter)
    }
    
    
    func vibrate() {
        if viewModel.vibration != "Off" {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
    }
    
    func vibrateStrong() {
        if viewModel.vibration != "Off" {
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
    }
    
    func vibrateNegative() {
        if viewModel.vibration != "Off" {
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred(intensity: 100)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                generator.impactOccurred(intensity: 10)
            }
        }
    }
    
    func shakeAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.05)) {
            consoleXOffset = -10
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            withAnimation(Animation.easeInOut(duration: 0.05)) {
                self.consoleXOffset = 10
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation(Animation.easeInOut(duration: 0.05)) {
                    self.consoleXOffset = 0
                }
            }
        }
    }
    
    func addToConsole(num: String) {
        vibrate()
        if resetOnType {
            console = ""
            console.append(num)
            resetOnType = false
        } else {
            console.append(num)
        }
    }
    
    func addToConsole(opp: String) {
        vibrate()
        if resetOnType {
            resetOnType = false
            console.append(opp)
        } else {
            console.append(opp)
        }
    }
}


//#Preview {
//    CalculatorView()
//}
