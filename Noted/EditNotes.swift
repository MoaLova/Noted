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
            //Headline input
            TextField("Headline", text: $newHeadline)
                .multilineTextAlignment(.center)
                .padding(20)
                .foregroundColor(.black.opacity(1))
                .font(Font.custom("Cochin", size: 16))
            Spacer()
            
            //Writing input
            ZStack(alignment: .centerFirstTextBaseline) {
                TextEditor(text: $newText)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Cochin", size: 16))
                if newText.isEmpty {
                    Text("Write your noted underneath: ")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .font(Font.custom("Cochin", size: 16))
                    Spacer()
                }
            }
            

            Spacer()

            //Delete your notes button
            HStack(spacing: 10) {
                Button(action: {
                    viewModel.deleteNotes(entity: entity)
                }) {
                    Image(systemName: "trash.fill")
                        .font(.system(size: 25))
                        .padding()
                        .background(Color.pink.opacity(0.2))
                        .foregroundColor(.black.opacity(0.6))
                        .cornerRadius(20)
                }

                //Save your edited notes button
                Button(action: {
                    if newHeadline.isEmpty && newText.isEmpty {
                        return
                    }
                    viewModel.updateNotes(entity: entity, newHeadline: newHeadline, newText: newText)
                }) {
                    Image(systemName: "square.and.arrow.down.fill")
                        .font(.system(size: 25))
                        .padding(15)
                        .background(Color.pink.opacity(0.2))
                        .foregroundColor(.black.opacity(0.6))
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
