//
//  Toolbar.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 25/03/23.
//

import SwiftUI

struct ToolbarView: View {
    
    @ObservedObject var multipeerViewModel: MultipeerViewModel
    
    @State var isBottomSheetVisible: Bool = false
    @Binding var isEnteredRoom: Bool
    
    let iconAdd = "+"
    
    var body: some View {
        if isEnteredRoom {
            toolbarRoom()
        } else {
            toolbarDefault()
        }
    }
    
    func toolbarDefault() -> some View {
        HStack {
            Text("Let's Play!")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)
            Spacer()
            Button {
                isBottomSheetVisible = !isBottomSheetVisible
            } label: {
                Text("+")
                    .foregroundColor(Color.white)
                    .font(.system(size: 36))
                    .padding(.top,-6)
                    .padding(.bottom,-3)
            }
            .buttonStyle(.bordered).tint(.white)
            .sheet(isPresented: $isBottomSheetVisible) {
                CreateRoomBottomSheet(viewModel: multipeerViewModel, isEnteredRoom: $isEnteredRoom)
            }
        }.padding(.all)
    }
    
    func toolbarRoom() -> some View {
        HStack {
            VStack {
                Text("Sport")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.system(size: 36))
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.system(size: 14))
                        .foregroundColor(Color.white)
                    Text("Cave")
                        .foregroundColor(Color.white)
                    
                }
            }
            Spacer()
            Text(PEACE_EMOT_CONST)
                .font(.system(size: 36))
        }.padding(.all)
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView(multipeerViewModel: MultipeerViewModel(), isEnteredRoom: .constant(false))
    }
}
