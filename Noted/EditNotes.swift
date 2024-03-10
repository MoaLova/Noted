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

            ZStack(alignment: .topLeading) {
                            if newText.isEmpty {
                                Text("text")
                                    .foregroundColor(.black)
                                    .padding(.leading, 4)
                                    .padding(.top, 8)
                                    .opacity(0.5)
                            }
                            TextEditor(text: $newText)
                                .padding()
                                .frame(minHeight: 100)
                        }

                        Spacer()
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
