//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Mathias on 6/16/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation
import UIKit

class CardController {
    static func fetchCard(completion: @escaping (Result <Card, CardError>) -> Void) {
        guard let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1") else {return completion(.failure(.invalidURl))}
        
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let card = topLevelObject.cards[0]
                return completion(.success(card))
            } catch {
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result <UIImage, CardError>) -> Void) {
        let finalURL = card.image
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else {return completion(.failure(.noData))}
                guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
                return completion(.success(image))
            } .resume()
    }
}

