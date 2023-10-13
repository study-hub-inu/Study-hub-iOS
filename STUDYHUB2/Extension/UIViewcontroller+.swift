//
//  UIViewcontrollerExtention.swift
//  STUDYHUB2
//
//  Created by 최용헌 on 2023/10/12.
//

import UIKit

extension UIViewController {
  func alertShow(title: String, message: String) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "확인",
                                  style: .default,
                                  handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
