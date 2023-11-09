//
//  BookMarkCell.swift
//  STUDYHUB2
//
//  Created by 최용헌 on 2023/11/09.
//
import UIKit

import SnapKit

final class BookMarkCell: UICollectionViewCell {
  
  static var id: String { NSStringFromClass(Self.self).components(separatedBy: ".").last ?? "" }
  
  var model: String? { didSet { bind() } }
  
  private lazy var majorLabel: UILabel = {
    let label = UILabel()
    label.text = " 세무회계학과 "
    label.textColor = .o50
    label.backgroundColor = .o10
    label.layer.cornerRadius = 5
    return label
  }()
  
  private lazy var bookMarkButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "BookMarkChecked"), for: .normal)
    return button
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "단기 스터디원 구해요!"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 16)
    return label
  }()
  
  private lazy var infoLabel: UILabel = {
    let label = UILabel()
    label.text = "내용내용내용"
    label.textColor = .bg80
    label.font = UIFont.systemFont(ofSize: 14)
    return label
  }()
  
  var remainCount: Int = 0
  private lazy var remainLabel: UILabel = {
    let label = UILabel()
    label.text = "잔여 \(remainCount)자리"
    label.textColor = .bg70
    label.font = UIFont.boldSystemFont(ofSize: 12)
    return label
  }()
  
  private lazy var enterButton: UIButton = {
    let button = UIButton()
    button.setTitle("신청하기", for: .normal)
    button.setTitleColor(UIColor.o50, for: .normal)
    button.layer.cornerRadius = 5
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.o40.cgColor
    return button
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setViewShadow(backView: self)
    addSubviews()
    
    configure()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  private func addSubviews() {
    
    [
      majorLabel,
      bookMarkButton,
      titleLabel,
      infoLabel,
      remainLabel,
      enterButton
    ].forEach {
      addSubview($0)
    }
  }
  
  private func configure() {
    majorLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.leading.equalToSuperview().offset(10)
    }
    
    bookMarkButton.snp.makeConstraints { make in
      make.centerY.equalTo(majorLabel)
      make.trailing.equalToSuperview().offset(-10)
    }
    
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(majorLabel.snp.bottom).offset(20)
      make.leading.equalTo(majorLabel)
    }
    
    infoLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.leading.equalTo(majorLabel)
    }
    
    remainLabel.snp.makeConstraints { make in
      make.top.equalTo(infoLabel.snp.bottom).offset(10)
      make.leading.equalTo(majorLabel)
    }
    
    enterButton.snp.makeConstraints { make in
      make.top.equalTo(remainLabel.snp.bottom).offset(20)
      make.leading.equalTo(majorLabel)
    }
    
    backgroundColor = .white
    
    self.layer.borderWidth = 0.1
    self.layer.borderColor = UIColor.cellShadow.cgColor
    self.layer.cornerRadius = 10
  }
  
  private func bind() {
    titleLabel.text = model
  }
  
}

