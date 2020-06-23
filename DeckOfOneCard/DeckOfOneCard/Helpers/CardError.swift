//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by Mathias on 6/16/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation

enum CardError: LocalizedError {
    case invalidURl
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURl:
            return "Internal error. Please update deck of one card website or contact for help"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no data"
        case .unableToDecode:
            return "The server responded with bad data"
        }
    }
}
