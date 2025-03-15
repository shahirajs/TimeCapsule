import SwiftUI
import PhotosUI

struct SelectDateView: View {
    @State private var isImagePickerPresented = false
    @State private var selectedImage: Image? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                Image("gree")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    ScrollView {
                        content()
                            .padding(.top, 20)
                    }
                    Spacer()
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                SelectImageView(selectedImage: $selectedImage)
            }
        }
    }

    @ViewBuilder
    func content() -> some View {
        VStack {
            NavigationLink(destination: ContentView()) {
                Image(systemName: "x.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .padding(.leading, 290)
            }

            Text("What will be in your lockit?")
                .fontWeight(.bold)
                .font(.system(size: 35))
                .foregroundColor(Color("textColor1"))
                .padding(.top, 45)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
                .padding(.trailing, 20)
                .padding(.leading, 20)
                .tracking(0.7)

            // Swipeable rectangles
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

                        // Display selected image
                        if let selectedImage {
                            selectedImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .padding(.top, 10)
                        }

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

            // Buttons
            HStack {
                Button(action: {
                    // Trigger photo selection
                    isImagePickerPresented = true
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

                NavigationLink(destination: ContentView()) {
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
}

#Preview {
    SelectDateView()
}
