import SwiftUI

struct OpenLockIt: View {
    @State private var navigateToNextPage = false
    @State private var chosenDate: Date = Date() // Initial date set to current date
    @State private var selectedDate: Date? = nil // Date the user selects
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("pin")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    //orderHeader()
                    ScrollView {
                        content()
                            .padding(.top, 20)
                    }
                    Spacer()
                    //bottomNavigationBar()
                }
            }
            .navigationBarBackButtonHidden(true) // Hide the back button for this view
        }
    }
    
    @ViewBuilder
    func orderHeader() -> some View {
        ZStack {
            Color.accentColor
                .frame(maxWidth: .infinity, maxHeight: 150)
                .edgesIgnoringSafeArea(.top)
            
            Text("LockIt")
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
            NavigationLink(destination: Homepage1View()) {
                Image(systemName: "x.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .padding(.leading, 290)
                    .padding(.top, 15)
            }

            Text("A memory from \(getFormattedDate())")
                .fontWeight(.bold)
                .font(.system(size: 35))
                .foregroundColor(Color("textColor2"))
                .padding(.top, 30)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .tracking(1)

            .padding(.top, 20)
        }
        .padding(.horizontal, 20)
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
    
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        return formatter.string(from: selectedDate ?? Date()) // Use current date if none is selected
    }
}

#Preview {
    OpenLockIt()
}
