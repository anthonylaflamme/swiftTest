//
//  ContentView.swift
//  yves
//  Created by Anthony Laflamme on 2023-07-10.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var entity: Entity? = nil
    
    var body: some View {
        VStack {
            // If an entity has been created, display its data in a square rectangle
            if let entity = entity {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Name: \(entity.name)")
                            VStack() {
                                ForEach(entity.mappedNameValue, id: \.self) { char in
                                    if let value = entity.letterMap[char] {
                                        Text("\(String(char)): \(value)")
                                    }
                                }
                            }
                            Text("Total: \(entity.total)")
                        }
                    )
                    .frame(height: 500)
                    .padding()
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.gray.opacity(0.1))
                    .overlay(
                        VStack {
                            Text("Please enter a value")
                        }
                        .padding()
                    )
                    .frame(height: 500)
                    .padding()
            }
            
            Form {
                TextField("Name", text: $name)
                Button(action: {
                    self.entity = Entity(name: self.name)
                }) {
                    Text("Submit")
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
