//
//  BarView.swift
//  B.U.B.B.L.E.S
//
//  Created by ditthales on 19/02/24.
//

import SwiftUI

struct BarView: View {
    
    @ObservedObject var bubbleSort = BubbleSort.shared
    
    var nBars: Int
    
    var body: some View {
        VStack {
            Spacer()
            Text(bubbleSort.message)
                .font(Font.custom(.orbitron, size: Constants.FONT_SIZE))
                .foregroundStyle(.white)
            HStack(spacing: 5) {
                ForEach(bubbleSort.numbers.indices, id: \.self) { index in
                    let numberValue = bubbleSort.numbers[index]
                    if numberValue < bubbleSort.sortedPlanets.count {
                        let planetName = bubbleSort.sortedPlanets[numberValue].rawValue
                        VStack {
                            Triangle()
                                .fill(self.color(for: index))
                                .frame(width: 20, height: 20)
                            Image(planetName)
                                .resizable()
                            .frame(width: 100, height: 100)
                            Text(planetName)
                                .font(Font.custom(.orbitron, size: 16))
                                .foregroundStyle(.white)
                                
                        }
                        
                        
                    }

                }
            }
            Spacer()
        }
        .onAppear {
            bubbleSort.generateRandomNumbers(qtd: nBars)
            //bubbleSort.planets.shuffle()
        }
    }
    
    func color(for index: Int) -> Color {
        if index == bubbleSort.currentIndex || index == bubbleSort.currentIndex + 1 {
            return .yellow
        } else if bubbleSort.numbers[index] == bubbleSort.sortedNumbers[index] {
            return .green
        } else {
            return .red
        }
    }
}

#Preview {
    BarView(nBars: 35)
}
