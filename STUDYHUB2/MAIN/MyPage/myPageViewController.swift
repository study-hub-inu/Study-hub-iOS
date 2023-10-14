import UIKit

import SnapKit

class MyPageViewController: UIViewController {
  
  var loginStatus: Bool = false
  
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
  
  // 로그인 하면 보이는 라벨
  private lazy var profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 15
    imageView.image = UIImage(named: "ProfileAvatar")
    return imageView
  }()
  
  private lazy var majorLabel = createLabel(title: "",
                                                textColor: .gray,
                                                fontSize: 18)
  private lazy var nickNameLabel = createLabel(title: "",
                                                textColor: .black,
                                                fontSize: 18)
  // 로그인 안하면 보이는 라벨
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
    
    scrollView.backgroundColor = .white
    
    fetchUserData()
    setUpLayout()
    makeUI()
  }
  
  // MARK: - setUpLayout
  func setUpLayout(){
    headerStackView.addArrangedSubview(studyHubLabel)
    headerStackView.addArrangedSubview(spacerView)
    headerStackView.addArrangedSubview(bellButton)
    
    view.addSubview(headerStackView)
    
    if loginStatus == false {
      //로그인 관련
      print("로그인실패")
      print(loginStatus)
      loginOrStackView.addArrangedSubview(grayTextLabel)
      loginOrStackView.addArrangedSubview(blackTextLabel)
    
    } else {
      //로그인 관련
      print(loginStatus)
      print("로그인성공")
      loginOrStackView.addArrangedSubview(profileImageView)
      loginOrStackView.addArrangedSubview(majorLabel)
      loginOrStackView.addArrangedSubview(nickNameLabel)
    }

    headerContentStackView.addArrangedSubview(loginOrStackView)
    
    gotologinStackView.addArrangedSubview(loginOrStackView)
    gotologinStackView.addArrangedSubview(chevronButton)
    
    headerContentStackView.addArrangedSubview(gotologinStackView)
    headerContentStackView.addArrangedSubview(buttonboxesStackView)
    headerContentStackView.addArrangedSubview(boxesDividerLine)
    headerContentStackView.addArrangedSubview(normalButtonStackView)
    
    writtenButton.addSubview(writtenLabel)
    writtenButton.addSubview(writtenCountLabel)
    
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
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(headerContentStackView)
    view.addSubview(scrollView)
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

    //로그인 관련
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
  
  // MARK: - 유저 정보 가저오는 함수
  func fetchUserData() {
    InfoManager.shared.fetchUser { result in
      switch result {
      case .success(let userData):
        // 사용자 정보를 사용하여 원하는 작업을 수행합니다.
        print("Email: \(userData.email)")
        print("Gender: \(userData.gender)")
        print(userData)
//        self.setUserData(data: userData)
        self.loginStatus = true
        // 나머지 정보도 마찬가지로 출력하거나 사용합니다.
      case .failure(let error):
        // 네트워크 오류 또는 데이터 파싱 오류를 처리합니다.
        print("Error: \(error)")
      }
    }
  }
  
  func setUserData(data: UserData) {
    // string to image 로 변환해서 넣기
//    profileImageView.image = data.imageURL
    majorLabel.text = data.major
    nickNameLabel.text = data.nickname
//    writtenCountLabel.text = String(data.postCount)
//    joinstudyCountLabel.text = String(data.participateCount)
//    bookmarkCountLabel.text = String(data.bookmarkCount)
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
