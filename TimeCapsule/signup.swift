//
//  signup.swift
//  TimeCapsule
//
//  Created by Shahira Jasmine on 16/3/2025.
//

import SwiftUI

struct signup: View {
    @State private var name = ""
        @State private var email = ""
        @State private var password = ""
        @State private var confirmPassword = ""

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
                        orderHeader()
                            .padding(.top, -55) // Adjusted to move up

                        Spacer()

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
                        bottomNavigationBar()
                            .padding(.bottom, -10)
                    }
                }
            }
        }

        // **Navigation Bar Positioned Right Below Dynamic Island**
        @ViewBuilder
        func orderHeader() -> some View {
            ZStack {
                Color.accentColor
                    .frame(height: 150)
                    .ignoresSafeArea(edges: .top) // Covers the entire top part

                HStack {
                    Spacer()

                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        }


        // **Bottom Navigation Bar (Same as Capsule Page)**
        @ViewBuilder
        func bottomNavigationBar() -> some View {
            ZStack {
                Color.accentColor
                    .frame(height: 100)
                    .ignoresSafeArea(edges: .bottom)

                HStack {
                    Spacer()

                    NavigationLink(destination: profilepage()) {
                        Image(systemName: "house")
                            .font(.system(size: 30))
                            .foregroundStyle(.white)
                    }

                    Spacer(minLength: 90)

                    NavigationLink(destination: profilepage()) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                    }

                    Spacer(minLength: 90)

                    NavigationLink(destination: profilepage()) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                    }

                    Spacer()
                }
                .padding(.bottom, 15)
            }
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

#Preview {
    signup()
}
