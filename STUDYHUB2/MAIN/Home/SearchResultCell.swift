
import UIKit

import SnapKit

final class SearchResultCell: UICollectionViewCell {
  
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
    button.setImage(UIImage(named: "BookMarkLightImg"), for: .normal)
    return button
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    
    return label
  }()
  
  private lazy var periodLabel: UILabel = {
    let label = UILabel()
    label.text = "9월 10일 ~ 10월 10일"
    label.textColor = .bg80
    return label
  }()
  
  private lazy var remainLabel: UILabel = {
    let label = UILabel()
    label.text = "1자리 남았어요"
    label.textColor = .o50
    return label
  }()
  
  private lazy var memberCountImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "MemberNumberImage")
    return imageView
  }()
  
  private lazy var memberCountLabel: UILabel = {
    let label = UILabel()
    label.text = "10/20명"
    label.changeColor(label: label, wantToChange: "10")
    return label
  }()
  
  private lazy var memberStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 10
    return stackView
  }()
  
  private lazy var fineImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "MoneyImage")
    return imageView
  }()
  
  private lazy var fineLabel: UILabel = {
    let label = UILabel()
    label.text = "400원"
    return label
  }()
  
  private lazy var fineStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 10
    return stackView
  }()
  
  private lazy var genderImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "GenderMixImg")
    return imageView
  }()
  
  private lazy var genderLabel: UILabel = {
    let label = UILabel()
    label.text = "무관"
    return label
  }()

  private lazy var genderStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 10
    return stackView
  }()
  
  private lazy var infoStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 10
    return stackView
  }()
  
  private lazy var profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 15
    imageView.image = UIImage(named: "ProfileAvatar")
    imageView.contentMode = .left
    imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    return imageView
  }()
  
  private lazy var nickNameLabel: UILabel = {
    let label = UILabel()
    label.text = "학생"
    return label
  }()
  
  private lazy var postedDate: UILabel = {
    let label = UILabel()
    label.text = "2023.9.1"
    return label
  }()
  
  private lazy var countMemeberLabel: UILabel = {
    let label = UILabel()
    label.textColor = .bg90
    label.text = "0/14"
    return label
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
    let memeberData = [memberCountImage, countMemeberLabel]
    for data in memeberData {
      memberStackView.addArrangedSubview(data)
    }
    
    let fineData = [fineImage, fineLabel]
    for data in fineData {
      fineStackView.addArrangedSubview(data)
    }
    
    let genderData = [genderImage, genderLabel]
    for data in genderData {
      genderStackView.addArrangedSubview(data)
    }
    
    let infoData = [memberStackView, fineStackView, genderStackView]
    for data in infoData {
      infoStackView.addArrangedSubview(data)
    }
    
    [
      majorLabel,
      bookMarkButton,
      titleLabel,
      periodLabel,
      remainLabel,
      infoStackView,
      profileImageView,
      nickNameLabel,
      postedDate,
    ].forEach {
      addSubview($0)
    }
  }
  
  private func configure() {
    majorLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(10)
      make.top.equalToSuperview().offset(10)
    }
    
    bookMarkButton.snp.makeConstraints { make in
      make.top.equalTo(majorLabel)
      make.trailing.equalToSuperview().offset(-10)
    }
    
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(majorLabel.snp.bottom).offset(10)
      make.leading.equalTo(majorLabel)
    }
    
    periodLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom)
      make.leading.equalTo(majorLabel)
    }
    
    remainLabel.snp.makeConstraints { make in
      make.top.equalTo(periodLabel)
      make.trailing.equalToSuperview().offset(-10)
    }
    
    infoStackView.snp.makeConstraints { make in
      make.top.equalTo(periodLabel.snp.bottom).offset(10)
      make.leading.equalToSuperview().offset(10)
    }
    
    profileImageView.snp.makeConstraints { make in
      make.top.equalTo(infoStackView.snp.bottom).offset(10)
      make.leading.equalTo(majorLabel)
    }
    
    nickNameLabel.snp.makeConstraints { make in
      make.leading.equalTo(profileImageView.snp.trailing).offset(10)
      make.top.equalTo(profileImageView)
    }
    
    postedDate.snp.makeConstraints { make in
      make.leading.equalTo(profileImageView.snp.trailing)
      make.top.equalTo(nickNameLabel.snp.bottom)
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

