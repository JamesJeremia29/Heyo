//
//  HeyoApp.swift
//  Heyo
//
//  Created by James Jeremia on 20/03/23.
//

import SwiftUI

@main
struct HeyoApp: App {
    let createRoomViewModel = CreateRoomViewModel()
    var body: some Scene {
        WindowGroup {
//            CategoryChip()
            MainVew().environmentObject(createRoomViewModel)
        }
    }
}
