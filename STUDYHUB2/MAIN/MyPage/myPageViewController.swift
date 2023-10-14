import UIKit

import SnapKit

class MyPageViewController: UIViewController {
  
  private let recentButton = UIButton(type: .system)
  private let popularButton = UIButton(type: .system)
  
  // MARK: - UI설정
  private lazy var headerStackView = createStackView(axis: .horizontal,
                                                spacing: 8)
  
  private lazy var studyHubLabel = createLabel(title: "마이페이지",
                                               textColor: .white,
                                               fontSize: 18)
  
  private lazy var bellButton: UIButton = {
    // Bell button
    let bellButton = UIButton(type: .system)
    bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
    bellButton.tintColor = .white
    return bellButton
  }()
  
  private let spacerView: UIView = {
    let spacerView = UIView()
    spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    return spacerView
  }()
  
  private lazy var headerContentStackView = createStackView(axis: .vertical,
                                                            spacing: 16)
  
  private lazy var loginOrStackView = createStackView(axis: .vertical,
                                                      spacing: 8)
  
  private lazy var grayTextLabel = createLabel(title: "나의 스터디 팀원을 만나보세요",
                                               textColor: .gray,
                                               fontSize: 16)
  
  private lazy var blackTextLabel = createLabel(title: "로그인 / 회원가입",
                                                textColor: .black,
                                                fontSize: 18)
  private lazy var gotologinStackView = createStackView(axis: .horizontal,
                                                        spacing: 8)
  
  private lazy var buttonboxesStackView = createStackView(axis: .horizontal,
                                                          spacing: 8)
  
  private lazy var writtenLabel = createLabel(title: "작성한 글",
                                              textColor: .gray,
                                              fontSize: 14)
  
  private lazy var writtenCountLabel = createLabel(title: "0",
                                                   textColor: .black,
                                                   fontSize: 16)
  
  private lazy var joinstudyLabel = createLabel(title: "참여한 스터디",
                                                textColor: .gray,
                                                fontSize: 14)
  
  private lazy var joinstudyCountLabel = createLabel(title: "0",
                                                     textColor: .black,
                                                     fontSize: 16)
  
  private lazy var bookmarkCountLabel = createLabel(title: "0",
                                                    textColor: .black,
                                                    fontSize: 16)
  
  private lazy var bookmarkLabel = createLabel(title: "북마크",
                                               textColor: .gray,
                                               fontSize: 14)
  
  
  private lazy var chevronButton: UIButton = {
    let chevronButton = UIButton(type: .system)
    chevronButton.setImage(UIImage(systemName: "chevron.right"),
                           for: .normal)
    chevronButton.tintColor = .black
    chevronButton.addTarget(self,
                            action: #selector(chevronButtonTapped),
                            for: .touchUpInside)
    return chevronButton
  }()
  
  private lazy var writtenButton: UIButton = {
    let writtenButton = UIButton()
    writtenButton.backgroundColor = UIColor(hexCode: "#F8F9F9")
    writtenButton.layer.cornerRadius = 5
    writtenButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
     writtenButton.heightAnchor.constraint(equalToConstant: 87).isActive = true
    return writtenButton
  }()
  
  private lazy var joinstudyButton: UIButton = {
    // Create a button for "참여한 스터디"
    let joinstudyButton = UIButton()
    joinstudyButton.backgroundColor = UIColor(hexCode: "#F8F9F9")
    joinstudyButton.layer.cornerRadius = 5
    joinstudyButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
      joinstudyButton.heightAnchor.constraint(equalToConstant: 87).isActive = true
    
    return joinstudyButton
  }()
  
  private lazy var bookmarkButton: UIButton = {
    // Create a button for "북마크"
    let bookmarkButton = UIButton()
    bookmarkButton.backgroundColor = UIColor(hexCode: "#F8F9F9")
    bookmarkButton.layer.cornerRadius = 5
    bookmarkButton.addTarget(self, action: #selector(bookmarkpageButtonTapped), for: .touchUpInside)
    bookmarkButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
    bookmarkButton.heightAnchor.constraint(equalToConstant: 87).isActive = true
    
    return bookmarkButton
  }()
  
  private let boxesDividerLine: UIView = {
    let boxesDividerLine = UIView()
    boxesDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
    boxesDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true
    return boxesDividerLine
  }()
  
  private lazy var normalButtonStackView = createStackView(axis: .vertical,
                                                           spacing: 16)
  
  private lazy var informButton = createMypageButton(title: "공지사항")
  private lazy var askButton = createMypageButton(title: "문의하기")
  private lazy var howtouseButton = createMypageButton(title: "이용방법")
  private lazy var serviceButton = createMypageButton(title: "서비스 이용약관")
  private lazy var informhandleButton = createMypageButton(title: "개인정보 처리 방침")
  let scrollView = UIScrollView()
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    
    headerStackView.addArrangedSubview(studyHubLabel)
    headerStackView.addArrangedSubview(spacerView)
    headerStackView.addArrangedSubview(bellButton)
    
    view.addSubview(headerStackView)
    
    loginOrStackView.addArrangedSubview(grayTextLabel)
    loginOrStackView.addArrangedSubview(blackTextLabel)
    
    headerContentStackView.addArrangedSubview(loginOrStackView)
    
    gotologinStackView.addArrangedSubview(loginOrStackView)
    gotologinStackView.addArrangedSubview(chevronButton)
    
    headerContentStackView.addArrangedSubview(gotologinStackView)
    headerContentStackView.addArrangedSubview(buttonboxesStackView)
    headerContentStackView.addArrangedSubview(boxesDividerLine)
    headerContentStackView.addArrangedSubview(normalButtonStackView)
    
    writtenButton.addSubview(writtenLabel)
    writtenButton.addSubview(writtenCountLabel)
    // writtenLabel constraints
    
    joinstudyButton.addSubview(joinstudyLabel)
    joinstudyButton.addSubview(joinstudyCountLabel)
    
    bookmarkButton.addSubview(bookmarkCountLabel)
    bookmarkButton.addSubview(bookmarkLabel)
    
    buttonboxesStackView.addArrangedSubview(writtenButton)
    buttonboxesStackView.addArrangedSubview(joinstudyButton)
    buttonboxesStackView.addArrangedSubview(bookmarkButton)
    
    normalButtonStackView.addArrangedSubview(informButton)
    normalButtonStackView.addArrangedSubview(serviceButton)
    normalButtonStackView.addArrangedSubview(howtouseButton)
    normalButtonStackView.addArrangedSubview(askButton)
    normalButtonStackView.addArrangedSubview(informhandleButton)
    
    // Create a scroll view to make the content scrollable
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(headerContentStackView)
    view.addSubview(scrollView)
    
    
    // Set the background color of the scrollView to white
    scrollView.backgroundColor = .white
    
    // Set the scroll view's content size to fit the content

        
    makeUI()
  }
  // MARK: - makeUI
  func makeUI(){
    headerStackView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
      make.leading.equalTo(view.snp.leading).offset(16)
      make.trailing.equalTo(view.snp.trailing).offset(-16)
    }
    
    // Header content stack view constraints
    headerContentStackView.snp.makeConstraints { make in
      make.top.equalTo(scrollView.snp.top).offset(16)
      make.leading.equalTo(scrollView.snp.leading)
      make.trailing.equalTo(scrollView.snp.trailing)
      make.bottom.equalTo(scrollView.snp.bottom)
      make.width.equalTo(scrollView.snp.width)
    }
    
    // Add other constraints similarly using SnapKit
    grayTextLabel.snp.makeConstraints { make in
      make.top.equalTo(loginOrStackView.snp.top).offset(16)
      make.leading.equalTo(loginOrStackView.snp.leading).offset(16)
      make.trailing.equalTo(loginOrStackView.snp.trailing).offset(10)
    }
    
    chevronButton.snp.makeConstraints { make in
      make.top.equalTo(loginOrStackView.snp.top).offset(50)
      make.trailing.equalTo(loginOrStackView.snp.trailing).offset(60)
    }
    
    
    buttonboxesStackView.snp.makeConstraints { make in
      make.leading.equalTo(headerContentStackView.snp.leading).offset(10)
      make.trailing.equalTo(headerContentStackView.snp.trailing).offset(-20)
    }
    
    boxesDividerLine.snp.makeConstraints { make in
      make.leading.equalTo(headerContentStackView.snp.leading)
      make.trailing.equalTo(headerContentStackView.snp.trailing)
    }
    
    normalButtonStackView.alignment = .leading
    // 공지사항 , 서비스이용약관 , 이용방법, 문의하기 ,개인정보 처리 방침
    normalButtonStackView.snp.makeConstraints { make in
      make.leading.equalTo(headerContentStackView.snp.leading).offset(20)
    }
    
    writtenLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
    
    writtenCountLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(writtenLabel.snp.bottom).offset(8)
    }
    
    joinstudyLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
    
    joinstudyCountLabel.snp.makeConstraints {make in
      make.centerX.equalToSuperview()
      make.top.equalTo(joinstudyLabel.snp.bottom).offset(8)
    }
    
    bookmarkLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
    
    bookmarkCountLabel.snp.makeConstraints {make in
      make.centerX.equalToSuperview()
      make.top.equalTo(bookmarkLabel.snp.bottom).offset(8)
    }
    
    // Scroll view constraints
    scrollView.snp.makeConstraints { make in
      make.top.equalTo(headerStackView.snp.bottom).offset(16)
      make.leading.equalTo(view.snp.leading)
      make.trailing.equalTo(view.snp.trailing)
      make.bottom.equalTo(view.snp.bottom)
    }
  }
  
  @objc func bookmarkpageButtonTapped() {
    let bookmarkViewController = BookmarkViewController()
    // Create a UINavigationController with HomeViewController as the root view controller
    let navigationController = UINavigationController(rootViewController: bookmarkViewController)
    navigationController.modalPresentationStyle = .fullScreen
    
    // Present the UINavigationController modally
    present(navigationController, animated: true, completion: nil)
  }
  
  @objc func chevronButtonTapped() {
    // Create an instance of ViewController (assuming that's the name of your ViewController class)
    let viewController = LoginViewController()
    
    // If you want to present it modally, you can use the following code
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.modalPresentationStyle = .fullScreen
    
    // Present the ViewController modally
    present(navigationController, animated: true, completion: nil)
  }
  
}
