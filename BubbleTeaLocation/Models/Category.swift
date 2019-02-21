//
//  Category.swift
//  BubbleTeaLocation
//
//  Created by Jack on 21/2/2562 BE.
//  Copyright © 2562 Jack. All rights reserved.
//

import Foundation

struct Category: Decodable {
    let id: String
    let name: String
    let pluralName: String
    let shortName: String
    let icon: Icon
    let primary: Bool
}

struct Icon: Decodable {
    let prefix: String
    let suffix: String
}
