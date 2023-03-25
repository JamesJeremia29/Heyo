//
//  MultipeerViewModel.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 23/03/23.
//


import MultipeerConnectivity

class MultipeerViewModel:NSObject, ObservableObject {
    
    @Published var listRoom: [RoomModel] = []
    var peerId: MCPeerID
    var session: MCSession
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    var nearbyServiceBrowser: MCNearbyServiceBrowser?
    final private let serviceType = "heyo-multipeer"
    
    private var information = [
        "deviceName": "\(UIDevice.current.name)-:",
        "emoji": ":)"
    ]
    
    override init() {
        peerId = MCPeerID(displayName: UUID().uuidString)
        session = MCSession(peer: peerId, securityIdentity: nil, encryptionPreference: .none)
        nearbyServiceBrowser = MCNearbyServiceBrowser(peer: peerId, serviceType: serviceType)
        super.init()
        session.delegate = self
        nearbyServiceBrowser?.delegate = self
        nearbyServiceAdvertiser?.delegate = self
    }
    
    func browseRoom() {
        print("BrowserRoom")
        nearbyServiceBrowser?.startBrowsingForPeers()
    }
    
    func stopBrowseRoom() {
        nearbyServiceBrowser?.stopBrowsingForPeers()
    }
    
    func createRoom(
        category: String,
        location: String,
        emoticon: String
    ) {
        print("CreateRoom")
        let roomInformation = [
            CATEGORY_CONST : category,
            LOCATION_CONST : location,
            EMOTICON_CONST : emoticon
        ]
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerId, discoveryInfo: roomInformation, serviceType: serviceType)
        nearbyServiceAdvertiser?.startAdvertisingPeer()
    }
    
    func deleteRoom() {
        nearbyServiceAdvertiser?.stopAdvertisingPeer()
    }
    
}

extension MultipeerViewModel: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("Room Detected -> \(peerID)")
        if(!listRoom.contains(where: {$0.peerId == peerID})){
            let newRoom = RoomModel(peerId: peerID, roomInformation: info)
            listRoom.append(newRoom)
        }
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        guard let indexRoom = listRoom.firstIndex(where: {$0.peerId == peerID}) else {
            return
        }
        listRoom.remove(at: indexRoom)
    }
    
    
}

extension MultipeerViewModel: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
}

extension MultipeerViewModel: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connecting:
            print("\(peerId) state: connecting")
        case .connected:
            print("\(peerId) state: connected")
        case .notConnected:
            print("\(peerId) state: not connected")
        @unknown default:
            print("\(peerId) state: unknown")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    
}
