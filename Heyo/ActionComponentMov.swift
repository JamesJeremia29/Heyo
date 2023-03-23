//
//  ActionComponentMov.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ActionComponentMov: View {
    var peace = "✌️"
    var okay = "👌"
    var thumbsUp = "👍"
    
    var body: some View {
        VStack{
            Text("Signature Moves")
            Spacer().frame(height: 20)
            HStack(alignment: .center, spacing: 30){
                Button {

                } label: {
                    Text(peace).font(.system(size: 50))
                }
                Button {

                } label: {
                    Text(thumbsUp).font(.system(size: 50))
                }
                Button {

                } label: {
                    Text(okay).font(.system(size: 50))
                }
            
            }
            
        }
    }
}

struct ActionComponentMov_Previews: PreviewProvider {
    static var previews: some View {
        ActionComponentMov()
    }
}
