//
//  CardCreate.swift
//  Heyo
//
//  Created by James Jeremia on 20/03/23.
//

import SwiftUI

struct ActionCreate: View {
    @State private var showingCredits = false
    
    var peace = "✌️"
    var okay = "👌"
    var thumbsUp = "👍"
    var img : String = "\(Image(systemName: "plus.bubble"))"
    var add1 = "➕"
    @State var navigate: Int? = 0
    
    var body: some View {
        NavigationLink(destination: TalkView(), tag: 1, selection: $navigate) {
            EmptyView()
        }
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
                self.navigate=1
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

