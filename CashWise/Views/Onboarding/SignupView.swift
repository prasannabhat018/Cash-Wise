//
//  SignupView.swift
//  CashWise
//
//  Created by Prasanna Bhat on 05/11/23.
//

import SwiftUI

struct SignupView: View {
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                    .frame(maxHeight: geometry.size.height * 0.15)
                HStack {
                    createAccountPrompt
                    Spacer()
                }
                
                signupForm
                
                HStack {
                    Spacer()
                    signupButton
                }
                
                Spacer()
                footerLink
                
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
    
    private var signupForm: some View {
        VStack(spacing: 40) {
            OnboardingTextField(text: $fullName,
                                placeholder: "FULL NAME",
                                imageName: ImageNames.SystemIcons.user)
            OnboardingTextField(text: $email,
                                placeholder: "EMAIL",
                                imageName: ImageNames.SystemIcons.email)
            OnboardingSecureTextField(text: $password,
                                      placeholder: "PASSWORD")
            OnboardingSecureTextField(text: $password,
                                      placeholder: "CONFIRM PASSWORD")
            
        }
        .padding()
        .foregroundColor(AppColors.subtitle)
    }
    
    private var createAccountPrompt: some View {
        VStack(alignment: .leading) {
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
        }
        .padding(.bottom, 20)
    }
    
    private var signupButton: some View {
        Button(action: {
            print("Sign up")
        }, label: {
            GradientRoundedButton(text: "SIGN UP")
        })
    }
    
    private var footerLink: some View {
        HStack(spacing: 5) {
            Text("Already have a account?")
                .foregroundStyle(AppColors.subtitle)
                .fontWeight(.semibold)
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Sign in")
                    .foregroundStyle(AppColors.themeColor)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    SignupView()
}
