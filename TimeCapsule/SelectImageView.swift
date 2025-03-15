import SwiftUI
import PhotosUI

struct SelectImageView: View {
    @Binding var selectedImage: Image?

    @State private var selectedItem: PhotosPickerItem? = nil

    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
            Text("Select a photo")
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                // Check if there is a selected item
                if let newItem {
                    // Load the selected item as Data
                    if let data = try? await newItem.loadTransferable(type: Data.self) {
                        // Convert data to UIImage and then to Image
                        if let uiImage = UIImage(data: data) {
                            selectedImage = Image(uiImage: uiImage)
                        }
                    }
                }
            }
        }
    }
}
