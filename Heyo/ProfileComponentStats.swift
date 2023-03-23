//
//  ProfileComponentStats.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ProfileComponentStats: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Stats").font(.system(size: 24, weight: .semibold))
            Spacer().frame(height: 30)
            HStack(){
                Spacer()
                VStack(){
                    Text("0").font(.system(size: 50, weight: .bold))
                    Text("Meets").font(.system(size: 17, weight: .medium))
                }
                Spacer()
                VStack{
                    Text("0").font(.system(size: 50, weight: .bold))
                    Text("Topics").font(.system(size: 17, weight: .medium))
                }
                Spacer()
                VStack{
                    Text("0").font(.system(size: 36, weight: .bold))
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
