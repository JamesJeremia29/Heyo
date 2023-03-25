//
//  ProfileComponentQuest.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ProfileComponentQuest: View {
    @AppStorage("numberSport") var numberSport: Int = 0
    @AppStorage("numberMovie") var numberMovie: Int = 0
    @AppStorage("numberTravel") var numberTravel: Int = 0
    @AppStorage("numberFood") var numberFood: Int = 0
    @AppStorage("numberNews") var numberNews: Int = 0
    @AppStorage("numberBadge") var numberBatch: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            HStack{
                Text("Quest").font(.system(size: 24, weight: .semibold)).padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 0))
                Spacer()
            }
            Text("Meet new people (\(numberSport + numberMovie + numberTravel + numberFood + numberNews)/\(getQuestTarget(value:(numberSport + numberMovie + numberTravel + numberFood + numberNews))))").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Sport \(getQuestTarget(value:numberSport)) times (\(numberSport)/\(getQuestTarget(value:numberSport)))").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Movie \(getQuestTarget(value:numberMovie)) times (\(numberMovie)/\(getQuestTarget(value:numberMovie)))").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Food \(getQuestTarget(value:numberFood)) times (\(numberFood)/\(getQuestTarget(value:numberFood)))").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Travel \(getQuestTarget(value:numberTravel)) times (\(numberTravel)/\(getQuestTarget(value:numberTravel)))").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss News \(getQuestTarget(value:numberNews)) times (\(numberNews)/\(getQuestTarget(value:numberNews)))").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            
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

func getQuestTarget(value: Int) -> Int{
    if value < 5 {
        return 5
    }
    else if value < 10 {
        return 10
    }
    else if value < 20 {
        return 20
    }
    else if value < 50{
        return 50
    }
    else{
        return 10000
    }
    
}
