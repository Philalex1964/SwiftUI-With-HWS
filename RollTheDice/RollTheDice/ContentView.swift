//
//  ContentView.swift
//  RollTheDice
//
//  Created by Aleksandar Filipov on 5/20/22.
//

import SwiftUI


struct ContentView: View {
    @State private var diceValue = 0
    @State private var previousRolls = [Int]()
    @State private var showRestartAlert = false
    @State private var sum = 0
    
    var body: some View {
        Text("Roll the Dice!")
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(width: 200, height: 100, alignment: .center)
            .background(.blue)
            .cornerRadius(25)
            .padding(.top)
            .onTapGesture(perform: rollDice)
            .alert("Game Over!", isPresented: $showRestartAlert) {
                Button("Restart!") {
                    previousRolls.removeAll()
                    sum = 0
                }
            } message: {
                Text("Total of 10 rolls:\(sum)")
            }
            
        Spacer()
                
        Text("\(diceValue)")
            .font(.system(size: 75))
            .frame(width: 200, height: 200)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Rectangle())
            .cornerRadius(25)
            .padding(.bottom)
        
        Spacer()
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(previousRolls, id:\.self) { num in
                    Text("\(num)")
                        
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(25)
                        .padding()
                }
            }
        }
    }
    
    func rollDice() {
        
        if previousRolls.count < 11 {
            diceValue = Int.random(in: 1...6)
            previousRolls.append(diceValue)
            sum += diceValue
        } else {
            showRestartAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
