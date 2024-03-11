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

            HStack {
                Button(action: {
                    viewModel.deleteNotes(entity: entity)
                }) {
                    Image(systemName: "trash.fill")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }

                Spacer()

                Button(action: {
                    if newHeadline.isEmpty && newText.isEmpty {
                        return
                    }
                    viewModel.updateNotes(entity: entity, newHeadline: newHeadline, newText: newText)
                }) {
                    Image(systemName: "square.and.arrow.down.fill")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
        }
        .navigationTitle("Edit")
        .onAppear {
            newHeadline = entity.headline ?? ""
            newText = entity.text ?? ""
        }
    }
}
