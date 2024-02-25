//
//  BubbleSort.swift
//  B.U.B.B.L.E.S
//
//  Created by ditthales on 19/02/24.
//

import Foundation
import SwiftUI

enum Step {
    case yes, no, next, question, none
}

class BubbleSort: ObservableObject {
    
    @Published var shouldLoop = false
    @Published var tickRate = 0.5
    @Published var numbers = [Int]()
    @Published var currentIndex = 0
    @Published var message = ""
    @Published var dialogState: DialogState = .tutorial
    @Published var step: Step = .none
    
    var nextIndex: Int {
        if currentIndex == 7 {
            return 0
        } else {
            return currentIndex + 1
        }
    }
    
    
    let sortedPlanets: [Planet] = [
        .mercury,
        .venus,
        .earth,
        .mars,
        .jupiter,
        .saturn,
        .uranus,
        .neptune,
    ]
    
    var sortedNumbers: [Int] {
        numbers.sorted()
    }
    
    var isOrdered: Bool {
        numbers == sortedNumbers
    }
    
    static var shared = BubbleSort()
    
    func reset(qtd: Int) {
        shouldLoop = false
        currentIndex = 0
        tickRate = 0.5
        generateRandomNumbers(qtd: qtd)
        //planets.shuffle()
    }
    
    func runLoop() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + tickRate) {
            
            self.bubbleSortStep()
            
            if self.numbers != self.sortedNumbers && self.shouldLoop {
                self.runLoop()
            } else {
                self.shouldLoop = false
            }
        }
    }
    
    func generateRandomNumbers(qtd: Int) {
        var uniqueNumbers = Set<Int>()
        
        while uniqueNumbers.count < qtd {
            let randomNumber = Int.random(in: 0..<8)
            uniqueNumbers.insert(randomNumber)
        }
        
        numbers = Array(uniqueNumbers)
        
        message = "Does \(sortedPlanets[numbers[currentIndex]].rawValue) comes after \(sortedPlanets[numbers[nextIndex]].rawValue)?"
        step = .question
    }
    
    func bubbleSortStep() {
        
        guard currentIndex < numbers.count - 1 else {
            currentIndex = 0
            message = "Does \(sortedPlanets[numbers[currentIndex]].rawValue) comes after \(sortedPlanets[numbers[nextIndex]].rawValue)?"
            step = .question
            return
        }
        
        if numbers[currentIndex] > numbers[currentIndex + 1] {
            if message == "Yes, let's swap them!" {
                numbers.swapAt(currentIndex, currentIndex + 1)
                message = "Let's move on"
                step = .next
            } else {
                message = "Yes, let's swap them!"
                step = .yes
            }
            
        } else {
            if message == "No, let's move on" || message == "Let's move on" {
                currentIndex += 1
                if currentIndex != 7 {
                    message = "Does \(sortedPlanets[numbers[currentIndex]].rawValue) comes after \(sortedPlanets[numbers[nextIndex]].rawValue)?"
                    step = .question
                }
            } else {
                message = "No, let's move on"
                step = .no
            }
            
        }
        
        if isOrdered {
            message = ""
            dialogState = .ending
        }
    }
}
