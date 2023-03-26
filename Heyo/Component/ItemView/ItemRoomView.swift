//
//  Card_join.swift
//  Heyo
//
//  Created by James Jeremia on 20/03/23.
//

import SwiftUI
import MultipeerConnectivity

struct ItemRoomView: View {
    
    @ObservedObject var multipeerViewModel: MultipeerViewModel
    @EnvironmentObject var createRoomViewModel: CreateRoomViewModel
    
    var category: String = ""
    var location: String = ""
    var emoticon: String = ""
    var peerId: MCPeerID
    @Binding var isEnteredRoom: Bool
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    VStack{
                        HStack{
                            Text(category).font(.system(size: 24, weight: .semibold))
                                .foregroundColor(.blue)
                            Spacer()
                            
                        }
                        Spacer().frame(height: 20)
                        HStack{
                            Image(systemName: "mappin.and.ellipse").resizable().frame(width: 25, height: 25).foregroundColor(.red)
                            Text(location).font(.system(size: 17, weight: .medium))
                            Spacer()
                        }
                    }
                    Text(emoticon).font(.system(size: 50))
                }
            }
        }
        .onTapGesture {
            isEnteredRoom = !isEnteredRoom
            let roomInfo = [
                CATEGORY_CONST : category,
                LOCATION_CONST : location,
                EMOTICON_CONST : emoticon
            ]
            let pickedRoom = RoomModel(
                peerId: peerId,roomInformation: roomInfo)
            createRoomViewModel.saveCategory(category: category)
            createRoomViewModel.setPickedRoom(newRoom: pickedRoom) 
            multipeerViewModel.joinRoom(foundPeerId: peerId)
        }
        .padding(.all)
        .frame(width: 361, height: 100, alignment: .center)
        .background(Color(.white))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ItemRoomView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRoomView(multipeerViewModel: MultipeerViewModel(), category: "Sport", location: "Depok", emoticon: "✌️", peerId: MCPeerID(),isEnteredRoom: .constant(false)).environmentObject(CreateRoomViewModel())
    }
}
