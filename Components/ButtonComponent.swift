//
//  ButtonComponent.swift
//  B.U.B.B.L.E.S
//
//  Created by ditthales on 20/02/24.
//

import SwiftUI

struct ButtonComponent: View {
    
    @State var title: String
    
    var buttonFunc: () -> ()
    
    var body: some View {
        Button(action: {
            buttonFunc()
        }) {
            Text(title)
                .font(Font.custom(.orbitron, size: Constants.FONT_SIZE))
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .shadow(color: Color.blue.opacity(0.7), radius: 10, x: 0, y: 0)
                )
                .padding(.horizontal, 20)
        }
    }
}



