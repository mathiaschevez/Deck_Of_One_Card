//
//  UIViewControllerExtension.swift
//  DeckOfOneCard
//
//  Created by Mathias on 6/16/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
