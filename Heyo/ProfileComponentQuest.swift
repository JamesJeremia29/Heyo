//
//  ProfileComponentQuest.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ProfileComponentQuest: View {
    
    @State var Streak : Int = 0
    @State var Sport : Int = 0
    @State var Movie : Int = 0
    @State var Food : Int = 0
    @State var Travel : Int = 0
    @State var News : Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            HStack{
                Text("Quest").font(.system(size: 24, weight: .semibold))
                Spacer().frame(height: 10)
            }
            Spacer().frame(height: 10)
            Text("Meet new people everyday in a week (\(Streak)/7)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Sport 5 times (\(Sport)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Movie 5 times (\(Movie)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Food 5 times (\(Food)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Travel 5 times (\(Travel)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss News 5 times (\(News)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            
        }.frame(width: 361, height: 250)
            .background()
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct ProfileComponentQuest_Previews: PreviewProvider {
    static var previews: some View {
        ProfileComponentQuest()
    }
}
