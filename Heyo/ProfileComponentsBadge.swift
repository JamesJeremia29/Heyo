//
//  ProfileComponentsBadge.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ProfileComponentsBadge: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Badge").font(.system(size: 24, weight: .semibold))
            Spacer().frame(height: 30)
            HStack(spacing: 10){
                Spacer()
                Text(Image(systemName: "flame")).font(.system(size: 36))
                Text(Image(systemName: "figure.run")).font(.system(size: 36))
                Text(Image(systemName: "film")).font(.system(size: 36))
                Text(Image(systemName: "car")).font(.system(size: 36))
                Text(Image(systemName: "fork.knife")).font(.system(size: 36))
                Text(Image(systemName: "newspaper")).font(.system(size: 36))
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
