//
//  ProfileComponentQuest.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ProfileComponentQuest: View {
    
    
    @AppStorage(TOTAL_MEET_STORAGE) var totalMeet: Int = 0
    @AppStorage(SPORT_CATEGORY_STORAGE) var sportCategory: Int = 0
    @AppStorage(MOVIE_CATEGORY_STORAGE) var movieCategory: Int = 0
    @AppStorage(FOOD_CATEGORY_STORAGE) var foodCategory: Int = 0
    @AppStorage(TRAVEL_CATEGORY_STORAGE) var travelCategory: Int = 0
    @AppStorage(NEWS_CATEGORY_STORAGE) var newsCategory: Int = 0
    
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
            Text("Meet new people everyday in a week (\(totalMeet)/7)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Sport 5 times (\(sportCategory)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Movie 5 times (\(movieCategory)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Food 5 times (\(foodCategory)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss Travel 5 times (\(travelCategory)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            Text("Discuss News 5 times (\(newsCategory)/5)").frame(width: 340).background(Color(.systemGray4)).cornerRadius(10)
            
        }
        .padding()
        .frame(width: 361, height: 250)
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
