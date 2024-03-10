//
//  ContentView.swift
//  Noted
//
//  Created by Moa.Svensson on 2024-03-06.
//

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
                .listStyle(.plain)
                NavigationLink(destination: EditView(viewModel: viewModel)) {
                    Text("Add")
                }
            }
            .navigationTitle("Notes")
        }
    }
}

#Preview {
    ContentView()
}
