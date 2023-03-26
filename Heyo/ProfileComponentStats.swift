//
//  ProfileComponentStats.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ProfileComponentStats: View {
    @AppStorage(TOTAL_MEET_STORAGE) var totalMeet: Int = 0
    @AppStorage(SPORT_CATEGORY_STORAGE) var sportCategory: Int = 0
    @AppStorage(MOVIE_CATEGORY_STORAGE) var movieCategory: Int = 0
    @AppStorage(FOOD_CATEGORY_STORAGE) var foodCategory: Int = 0
    @AppStorage(TRAVEL_CATEGORY_STORAGE) var travelCategory: Int = 0
    @AppStorage(NEWS_CATEGORY_STORAGE) var newsCategory: Int = 0
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Stats").font(.system(size: 24, weight: .semibold))
            Spacer().frame(height: 30)
            HStack(){
                Spacer()
                VStack(){
                    Text("\(totalMeet)").font(.system(size: 50, weight: .bold))
                    Text("Meets").font(.system(size: 17, weight: .medium))
                }
                Spacer()
                VStack{
                    Text("\(sportCategory+movieCategory+foodCategory+travelCategory+newsCategory)").font(.system(size: 50, weight: .bold))
                    Text("Topics").font(.system(size: 17, weight: .medium))
                }
                Spacer()
                VStack{
                    Text("0").font(.system(size: 50, weight: .bold))
                    Text("Badge").font(.system(size: 17, weight: .medium))
                }
                Spacer()
            }
        }
        .padding()
        .frame(width: 361, height: 150)
            .background()
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct ProfileComponentStats_Previews: PreviewProvider {
    static var previews: some View {
        ProfileComponentStats()
    }
}
