//
//  OnboardingTextField.swift
//  CashWise
//
//  Created by Prasanna Bhat on 05/11/23.
//

import SwiftUI

protocol OnboardingInputField: View {
    var placeholder: String { get }
    var text: Binding<String> { get }
    var imageName: String { get }
}

extension OnboardingInputField {
    var iconSize: CGFloat { 16 }
    var iconSpacing: CGFloat { 20 }
    
    var seperator: some View {
        Rectangle()
            .frame(width: .infinity, height: 1)
            .foregroundStyle(AppColors.subtitle)
    }
}

struct OnboardingTextField: OnboardingInputField {
    var text: Binding<String>
    var placeholder: String
    var imageName: String
    
    var body: some View {
        VStack {
            HStack(spacing: iconSpacing) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: iconSize, height: iconSize)
                TextField(placeholder, text: text)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            seperator
        }
    }
}

struct OnboardingSecureTextField: OnboardingInputField {
    var text: Binding<String>
    var placeholder: String
    var imageName: String = ImageNames.SystemIcons.password
    
    var body: some View {
        VStack {
            HStack(spacing: iconSpacing) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: iconSize, height: iconSize)
                SecureField(placeholder, text: text)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            seperator
        }
    }
}

#Preview {
    VStack {
        OnboardingTextField(text: .constant(""),
                            placeholder: "EMAIL",
                            imageName: ImageNames.SystemIcons.email)
        OnboardingSecureTextField(text: .constant(""), 
                                  placeholder: "PASSWORD")
    }
}
