//
//  UIApplication+Keyboard.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 11/27/21.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
