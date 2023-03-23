//
//  ContentView.swift
//  Heyo
//
//  Created by James Jeremia on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 1
    @State private var showingCredits = false
    
    var peace = "✌️"
    var okay = "👌"
    var thumbsUp = "👍"
    var img : String = "\(Image(systemName: "plus.bubble"))"
    var add1 = "✏️"

    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray4
    }
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("Let's Play!")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                Button(add1) {
                            showingCredits.toggle()
                        }
                        .sheet(isPresented: $showingCredits) {
                            ActionComponentTopic()
                            ActionComponentLoc()
                            ActionComponentMov()
                            Button(action: {
                                
                            }, label: {
                                Text("Create").foregroundColor(Color(.white)).font(.system(size: 24)).frame(width: 361,height: 50)
                                    .background(Color("greenTheme"))
                                    .cornerRadius(10)
                            })
                                .presentationDetents([.medium, .large])
                        }
//                Button {
//                    print("")
//                } label: {
//                    Image(systemName: "plus.bubble")
//                }.font(.system(size: 36, weight: .bold
//                              ))
//                .foregroundColor(.white)

            }.padding(.all)
            Spacer()
            TabView(selection: $selection) {
                CardJoin().onTapGesture {
                    selection = 2
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
