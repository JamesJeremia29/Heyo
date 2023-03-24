//
//  TalkView.swift
//  Heyo
//
//  Created by James Jeremia on 21/03/23.
//

import SwiftUI


struct TalkView: View {
    var peace = "✌️"
//    @Binding var rootIsActive : Bool
//    @Binding var room : Bool
    
    var body: some View {
        NavigationView(){
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
                ListPeople()
                ListPeople()
                Spacer()
                Button(action: {
//                    self.rootIsActive = false
                }, label: {
                    Text("Delete").foregroundColor(Color(.white)).font(.system(size: 24)).frame(width: 361,height: 50)
                        .background(Color("redTheme"))
                        .cornerRadius(10)
                }
                       
            )}
        }
    }
}

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView()
    }
}
