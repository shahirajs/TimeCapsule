//
//  BuryCapsuleView.swift
//  TimeCapsule
//
//  Created by Thamadi Kulathunga on 15/3/2025.
//

import SwiftUI

struct BuryCapsuleView: View {
    let selectedImage: String // Store the selected image
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("pinkngreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    //orderHeader()
                    
                    HStack {
                        Spacer()

                    }
                    
                    Text("Your capsule has been buried!")
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
                    //bottomNavigationBar()
                }
            }
        }
    }
    
    @ViewBuilder
    func orderHeader() -> some View {
        ZStack {
            Color.accentColor
                .frame(maxWidth: .infinity, maxHeight: 150)
                .edgesIgnoringSafeArea(.top)
            
            Text("Lockit")
                .fontWeight(.semibold)
                .font(.system(size: 25))
                .foregroundStyle(.white)
                .padding(.top, 45)
                .padding(.bottom, 10)
                .font(.custom("American Typewriter", size: 28))
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .padding(.top, 35)
                .padding(.leading, 290)
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
                
                NavigationLink(destination: ContentView()
                    .navigationBarBackButtonHidden(true)) {
                        Image(systemName: "house")
                            .font(.system(size: 30))
                            .foregroundStyle(.white)
                    }
                
                Spacer(minLength: 90)
                
                NavigationLink(destination: ContentView()
                    .navigationBarBackButtonHidden(true)) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                    }
                
                Spacer(minLength: 90)
                
                NavigationLink(destination: ContentView()
                    .navigationBarBackButtonHidden(true)) {
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

#Preview {
    BuryCapsuleView(selectedImage: "Clock")
}

