//
//  CreditsView.swift
//  B.U.B.B.L.E.S
//
//  Created by ditthales on 25/02/24.
//

import SwiftUI

struct CreditsView: View {
    @State private var isTextHidden = true
    
    var body: some View {
        ZStack {
            VStack{
                Text("This experience was made by Thales Fraga especially for apple's WWDC Swift Student Challenge 2024.\n\nRoyalties free music:\nSonnor by Eugenio Mininni\nAvailable on mixkit.co\n\nCustom Fonts:\nOrbitron by Matt McInerney\nAvailable on Google Fonts\n\nIllustrations made by:\nThales Fraga\n\nScript made by:\nThales Fraga\n\nSpecial thanks to:\n\n\n\n\n\n\n\n\n\n\nApple\nFederal University of Pernambuco (UFPE)\nCenter for Informatics - UFPE\nOdilon Maroja\nApple Developer Academy - UFPE")
                    .font(Font.custom(.orbitron, size: Constants.FONT_SIZE))
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 550, height: 2*UIScreen.main.bounds.height, alignment: .center)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                            withAnimation(.linear(duration: 10)) {
                                isTextHidden = false
                            }
                        }
                    }
            }
            .offset(y: isTextHidden ? 1.5*UIScreen.main.bounds.height : -UIScreen.main.bounds.height)
            .onChange(of: isTextHidden) { _ in
                withAnimation(.linear(duration: 15)) {
                }
            }
        }
        
    }
}

