//
//  ProfileView.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 30){
            ProfileComponentStats()
            ProfileComponentsBadge()
            ProfileComponentQuest()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
