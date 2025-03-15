//
//  NoteView.swift
//  TimeCapsule
//
//  Created by Shahira Jasmine on 15/3/2025.
//

import SwiftUI

struct NoteView: View {
    var body: some View {
            NavigationStack {
                ZStack {
                    Image("gree")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        orderHeader()
                        ScrollView {
                            content()
                                .padding(.top, 20)
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
    func content() -> some View {
        VStack {
            Text("What will be in your capsule?")
                .fontWeight(.bold)
                .font(.system(size: 40))
                .foregroundColor(Color("textColor1"))
                .padding(.top, 45)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
            
            
            TabView(selection: $currentIndex) {
                ForEach(0..<numberOfRectangles, id: \.self) { index in
                    VStack {
                        TextField("Add a title...", text: $titles[index])
                            .foregroundColor(Color("textColor1"))
                            .accentColor(Color("textColor1"))
                            .font(.system(size: 30))
                            .padding()
                            .cornerRadius(10)
                            .padding(.horizontal)
                        
                        TextField("Write a message...", text: $messages[index])
                            .font(.system(size: 20))
                            .foregroundColor(Color("textColor1"))
                            .accentColor(Color("textColor1"))
                            .background(Color.white.opacity(0.7))
                            .padding(.top, -25)
                            .padding(.leading, 15)
                            .padding(.horizontal)
                            .frame(minHeight: 50)

                        Spacer()
                    }
                    .frame(width: 340, height: 340)
                    .foregroundStyle(.white)
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(.top, 20)
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 360)
            .onAppear {
                loadMoreContent()
            }
            .onChange(of: currentIndex) { newIndex in
                if newIndex == numberOfRectangles - 1 {
                    loadMoreContent()
                }
            }

            HStack {
                ForEach(0..<numberOfRectangles, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color.white : Color("textColor1"))
                        .frame(width: 10, height: 10)
                        .padding(10)
                }
            }
            
            HStack {
                Button(action: {
                    //action
                }) {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 65, height: 65)

                        Text("📷")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 5)

                Button(action: {
                    //action
                }) {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 65, height: 65)

                        Text("🎥")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 5)

                Button(action: {
                    //action
                }) {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 65, height: 65)

                        Text("🎤")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 5)

                Button(action: {
                    //action
                }) {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 65, height: 65)

                        Text("🎧")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 5)
            }
            
            HStack {
                
                Button(action: {
                    //action
                }) {
                    ZStack {
                        Circle()
                            .fill(.accent)
                            .frame(width: 70, height: 70)

                        Image(systemName: "person.badge.plus")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 20)
                }
                
                Button(action: {
                    if currentIndex < numberOfRectangles - 1 {
                        currentIndex += 1
                    } else {
                        loadMoreContent()
                    }
                }) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .font(.system(size: 30))
                        .foregroundColor(Color("textColor3"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("textColor2"))
                        .cornerRadius(40)
                        .padding(.horizontal, 40)
                }

            }
            .padding(.top, 20)

        }
    }

    @State private var numberOfRectangles = 1
    @State private var currentIndex = 0

    @State private var titles: [String] = Array(repeating: "", count: 10)
    @State private var messages: [String] = Array(repeating: "", count: 10)

    func loadMoreContent() {
        if numberOfRectangles < 10 {
            numberOfRectangles += 1
            titles.append("")
            messages.append("")
        }
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


