//
//  MultipeerViewModel.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 23/03/23.
//


import MultipeerConnectivity

class TestVM:NSObject, ObservableObject {
    
    @Published var listRoom: [RoomModel] = []
    let myPeerId: MCPeerID = MCPeerID(displayName: UIDevice().name)
    var mySession: MCSession
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    var nearbyServiceBrowser: MCNearbyServiceBrowser?
    let serviceType = "hmultipeer"
    
    private var information = [
        "deviceName": "\(UIDevice.current.name)",
        "emoji": ":)"
    ]
    
    override init() {
//        myPeerId = MCPeerID(displayName: UIDevice().name)
        mySession = MCSession(peer: myPeerId)
        nearbyServiceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: serviceType)
        super.init()
        mySession.delegate = self
        nearbyServiceBrowser?.delegate = self
        nearbyServiceAdvertiser?.delegate = self
    }
    
    func getListPeople(){
        let listPeople = mySession.connectedPeers
        print("listPeople -> \(listPeople.description)")
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
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: roomInformation, serviceType: serviceType)
        print("Advertise -> \(String(describing: nearbyServiceBrowser?.myPeerID))")
        nearbyServiceAdvertiser?.startAdvertisingPeer()
    }
    
    func deleteRoom() {
        nearbyServiceAdvertiser?.stopAdvertisingPeer()
    }
    
    
    func joinRoom(foundPeerId: MCPeerID)  {
        print("Peer Id _> \(foundPeerId)")
        
        mySession.nearbyConnectionData(forPeer: foundPeerId) { foundData, errorData in
            print("DATA -> \(foundPeerId)")
//            print("Error -> \(errorData?.localizedDescription)")
            let nearbyString = String(data: foundData!, encoding: .utf8)
            print("Nearby connection data:---> \(String(describing: nearbyString))")


            self.mySession.connectPeer(foundPeerId, withNearbyConnectionData: foundData!)
        }
//        do {
//            let obtainData = try await self.mySession.nearbyConnectionData(forPeer: peerId)
//            self.mySession.connectPeer(peerId, withNearbyConnectionData: obtainData)
//        } catch {
//            print("ERRROR -> \(error.localizedDescription)")
//        }
//        mySession.nearbyConnectionData(forPeer: peerId) { connectionData, errorData in
//            print("DATAA -> \(connectionData?.description)")
//            self.mySession.connectPeer(peerId, withNearbyConnectionData: connectionData!)
//        }
        
    }
    
}

extension TestVM: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("Room Detected -> \(peerID)")
        nearbyServiceBrowser?.invitePeer(peerID, to: mySession, withContext: nil, timeout: 10)
//        mySession.nearbyConnectionData(forPeer: peerID) { foundData, errorData in
////            print("Error -> \(errorData?.localizedDescription)")
//            let nearbyString = String(data: foundData!, encoding: .utf8)
//            print("Nearby connection data:---> \(String(describing: nearbyString))")
//
//
//            self.mySession.connectPeer(peerID, withNearbyConnectionData: foundData!)
//        }
        
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

extension TestVM: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        print("qwerqwer")
        invitationHandler(true, mySession)
    }
}

extension TestVM: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connecting:
            print("\(peerID) state: connecting")
        case .connected:
            print("\(peerID) state: connected")
        case .notConnected:
            print("\(peerID) state: not connected")
        @unknown default:
            print("\(peerID) state: unknown")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("Session 1")
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print("Session 2")
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print("Session 3")
    }
    
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        print("Session 4")
    }
    
    
}
