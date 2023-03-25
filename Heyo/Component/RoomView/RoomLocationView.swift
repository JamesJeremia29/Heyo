//
//  ActionComponentLoc.swift
//  Heyo
//
//  Created by James Jeremia on 22/03/23.
//

import SwiftUI

struct RoomLocationView: View {
    @EnvironmentObject var viewModel: CreateRoomViewModel
    @Binding var inputLoc : String
    
    var body: some View {
        VStack{
            Text("\(Image(systemName: "mappin.and.ellipse")) Location").padding(.bottom)
            TextField("Enter your location",text: $inputLoc).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal)
                .frame(width: 250)
        
        }
    }
}

struct RoomLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RoomLocationView(inputLoc: .constant("lkasdjf")).environmentObject(CreateRoomViewModel())
    }
}
