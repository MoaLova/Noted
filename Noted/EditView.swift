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
            TextField("headline", text: $headline)
                .padding()
            TextField("text", text: $text)
                .padding()
            Button("save notes") {
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
        if headline.isEmpty {
            return
        }
        if text.isEmpty {
            return
        }
        viewModel.addNotes(headline: headline, text: text)
        headline = ""
        text = ""
    }
}
