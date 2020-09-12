//
//  Mission.swift
//  Moonshot
//
//  Created by Larry Nguyen on 9/12/20.
//  Copyright © 2020 Larry Nguyen. All rights reserved.
//

import Foundation


struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
