//
//  ListPeople.swift
//  Heyo
//
//  Created by James Jeremia on 21/03/23.
//

import SwiftUI

struct ItemPeopleView: View {
    var username: String
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Image(systemName: "person.fill").padding(.all
                )
                Text(username).padding(.all)
                Spacer()
            }.frame(width: 361, height: 40)
                .background(Color(.white))
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}

struct ItemPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ItemPeopleView(username: "Halo")
    }
}
