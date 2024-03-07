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
    var body: some View{
        NavigationView{
            VStack{
                NavigationLink(destination: EditView()) {
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

