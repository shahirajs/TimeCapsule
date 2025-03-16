import SwiftUI

struct SelectACapsuleView: View {
    let images: [String] = ["Clock", "Camera", "Lock", "Rocket"]
    @State private var selectedImage: String = "Clock" // Default selection
    @State private var navigateToNextPage = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("pinkngreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    NavigationLink(destination: Homepage1View()) {
                        Image(systemName: "x.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding(.leading, 290)
                            .padding(.top, 15)
                    }
                    
                    Text("Select your time capsule")
                        .fontWeight(.semibold)
                        .font(.system(size: 40))
                        .foregroundColor(Color("F6C7CD"))
                        .padding(.top, 70)
                        .padding(.bottom, -50)
                        .multilineTextAlignment(.center)
                    
                    TabView(selection: $selectedImage) {
                        ForEach(images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 350)
                                .tag(image) // Tag each image with its name
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(height: 400)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                    // Updated NavigationLink to navigate to NoteView
                    NavigationLink(destination: HomepageView().navigationBarBackButtonHidden(true), isActive: $navigateToNextPage) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .font(.system(size: 30))
                            .foregroundColor(Color("736ECC"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("F6C7CD"))
                            .cornerRadius(40)
                            .padding(.horizontal, 100)
                    }
                    .padding(.bottom, 60)

                }
            }
        }
    }
}

#Preview {
    SelectACapsuleView()
}
