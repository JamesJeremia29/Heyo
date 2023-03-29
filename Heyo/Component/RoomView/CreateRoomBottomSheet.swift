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
    
    @AppStorage("numberSport") var numberSport: Int = 0
    @AppStorage("numberMovie") var numberMovie: Int = 0
    @AppStorage("numberTravel") var numberTravel: Int = 0
    @AppStorage("numberFood") var numberFood: Int = 0
    @AppStorage("numberNews") var numberNews: Int = 0
    @AppStorage("numberBadge") var numberBatch: Int = 0
    @State private var location: String = ""
    @Binding var isEnteredRoom: Bool
    
    var body: some View {
        VStack {
            RoomCategoryTopicView()
            RoomLocationView(inputLoc: $location)
            RoomSignatureMoveView()
            Button(action: {
                createRoomViewModel.setLocation(newLocation: location.description)
                let roomInformation = [
                    CATEGORY_CONST : createRoomViewModel.pickedCategory.name,
                    LOCATION_CONST : createRoomViewModel.location,
                    EMOTICON_CONST : createRoomViewModel.pickedSignMove.value
                ]
                handlingGamification(category: createRoomViewModel.pickedCategory)
                let pickedRoom = RoomModel(roomInformation: roomInformation)
                createRoomViewModel.pickedRoom = pickedRoom
                createRoomViewModel.isHost = true
                createRoomViewModel.saveCategory(category: createRoomViewModel.pickedCategory)
                viewModel.createRoom(roomInformation: roomInformation)
                isEnteredRoom = true
            }, label: {
                Text("Create").foregroundColor(Color(.white)).font(.system(size: 24)).frame(width: 361,height: 50)
                    .background(Color("greenTheme"))
                    .cornerRadius(10)
            }).presentationDetents([.medium, .large])
        }
        
        
    }
    
    func handlingGamification(category: CategoryEnum){
        switch category {
        case .Sport:
            numberSport += 1
        case .Movie:
            numberMovie += 1
        case .Travel:
            numberTravel += 1
        case .Food:
            numberFood += 1
        case .News:
            numberNews += 1
        }
    }
}
//struct CreateRoomBottomSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateRoomBottomSheet(viewModel: MultipeerViewModel(), location: "Stringasdf").environmentObject(CreateRoomViewModel())
//    }
//}
//231202 -> helmi
//00000 -> James
