//
//  EditView.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-06.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var viewModel: NotedViewModel

    @State private var headline: String = ""
    @State private var text: String = ""

    var body: some View {
        VStack {
            TextField("Headline", text: $headline)
                .padding()

            TextEditor(text: $text) // Use TextEditor for multiline text input
                .padding()
                .frame(minHeight: 100) // Set a minimum height for multiline input

            Spacer() // Spacer to push the following button to the bottom

            Button("Save Notes") {
                addNotes()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .navigationTitle("Edit")
    }

    func addNotes() {
        print("Before saving: Headline - \(headline), Text - \(text)")
        if headline.isEmpty || text.isEmpty {
            return
        }
        viewModel.addNotes(headline: headline, text: text)
        headline = ""
        text = ""
    }
}


struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample NotedViewModel for preview
        let viewModel = NotedViewModel()

        // Assuming you want to preview EditView with an empty viewModel
        EditView(viewModel: viewModel)
    }
}
