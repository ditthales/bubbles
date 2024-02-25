//
//  DialogView.swift
//  B.U.B.B.L.E.S
//
//  Created by ditthales on 20/02/24.
//

import SwiftUI

struct DialogView: View {
    
    @State var dialogState: DialogState
    
    @State var animateText = ""
    @State var indexNumber = 0
    @State var timeInterval: TimeInterval = 0.01
    @State var shouldType = true
    
    @State var dialogIndex = 0
    
    @State var finalDialog = false
    
    var endFunction: () -> ()
    
    var buttonLabel: String {
        
        if dialogEnd {
            switch dialogState {
            case .tutorial:
                return "Let's go!"
            case .ending:
                return "I'm ready!"
            case .none:
                return ""
            }
        } else if text == animateText {
            return "Next"
        } else {
            return "Skip"
        }
        
        
    }
    
    var text: String {
        if dialogIndex < dialog.count {
            return dialog[dialogIndex]
        }
        return ""
    }
    
    var dialogEnd: Bool {
        return dialogIndex == dialog.count - 1 && text == animateText
    }
    
    var dialogTutorial = [
        "Please put your device in landscape mode!",
        "Hello! My name is Blob, and I'm from B.U.B.B.L.E.S. I've been looking for you. You're the newbie, right?",
        "Wait, you don't even know what B.U.B.B.L.E.S is?",
        "Well, first of all, congratulations! Now you're the newbie.",
        "B.U.B.B.L.E.S stands for Benevolent Union of Brave Beings Leading Earth's Salvation.",
        "We are a legion that fights supervillains.",
        "Well, enough talk! We have your mission.",
        "Listen up, rookie. The universe is in chaos.",
        "A notorious villain has tampered with the very fabric of reality.",
        "Planets are displaced, stars are in disarray, and chaos reigns supreme.",
        "Our intel suggests that the villain has scattered the planets across the cosmos.",
        "Your task is to restore order to the universe by reorganizing the planets.",
        "But be warned, this won't be easy.",
        "The B.U.B.B.L.E Sort algorithm is the key to our success. It's a simple yet powerful tool.",
        "Here's how it works: For each pair of adjacent planets, check if they are in the correct order.",
        "If they are not, swap their positions.",
        "Then, move on to the next pair of planets and repeat the process.",
        "Continue doing this until the entire list of planets is sorted.",
        "This algorithm might seem straightforward, but it's crucial for our mission.",
        "Are you ready to learn and master Bubble Sort to save the universe?"
    ]
    
    var dialogEnding = [
        "Congratulations, you have completed the interactive tutorial!",
        "You now master one of the most powerful algorithms in the universe.",
        "Which is excellent for a beginner.",
        "Now you are able to stop the supervillain and complete your mission.",
        "The universe is counting on you!",
        "I'm serious, no more games...",
        "THE UNIVERSE IS COUNTING ON YOU!"
    ]
    
    var dialog: [String] {
        switch dialogState {
        case .tutorial:
            return dialogTutorial
        case .ending:
            return dialogEnding
        case .none:
            return []
        }
    }
    
    @State var textIndex = 0
    
    var body: some View {
        HStack (alignment: .top, spacing: 50){
            Image(.agent)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .padding(.vertical, 10)
            Spacer()
            VStack (alignment: .trailing) {
                Text(animateText)
                    .font(Font.custom(.orbitron, size: Constants.FONT_SIZE))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.white)
                    .onAppear{
                        startAnimation()
                }
                Spacer()
                Button {
                    if animateText != text {
                        animateText = text
                        shouldType = false
                    } else {
                        if dialogEnd {
                            endFunction()
                        } else {
                            dialogIndex += 1
                            animateText = ""
                            indexNumber = 0
                            shouldType = true
                            startAnimation()
                        }
                    }
                    
                } label: {
                    Text(buttonLabel)
                        .font(Font.custom(.orbitron, size: 22))
                        .foregroundStyle(.green)
                }
            }.padding(.top, 50)
                .padding(.bottom, 70)
        }
        .frame(height: 300)
        .padding(.horizontal, 50)
        .padding(.bottom, -50)
        .background(Color("Smoke", bundle: .main))
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .clipShape(.rect(cornerRadius: 30))
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            if indexNumber < text.count && shouldType {
                animateText += String(text[text.index(text.startIndex, offsetBy: indexNumber)])
                indexNumber += 1
            } else {
                timer.invalidate()
            }
        }
    }
}

