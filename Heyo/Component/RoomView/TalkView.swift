//
//  TalkView.swift
//  Heyo
//
//  Created by James Jeremia on 21/03/23.
//

import SwiftUI

struct TalkView: View {
    @ObservedObject var multipeerViewModel: MultipeerViewModel
    @EnvironmentObject var createViewModel: CreateRoomViewModel
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
            ForEach(multipeerViewModel.listPeople){ user in
                ItemPeopleView(username: user.displayName)
            }
            Spacer()
            Button {
                isEnteredRoom = !isEnteredRoom
                multipeerViewModel.deleteRoom(isHost: createViewModel.isHost)
                createViewModel.isHost = false
            } label: {
                Text(createViewModel.isHost ? "Delete" : "Exit").foregroundColor(Color(.white)).font(.system(size: 24)).frame(width: 361,height: 50)
                    .background(Color("redTheme"))
                    .cornerRadius(10)
            }
        }.padding().background(Color.white)
    }
}

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView(multipeerViewModel: MultipeerViewModel(), isEnteredRoom: .constant(false)).environmentObject(CreateRoomViewModel())
    }
}
