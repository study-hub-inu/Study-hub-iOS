//
//  UIColorExtension.swift
//  STUDYHUB2
//
//  Created by 최용헌 on 2023/10/06.
//

import UIKit

extension UIColor {
  static let postedMajor = UIColor(red: 0.44, green: 0.17, blue: 0.11, alpha: 1.00)
  static let deepGray = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
  convenience init(hexCode: String, alpha: CGFloat = 1.0) {
    var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    if hexFormatted.hasPrefix("#") {
      hexFormatted = String(hexFormatted.dropFirst())
    }
    
    assert(hexFormatted.count == 6, "Invalid hex code used.")
    
    var rgbValue: UInt64 = 0
    Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
    

  }
}
