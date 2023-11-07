import UIKit

import SnapKit

final class SearchViewController: NaviHelper {
  
  // MARK: - 화면구성, 검색 후 셀클릭 시 ui가 안뜸
  
  // MARK: - 서치바
  private let searchBar = UISearchBar.createSearchBar()
  
  private lazy var resultTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(CustomCell.self,
                       forCellReuseIdentifier: CustomCell.cellId)
    tableView.backgroundColor = .white
    tableView.separatorInset.left = 0
    tableView.layer.cornerRadius = 10
    return tableView
  }()
  
  // MARK: - 서치바에서 검색할 때
  private lazy var recentButton: UIButton = {
    let button = UIButton()
    button.setTitle("최신순", for: .normal)
    button.tintColor = .black
    return button
  }()
  
  private lazy var popularButton: UIButton = {
    let button = UIButton()
    button.setTitle("인기순", for: .normal)
    button.tintColor = .black
    return button
  }()
  
  private lazy var countLabel = createLabel(title: "4개",
                                            textColor: .bg80,
                                            fontSize: 14)
  
  private lazy var resultCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .vertical
    flowLayout.minimumLineSpacing = 10// cell사이의 간격 설정
    let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    view.backgroundColor = .white
    view.clipsToBounds = false

    return view
  }()
  
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.backgroundColor = .white
    return scrollView
  }()
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    navigationItemSetting()
    redesignNavigationbar()
    
    redesignSearchBar()
    
    setUpLayout()
    makeUI()
    
  }
  
  func makeUI() {
    searchBar.delegate = self
    
    resultTableView.delegate = self
    resultTableView.dataSource = self
    
    resultCollectionView.register(SearchResultCell.self,
                                    forCellWithReuseIdentifier: SearchResultCell.id)
    
    searchBar.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.leading.equalToSuperview().offset(10)
      make.trailing.equalToSuperview().offset(-10)
    }
  }
  
  func setUpLayout() {
    view.addSubview(searchBar)
  }
  
  // MARK: - 서치바 재설정
  func redesignSearchBar(){
    searchBar.placeholder = "관심있는 스터디를 검색해 보세요"
    
    if let searchBarTextField = searchBar.value(forKey: "searchField") as? UITextField {
      searchBarTextField.backgroundColor = .bg30
      searchBarTextField.layer.borderColor = UIColor.clear.cgColor
    }
  }
  // MARK: -  네비게이션바 재설정
  func redesignNavigationbar(){
    let bookMarkImg = UIImage(named: "BookMarkImg")?.withRenderingMode(.alwaysOriginal)
    lazy var bookMark = UIBarButtonItem(
      image: bookMarkImg,
      style: .plain,
      target: self,
      action: #selector(bookmarkpageButtonTapped))
    bookMark.imageInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
    
    let alertBellImg = UIImage(named: "BellImgWithWhite")?.withRenderingMode(.alwaysOriginal)
    lazy var alertBell = UIBarButtonItem(
      image: alertBellImg,
      style: .plain,
      target: self,
      action: nil)
    alertBell.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    navigationItem.rightBarButtonItems = [alertBell, bookMark]
  }

  @objc func bookmarkpageButtonTapped() {
    let bookmarkViewController = BookmarkViewController()
    let navigationController = UINavigationController(rootViewController: bookmarkViewController)
    navigationController.modalPresentationStyle = .fullScreen
    present(navigationController, animated: true, completion: nil)
  }
}

extension SearchViewController: UISearchBarDelegate {
  // 검색(Search) 버튼을 눌렀을 때 호출되는 메서드
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let keyword = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
    
    print(keyword)
    searchTapped(keyword: keyword)
  }
  
  func searchTapped(keyword: String){
    
    view.setNeedsLayout()
    view.layoutIfNeeded()
    
    view.addSubview(resultTableView)
    resultTableView.snp.makeConstraints { make in
      make.top.equalTo(searchBar.snp.bottom).offset(10)
      make.leading.trailing.equalTo(searchBar)
      make.bottom.equalTo(view).offset(-10)
    }
    
  }
}

// MARK: - cell 함수
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
  // UITableViewDataSource 함수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = resultTableView.dequeueReusableCell(withIdentifier: CustomCell.cellId,
                                                   for: indexPath) as! CustomCell
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "ScearchImgGray")
    cell.contentView.addSubview(imageView)
    
    imageView.snp.makeConstraints { make in
      make.leading.equalToSuperview()
      make.centerY.equalTo(cell.contentView)
    }
    
  
    cell.backgroundColor = .white
    
    
    return cell
  }
  
  // UITableViewDelegate 함수 (선택)
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    resultTableView.isHidden = true
    
    navigationController?.navigationBar.topItem?.title = "검색결과"
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    
    view.addSubview(recentButton)
    view.addSubview(popularButton)
    view.addSubview(countLabel)
    view.addSubview(resultCollectionView)
    
    recentButton.snp.makeConstraints { make in
      make.top.equalTo(searchBar.snp.bottom).offset(10)
      make.leading.equalToSuperview().offset(10)
    }
    
    popularButton.snp.makeConstraints { make in
      make.top.equalTo(recentButton)
      make.leading.equalTo(recentButton.snp.trailing)
    }
    
    countLabel.snp.makeConstraints { make in
      make.top.equalTo(recentButton)
      make.trailing.equalToSuperview().offset(-10)
    }
    
    resultCollectionView.snp.makeConstraints { make in
      make.height.equalTo(500)
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
  
  func reloadTalbeView(){
    resultTableView.reloadData()
  }
}

// MARK: - collectionView
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {
    let postedVC = PostedStudyViewController()
    let postedVCwithNavi = UINavigationController(rootViewController: postedVC)
    present(postedVCwithNavi, animated: true, completion: nil)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.id,
                                                  for: indexPath)
    return cell
  }
}

// 셀의 각각의 크기
extension SearchViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
 
      return CGSize(width: 335, height: collectionView.frame.height)

  }
}

