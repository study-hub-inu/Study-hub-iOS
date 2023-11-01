
import UIKit

import SnapKit

final class DepartmentselectViewController: NaviHelper {
  private lazy var majorSet = ["공연예술과", "IBE전공", "건설환경공학", "건축공학",
                               "경영학부", "경제학과", "국어교육과", "국어국문학과",
                               "기계공학과","데이터과학과","도시건축학","도시공학과",
                               "도시행정학과","독어독문학과","동북아통상전공","디자인학부",
                               "무역학부","문헌정보학과","물리학과","미디어커뮤니케이션학과",
                               "바이오-로봇 시스템 공학과","법학부", "불어불문학과","사회복지학과",
                               "산업경영공학과","생명공학부(나노바이오공학전공)","생명공학부(생명공학전공)",
                               "생명과학부(분자의생명전공)","생명과학부(생명과학전공)","서양화전공(조형예술학부)",
                               "세무회계학과","소비자학과","수학과","수학교육과", "스마트물류공학전공", "스포츠과학부",
                               "신소재공학과","안전공학과","에너지화학공학","역사교육과","영어교육과","영어영문학과",
                               "운동건강학부","유아교육과","윤리교육과","일본지역문화학과","일어교육과","임베디드시스템공과",
                               "전기공학과","전자공학과","정보통신학과","정치외교학과","중어중국학과","창의인개발학과",
                               "체육교육과","컴퓨터공학부","테크노경영학과","패션산업학과","한국화전공(조형예술학부)",
                               "해양학과","행정학과","화학과","환경공학" ]
  
  private let searchController = UISearchBar.createSearchBar()
  
  private lazy var describeLabel = createLabel(
    title: "- 관련학과는 1개만 선택할 수 있어요 \n- 다양한 학과와 관련된 스터디라면, '공통'을 선택해 주세요",
    textColor: .bg60,
    fontSize: 12)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    navigationItemSetting()
    redesignNavigationbar()
    
    setupLayout()
    makeUI()
    
    searchController.delegate = self
    
  }
  // MARK: - view 계층 구성
  func setupLayout(){
    [
      searchController,
      describeLabel
    ].forEach {
      view.addSubview($0)
    }
  }
  // MARK: - UI세팅
  func makeUI() {
    searchController.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(10)
      make.width.equalToSuperview().multipliedBy(0.95)
    }
    
    describeLabel.numberOfLines = 2
    describeLabel.snp.makeConstraints { make in
      make.top.equalTo(searchController.snp.bottom).offset(10)
      make.leading.equalTo(searchController.snp.leading)
    }
  }
  
  // MARK: - 네비게이션바 재설정
  func redesignNavigationbar(){
    let rightButtonImg = UIImage(named: "DeCompletedImg.png")?.withRenderingMode(.alwaysOriginal)
    let rightButton = UIBarButtonItem(image: rightButtonImg,
                                      style: .plain,
                                      target: self,
                                      action: #selector(redesingRightButtonTapped))
    self.navigationItem.rightBarButtonItem = rightButton
    
    self.navigationItem.title = "관련학과"
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
  
  @objc func redesingRightButtonTapped(){
    
  }
}


extension DepartmentselectViewController: UISearchBarDelegate {
  // 검색(Search) 버튼을 눌렀을 때 호출되는 메서드
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let keyword = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
    
    let matchingDepartments = majorSet.filter { $0.contains(keyword) }
    
    if matchingDepartments.isEmpty {
        print("검색 결과가 없음")
        // 검색 결과가 없을 때의 처리를 할 수 있습니다.
    } else {
        print("검색 결과: \(matchingDepartments)")
        // 검색 결과를 처리하거나 표시할 수 있습니다.
    }
    
    // 사용자 상호 작용을 다시 활성화
    searchBar.isUserInteractionEnabled = true
  }
}
