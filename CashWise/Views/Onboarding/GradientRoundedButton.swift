//
//  GradientRoundedButton.swift
//  CashWise
//
//  Created by Prasanna Bhat on 05/11/23.
//

import SwiftUI

struct GradientRoundedButton: View {
    var text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(text)
            Image(systemName: ImageNames.SystemIcons.rightArrow)
        }
        .padding()
        .background(
            LinearGradient(stops: [.init(color: AppColors.themeColor.opacity(0.55), location: 0.0),
                                   .init(color: AppColors.themeColor.opacity(1.0), location: 1.0)],
                           startPoint: .leading,
                           endPoint: .trailing)
        )
        .foregroundStyle(.white)
        .fontWeight(.bold)
        .clipShape(.capsule(style: .circular))
    }
}

#Preview {
    GradientRoundedButton(text: "LOGIN")
}
