//
//  ContentView.swift
//  GuessTheFlagSwiftUI
//
//  Created by Arshad Shaik on 05/07/24.
//

import SwiftUI

struct ContentView: View {
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  
  @State private var scoreTitle = ""
  @State private var showScore = false
  
  var body: some View {
    ZStack {
      //LinearGradient(colors: [.mint, .black], startPoint: .top, endPoint: .bottom)
      RadialGradient(stops: [
        .init(color: Color(red: 0.1, green: 0.23, blue: 0.34), location: 0.3),
        .init(color: Color(red: 0.56, green: 0.15, blue: 0.35), location: 0.3)
      ], center: .top, startRadius: 200, endRadius: 700)
        .ignoresSafeArea()
      
      VStack(spacing: 30) {
        VStack {
          Text("Tap on flag")
            .foregroundStyle(.secondary)
            .font(.headline.weight(.bold))
          
          
          Text(countries[correctAnswer])
            .foregroundStyle(.secondary)
            .font(.largeTitle.weight(.medium))
        }
        
        ForEach(0..<3) { number in
          Button {
            flagTapped(number)
          } label: {
            Image(countries[number])
              .clipShape(.buttonBorder)
              .shadow(radius: 5)
          }
        }
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical, 20)
      .background(.regularMaterial)
      .clipShape(.buttonBorder)
    }
    .alert(scoreTitle, isPresented: $showScore) {
      Button("Continue", action: askQuestion)
    } message: {
      Text("Your score is ???")
    }
  }
  
  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
    } else {
      scoreTitle = "Wrong"
    }
    
    showScore = true
  }
  
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
}

#Preview {
  ContentView()
}
