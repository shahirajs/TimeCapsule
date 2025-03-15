import SwiftUI

struct SelectDateView: View {
    @State private var chosenDate: Date = Date() // Initial date set to current date
    @State private var isDatePickerVisible: Bool = false
    @State private var selectedDate: Date? = nil // Date the user selects
    
    @AppStorage("selectedImage") private var selectedImage: String = "Clock"  // Retrieve the selected image
    
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
            .onAppear {
                // Refresh the image whenever the view appears
                selectedImage = UserDefaults.standard.string(forKey: "selectedImage") ?? "Clock"
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
            
            // Display the image that was selected
            Image(selectedImage) // Use the image name stored in AppStorage
                .resizable()
                .scaledToFit()
                .frame(height: 350)
                .padding(.top, -10)
            
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
                    .tracking(0.7)
            }
            .padding(.top, 5)
        }
    }
    
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        return formatter.string(from: selectedDate ?? Date()) // Use current date if none is selected
    }
}

#Preview {
    SelectDateView()
}
