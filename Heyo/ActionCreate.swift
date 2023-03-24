//
//  CardCreate.swift
//  Heyo
//
//  Created by James Jeremia on 20/03/23.
//

import SwiftUI

struct ActionCreate: View {
    @State private var showingCredits = false
    
    @State private var room = false
    
    var peace = "✌️"
    var okay = "👌"
    var thumbsUp = "👍"
    var img : String = "\(Image(systemName: "plus.bubble"))"
    var add1 = "➕"
    
    var body: some View {
        Button(add1) {
            showingCredits.toggle()
        }
        .sheet(isPresented: $showingCredits) {
            Spacer().frame(height: 20)
            ActionComponentTopic()
            ActionComponentLoc()
            ActionComponentMov()
            Button(action: {
                showingCredits.toggle()
                room.toggle()
                print(room)
            }, label: {
                Text("Create").foregroundColor(Color(.white))
                    .frame(width: 361, height: 50)
                    .background(Color("greenTheme"))
                    .cornerRadius(10)
            })
                .presentationDetents([.medium, .large])
        }
    }
}

struct ActionCreate_Previews: PreviewProvider {
    static var previews: some View {
        ActionCreate()
    }
}

