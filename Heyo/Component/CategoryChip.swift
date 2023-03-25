//
//  CategoryChip.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 24/03/23.
//

import SwiftUI

struct CategoryChip: View {
    @EnvironmentObject private var viewModel: CreateRoomViewModel
    var content: String = ""
    var color: Color = Color.blue
    
    
    var body: some View {
        VStack{
            Text(content)
                .padding(.top,8)
                .padding(.bottom,8)
                .padding(.leading,12)
                .padding(.trailing,12)
                .background(
                    BackgroundChip(
                        content: content,
                        color: color
                    )
                )
        }.onTapGesture {
            viewModel.setPickedCategory(newPicked: content)
        }
    }
}

struct BackgroundChip: View {
    @EnvironmentObject var viewModel: CreateRoomViewModel
    var content: String
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .strokeBorder(color, lineWidth: 1)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        viewModel.pickedCategory.name == content ? color : Color.white
                    )
            )
    }
}

struct CategoryChip_Previews: PreviewProvider {
    static var previews: some View {
        CategoryChip().environmentObject(CreateRoomViewModel())
    }
}
