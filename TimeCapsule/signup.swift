//
//  signup.swift
//  TimeCapsule
//
//  Created by Shahira Jasmine on 16/3/2025.
//

import SwiftUI

struct signup: View {
    @State private var navigateToNextPage = false
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var navigateToHomepage = false
    @State private var navigateToSelectCapsule = false
    @State private var navigateToProfile = false

    var body: some View {
        NavigationStack {
            ZStack {
                // **Background Image**
                Image("black")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    // **Moves Navigation Bar Directly Below Dynamic Island**
                    //orderHeader()// Adjusted to move up

                    // Close Button to dismiss navigation
                    Button(action: {
                        // Logic to remove back navigation or pop the view
                        navigateToNextPage = true
                    }) {
                        Image(systemName: "x.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding(.leading, 290)
                            .padding(.top, 35)
                            .padding(.bottom, 130)
                    }
                    .padding(.bottom, 60)

                    // **Sign Up Form - Raised Upwards**
                    VStack(spacing: 15) {
                        Text("Create an account")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)

                        CustomTextField(icon: "person.fill", placeholder: "Name", text: $name)
                        CustomTextField(icon: "envelope.fill", placeholder: "Email", text: $email)
                        CustomTextField(icon: "lock.fill", placeholder: "Password", text: $password, isSecure: true)
                        CustomTextField(icon: "lock.fill", placeholder: "Confirm Password", text: $confirmPassword, isSecure: true)

                        Button(action: {
                            // Sign Up Logic
                        }) {
                            Text("SIGN UP")
                                .foregroundColor(.white)
                                .frame(width: 300, height: 50)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    .offset(y: -60) // **Moves the form upwards**

                    Spacer()

                    // **Bottom Navigation Bar - Stays in Place**
                    //bottomNavigationBar()
                        .padding(.bottom, -10)
                }
            }
            .navigationBarBackButtonHidden(true) // Hide the default back button
        }
        .navigationDestination(isPresented: $navigateToNextPage) {
            profilepage()
        }
    }

    @ViewBuilder
    func orderHeader() -> some View {
        ZStack {
            Color.accentColor
                .frame(maxWidth: .infinity, maxHeight: 150) // Set the height for the header
                .edgesIgnoringSafeArea(.top)
            
            Text("Lockit")
                .fontWeight(.semibold)
                .font(.system(size: 25))
                .foregroundStyle(.white)
                .padding(.top, 45)
                .padding(.bottom, 10)
                .font(.custom("American Typewriter", size: 28))
            
        }
        .frame(height: 100)
    }
    
@ViewBuilder
func bottomNavigationBar() -> some View {
    ZStack {
        Color.accentColor
            .frame(maxWidth: .infinity, maxHeight: 100)
            .edgesIgnoringSafeArea(.bottom)
        
        HStack {
            Spacer()
            
            NavigationLink(destination: Homepage1View().navigationBarBackButtonHidden(true), isActive: $navigateToHomepage) {
                Image(systemName: "house")
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
            }
            
            Spacer(minLength: 90)
            
            NavigationLink(destination: SelectACapsuleView().navigationBarBackButtonHidden(true), isActive: $navigateToSelectCapsule) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 35))
                    .foregroundStyle(.white)
            }
            
            Spacer(minLength: 90)
            
            NavigationLink(destination: profilepage().navigationBarBackButtonHidden(true), isActive: $navigateToProfile) {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 35))
                    .foregroundStyle(.white)
            }
            
            Spacer()
        }
        .padding(.bottom, 15)
    }
}

    // **Custom TextField Component**
    struct CustomTextField: View {
        var icon: String
        var placeholder: String
        @Binding var text: String
        var isSecure: Bool = false

        var body: some View {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .foregroundColor(.white)
                } else {
                    TextField(placeholder, text: $text)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
        }
    }
}

#Preview {
    signup()
}
