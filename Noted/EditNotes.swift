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
            TextField("text", text: $newText)
                .padding()
            Button("save notes") {
                if newHeadline.isEmpty && newText.isEmpty {
                    // Handle case when both fields are empty (optional)
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
