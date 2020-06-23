//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Mathias on 6/16/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
}

struct TopLevelObject: Decodable {
    let cards: [Card]
}
