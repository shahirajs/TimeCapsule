import SwiftUI

struct OpenLockIt: View {
    @State private var chosenDate: Date = Date() // Initial date set to current date
    @State private var selectedDate: Date? = nil // Date the user selects
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Pink")
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
            NavigationLink(destination: ContentView()) {
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

            // 2x2 Grid Layout
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                // First: More rounded rectangle
                VStack {
                    Text("Memory 1")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color("textColor2"))
                        .padding(.top, 10)

                    Text("Some placeholder text for memory 1.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                }
                .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 180)
                .background(Color("textColor2"))
                .clipShape(RoundedRectangle(cornerRadius: 30)) // More rounded shape
                .shadow(radius: 5)

                // Second: 4-leaf clover
                VStack {
                    Image(systemName: "suit.club.fill") // 4-leaf clover icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.green)
                        .padding(.top, 10)

                    Text("Memory 2")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color("textColor2"))

                    Text("Some placeholder text for memory 2.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                }
                .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 180)
                .background(Color("color1"))
                .clipShape(RoundedRectangle(cornerRadius: 10)) // Keeping a mild rounded look
                .shadow(radius: 5)

                // Third: Normal Rectangle (unchanged)
                VStack {
                    Text("Memory 3")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color("textColor2"))
                        .padding(.top, 10)

                    Text("Some placeholder text for memory 3.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                }
                .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 180)
                .background(Color("color2"))
                .cornerRadius(20)
                .shadow(radius: 5)

                // Fourth: Circle Shape
                VStack {
                    Text("Memory 4")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color("textColor2"))
                        .padding(.top, 10)

                    Text("Some placeholder text for memory 4.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                }
                .frame(width: 180, height: 180) // Adjusting for a circular shape
                .background(Color("textColor2"))
                .clipShape(Circle()) // Making it a circle
                .shadow(radius: 5)
            }
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
