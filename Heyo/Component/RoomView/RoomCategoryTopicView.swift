//
//  ActionComponentTopic.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct RoomCategoryTopicView: View {
    @State var onTap = false
    var body: some View {
        VStack {
            Text("Topic")
            Spacer().frame(height: 20)
            HStack{
                CategoryChip(
                    content: CategoryEnum.Sport.name,
                    color: Color.red
                )
                CategoryChip(
                    content: CategoryEnum.Movie.name,
                    color: Color.brown
                )
                CategoryChip(
                    content: CategoryEnum.Travel.name,
                    color: Color.cyan
                )
            }
            Spacer().frame(height: 10)
            HStack{
                CategoryChip(
                    content: CategoryEnum.Food.name,
                    color: Color.orange
                )
                CategoryChip(
                    content: CategoryEnum.News.name,
                    color: Color.purple
                )
            }.padding(.bottom)
        }
    }
}

struct RoomCategoryTopicView_Previews: PreviewProvider {
    static var previews: some View {
        RoomCategoryTopicView().environmentObject(CreateRoomViewModel())
    }
}
