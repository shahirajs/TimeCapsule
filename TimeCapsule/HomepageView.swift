//
//  HomepageView.swift
//  TimeCapsule
//
//  Created by Thamadi Kulathunga on 15/3/2025.
//

import SwiftUI

struct NoteView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("purplenwhite")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    orderHeader()
                    
                    
                    Text("You have a capsule to open!")
                        .fontWeight(.semibold)
                        .font(.system(size: 40))
                        .foregroundColor(Color("F6C7CD"))
                        .padding(.top, 60)
                        .padding(.bottom, 10)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    // Display the selected image
                    Image("Rocket")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Open")
                            .fontWeight(.semibold)
                            .font(.system(size: 30))
                            .foregroundColor(Color("736ECC"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("F6C7CD")) // Pink background color from the asset catalog
                            .cornerRadius(40) // Rounded corners
                            .padding(.horizontal, 100)
                    }
                    .padding(.bottom, 40)
                    
                    Spacer()
                    bottomNavigationBar()
                }
            }
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
    NoteView()
}
