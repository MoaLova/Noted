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
        //Navigation between views
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 0) {
                        ForEach(viewModel.notes) { entity in
                            NavigationLink(destination: EditNotes(entity: entity, viewModel: viewModel)) {
                                Rectangle()
                                .fill(Color.yellow.opacity(0.4))
                                    .frame(height: 120)
                                    .overlay(
                                        Text(entity.headline ?? "no headline")
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(Font.custom("Cochin", size: 20))
                                    )
                                    .cornerRadius(15)
                                    .padding()
                            }
                        }
                    }
                    .padding()
                }

                //Navigation to the editView
                NavigationLink(destination: EditView(viewModel: viewModel)) {
                    Rectangle()
                        .frame(width: 70, height: 50)
                        .cornerRadius(15)
                        .foregroundColor(.pink.opacity(0.2))
                        .overlay(
                    Text("Add")
                        .foregroundColor(.black.opacity(0.7)))
                        .font(Font.custom("Cochin", size: 16))
                }
                .padding() 
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Spacer()
                        Text("Noted")
                            .padding(.top)
                            .foregroundColor(.black.opacity(0.7))
                            .padding(.bottom, 8)
                            .font(Font.custom("Cochin", size: 45))
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
