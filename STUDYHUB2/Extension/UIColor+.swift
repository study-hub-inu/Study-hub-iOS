//
//  UIColorExtension.swift
//  STUDYHUB2
//
//  Created by 최용헌 on 2023/10/06.
//

import UIKit

extension UIColor {
  static let postedMajor = UIColor(red: 1.00, green: 0.71, blue: 0.64, alpha: 1.00)
  static let postedMajorBackGorund = UIColor(red: 0.44, green: 0.17, blue: 0.11, alpha: 1.00)
  static let deepGray = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
  static let bg20 = UIColor(red: 0.97, green: 0.98, blue: 0.98, alpha: 1.00)
  static let bg30 = UIColor(red: 0.95, green: 0.96, blue: 0.96, alpha: 1.00)
  static let bg40 = UIColor(red: 0.91, green: 0.92, blue: 0.93, alpha: 1.00)
  static let bg50 = UIColor(red: 0.85, green: 0.86, blue: 0.87, alpha: 1.00)
  static let bg60 = UIColor(red: 0.76, green: 0.78, blue: 0.80, alpha: 1.00)
  static let bg80 = UIColor(red: 0.41, green: 0.45, blue: 0.49, alpha: 1.00)
  static let changeInfo = UIColor(red: 1.00, green: 0.33, blue: 0.19, alpha: 1.00)
  static let o50 = UIColor(red: 1.00, green: 0.33, blue: 0.19, alpha: 1.00)
  static let o10 = UIColor(red: 1.00, green: 0.95, blue: 0.93, alpha: 1.00)
  
  
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
