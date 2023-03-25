//
//  ContentView.swift
//  Heyo
//
//  Created by James Jeremia on 20/03/23.
//

import SwiftUI

struct MainVew: View {

    @StateObject private var viewModel = MultipeerViewModel()
    
    @State var selection = 1
    @State private var showingCredits = false
    @State var isEnteredRoom = false
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray4
    }

    var body: some View {
        VStack(alignment: .leading) {
            ToolbarView(multipeerViewModel: viewModel, isEnteredRoom: $isEnteredRoom)
            Spacer()
            if isEnteredRoom {
                TalkView(isEnteredRoom: $isEnteredRoom)
            } else {
                HomeView(multipeerViewModel: viewModel)
            }
        }.background(Color("blueTheme"))
            .onAppear(perform: viewModel.browseRoom)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainVew().environmentObject(CreateRoomViewModel())
    }
}
