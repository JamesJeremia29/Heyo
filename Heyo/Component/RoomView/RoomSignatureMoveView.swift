//
//  ActionComponentMov.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct RoomSignatureMoveView: View {
    @EnvironmentObject var viewModel: CreateRoomViewModel
    var body: some View {
        VStack{
            Text("Signature Moves")
            Spacer().frame(height: 20)
            HStack(alignment: .center, spacing: 30){
                Button {
                    viewModel.setPickedSignMove(
                        newPicked: SignMoveEnum.Peace.value
                    )
                } label: {
                    Text(
                        SignMoveEnum.Peace.value
                    )
                    .font(.system(size: 50))
                    .opacity(
                        viewModel.pickedSignMove.value == SignMoveEnum.Peace.value ? 1.0 : 0.5
                    )
                }
                Button {
                    viewModel.setPickedSignMove(
                        newPicked: SignMoveEnum.ThumbsUp.value
                    )
                } label: {
                    Text(
                        SignMoveEnum.ThumbsUp.value
                    )
                    .font(.system(size: 50))
                    .opacity(
                        viewModel.pickedSignMove.value == SignMoveEnum.ThumbsUp.value ? 1.0 : 0.5
                    )
                }
                Button {
                    viewModel.setPickedSignMove(
                        newPicked: SignMoveEnum.Okay.value
                    )
                } label: {
                    Text(
                        SignMoveEnum.Okay.value
                    )
                    .font(.system(size: 50))
                    .opacity(
                        viewModel.pickedSignMove.value == SignMoveEnum.Okay.value ? 1.0 : 0.5
                    )
                }
            
            }
            
        }
    }
}

struct RoomSignatureMoveView_Previews: PreviewProvider {
    static var previews: some View {
        RoomSignatureMoveView().environmentObject(CreateRoomViewModel())
    }
}
