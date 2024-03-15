//
//  EditView.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-06.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var viewModel: NotedViewModel

    @State private var newHeadline: String = ""
    @State private var newText: String = ""
    @State private var isEditing = false

    var body: some View {
        VStack {
            Spacer()
            //Headline ipu
            TextField("Headline", text: $newHeadline)
                .multilineTextAlignment(.center)
                .padding(20)
                .foregroundColor(.black.opacity(1))
                .font(Font.custom("Cochin", size: 20))
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
                        .font(Font.custom("Cochin", size: 20))
                    Spacer()
                }
            }
            
            
            //Button to add the notes
            Spacer()
            Button(action: {
                addNotes()
            }) {
                Image(systemName: "square.and.arrow.down")
                    .font(.system(size: 25)) 
                    .padding(15)
                    .background(Color.pink.opacity(0.2))
                    .foregroundColor(.black.opacity(0.6))
                    .cornerRadius(20)
                    .position(CGPoint(x: 230.0, y: 270.0))
            }
        }
    }
//Function to add notes
    
    func addNotes() {
        print("Before saving: Headline - \(newHeadline), Text - \(newText)")
        if newHeadline.isEmpty || newText.isEmpty {
            return
        }
        viewModel.addNotes(headline: newHeadline, text: newText)
        newHeadline = ""
        newText = ""
    }
}


struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NotedViewModel()
        
        EditView(viewModel: viewModel)
    }
}
