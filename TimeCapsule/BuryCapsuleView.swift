//
//  BuryCapsuleView.swift
//  TimeCapsule
//
//  Created by Thamadi Kulathunga on 15/3/2025.
//

import SwiftUI

struct BuryCapsuleView: View {
    let selectedImage: String // Store the selected image
    @State private var navigateToNextPage = false
    @State private var showContent = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("pinkngreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        Spacer()
                    }

                    Text("Your LockIt has been buried!")
                        .fontWeight(.semibold)
                        .font(.system(size: 40))
                        .foregroundColor(Color("F6C7CD"))
                        .padding(.top, 200)
                        .multilineTextAlignment(.center)

                    // Display the selected image
                    Image(selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                        .padding(.top, -15)
                        .padding()

                    Spacer()
                }

                NavigationLink(destination: Homepage1View(), isActive: $navigateToNextPage) {
                    EmptyView()
                }
                .hidden()
            }
            .onAppear {
                // Start a 2-second delay before navigating
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigateToNextPage = true
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    BuryCapsuleView(selectedImage: "Rocket")
}

