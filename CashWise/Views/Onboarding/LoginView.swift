//
//  LoginView.swift
//  CashWise
//
//  Created by Prasanna Bhat on 04/11/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
        
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                        .frame(maxHeight: geometry.size.height * 0.20)
                    
                    HStack {
                        /* for prompt's left alignment*/
                        loginPrompt
                        Spacer()
                    }
                    .padding(.bottom, 50)
                    
                    loginForm
                    
                    HStack {
                        /* for button right aligment */
                        Spacer()
                        loginButton
                    }
                    
                    Spacer()
                    footerLink
                    
                }
                .padding()
            }
        }
    }
    
    private var loginPrompt: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Please sign in to continue")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(AppColors.subtitle)
        }
    }
    
    private var loginForm: some View {
        VStack(spacing: 40) {
            OnboardingTextField(text: $email,
                                placeholder: "EMAIL",
                                imageName: ImageNames.SystemIcons.email)
            OnboardingSecureTextField(text: $password,
                                      placeholder: "PASSWORD")
        }
        .padding()
        .foregroundColor(AppColors.subtitle)
    }
    
    private var loginButton: some View {
        Button(action: {
            print("Email: \(email), Password: \(password)")
        }) {
            GradientRoundedButton(text: "LOGIN")
        }
    }
    
    private var footerLink: some View {
        HStack(spacing: 5) {
            Text("Don't have an account?")
                .foregroundStyle(AppColors.subtitle)
                .fontWeight(.semibold)
            NavigationLink {
                SignupView()
            } label: {
                Text("Sign up")
                    .foregroundStyle(AppColors.themeColor)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    LoginView()
}
