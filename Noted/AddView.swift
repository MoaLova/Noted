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
            TextField("Headline", text: $newHeadline)
                .multilineTextAlignment(.center)
                .padding(20)
            Spacer()
            
            
            ZStack(alignment: .centerFirstTextBaseline) {
                
                TextEditor(text: $newText)
                
                if newText.isEmpty {
                    Text("Write your noted underneath: ")
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            
            Spacer()
            Button(action: {
                addNotes()
            }) {
                Image(systemName: "square.and.arrow.down")
                       .font(.system(size: 25)) // Adjust the font size as needed
                       .padding(15)
                       .background(Color.blue)
                       .foregroundColor(.white)
                       .cornerRadius(20)
                       .position(CGPoint(x: 300.0, y: 290.0))
            }}}

    
    
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
        // Create a sample NotedViewModel for preview
        let viewModel = NotedViewModel()

        // Assuming you want to preview EditView with an empty viewModel
        EditView(viewModel: viewModel)
    }
}
