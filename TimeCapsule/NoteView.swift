import SwiftUI
import PhotosUI
import AVFoundation

struct NoteView: View {
    
    @State private var numberOfRectangles = 1
    @State private var currentIndex = 0
    @State private var titles: [String] = Array(repeating: "", count: 10)
    @State private var messages: [String] = Array(repeating: "", count: 10)
    @State private var selectedImages: [Image?] = Array(repeating: nil, count: 10)
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var isPhotoPickerPresented = false
    @State private var audioRecorder: AVAudioRecorder?
    @State private var audioPlayer: AVAudioPlayer?
    @State private var audioURLs: [URL?] = Array(repeating: nil, count: 10)
    @State private var isRecording: Bool = false
    @State private var recordingTime: Int = 0
    @State private var songName: String = ""  // Added to store the song name
    @State private var isPopupPresented: Bool = false // To track popup visibility
    @State private var songNames: [String] = Array(repeating: "", count: 10) // Store song names for each index
    
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

            Text("What will be in your LockIt?")
                .fontWeight(.bold)
                .font(.system(size: 35))
                .foregroundColor(Color("textColor1"))
                .padding(.top, 30)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
                .padding(.trailing, 20)
                .padding(.leading, 20)
                .tracking(0.7)

            TabView(selection: $currentIndex) {
                ForEach(0..<numberOfRectangles, id: \.self) { index in
                    VStack {
                        if let audioURL = audioURLs[index] {
                            // Show play button for the audio if it exists
                            Button(action: {
                                playAudio(from: audioURL)
                            }) {
                                Text("▶️ Play Voice Memo")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.accent)
                                    .cornerRadius(40)
                                    .padding(.horizontal, 40)
                                    .padding(.top, 130)
                            }
                        } else if let selectedImage = selectedImages[index] {
                            // Show image if it exists
                            selectedImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width - 60, height: 350)
                                .cornerRadius(10)
                                .padding(.top, 10)
                        } else {
                            // Show song name and play button if song exists
                            if !songNames[index].isEmpty {
                                Button(action: {
                                    // Play the audio associated with this song
                                    if let audioURL = audioURLs[index] {
                                        playAudio(from: audioURL)
                                    }
                                }) {
                                    Text("▶️ Play: \(songNames[index])")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(.accent)
                                        .cornerRadius(40)
                                        .padding(.horizontal, 40)
                                        .padding(.top, 130)
                                }
                            }
                        }
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 340)
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

            // Camera Button (Updated)
            HStack {
                Button(action: {
                    isPhotoPickerPresented = true
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

                // Voice Memo Button (Updated)
                Button(action: {
                    if isRecording {
                        stopRecording() // Stop recording if in progress
                    } else {
                        startRecording(for: currentIndex) // Start recording if not recording
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(isRecording ? Color.red : Color.white)
                            .frame(width: 65, height: 65)

                        Text(isRecording ? "⏹️" : "🎤")
                            .font(.largeTitle)
                            .foregroundColor(isRecording ? .white : .white)
                    }
                }
                .padding(.horizontal, 10)
                
                Button(action: {
                    isPopupPresented = true // Show the popup when the headphone button is pressed
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
        .photosPicker(isPresented: $isPhotoPickerPresented, selection: $selectedItem, matching: .images, photoLibrary: .shared())
        .onChange(of: selectedItem) { newItem in
            Task {
                if let newItem {
                    if let data = try? await newItem.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            selectedImages[currentIndex] = Image(uiImage: uiImage)
                        }
                    }
                }
            }
        }
        .alert(isPresented: $isPopupPresented) {
            Alert(
                title: Text("Enter Song Name"),
                message: Text("Enter a name for the song you want to save."),
                primaryButton: .default(Text("Save")) {
                    songNames[currentIndex] = songName // Save the song name
                    isPopupPresented = false // Dismiss the popup
                },
                secondaryButton: .cancel() {
                    isPopupPresented = false // Dismiss the popup
                }
            )
        }

        // Use a sheet to display the text field:
        .sheet(isPresented: $isPopupPresented) {
            VStack {
                Text("Enter Song Name")
                    .font(.headline)
                    .padding()

                TextField("Song name", text: $songName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                HStack {
                    Button("Save") {
                        songNames[currentIndex] = songName
                        isPopupPresented = false
                    }
                    .padding()

                    Button("Cancel") {
                        isPopupPresented = false
                    }
                    .padding()
                }
            }
            .padding()
        }
    }

    func startRecording(for index: Int) {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("voiceMemo_\(index).m4a")
        
        // Ensure the file path is valid
        if FileManager.default.fileExists(atPath: audioFilename.path) {
            print("File already exists: \(audioFilename.path)")
        }
        
        // Correct audio settings
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100, // Standard sample rate for audio
            AVNumberOfChannelsKey: 1, // Mono channel
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue // High audio quality
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.prepareToRecord() // Explicitly prepare the recorder before starting
            audioRecorder?.record()
            isRecording = true
            recordingTime = 0
            audioURLs[index] = audioFilename
            
            startRecordingTimer()
        } catch {
            print("Failed to start recording: \(error)")
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
        
        if let url = audioURLs[currentIndex], FileManager.default.fileExists(atPath: url.path) {
            print("Recording saved at: \(url.path)")
        } else {
            print("Failed to save the recording.")
        }
    }
    
    func playAudio(from url: URL) {
        if FileManager.default.fileExists(atPath: url.path) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay() // Explicitly prepare the player before playing
                audioPlayer?.play()
                print("Playing audio from: \(url.path)")
            } catch {
                print("Failed to play audio: \(error)")
            }
        } else {
            print("Audio file does not exist at path: \(url.path)")
        }
    }
    
    func loadMoreContent() {
        if numberOfRectangles < 10 {
            numberOfRectangles += 1
            titles.append("")
            messages.append("")
            selectedImages.append(nil)
            audioURLs.append(nil)
        }
    }

    func startRecordingTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if isRecording {
                recordingTime += 1
            } else {
                timer.invalidate()
            }
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}


#Preview {
    NoteView()
}
