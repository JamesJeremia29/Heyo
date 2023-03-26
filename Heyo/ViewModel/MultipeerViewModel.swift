//
//  MultipeerViewModel.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 23/03/23.
//

import SwiftUI
import MultipeerConnectivity

class MultipeerViewModel:NSObject, ObservableObject {
    @AppStorage(TOTAL_MEET_STORAGE) var totalMeet: Int = 0
    @Published var listRoom = [RoomModel]()
    @Published var listPeople = [People]()
    @Published var pickedRoom: RoomModel?
    var myPeerId: MCPeerID
    var mySession: MCSession
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    var nearbyServiceBrowser: MCNearbyServiceBrowser?
    let serviceType = "hi-multipeer"
    
    override init() {
        myPeerId = MCPeerID(displayName:UIDevice().name )
        mySession = MCSession(peer: myPeerId, securityIdentity: nil, encryptionPreference: .required)
        self.nearbyServiceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: serviceType)
        super.init()
        mySession.delegate = self
        nearbyServiceBrowser?.delegate = self
    }
    
    func getListPeople(){
        listPeople.removeAll()
        for user in mySession.connectedPeers {
            listPeople.append(People(displayName: user.displayName))
        }
        
    }
    
    func browseRoom() {
        print("BrowserRoom")
        nearbyServiceBrowser?.startBrowsingForPeers()
    }
    
    func stopBrowseRoom() {
        nearbyServiceBrowser?.stopBrowsingForPeers()
    }
    
    func createRoom(
        roomInformation: [String : String]
    ) {
        totalMeet += 1
        self.nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: roomInformation, serviceType: serviceType)
        nearbyServiceAdvertiser?.delegate = self
        nearbyServiceAdvertiser?.startAdvertisingPeer()
    }
    
    func deleteRoom(isHost: Bool) {
        if isHost {
            if !mySession.connectedPeers.isEmpty {
                    mySession.cancelConnectPeer(mySession.connectedPeers.first!)
                }
        } else {
            mySession.disconnect()
        }
        
//
        nearbyServiceAdvertiser?.stopAdvertisingPeer()
    }
    
    func joinRoom(foundPeerId: MCPeerID) {
        print("Peer Id _> \(foundPeerId)")
        totalMeet += 1
        nearbyServiceBrowser?.invitePeer(foundPeerId, to: mySession, withContext: nil, timeout: 500)
//        mySession.nearbyConnectionData(forPeer: foundPeerId) { foundData, errorData in
//            print("DATA -> \(foundPeerId)")
////            print("Error -> \(errorData?.localizedDescription)")
//
////            print("Nearby connection data:---> \(nearbyString)")
//
//
//            self.mySession.connectPeer(foundPeerId, withNearbyConnectionData: foundData!)
//        }
        
    }
    
}

extension MultipeerViewModel: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("Room Detected ->\(peerID)|| \(browser.myPeerID)")
        
//        mySession.nearbyConnectionData(forPeer: peerID) { foundData, errorData in
//            if foundData != nil {
//                print("NOTNULL")
//                self.mySession.connectPeer(peerID, withNearbyConnectionData: foundData!)
//            }
//            print("nearbyConnectionData")
//        }
//
//        browser.invitePeer(peerID, to: mySession, withContext: nil, timeout: 500)
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
        print("qwerqwer")
        invitationHandler(true, mySession)
    }
}

extension MultipeerViewModel: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        DispatchQueue.main.async {
            switch state {
            case .connecting:
                print("\(peerID) state: connecting")
            case .connected:
                self.getListPeople()
            case .notConnected:
                self.getListPeople()
            @unknown default:
                print("\(peerID) state: unknown")
            }
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("Session 1")
        DispatchQueue.main.async {
            let command = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)! as String
            print("command -> \(command)")
        }
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
    
    func send(){
        do{
            let startCommand = "HALOGES"
            let message = startCommand.data(using: String.Encoding.utf8, allowLossyConversion: false)
            try self.mySession.send(message!, toPeers: self.mySession.connectedPeers, with: .unreliable)
        } catch {
            print("ERROR MESSAGE -> \(error.localizedDescription)")
        }
    }
    
}
