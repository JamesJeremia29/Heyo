//
//  TalkView.swift
//  Heyo
//
//  Created by James Jeremia on 21/03/23.
//

import SwiftUI

struct TalkView: View {
    @Binding var isEnteredRoom: Bool
    
    let listData : [People] = [
        People(displayName: "Bintang Emon"),
        People(displayName: "Coki Pardede"),
        People(displayName: "Tretan Muslim"),
        People(displayName: "Adriano Qalbi"),
        People(displayName: "Abdel Achrian"),
        People(displayName: "Fico Fahreza")
    ]
    
    var body: some View {
        VStack {
            ForEach(listData){ room in
                ItemPeopleView(username: room.displayName)
            }
            Spacer()
            Button {
                print("asdf")
                isEnteredRoom = !isEnteredRoom
            } label: {
                Text("Delete").foregroundColor(Color(.white)).font(.system(size: 24)).frame(width: 361,height: 50)
                    .background(Color("redTheme"))
                    .cornerRadius(10)
            }
        }.padding().background(Color.white)
    }
}

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView(isEnteredRoom: .constant(false))
    }
}
