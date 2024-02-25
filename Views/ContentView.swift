import SwiftUI

enum DialogState {
    case tutorial, ending, none
}

struct ContentView: View {
    
    @ObservedObject var bubbleSort = BubbleSort.shared
    
    @State var isTheEnd = false
    
    let planetsNumber = 8
    
    var body: some View {
        
        if !isTheEnd {
            
            VStack {
                
                if bubbleSort.dialogState == .tutorial {
                    DialogView(dialogState: bubbleSort.dialogState) {
                        bubbleSort.dialogState = .none
                    }
                } else {
                    
                    if bubbleSort.dialogState == .ending {
                        DialogView(dialogState: bubbleSort.dialogState) {
                            bubbleSort.dialogState = .none
                            isTheEnd = true
                        }
                    }
                    
                    BarView(nBars: planetsNumber)
                    
                    HStack {
                        if bubbleSort.isOrdered {
                            
                        } else {
                            if !bubbleSort.shouldLoop {
                                ButtonComponent(title: "Automatic Sort") {
                                    bubbleSort.shouldLoop = true
                                    bubbleSort.runLoop()
                                }
                            } else {
                                ButtonComponent(title: "Stop") {
                                    bubbleSort.shouldLoop = false
                                }
                            }
                            if !bubbleSort.shouldLoop {
                                
                                if bubbleSort.step == .question && (bubbleSort.numbers[bubbleSort.currentIndex] > bubbleSort.numbers[bubbleSort.currentIndex + 1]) {
                                    ButtonComponent(title: "Yes") {
                                        bubbleSort.bubbleSortStep()
                                    }
                                    ButtonComponent(title: "No") {
                                        bubbleSort.message = "Wrong answer!"
                                    }
                                } else if bubbleSort.step == .question && (bubbleSort.numbers[bubbleSort.currentIndex] <= bubbleSort.numbers[bubbleSort.currentIndex + 1]){
                                    ButtonComponent(title: "Yes") {
                                        bubbleSort.message = "Wrong answer!"
                                    }
                                    ButtonComponent(title: "No") {
                                        bubbleSort.bubbleSortStep()
                                    }
                                } else {
                                    ButtonComponent(title: "Next Step") {
                                        bubbleSort.bubbleSortStep()
                                    }
                                }
                                
                            } else {
                                ButtonComponent(title: "Faster") {
                                    bubbleSort.tickRate /= 2
                                }
                                ButtonComponent(title: "Slower") {
                                    bubbleSort.tickRate *= 2
                                }
                            }
                        }
                        
                        
                    }
                    Spacer()
                    
                }
            }
            .padding(50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image(.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            )
        } else {
            
            ZStack {
                
                FinalView()
                
                CreditsView()
                
            }
            .background(
                Image(.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            )
            
        }
    }
    
}

#Preview {
    ContentView()
}
