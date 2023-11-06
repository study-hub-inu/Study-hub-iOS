
import UIKit

import SnapKit
final class HomeViewController: NaviHelper {
  
  // MARK: - 화면구성
  private lazy var mainStackView = createStackView(axis: .vertical,
                                                   spacing: 10)
  private let mainImageView: UIImageView = {
    let mainImageView = UIImageView(image: UIImage(named: "MainImg"))
    
    mainImageView.clipsToBounds = true
    return mainImageView
  }()
  
  lazy var detailsButton: UIButton = {
    let detailsButton = UIButton(type: .system)
    detailsButton.setTitle("알아보기", for: .normal)
    detailsButton.setTitleColor(.white, for: .normal)
    detailsButton.backgroundColor = UIColor(hexCode: "FF5935")
    detailsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    detailsButton.layer.cornerRadius = 8
    detailsButton.addTarget(self, action: #selector(detailsButtonTapped), for: .touchUpInside)
    return detailsButton
  }()

  // MARK: - 서치바
  private let searchBar = UISearchBar.createSearchBar()

  // MARK: - 모집 중인 스터디
  private let newStudyLabel: UILabel = {
    let newStudyLabel = UILabel()
    newStudyLabel.text = "NEW! 모집 중인 스터디예요"
    newStudyLabel.font = UIFont.boldSystemFont(ofSize: 18)
    newStudyLabel.textColor = .black
    
    let attributedText = NSMutableAttributedString(string: "NEW! 모집 중인 스터디예요")
    attributedText.addAttribute(.foregroundColor,
                                value: UIColor(hexCode: "FF5935"),
                                range: NSRange(location: 0, length: 4))
    newStudyLabel.attributedText = attributedText
    return newStudyLabel
  }()

  private lazy var allButton: UIButton = {
    let button = UIButton()
    button.setTitle("전체", for: .normal)
    button.setTitleColor(UIColor.g60, for: .normal)
    
    let image = UIImage(named: "RightArrow")
    button.setImage(image, for: .normal)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    return button
  }()
  
  private lazy var newStudyStackView = createStackView(axis: .horizontal,
                                                       spacing: 10)

  // MARK: - 마감이 입박한 스터디
  private let deadLineImg: UIImageView = {
    let smallImageView = UIImageView(image: UIImage(named: "FireImg"))
    smallImageView.contentMode = .scaleAspectFit
    smallImageView.tintColor = UIColor(hexCode: "FF5935") // Set color
    return smallImageView
  }()
  
  private let deadLineLabel: UILabel = {
    let textLabel = UILabel()
    textLabel.text = "마감이 임박한 스터디예요"
    textLabel.font = UIFont.boldSystemFont(ofSize: 18)
    textLabel.textColor = .black
    
    // Apply attributed text to change color of "HUB"
    let textAttributedText = NSMutableAttributedString(string: "마감이 임박한 스터디예요")
    textAttributedText.addAttribute(.foregroundColor, value: UIColor(hexCode: "FF5935"),
                                    range: NSRange(location: 0, length: 2))
    textLabel.attributedText = textAttributedText
    
    return textLabel
  }()
  
  private lazy var deadLineStackView = createStackView(axis: .horizontal,
                                                       spacing: 10)

  
  private lazy var totalStackView = createStackView(axis: .vertical,
                                                    spacing: 10)
  private lazy var scrollView: UIScrollView = UIScrollView()
  
  // MARK: -  viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    navigationItemSetting()
    redesignNavigationbar()
    redesignSearchBar()
    setUpLayout()
    makeUI()
  }
  
  // MARK: - setuplayout
  func setUpLayout(){
 
    scrollView.addSubview(mainImageView)
    scrollView.addSubview(detailsButton)
    
    let newStudyDataView = [newStudyLabel, allButton]
    for view in newStudyDataView {
      newStudyStackView.addArrangedSubview(view)
    }
    newStudyStackView.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 10)
    
    let spaceView1 = UIView()
    let deadLineViewData = [deadLineImg, deadLineLabel, spaceView1]
    for view in deadLineViewData {
      deadLineStackView.addArrangedSubview(view)
    }
    deadLineStackView.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 10)

    searchBar.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

    let totalViewData = [mainStackView, searchBar,
                         newStudyStackView, deadLineStackView]
    for view in totalViewData {
      totalStackView.addArrangedSubview(view)
    }
    
    scrollView.addSubview(totalStackView)
    
    view.addSubview(scrollView)
  }
  
  // MARK: - makeUI
  func makeUI(){
    mainImageView.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(scrollView)
    }
    
    detailsButton.snp.makeConstraints { make in
      make.leading.equalTo(mainImageView.snp.leading).offset(20)
      make.bottom.equalTo(mainImageView.snp.bottom).offset(-30)
      make.width.equalTo(110)
      make.height.equalTo(39)
    }
    
    totalStackView.snp.makeConstraints { make in
      make.top.equalTo(mainImageView.snp.bottom)
      make.leading.trailing.bottom.equalTo(scrollView.contentLayoutGuide)
      make.width.equalTo(view.safeAreaLayoutGuide)
    }
    
    scrollView.snp.makeConstraints { make in
      make.edges.equalTo(view)
    }
  }
  
  // MARK: - 네비게이션바 재설정
  func redesignNavigationbar(){
    // 네비게이션 왼쪽아이템
    let logoImg = UIImage(named: "LogoImage")?.withRenderingMode(.alwaysOriginal)
    let logo = UIBarButtonItem(image: logoImg, style: .done, target: nil, action: nil)
    logo.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    let mainTitleImg = UIImage(named: "MainTitle")?.withRenderingMode(.alwaysOriginal)
    let mainTitle = UIBarButtonItem(image: mainTitleImg, style: .done, target: nil, action: nil)
    mainTitle.imageInsets = UIEdgeInsets(top: 0, left: -40, bottom: 0, right: 0)

    let bookMarkImg = UIImage(named: "BookMarkImg")?.withRenderingMode(.alwaysOriginal)
    lazy var bookMark = UIBarButtonItem(
      image: bookMarkImg,
      style: .plain,
      target: self,
      action: nil)
    bookMark.imageInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)

    let alertBellImg = UIImage(named: "BellImg")?.withRenderingMode(.alwaysOriginal)
    lazy var alertBell = UIBarButtonItem(
      image: alertBellImg,
      style: .plain,
      target: self,
      action: nil)
    alertBell.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    navigationItem.leftBarButtonItems = [logo, mainTitle]
    navigationItem.rightBarButtonItems = [alertBell, bookMark]
  }
  
  // MARK: - 알아보기로 이동하는 함수
  @objc func detailsButtonTapped() {
    let detailsViewController = DetailsViewController()
    let navigationController = UINavigationController(rootViewController: detailsViewController)
    navigationController.modalPresentationStyle = .fullScreen
    present(navigationController, animated: true, completion: nil)
  }

  // 북마크 페이지로 이동
  @objc func bookmarkpageButtonTapped() {
    let bookmarkViewController = BookmarkViewController()
    let navigationController = UINavigationController(rootViewController: bookmarkViewController)
    
    navigationController.modalPresentationStyle = .fullScreen
    present(navigationController, animated: true, completion: nil)
  }
  

  
  // 서치바 재설정
  func redesignSearchBar(){
    searchBar.placeholder = "관심있는 스터디를 검색해 보세요"
    
    if let searchBarTextField = searchBar.value(forKey: "searchField") as? UITextField {
      searchBarTextField.backgroundColor = .bg30
    }
  }
}

// MARK: - 서치바 관련
extension HomeViewController: UISearchBarDelegate {
  // 검색(Search) 버튼을 눌렀을 때 호출되는 메서드
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let keyword = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
    
    
    if keyword.isEmpty {
      print("검색 결과가 없음")
      // 검색 결과가 없을 때의 처리를 할 수 있습니다.
    } else {
      let searchViewController = SearchViewController()
      let navigationController = UINavigationController(rootViewController: searchViewController)
      navigationController.modalPresentationStyle = .fullScreen
      present(navigationController, animated: true, completion: nil)
    }
    
  }
}
