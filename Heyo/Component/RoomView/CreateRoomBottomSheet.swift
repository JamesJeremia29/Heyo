//
//  CreateRoomBottomSheet.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 24/03/23.
//

import SwiftUI

struct CreateRoomBottomSheet: View {
    @ObservedObject var viewModel: MultipeerViewModel
    @EnvironmentObject var createRoomViewModel: CreateRoomViewModel
    
    @State private var location: String = ""
    @Binding var isEnteredRoom: Bool
    
    var body: some View {
        VStack {
            RoomCategoryTopicView()
            RoomLocationView(inputLoc: $location)
            RoomSignatureMoveView()
            Button(action: {
                createRoomViewModel.setLocation(newLocation: location.description)
                viewModel.createRoom(
                    category: createRoomViewModel.pickedCategory.name,
                    location: createRoomViewModel.location,
                    emoticon: createRoomViewModel.pickedSignMove.value
                )
                isEnteredRoom = true
            }, label: {
                Text("Create").foregroundColor(Color(.white)).font(.system(size: 24)).frame(width: 361,height: 50)
                    .background(Color("greenTheme"))
                    .cornerRadius(10)
            }).presentationDetents([.medium, .large])
        }
    }
}

//struct CreateRoomBottomSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateRoomBottomSheet(viewModel: MultipeerViewModel(), location: "Stringasdf").environmentObject(CreateRoomViewModel())
//    }
//}
