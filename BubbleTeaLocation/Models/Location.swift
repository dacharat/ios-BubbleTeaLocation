//
//  Location.swift
//  BubbleTeaLocation
//
//  Created by Jack on 21/2/2562 BE.
//  Copyright © 2562 Jack. All rights reserved.
//

import Foundation
struct Location: Decodable {
    let lat: Double
    let lng: Double
    let labeledLatLngs: [LabelLatLng]
    let distance: Int
    let cc: String
    let country: String
    let formattedAddress: [String]
}
