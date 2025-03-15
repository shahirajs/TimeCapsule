import SwiftUI

struct SelectACapsuleView: View {
    let images: [String] = ["Clock", "Camera", "Lock", "Rocket"]
    @State private var selectedImage: String? = nil
    @State private var navigateToNextPage = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("pinkngreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    //orderHeader()
                    NavigationLink(destination: ContentView()) {
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
                    
                    
                    TabView {
                        ForEach(images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 350)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(height: 400)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                    NavigationLink(destination: BuryCapsuleView(selectedImage: selectedImage ?? "Clock"), isActive: $navigateToNextPage) {
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
    SelectACapsuleView()
}
