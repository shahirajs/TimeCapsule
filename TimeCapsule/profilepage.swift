//
//  profilepage.swift
//  TimeCapsule
//
//  Created by Vincent Anter on 15/3/2025.
//

//
//  NoteView.swift
//  TimeCapsule
//
//  Created by Shahira Jasmine on 15/3/2025.
//

import SwiftUI


struct CapsuleItem {
    let image: String
    let unlockTime: Date
}

struct profilepage: View {
    @State private var selectedTab = "Your Capsule"
    @State private var capsules: [CapsuleItem] = []
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Image("black")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) //
                
                VStack {
                    orderHeader()

                    
                    Image("aiman")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        .padding(.top, 10)

                    toggleTabs
                    capsuleGrid //

                    Spacer()
                    bottomNavigationBar()
                }
            }
            .onAppear {
                setupCapsules() //
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Capsule Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    @ViewBuilder
    func orderHeader() -> some View {
        ZStack {
            Color.accentColor
                .frame(maxWidth: .infinity, maxHeight: 150)
                .edgesIgnoringSafeArea(.top)

            Text("lockit")
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
                .position(x: UIScreen.main.bounds.width - 50, y: 40)
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

    // MARK: - Toggle Tabs
    @ViewBuilder
    var toggleTabs: some View {
        HStack {
            Button(action: { selectedTab = "Your Capsule" }) {
                Text("Your Capsule")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedTab == "Your Capsule" ? Color.blue : Color.gray.opacity(0.3))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: { selectedTab = "Shared Capsules" }) {
                Text("Shared Capsules")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedTab == "Shared Capsules" ? Color.blue : Color.gray.opacity(0.3))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    // MARK: - Capsules
    func setupCapsules() {
        let now = Date()
        capsules = [
            CapsuleItem(image: "caps_clock", unlockTime: now.addingTimeInterval(60086)),  //
            CapsuleItem(image: "caps_glass", unlockTime: now.addingTimeInterval(120650)), //
            CapsuleItem(image: "caps_rocket", unlockTime: now.addingTimeInterval(1800)), //
            CapsuleItem(image: "caps_cloud", unlockTime: now.addingTimeInterval(24000))  //
        ]
    }

    var capsuleGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            ForEach(capsules, id: \.image) { capsule in
                Button(action: { checkCapsuleUnlock(capsule: capsule) }) {
                    VStack {
                        Image(capsule.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)

                        Text(timeRemaining(capsule.unlockTime))
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
    }

    // MARK: - Capsule Unlock Logic
    func checkCapsuleUnlock(capsule: CapsuleItem) {
        let now = Date()
        if now < capsule.unlockTime {
            let remaining = capsule.unlockTime.timeIntervalSince(now)
            let minutes = Int(remaining) / 60
            alertMessage = "You need to wait \(minutes) minutes."
            showAlert = true
        } else {
            alertMessage = "Your capsule is now available!"
            showAlert = true
        }
    }

    func timeRemaining(_ unlockTime: Date) -> String {
        let now = Date()
        if now >= unlockTime {
            return "Unlocked!"
        }
        let remaining = unlockTime.timeIntervalSince(now)
        let minutes = Int(remaining) / 60
        let seconds = Int(remaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

// ✅ FIX 3: Prevent circular reference in Preview
#Preview {
    profilepage()
}
