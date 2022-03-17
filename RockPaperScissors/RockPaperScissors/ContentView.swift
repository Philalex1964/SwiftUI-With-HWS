//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Aleksandar Filipov on 3/17/22.
//

import SwiftUI

struct bodyText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25, weight: .heavy, design: .rounded))
            .foregroundStyle(.white)
    }
}

extension View {
    func bodyTextStyle() -> some View {
        modifier(bodyText())
    }
}

struct ContentView: View {
    @State private var moves = ["✊🏻", "👋🏻", "✌🏻"].shuffled()
    @State private var gameChoice = Int.random(in: 0...2)
    @State private var gameToWinCondition = ["WIN", "LOSE"]
    @State private var gameToWinChoice = Int.random(in: 0...1)
    @State private var score = 0
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var attemptsCount = 0
    
    let gameWon = "Great! You won!"
    let gameLost = "Oops! You lost!"
    
    var message: String {
        "Your score is: \(score)"
    }
    
    var finalMessage: String {
        "Game over! Your final score is: \(score)"
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing:50) {
                Spacer()
                
                Text("Rock Scissors Paper")
                    .font(.system(.title))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(moves[gameChoice])
                    .font(.system(size: 200))
                    .foregroundColor(.white)
                
                Text("Choose to \(gameToWinCondition[gameToWinChoice]) this game")
                    .bodyTextStyle()
                
                HStack(spacing: 40) {
                    
                    ForEach(0..<3) { number in
                        Button {
                            buttonTapped(number)
                        } label: {
                            Text(moves[number])
                        }
                        .font(.system(size: 75))
                    }
                }
                
                Text("Score: \(score)")
                    .bodyTextStyle()
                
                Spacer()
            }
        }
        
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(attemptsCount == 5 ? finalMessage : message), dismissButton: .default(Text(attemptsCount == 5 ? "New game" :  "Continue")) {
                attemptsCount == 5 ? newGame() : nextRound()
            })
        }
    }
    
    func buttonTapped(_ number: Int) {
        if gameToWinCondition[gameToWinChoice] == "WIN" {
            if moves[gameChoice] == "✊🏻" {
                moves[number] == "👋🏻" ? (alertTitle = gameWon, score += 1) : (alertTitle = gameLost, score -= 1)
            } else if moves[gameChoice] == "👋🏻" {
                moves[number] == "✌🏻" ? (alertTitle = gameWon, score += 1) : (alertTitle = gameLost, score -= 1)
            } else {
                moves[number] == "✊🏻" ? (alertTitle = gameWon, score += 1) : (alertTitle = gameLost, score -= 1)
            }
        } else {
            if moves[gameChoice] == "✊🏻" {
                moves[number] == "👋🏻" ? (alertTitle = gameLost, score -= 1) : (alertTitle = gameWon, score += 1)
            } else if moves[gameChoice] == "👋🏻" {
                moves[number] == "✌🏻" ? (alertTitle = gameLost, score -= 1) : (alertTitle = gameWon, score += 1)
            } else {
                moves[number] == "✊🏻" ? (alertTitle = gameLost, score -= 1) : (alertTitle = gameWon, score += 1)
            }
        }
        attemptsCount += 1
        showingAlert = true
    }

    func nextRound() {
        moves.shuffle()
        gameToWinCondition.shuffle()
    }

    func newGame () {
        moves.shuffle()
        gameToWinCondition.shuffle()
        score = 0
        attemptsCount = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
