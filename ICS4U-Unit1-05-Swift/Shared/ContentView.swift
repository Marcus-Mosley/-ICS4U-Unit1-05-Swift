//
// ContentView.swift
// ICS4U-Unit1-05-Swift
//
// Created by Marcus A. Mosley on 2021-01-20
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var guess: String = ""
    @State private var text: String = "Dice Game"
    @State private var showingAlert = false
    @State private var counter = 1
    private let randomNumber = Int.random(in: 1...6)
    
    var body: some View {
        VStack {
            Text(text)
                .font(.title)
            TextField("Enter a guess between 1-6: ", text: $guess)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .keyboardType(.numberPad)
            Button(action: {
                if Int(guess) != nil && Int(guess)! >= 1 && Int(guess)! <= 6 {
                    if Int(guess) == randomNumber {
                        
                        text = "That is correct, it took \(counter) guess(es)"
                    } else {
                        
                        text = "That is incorrect, please try again"
                        counter += 1
                    }
                } else {
                    showingAlert = true
                }
            }) {
                Text("Click Here")
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"), message: Text("Not Valid Input"), dismissButton: .default(Text("Got It!")))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
