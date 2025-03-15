import SwiftUI

struct NoteView: View {
    @State private var chosenDate: Date = Date() // Initial date set to current date
    @State private var isDatePickerVisible: Bool = false
    @State private var selectedDate: Date? = nil // Date the user selects
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("gree")
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
                
                if isDatePickerVisible { // If the DatePicker is visible
                    VStack {
                        
                        DatePicker("Select A Date", selection: $chosenDate, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 10)
                        
                        Button(action: {
                            selectedDate = chosenDate // Save chosen date
                            isDatePickerVisible = false // Hide DatePicker after selection
                        }) {
                            Text("Done")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accent)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                    .cornerRadius(15)
                    .shadow(radius: 20)
                    .padding(.horizontal, 30)
                    .transition(.scale)
                    .animation(.spring(), value: isDatePickerVisible)
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
            NavigationLink(destination: ContentView()) {
                Image(systemName: "x.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .padding(.leading, 290)
                    .padding(.top, 15)
            }
            
            Text("Select a date for future you to open ")
                .fontWeight(.bold)
                .font(.system(size: 35))
                .foregroundColor(Color("textColor1"))
                .padding(.top, 60)
                .multilineTextAlignment(.center)
                .padding(.trailing, 20)
                .padding(.leading, 20)
                .tracking(1)
            
            Button(action: {
                withAnimation {
                    isDatePickerVisible.toggle() // Toggle the DatePicker visibility
                }
            }) {
                ZStack {
                    HStack {
                        Text(getFormattedDate())
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .padding(.leading, 60)
                        
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.accent)
                            .frame(width: 70, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.trailing, 5)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Color.accent)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding()
            }
            
            NavigationLink(destination: ContentView()) {
                Text("Bury LockIt!")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(Color("textColor3"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("textColor2"))
                    .cornerRadius(40)
                    .padding(.horizontal, 40)
                    .padding(.top, 350)
                    .tracking(0.7)
            }
            .padding(.top, 20)
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
    
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        return formatter.string(from: selectedDate ?? Date()) // Use current date if none is selected
    }
}

#Preview {
    NoteView()
}
