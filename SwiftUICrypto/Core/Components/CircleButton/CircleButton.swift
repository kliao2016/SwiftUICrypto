//
//  CircleButton.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 9/20/21.
//

import SwiftUI

struct CircleButton: View {
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
    }
}

#if DEBUG
struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(iconName: "info")
            .previewLayout(.sizeThatFits)
        
        CircleButton(iconName: "plus")
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
}
#endif
