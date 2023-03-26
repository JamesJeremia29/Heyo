//
//  RoomModel.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 23/03/23.
//

import SwiftUI
import MultipeerConnectivity

struct RoomModel: Identifiable {
    var id = UUID().uuidString
    var peerId: MCPeerID?
    var roomInformation: [String: String]?
}
