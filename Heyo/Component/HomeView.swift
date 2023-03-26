//
//  HomeView.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 25/03/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var multipeerViewModel: MultipeerViewModel
    @State private var tabViewSelection = 1
    
    var body: some View {
        TabView(selection: $tabViewSelection) {
            let isEmpty = multipeerViewModel.listRoom.isEmpty
            if (isEmpty){
                Text("No Room Exist").tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Play")
                }.tag(1)
            } else {
                VStack {
                    ForEach(multipeerViewModel.listRoom){ room in
                        ItemRoomView(
                            multipeerViewModel: multipeerViewModel, category: room.roomInformation?[CATEGORY_CONST] ?? "",
                            location: room.roomInformation?[LOCATION_CONST] ?? "",
                            emoticon: room.roomInformation?[EMOTICON_CONST] ?? "",
                            peerId: room.peerId
                        ).padding(12)
                    }
                }.tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Play")
                }.tag(1)
                
            }
            VStack(spacing: 30) {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }.tag(2)
        }.accentColor(.blue)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(multipeerViewModel: MultipeerViewModel())
    }
}
