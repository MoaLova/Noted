//
//  EditNotes.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-07.
//

import SwiftUI

struct EditNotes: View {
    var entitys: Noted
    @ObservedObject var viewModel : NotedViewModel
    
    @State var headline: String = ""
    @State var text: String = ""
    
    var body: some View {
        TextField("new name", text: $headline)
            .padding()
        TextField(" new text", text: $text)
            .padding()
        Button("update notes"){
            if headline.isEmpty{
                return
            }
            if text.isEmpty{
                return
            }
            viewModel.addNotes(headline: headline, text: text)
            headline = ""
            text = ""
        }
    .padding()
         .background(.blue)
         .foregroundColor(.white)
         .cornerRadius(20)
         
        Text(entitys.headline ?? "no headline")
        Text(entitys.text ?? "no text")
    }
}

