//
//  People.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 25/03/23.
//

import Foundation

struct People: Identifiable, Encodable {
    var id = UUID().uuidString
    var displayName: String
}
