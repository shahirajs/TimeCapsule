//
//  Homepage2View.swift
//  TimeCapsule
//
//  Created by Thamadi Kulathunga on 16/3/2025.
//

import SwiftUI

struct Homepage2View: View {
    
    @State private var targetDate = Date().addingTimeInterval(10 * 365 * 24 * 60 * 60) // 10 years
    @State private var remainingTime: String = ""

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
                    
                    
                    Text("You have a capsule in 10 years!")
                        .fontWeight(.semibold)
                        .font(.system(size: 35))
                        .foregroundColor(Color("FFEFD0"))
                        .multilineTextAlignment(.center)
                
                    Image("Camera")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    
                        .onAppear {
                            startTimer()
                        }
                    Text(remainingTime)
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
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            let now = Date()
            let timeInterval = targetDate.timeIntervalSince(now)
            
            if timeInterval <= 0 {
                remainingTime = "00:00:00"
                timer.invalidate()
            } else {
                let days = Int(timeInterval) / (24 * 60 * 60)
                let hours = (Int(timeInterval) % (24 * 60 * 60)) / (60 * 60)
                let minutes = (Int(timeInterval) % (60 * 60)) / 60
                let seconds = Int(timeInterval) % 60
                remainingTime = String(format: "%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
            }
        }
    }

    
    
    
    
}

#Preview {
    Homepage2View()
}
