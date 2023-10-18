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
  
  // MARK: - UI 생성 함수
  func createContactButton(title: String, selector: Selector) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
    button.layer.cornerRadius = 5
    button.backgroundColor = .white
    button.addTarget(self, action: selector, for: .touchUpInside)
    return button
  }
  
  func createFineButton(title: String, selector: Selector) -> UIButton {
    let button = UIButton()
    button.setImage(UIImage(named: "circle"), for: .normal)
    button.setImage(UIImage(named: "checkmark.circle."), for: .selected)
    button.tintColor = UIColor(hexCode: "#FF5530")
    button.addTarget(self, action: selector, for: .touchUpInside)
    return button
  }
  
  // 날짜 선택하는 버튼
  func createDateButton(selector: Selector) -> UIButton{
    let button = UIButton()
    button.setTitle("선택하기", for: .normal)
    button.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    button.backgroundColor = .white
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
    button.layer.cornerRadius = 2
    button.addTarget(self, action: selector, for: .touchUpInside)
    return button
  }
  
  // info
  func createTextField(title: String) -> UITextField {
    let textField = UITextField()
    let placeholderTextAttributes: [NSAttributedString.Key: Any] = [
      .foregroundColor: UIColor.gray,
      .font: UIFont.systemFont(ofSize: 14)
    ]
    
    textField.attributedPlaceholder = NSAttributedString(string: title,
                                                         attributes: placeholderTextAttributes)
    
    textField.backgroundColor = .white
    textField.textColor = .black
    textField.font = UIFont.systemFont(ofSize: 14)
    textField.borderStyle = .roundedRect
    textField.layer.cornerRadius = 5
    textField.layer.borderColor = UIColor.gray.cgColor
    textField.layer.borderWidth = 1.0
    
    return textField
  }
  
  func createLabel(title: String, textColor: UIColor, fontSize: CGFloat) -> UILabel {
    let label = UILabel()
    label.text = title
    label.textColor = textColor
    label.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    return label
  }
  
  func createStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = axis
    stackView.spacing = spacing
    
    return stackView
  }
  
  func createDividerLine(height: CGFloat) -> UIView {
    let dividerLine = UIView()
    dividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
    dividerLine.heightAnchor.constraint(equalToConstant: height).isActive = true
    
    return dividerLine
  }
  
  func createMypageButton(title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.setTitleColor(UIColor(hexCode: "#49545C"), for: .normal)
    return button
  }
  
  // 날짜 변경함수
  func convertToFormat(dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy년 MM월 dd일" // 입력된 날짜의 형식
    guard let date = dateFormatter.date(from: dateString) else { return "" }
    
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
  }

}
