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
                    Spacer()
                    
                    
                    Text("You have a capsule to open!")
                        .fontWeight(.semibold)
                        .font(.system(size: 38))
                        .foregroundColor(Color("FFEFD0"))
                        .multilineTextAlignment(.center)
                
                    Image("Rocket")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    
                    Text("00:00:00")
                        .fontWeight(.semibold)
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("A capsule from 12th January 2009....")
                        .fontWeight(.semibold)
                        .font(.system(size: 17.5))
                        .foregroundColor(Color("37357E"))
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Open")
                            .fontWeight(.semibold)
                            .font(.system(size: 30))
                            .foregroundColor(Color("736ECC"))
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(Color("1BFEFD"))
                            .cornerRadius(40)
                            .padding(.horizontal, 100)
                    }
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
