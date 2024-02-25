//
//  FinalView.swift
//  B.U.B.B.L.E.S
//
//  Created by ditthales on 25/02/24.
//

import SwiftUI

struct FinalView: View {
    @State private var isGrowing = false
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.white.opacity(0.4))
                .scaleEffect(isGrowing ? 50 : 0.1)
                .animation(.easeInOut(duration: 4), value: isGrowing)
                .onAppear {
                    self.isGrowing = true
                }
            Circle()
                .fill(Color.white.opacity(0.6))
                .scaleEffect(isGrowing ? 50 : 0.1)
                .animation(.easeInOut(duration: 5), value: isGrowing)
                .onAppear {
                    self.isGrowing = true
                }
            Circle()
                .fill(Color.white)
                .scaleEffect(isGrowing ? 50 : 0.1)
                .animation(.easeInOut(duration: 6), value: isGrowing)
                .onAppear {
                    self.isGrowing = true
                }
        }
        
    }
}
