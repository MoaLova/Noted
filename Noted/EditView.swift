//
//  EditView.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-06.
//

import SwiftUI

import SwiftUI

struct EditView: View {
  @StateObject var viewModel = NotedViewModel()
    
  @State var headline: String = ""
  @State  var text: String = ""
    var body: some View {
       
            VStack{
               TextField("headline", text: $headline)
                    .padding()
                TextField("text", text: $text)
                    .padding()
                Button("save notes"){
                    addNotes()
                }.padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                List{
                    ForEach(viewModel.notes){ entity in
                        NavigationLink{
                            Text(entity.headline ?? "no headline")
                           
                        }label: {
                            Text(entity.headline ?? "no headline")
                           
                        }
                        
                    } .onDelete( perform: { indexSet in
                        viewModel.deleteNotes(indexSet: indexSet)
                        
                    }
                                 )
            }
            }.navigationTitle("Edit")
    
    }
    func addNotes(){
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
}

#Preview {
    EditView()
}
