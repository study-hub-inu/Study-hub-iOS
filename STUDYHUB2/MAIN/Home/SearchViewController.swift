import UIKit

import SnapKit

final class SearchViewController: UIViewController {
  
  // MARK: - 화면구성
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    
    setUpLayout()
  }
  
  func setUpLayout() {
    // Header stack view
    let headerStackView = UIStackView()
    headerStackView.axis = .horizontal
    headerStackView.alignment = .center
    headerStackView.spacing = 8
    
    view.addSubview(headerStackView)
    
    headerStackView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
      make.leading.equalToSuperview().offset(16)
      make.trailing.equalToSuperview().offset(-16)
    }
    
    // Back button
    let backButton = UIButton(type: .system)
    backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
    backButton.tintColor = .white
    backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    headerStackView.addArrangedSubview(backButton)
    
    // Spacer view
    let spacerView = UIView()
    spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    headerStackView.addArrangedSubview(spacerView)
    
    // Bookmark button
    let bookmarkButton = UIButton(type: .system)
    bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    bookmarkButton.tintColor = .white
    bookmarkButton.addTarget(self, action: #selector(bookmarkpageButtonTapped), for: .touchUpInside)
    headerStackView.addArrangedSubview(bookmarkButton)
    
    // Bell button
    let bellButton = UIButton(type: .system)
    bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
    bellButton.tintColor = .white
    headerStackView.addArrangedSubview(bellButton)
    
    // Header content stack view
    let headerContentStackView = UIStackView()
    headerContentStackView.axis = .vertical
    headerContentStackView.spacing = 16
    view.addSubview(headerContentStackView)
    
    headerContentStackView.snp.makeConstraints { make in
      make.top.equalTo(headerStackView.snp.bottom).offset(16)
      make.leading.trailing.equalToSuperview()
    }
    
    // Search bar
    let searchBar = UISearchBar()
    searchBar.placeholder = "관심있는 스터디를 검색해 보세요"
    searchBar.backgroundImage = UIImage()
    headerContentStackView.addArrangedSubview(searchBar)
    
    // Recent all stack view
    let recentallStackView = UIStackView()
    recentallStackView.axis = .vertical
    headerContentStackView.addArrangedSubview(recentallStackView)
    
    // Recent ask stack view
    let recentaskStackView = UIStackView()
    recentaskStackView.axis = .horizontal
    recentaskStackView.spacing = 16
    recentallStackView.addArrangedSubview(recentaskStackView)
    
    // Recent ask label
    let recentaskLabel = UILabel()
    recentaskLabel.text = "최근 검색어"
    recentaskLabel.textColor = .black
    recentaskLabel.font = UIFont.systemFont(ofSize: 15)
    recentaskStackView.addArrangedSubview(recentaskLabel)
    
    // Delete button
    let deleteButton = UIButton(type: .system)
    deleteButton.setTitle("삭제", for: .normal)
    deleteButton.setTitleColor(UIColor(hexCode: "#636363"), for: .normal)
    deleteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    recentaskStackView.addArrangedSubview(deleteButton)
    
    // No recent ask label
    let norecentaskLabel = UILabel()
    norecentaskLabel.text = "최근 검색어가 없습니다"
    norecentaskLabel.textColor = UIColor(hexCode: "#C2C8CC")
    norecentaskLabel.font = UIFont.systemFont(ofSize: 15)
    recentallStackView.addArrangedSubview(norecentaskLabel)
    
    // Recent all stack view divider line
    let recentallStackViewDividerLine = UIView()
    recentallStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
    recentallStackViewDividerLine.snp.makeConstraints { make in
      make.height.equalTo(10)
    }
    headerContentStackView.addArrangedSubview(recentallStackViewDividerLine)
    
    // Recommend stack view
    let recommendStackView = UIStackView()
    recommendStackView.axis = .horizontal
    recommendStackView.spacing = 16
    headerContentStackView.addArrangedSubview(recommendStackView)
    
    // Recommend label
    let recommendLabel = UILabel()
    recommendLabel.text = "추천 검색어"
    recommendLabel.textColor = .black
    recommendLabel.font = UIFont.systemFont(ofSize: 15)
    recommendStackView.addArrangedSubview(recommendLabel)
    
    // Scroll view
    let scrollView = UIScrollView()
    scrollView.backgroundColor = .white
    scrollView.addSubview(headerContentStackView)
    view.addSubview(scrollView)
    
    scrollView.snp.makeConstraints { make in
      make.top.equalTo(headerStackView.snp.bottom).offset(16)
      make.leading.trailing.bottom.equalToSuperview()
    }
    
    headerContentStackView.snp.makeConstraints { make in
      make.edges.equalTo(scrollView)
      make.width.equalTo(scrollView)
    }
  }
  
  @objc func goBack() {
    self.dismiss(animated: true, completion: nil)
  }
  
  @objc func bookmarkpageButtonTapped() {
    let bookmarkViewController = BookmarkViewController()
    let navigationController = UINavigationController(rootViewController: bookmarkViewController)
    navigationController.modalPresentationStyle = .fullScreen
    present(navigationController, animated: true, completion: nil)
  }
}
