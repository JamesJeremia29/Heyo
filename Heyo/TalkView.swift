//
//  TalkView.swift
//  Heyo
//
//  Created by James Jeremia on 21/03/23.
//

import SwiftUI

struct TalkView: View {
    
    var peace = "✌️"
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                
                HStack{
                    VStack{
                        Text("Sports")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                        Text("\(Image(systemName: "mappin.and.ellipse")) Cave").foregroundColor(Color(.white)).font(.system(size: 21, weight: .bold))
                    }
                    Spacer()
                    Text(peace).font(.system(size: 50))
                }.padding(.horizontal)
                Spacer()
            }.background(Color("blueTheme"))
                .frame(height: 75)
            Spacer()
            ListPeople()
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Delete").foregroundColor(Color(.white)).font(.system(size: 24)).frame(width: 361,height: 50)
                    .background(Color("redTheme"))
                    .cornerRadius(10)
            }
                   //            NavigationView {
                   //                NavigationLink(destination: ContentView()) {
                   //                    Text("I want bananas!")
                   //                }
                   //            }
                   
                   //            Button {
                   //
                   //            } label: {
                   //                Text("Leave").foregroundColor(Color(.white)).font(.system(size: 17)).frame(width: 70,height: 20)
                   //                    .background(Color("redTheme"))
                   //                    .cornerRadius(10)
                   //            }
                   
                   
            )}
    }
}

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView()
    }
}
