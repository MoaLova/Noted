//
//  EditNotes.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-07.
//

import SwiftUI

struct EditNotes: View {
    @ObservedObject var entity: Noted
    @ObservedObject var viewModel: NotedViewModel

    @State private var newHeadline: String = ""
    @State private var newText: String = ""

    var body: some View {
        VStack {
            TextField("headline", text: $newHeadline)
                .padding()

            TextEditor(text: $newText) // Use TextEditor for multiline text input
                .padding()
                .frame(minHeight: 100) // Set a minimum height for multiline input

            Spacer() // Spacer to push the following button to the bottom

            Button("Save Notes") {
                if newHeadline.isEmpty && newText.isEmpty {
                    return
                }
                viewModel.updateNotes(entity: entity, newHeadline: newHeadline, newText: newText)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .navigationTitle("Edit")
        .onAppear {
            newHeadline = entity.headline ?? ""
            newText = entity.text ?? ""
        }
    }
}
