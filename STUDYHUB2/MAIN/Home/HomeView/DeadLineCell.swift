
import UIKit

import SnapKit

final class DeadLineCell: UITableViewCell {
  static let cellId = "DeadLineCell"
  
  var buttonAction: (() -> Void) = {}
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupLayout()
    makeUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private lazy var profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "ProfileAvatar")
    return imageView
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "컴활 1급 같이하실 분"
    return label
  }()
  
  private lazy var bookMarkButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "BookMarkLightImg"), for: .normal)
    return button
  }()
  
  private lazy var countImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "PersonImg")
    return imageView
  }()
  
  private lazy var countLabel: UILabel = {
    let label = UILabel()
    label.text = "29/39명"
    label.textColor = .bg90
    label.changeColor(label: label, wantToChange: "29")
    return label
  }()
  
  private lazy var remainLabel: UILabel = {
    let label = UILabel()
    label.text = "1자리 남았어요!"
    label.textColor = .o50
    return label
  }()

  
  
  func setupLayout() {
    [
      profileImageView,
      titleLabel,
      bookMarkButton,
      countImageView,
      countLabel,
      remainLabel
    ].forEach {
      self.contentView.addSubview($0)
    }
  }
  
  func makeUI() {
    profileImageView.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(10)
      make.centerY.equalToSuperview()
    }
    
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.leading.equalTo(profileImageView.snp.trailing).offset(10)
    }
    
    countImageView.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom)
      make.leading.equalTo(profileImageView.snp.trailing)
    }
    
    countLabel.snp.makeConstraints { make in
      make.top.equalTo(countImageView)
      make.leading.equalTo(countImageView.snp.trailing)
    }
    
    bookMarkButton.snp.makeConstraints { make in
      make.top.equalTo(titleLabel)
      make.trailing.equalToSuperview().offset(-10)
    }
    
    remainLabel.snp.makeConstraints { make in
      make.top.equalTo(bookMarkButton.snp.bottom)
      make.trailing.equalToSuperview().offset(-50)
    }
  }

}


