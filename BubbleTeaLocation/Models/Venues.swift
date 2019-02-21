//
//  Venues.swift
//  BubbleTeaLocation
//
//  Created by Jack on 21/2/2562 BE.
//  Copyright © 2562 Jack. All rights reserved.
//

import Foundation

struct Venue: Decodable {
    let name: String
    let location: Location?
    let category: [Category]?
    let verified: Bool
    let stats: Stat?
    let referralId: String?
}
