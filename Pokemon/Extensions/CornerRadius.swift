//
//  CornerRadius.swift
//  Pokemon
//
//  Created by Nicolas Demange on 25/03/2023.
//

import UIKit

extension UIView {
  @IBInspectable var cornerRadius: CGFloat {
   get{
        return layer.cornerRadius
    }
    set {
        layer.cornerRadius = newValue
        layer.masksToBounds = newValue > 0
    }
  }
}
