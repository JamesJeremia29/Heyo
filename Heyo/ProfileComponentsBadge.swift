//
//  ProfileComponentsBadge.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ProfileComponentsBadge: View {
    @AppStorage("numberSport") var numberSport: Int = 0
    @AppStorage("numberMovie") var numberMovie: Int = 0
    @AppStorage("numberTravel") var numberTravel: Int = 0
    @AppStorage("numberFood") var numberFood: Int = 0
    @AppStorage("numberNews") var numberNews: Int = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Badge").font(.system(size: 24, weight: .bold)).padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 0))
            HStack(spacing: 10){
                Spacer()
                Image(systemName: "flame")
                    .foregroundStyle(getBadgeTier(value: (numberSport + numberMovie + numberTravel + numberFood + numberNews)))
                    .font(.system(size: 36))
                Image(systemName: "figure.run")
                    .foregroundStyle(getBadgeTier(value: numberSport))
                    .font(.system(size: 36))
                Image(systemName: "film")
                    .foregroundStyle(getBadgeTier(value: numberMovie))
                    .font(.system(size: 36))
                Image(systemName: "car")
                    .foregroundStyle(getBadgeTier(value: numberTravel))
                    .font(.system(size: 36))
                Image(systemName: "fork.knife")
                    .foregroundStyle(getBadgeTier(value: numberFood))
                    .font(.system(size: 36))
                Image(systemName: "newspaper")
                    .foregroundStyle(getBadgeTier(value: numberNews))
                    .font(.system(size: 36))
                Spacer()
            }
        }.frame(width: 361, height: 120)
            .background()
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct ProfileComponentsBadge_Previews: PreviewProvider {
    static var previews: some View {
        ProfileComponentsBadge()
    }
}

func getBadgeTier(value: Int) -> LinearGradient {
    if value < 5 {
        return LinearGradient.noTier
    }
    else if value >= 5 && value < 10 {
        return LinearGradient.bronze
    }
    else if value >= 10 && value < 20 {
        return LinearGradient.silver
    }
    else if value >= 20 && value < 50{
        return LinearGradient.gold
    }
    else {
        return LinearGradient.diamond
    }
}

extension Color {
    static let bronzeStart = Color(red: 0.8, green: 0.5, blue: 0.2)
    static let bronzeEnd = Color(red: 0.6, green: 0.4, blue: 0.2)
    
    static let silverStart = Color(red: 0.8, green: 0.8, blue: 0.8)
    static let silverEnd = Color(red: 0.6, green: 0.6, blue: 0.6)
    
    static let goldStart = Color(red: 1.0, green: 0.88, blue: 0.0)
    static let goldEnd = Color(red: 1.0, green: 0.78, blue: 0.0)
    
    static let diamondStart = Color(red: 0.2, green: 0.8, blue: 0.8)
    static let diamondEnd = Color(red: 0.0, green: 0.5, blue: 0.8)
}

extension LinearGradient {
    static let noTier = LinearGradient(gradient: Gradient(colors: [ .black, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let bronze = LinearGradient(gradient: Gradient(colors: [ .bronzeStart, .bronzeEnd]), startPoint: .topLeading, endPoint: .bottomTrailing)

    static let silver = LinearGradient(gradient: Gradient(colors: [.silverStart, .silverEnd]), startPoint: .topLeading, endPoint: .bottomTrailing)

    static let gold = LinearGradient(gradient: Gradient(colors: [.goldStart, .goldEnd]), startPoint: .topLeading, endPoint: .bottomTrailing)

    static let diamond = LinearGradient(gradient: Gradient(colors: [ .diamondStart, .diamondEnd]), startPoint: .leading, endPoint: .trailing)

}
