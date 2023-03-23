//
//  ActionComponentTopic.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct ActionComponentTopic: View {
    var body: some View {
        VStack {
            Text("Topic")
            Spacer().frame(height: 20)
            HStack{
                Text("Sport")
                    .foregroundColor(Color("blueTheme"))
                    .font(.system(size: 17, weight: .medium))
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("blueTheme"), lineWidth : 1))
                Text("Movie")
                    .foregroundColor(Color(.orange))
                    .font(.system(size: 17, weight: .medium))
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.orange), lineWidth : 1))
                Text("Travel")
                    .foregroundColor(Color("greenTheme"))
                    .font(.system(size: 17, weight: .medium))
                    .padding(.horizontal)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("greenTheme"), lineWidth : 1))
            }
            Spacer().frame(height: 10)
            HStack{
                Text("Food")
                    .foregroundColor(Color("purpleTheme"))
                    .font(.system(size: 17, weight: .medium))
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("purpleTheme"), lineWidth : 1))
                Text("News")
                    .foregroundColor(Color("redTheme"))
                    .font(.system(size: 17, weight: .medium))
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("redTheme"), lineWidth : 1))
            }.padding(.bottom)
        }
    }
}

struct ActionComponentTopic_Previews: PreviewProvider {
    static var previews: some View {
        ActionComponentTopic()
    }
}
