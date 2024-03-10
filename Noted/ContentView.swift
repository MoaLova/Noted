//
//  ContentView.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-06.
//

import SwiftUI
import CoreData

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel = NotedViewModel()

    var body: some View {
        NavigationView {
            VStack {
              
                List {
                    ForEach(viewModel.notes) { entity in
                        VStack {
                            NavigationLink(destination: EditNotes(entity: entity, viewModel: viewModel)) {
                                Text(entity.headline ?? "no headline")
                            }
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.deleteNotes(indexSet: indexSet)
                    }
                }
                .listStyle(.inset)

                NavigationLink(destination: EditView(viewModel: viewModel)) {
                    Text("Add")
                }
                .padding() // Add padding for spacing
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Spacer()
                        Text("Noted")
                            .font(.title) // Adjust the font size as needed
                            .foregroundColor(.primary)
                            .padding(.bottom, 8) // Add padding below the "Noted" text
                        Spacer()
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
