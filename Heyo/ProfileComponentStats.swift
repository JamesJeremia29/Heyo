//
//  ProfileComponentStats.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ProfileComponentStats: View {
    @AppStorage("numberSport") var numberSport: Int = 0
    @AppStorage("numberMovie") var numberMovie: Int = 0
    @AppStorage("numberTravel") var numberTravel: Int = 0
    @AppStorage("numberFood") var numberFood: Int = 0
    @AppStorage("numberNews") var numberNews: Int = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Stats").font(.system(size: 24, weight: .bold)).padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
            
            HStack(){
                Spacer()
                VStack(){
                    Text("\(numberSport + numberMovie + numberTravel + numberFood + numberNews)").font(.system(size: 50, weight: .bold))
                    Text("Meets").font(.system(size: 17, weight: .medium))
                }
                Spacer()
                VStack{
                    Text("\(countTopic(numSports:numberSport, numMovies:numberMovie, numTravel:numberTravel, numFood:numberFood, numNews:numberNews))").font(.system(size: 50, weight: .bold))
                    Text("Topics").font(.system(size: 17, weight: .medium))
                }
                Spacer()
                VStack{
                    Text("\(countBadge(numSports:numberSport, numMovies:numberMovie, numTravel:numberTravel, numFood:numberFood, numNews:numberNews))").font(.system(size: 50, weight: .bold))
                    Text("Badge").font(.system(size: 17, weight: .medium))
                }
                Spacer()
            }
        }.frame(width: 361, height: 150)
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

func countTopic(numSports: Int, numMovies: Int, numTravel: Int, numFood: Int, numNews: Int) -> Int {
    var countTopic: Int = 0
    for i in [numSports, numMovies, numTravel, numFood, numNews]{
        if i > 0 {
            countTopic += 1
        }
    }
    
    return countTopic
}

func countBadge(numSports: Int, numMovies: Int, numTravel: Int, numFood: Int, numNews: Int) -> Int {
    var countBadge: Int = 0
    let totalMeets: Int = numSports + numMovies + numTravel + numFood + numNews
    for i in [totalMeets, numSports, numMovies, numTravel, numFood, numNews]{
        if i >= 5 {
            countBadge += 1 // bronze
            if i >= 10{
                countBadge += 1 // silver
                if i >= 20{
                    countBadge += 1 // gold
                    if i >= 50{
                        countBadge += 1 // diamond
                    }
                }
            }
        }
    }
    
    return countBadge
}

//struct ProfileComponentStats_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileComponentStats()
//    }
//}
