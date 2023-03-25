//
//  ContentView.swift
//  Heyo
//
//  Created by James Jeremia on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("numberSport") var numberSport: Int = 0
    @AppStorage("numberMovie") var numberMovie: Int = 0
    @AppStorage("numberTravel") var numberTravel: Int = 0
    @AppStorage("numberFood") var numberFood: Int = 0
    @AppStorage("numberNews") var numberNews: Int = 0
    @AppStorage("numberBadge") var numberBatch: Int = 0
    
    @State var selection = 1
    @State var tabPage = 1
    @State private var showingCredits = false
    @State private var room = false
//    @State var navigate: Int? = 0
    var peace = "✌️"
    var okay = "👌"
    var thumbsUp = "👍"
    var img : String = "\(Image(systemName: "plus.bubble"))"
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray4
    }
    
    var body: some View {
        NavigationView(){
            VStack(alignment: .leading) {
                
//                NavigationLink(destination: TalkView(), tag: 1, selection: $navigate) {
//                    EmptyView()
//                }

                
                HStack {
                    Text("Let's Play!")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    ActionCreate()
                    
                }.padding(.all)
                Spacer()
                TabView(selection: $tabPage) {
                    CardJoin().onTapGesture {
//                        self.navigate = 1
                        tabPage = 2
                    }
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Play")
                    }.tag(1)
                    VStack(spacing: 30) {
                        ProfileView()
                    }
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }.tag(2)
                }.accentColor(.blue)
            }.background(Color("blueTheme"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

