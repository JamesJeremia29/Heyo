//
//  ListPeople.swift
//  Heyo
//
//  Created by James Jeremia on 21/03/23.
//

import SwiftUI

struct ListPeople: View {
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Image(systemName: "person.fill").padding(.all
                )
                Text("Username").padding(.all)
                Spacer()
            }.frame(width: 361, height: 40)
                .background(Color(.white))
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}

struct ListPeople_Previews: PreviewProvider {
    static var previews: some View {
        ListPeople()
    }
}
