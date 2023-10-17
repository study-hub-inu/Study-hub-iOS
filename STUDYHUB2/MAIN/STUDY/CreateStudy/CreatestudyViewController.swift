import UIKit

import SnapKit

class CreateStudyViewController: UIViewController {
  
  private var selectedDepartments: [String] = [] // 선택된 학과를 저장할 배열
  
  // 선택한 학과를 저장할 프로퍼티
  var selectedDepartment: String? {
    didSet {
      // selectedDepartment가 설정되면 버튼을 생성
      if let department = selectedDepartment {
        addDepartmentButton(department)
      }
    }
  }

  // MARK: - UI설정
  private lazy var completeButton: UIButton = {
    let completeButton = UIButton()
    completeButton.setTitle("완료하기", for: .normal)
    completeButton.setTitleColor(.white, for: .normal)
    completeButton.backgroundColor = UIColor(hexCode: "#FF5530")
    completeButton.layer.cornerRadius = 5
    completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
    return completeButton
  }()
  
  private lazy var categoryStackView = createStackView(axis: .vertical,
                                                       spacing: 16)
  private lazy var departmentButtonStackView = createStackView(axis: .vertical,
                                                               spacing: 16)
  // 성별버튼
  private lazy var allGenderButton = createContactButton(title: "남녀무관",
                                                         selector: #selector(genderButtonTapped(_:)))
  
  private lazy var maleOnlyButton = createContactButton(title: "남자만",
                                                        selector:#selector(genderButtonTapped(_:)))
  private lazy var femaleOnlyButton = createContactButton(title: "여자만",
                                                          selector: #selector(genderButtonTapped(_:)))
  // 대면 비대면 버튼
  private lazy var contactButton = createContactButton(title: "대면",
                                                       selector: #selector(meetButtonTapped(_:)))
  
  private lazy var untactButton = createContactButton(title: "비대면",
                                                      selector: #selector(meetButtonTapped(_:)))
  
  private lazy var mixmeetButton = createContactButton(title: "혼합",
                                                       selector: #selector(meetButtonTapped(_:)))
  
  // 벌금버튼
  private lazy var haveFineButton = createFineButton(title: "circle",
                                                     selector: #selector(haveFineButtonTapped(_:)))
  
  private lazy var noFineButton = createFineButton(title: "circle",
                                                   selector: #selector(noFineButtonTapped(_:)))
  
  private lazy var fineButtonsStackView = createStackView(axis: .horizontal,
                                                          spacing: 10)
  private lazy var finefixStackView = createStackView(axis: .vertical,
                                                      spacing: 10)
  
  private lazy var periodStackView = createStackView(axis: .vertical,
                                                     spacing: 16)
  
  private lazy var startDateButton = createDateButton(selector: #selector(startDateButtonTapped))
  private lazy var endDateButton = createDateButton(selector: #selector(endDateButtonTapped))
  
  private lazy var chatLinkTextField = createTextField(title: "채팅방 링크를 첨부해 주세요")
  private lazy var studyproduceTextField = createTextField(title: "스터디에 대해 알려주세요")
  
  private let fineAmountTextField: UITextField = {
    let fineAmountTextField = UITextField()
    fineAmountTextField.placeholder = "가격을 알려주세요"
    fineAmountTextField.textColor = UIColor(hexCode: "#A1AAB0")
    fineAmountTextField.font = UIFont.systemFont(ofSize: 14)
    fineAmountTextField.borderStyle = .roundedRect  // Add rounded border
    return fineAmountTextField
  }()
  
  private lazy var studymemberTextField = createTextField(title: "스터디에 대해 알려주세요")
  private lazy var studytitleTextField = createTextField(title: "제목입니다")
  
  let startDatePicker = UIDatePicker()
  let startDateTextField = UITextField()
  var selectedStartDate: Date?
  
  let endDatePicker = UIDatePicker()
  let endDateTextField = UITextField()
  var selectedEndDate: Date?
  
  private let headerStackView: UIStackView = {
    let headerStackView = UIStackView()
    headerStackView.axis = .horizontal
    headerStackView.alignment = .center
    headerStackView.spacing = 8
    return headerStackView
  }()
  
  private lazy var backButton: UIButton = {
    let backButton = UIButton(type: .system)
    backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
    backButton.tintColor = .white
    backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    return backButton
  }()
  
  private lazy var createStudyLabel = createLabel(title: "스터디 만들기",
                                                  textColor: .white,
                                                  fontSize: 18)
  
  private lazy var headerContentStackView = createStackView(axis: .vertical,
                                                            spacing: 40)
  
  private lazy var chatLinkStackView = createStackView(axis: .vertical,
                                                       spacing: 16)
  
  private lazy var chatLinkLabel = createLabel(title: "채팅방 링크",
                                               textColor: .black,
                                               fontSize: 18)
  
  
  private lazy var descriptionLabel = createLabel(title: "참여코드가 없는 카카오톡 오픈 채팅방 링크로 첨부",
                                                  textColor: .gray,
                                                  fontSize: 14)
  
  private let chatLinkDividerLine: UIView = {
    let chatLinkDividerLine = UIView()
    chatLinkDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
    return chatLinkDividerLine
  }()
  
  private lazy var studyinfoStackView = createStackView(axis: .vertical,
                                                        spacing: 16)
  
  private lazy var studytitleLabel = createLabel(title: "스터디 제목",
                                                 textColor: .black, fontSize: 18)
  
  private lazy var studyproduceLabel = createLabel(title: "스터디 소개",
                                                   textColor: .black, fontSize: 18)
  
  private let studyinfoStackViewDividerLine: UIView = {
    let studyinfoStackViewDividerLine = UIView()
    studyinfoStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
    return studyinfoStackViewDividerLine
  }()
  
  private lazy var associatedepartLabel = createLabel(title: "관련 학과 선택",
                                                      textColor: .black,
                                                      fontSize: 18)
  
  
  private lazy var periodLabel = createLabel(title: "기간",
                                             textColor: .black,
                                             fontSize: 18)
  
  private lazy var startLabel = createLabel(title: "시작하는 날",
                                            textColor: .black,
                                            fontSize: 18)
  
  
  private lazy var endLabel = createLabel(title: "종료하는 날",
                                          textColor: .black,
                                          fontSize: 18)
  
  
  private lazy var genderLabel = createLabel(title: "성별",
                                             textColor: .black,
                                             fontSize: 18)
  
  private lazy var studymembercountLabel = createLabel(title: "인원",
                                                       textColor: .black,
                                                       fontSize: 18)
  
  private lazy var studymemberLabel = createLabel(title: "스터디 팀원",
                                                  textColor: .black,
                                                  fontSize: 18)
  
  private lazy var studymethodLabel = createLabel(title: "스터디 방식",
                                                  textColor: .black,
                                                  fontSize: 18)
  
  private lazy var meetLabel = createLabel(title: "대면 여부",
                                           textColor: .black,
                                           fontSize: 18)
  
  private lazy var fineLabel = createLabel(title: "벌금",
                                           textColor: .black,
                                           fontSize: 18)
  
  private lazy var haveFineLabel = createLabel(title: "있어요",
                                               textColor: .black,
                                               fontSize: 16)
  
  private lazy var noFineLabel = createLabel(title: "없어요",
                                             textColor: .black,
                                             fontSize: 16)
  
  private lazy var associatedepartStackView = createStackView(axis: .horizontal,
                                                              spacing: 16)
  
  private lazy var studymemberStackView = createStackView(axis: .vertical,
                                                          spacing: 16)
  
  private lazy var genderButtonsStackView = createStackView(axis: .horizontal,
                                                            spacing: 16)
  
  private lazy var meetButtonsStackView = createStackView(axis: .horizontal,
                                                          spacing: 16)
  
  private lazy var description4Label = createLabel(title: "최대 50명 참여 가능",
                                                   textColor: UIColor(hexCode: "#A1AAB0"),
                                                   fontSize: 12)
  
  private lazy var countLabel = createLabel(title: "명",
                                            textColor: UIColor(hexCode: "#68737D"),
                                            fontSize: 15)
  
  
  private lazy var description5Label = createLabel(title: "참여자의 성별 선택",
                                                   textColor: UIColor(hexCode: "#A1AAB0"),
                                                   fontSize: 12)
  
  
  private lazy var studymethodStackView = createStackView(axis: .vertical,
                                                          spacing: 16)
  
  
  private lazy var description6Label = createLabel(title: "혼합일 경우, 관련 내용에 대한 계획을 소개에 적어주세요",
                                                   textColor: UIColor(hexCode: "#A1AAB0"),
                                                   fontSize: 12)
  
  private lazy var categoryStackViewDividerLine = createDividerLine(height: 10)
  private lazy var grayDividerLine = createDividerLine(height: 2)
  private lazy var studymemberStackViewDividerLine = createDividerLine(height: 10)
  private lazy var grayDividerLine2 = createDividerLine(height: 2)
  private lazy var studymethodStackViewDividerLine = createDividerLine(height: 10)
  private lazy var grayDividerLine3 = createDividerLine(height: 2)
  
  private lazy var associatedepartButton: UIButton = {
    let associatedepartButton = UIButton(type: .system)
    associatedepartButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    associatedepartButton.tintColor = .black
    associatedepartButton.addTarget(self, action: #selector(departmentArrowButtonTapped), for: .touchUpInside)
    return associatedepartButton
  }()
  
  let scrollView = UIScrollView()
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
        
    setUpLayout()
    makeUI()
  }
  
  // MARK: - setUpLayout
  func setUpLayout(){
    headerStackView.addArrangedSubview(backButton)
    headerStackView.addArrangedSubview(createStudyLabel)
    
    view.addSubview(headerStackView)
    
    headerContentStackView.addArrangedSubview(chatLinkStackView)
    headerContentStackView.addArrangedSubview(chatLinkDividerLine)
    headerContentStackView.addArrangedSubview(studyinfoStackView)
    
    // 키보드 내리기를 위한 탭 제스처 추가
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    view.addGestureRecognizer(tapGesture)
    
    chatLinkDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true
    
    chatLinkStackView.addArrangedSubview(chatLinkLabel)
    chatLinkStackView.addArrangedSubview(descriptionLabel)
    chatLinkStackView.addArrangedSubview(chatLinkTextField)
    
    studyproduceTextField.heightAnchor.constraint(equalToConstant: 150).isActive = true
    studyproduceTextField.contentVerticalAlignment = .top
    
    studyinfoStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true
    
    studyinfoStackView.addArrangedSubview(studytitleLabel)
    studyinfoStackView.addArrangedSubview(studytitleTextField)
    studyinfoStackView.addArrangedSubview(studyproduceLabel)
    studyinfoStackView.addArrangedSubview(studyproduceTextField)
    
    headerContentStackView.addArrangedSubview(studyinfoStackViewDividerLine)
    headerContentStackView.addArrangedSubview(categoryStackView)
    headerContentStackView.addArrangedSubview(categoryStackViewDividerLine)
    headerContentStackView.addArrangedSubview(studymemberStackView)
    headerContentStackView.addArrangedSubview(studymethodStackView)
    headerContentStackView.addArrangedSubview(studymemberStackViewDividerLine)
    headerContentStackView.addArrangedSubview(studymethodStackViewDividerLine)
    headerContentStackView.addArrangedSubview(periodStackView)
    
    categoryStackView.addArrangedSubview(associatedepartStackView)
    
    associatedepartStackView.addArrangedSubview(associatedepartLabel)
    associatedepartStackView.addArrangedSubview(associatedepartButton)
    
    categoryStackView.addArrangedSubview(departmentButtonStackView)
    
    studymemberTextField.addSubview(countLabel)
    
    genderButtonsStackView.addArrangedSubview(allGenderButton)
    genderButtonsStackView.addArrangedSubview(maleOnlyButton)
    genderButtonsStackView.addArrangedSubview(femaleOnlyButton)
    
    studymemberStackView.addArrangedSubview(studymemberLabel)
    studymemberStackView.addArrangedSubview(grayDividerLine)
    studymemberStackView.addArrangedSubview(studymembercountLabel)
    studymemberStackView.addArrangedSubview(description4Label)
    studymemberStackView.addArrangedSubview(studymemberTextField)
    studymemberStackView.addArrangedSubview(genderLabel)
    studymemberStackView.addArrangedSubview(description5Label)
    studymemberStackView.addArrangedSubview(genderButtonsStackView)
    
    meetButtonsStackView.addArrangedSubview(contactButton)
    meetButtonsStackView.addArrangedSubview(untactButton)
    meetButtonsStackView.addArrangedSubview(mixmeetButton)
    
    fineButtonsStackView.addArrangedSubview(haveFineButton)
    fineButtonsStackView.addArrangedSubview(haveFineLabel)
    fineButtonsStackView.addArrangedSubview(noFineButton)
    fineButtonsStackView.addArrangedSubview(noFineLabel)
    
    studymethodStackView.addArrangedSubview(studymethodLabel)
    studymethodStackView.addArrangedSubview(grayDividerLine2)
    studymethodStackView.addArrangedSubview(meetLabel)
    studymethodStackView.addArrangedSubview(description6Label)
    studymethodStackView.addArrangedSubview(meetButtonsStackView)
    studymethodStackView.addArrangedSubview(fineLabel)
    studymethodStackView.addArrangedSubview(fineButtonsStackView)
    studymethodStackView.addArrangedSubview(finefixStackView)
    
    // Add UI elements to the headerContentStackView
    periodStackView.addArrangedSubview(periodLabel)
    periodStackView.addArrangedSubview(grayDividerLine3)
    periodStackView.addArrangedSubview(startLabel)
    periodStackView.addArrangedSubview(startDateButton)
    periodStackView.addArrangedSubview(endLabel)
    periodStackView.addArrangedSubview(endDateButton)
    // Add the completeButton to the periodStackView
    periodStackView.addArrangedSubview(completeButton)
    
    // Constraints for the "완료하기" button
    completeButton.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 16).isActive = true
    completeButton.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: -16).isActive = true
    completeButton.heightAnchor.constraint(equalToConstant: 57).isActive = true
    
    // Create a scroll view to make the content scrollable
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(headerContentStackView)
    view.addSubview(scrollView)
    
    scrollView.backgroundColor = .white
    
    headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
  }
  // MARK: - makeUI
  func makeUI(){
    headerStackView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.leading.equalTo(view.snp.leading).offset(-60)
      make.trailing.equalTo(view.snp.trailing).offset(-16)
    }
    
    createStudyLabel.snp.makeConstraints { make in
      make.centerX.equalTo(headerStackView.snp.centerX).offset(100)
    }
    headerContentStackView.snp.makeConstraints { make in
      make.top.equalTo(scrollView.snp.top).offset(30)
      make.leading.trailing.bottom.equalTo(scrollView)
      make.width.equalTo(scrollView)
    }
    chatLinkLabel.snp.makeConstraints { make in
      make.leading.equalTo(chatLinkStackView).offset(16)
      make.trailing.equalTo(chatLinkStackView).offset(10)
    }
    
    descriptionLabel.snp.makeConstraints { make in
      make.leading.equalTo(chatLinkStackView).offset(16)
      make.trailing.equalTo(chatLinkStackView).offset(100)
    }
    
    chatLinkTextField.snp.makeConstraints { make in
      make.leading.equalTo(chatLinkStackView).offset(16)
      make.trailing.equalTo(chatLinkStackView)
      make.width.equalTo(chatLinkStackView).offset(-50)
    }
    studytitleLabel.snp.makeConstraints { make in
      make.leading.equalTo(studyinfoStackView).offset(16)
      make.trailing.equalTo(studyinfoStackView).offset(5)
    }
    studytitleTextField.snp.makeConstraints { make in
      make.leading.equalTo(studyinfoStackView).offset(16)
      make.trailing.equalTo(chatLinkTextField)
    }
    studyproduceLabel.snp.makeConstraints { make in
      make.leading.equalTo(studyinfoStackView).offset(16)
      make.trailing.equalTo(studyinfoStackView).offset(10)
    }
    
    studyproduceTextField.snp.makeConstraints { make in
      make.leading.equalTo(studyinfoStackView).offset(16)
      make.trailing.equalTo(studyinfoStackView)
      make.width.equalTo(studyinfoStackView).offset(-50)
    }
    // (3) 카테고리 뷰
    associatedepartStackView.snp.makeConstraints { make in
      make.leading.equalTo(categoryStackView).offset(16)
      make.trailing.equalTo(categoryStackView)
    }
    
    associatedepartButton.snp.makeConstraints { make in
      make.leading.equalTo(associatedepartStackView).offset(300)
      make.trailing.equalTo(associatedepartStackView)
    }
    
    // (4) 스터디멤버 뷰
    studymemberLabel.snp.makeConstraints { make in
      make.leading.equalTo(studymemberStackView).offset(16)
      make.trailing.equalTo(studymemberStackView).offset(5)
    }
    
    grayDividerLine.snp.makeConstraints { make in
      make.leading.equalTo(studymemberStackView).offset(0)
      make.trailing.equalTo(studymemberStackView).offset(10)
    }
    
    studymembercountLabel.snp.makeConstraints { make in
      make.leading.equalTo(studymemberStackView).offset(16)
      make.trailing.equalTo(studymemberStackView).offset(5)
    }
    description4Label.snp.makeConstraints { make in
      make.leading.equalTo(studymemberStackView).offset(16)
      make.trailing.equalTo(studymemberStackView).offset(100)
    }
    
    studymemberTextField.snp.makeConstraints { make in
      make.leading.equalTo(studymemberStackView).offset(16)
      make.trailing.equalTo(studymemberStackView)
      make.width.equalTo(studymemberStackView).offset(-50)
    }
    
    countLabel.snp.makeConstraints { make in
      make.centerY.equalTo(studymemberTextField)
      make.trailing.equalTo(studymemberTextField).offset(-8)
      make.width.equalTo(20)
      make.height.equalTo(20)
    }
    genderLabel.snp.makeConstraints { make in
      make.leading.equalTo(studymemberStackView.snp.leading).offset(16)
      make.trailing.equalTo(studymemberStackView.snp.trailing).offset(10)
    }
    
    description5Label.snp.makeConstraints { make in
      make.leading.equalTo(studymemberStackView.snp.leading).offset(16)
      make.trailing.equalTo(studymemberStackView.snp.trailing).offset(10)
    }
    
    genderButtonsStackView.snp.makeConstraints { make in
      make.trailing.equalTo(studymemberStackView.snp.trailing).offset(-16)
      make.top.equalTo(description5Label.snp.bottom).offset(8)
      make.height.equalTo(30)
    }
    
    allGenderButton.snp.makeConstraints { make in
      make.width.equalTo(100)
    }
    
    maleOnlyButton.snp.makeConstraints { make in
      make.width.equalTo(100)
    }
    femaleOnlyButton.snp.makeConstraints { make in
      make.width.equalTo(100)
    }
    studymethodLabel.snp.makeConstraints { make in
      make.leading.equalTo(studymethodStackView).offset(16)
      make.trailing.equalTo(studymethodStackView).offset(5)
    }
    meetLabel.snp.makeConstraints { make in
      make.leading.equalTo(studymethodStackView).offset(16)
      make.trailing.equalTo(studymethodStackView).offset(5)
    }
    
    description6Label.snp.makeConstraints { make in
      make.leading.equalTo(studymethodStackView).offset(16)
      make.trailing.equalTo(studymethodStackView).offset(100)
    }
    
    meetButtonsStackView.snp.makeConstraints { make in
      make.trailing.equalTo(studymethodStackView).offset(-16)
    }
    
    contactButton.snp.makeConstraints { make in
      make.width.equalTo(80)
    }
    
    untactButton.snp.makeConstraints { make in
      make.width.equalTo(100)
    }
    
    mixmeetButton.snp.makeConstraints { make in
      make.width.equalTo(80)
    }
    fineLabel.snp.makeConstraints { make in
      make.leading.equalTo(studymethodStackView).offset(16)
      make.trailing.equalTo(studymethodStackView).offset(100)
    }
    
    fineButtonsStackView.snp.makeConstraints { make in
      make.leading.equalTo(studymethodStackView).offset(16)
      make.trailing.equalTo(studymethodStackView).offset(50)
    }
    
    grayDividerLine2.snp.makeConstraints { make in
      make.leading.equalTo(studymethodStackView)
      make.trailing.equalTo(studymethodStackView).offset(10)
    }
    // 스터디기간 뷰
    periodLabel.snp.makeConstraints { make in
      make.leading.equalTo(periodStackView).offset(16)
      make.trailing.equalTo(periodStackView).offset(5)
    }
    
    grayDividerLine3.snp.makeConstraints { make in
      make.leading.equalTo(periodStackView)
      make.trailing.equalTo(periodStackView).offset(10)
    }
    
    startLabel.snp.makeConstraints { make in
      make.leading.equalTo(periodStackView).offset(16)
      make.trailing.equalTo(periodStackView).offset(10)
    }
    startDateButton.snp.makeConstraints { make in
      make.leading.equalTo(periodStackView).offset(16)
      make.trailing.equalTo(periodStackView).offset(-16)
      make.height.equalTo(50)
    }
    
    endLabel.snp.makeConstraints { make in
      make.leading.equalTo(periodStackView).offset(16)
      make.trailing.equalTo(periodStackView).offset(10)
    }
    
    endDateButton.snp.makeConstraints { make in
      make.leading.equalTo(periodStackView).offset(16)
      make.trailing.equalTo(periodStackView).offset(-16)
      make.height.equalTo(50)
    }
    
    endDateButton.snp.makeConstraints { make in
      make.bottom.equalTo(completeButton.snp.top).offset(-40)
    }
    
    scrollView.snp.makeConstraints { make in
      make.top.equalTo(headerStackView.snp.bottom).offset(16)
      make.leading.equalTo(view)
      make.trailing.equalTo(view)
      make.bottom.equalTo(view)
    }
  }
 
  // 선택한 학과에 대한 버튼을 생성하고 departmentButtonStackView에 추가하는 함수
  func addDepartmentButton(_ department: String) {
    // Department 버튼과 삭제 버튼을 수평으로 나열하는 스택 뷰 생성
    lazy var buttonStackView: UIStackView = createStackView(axis: .horizontal, spacing: 0)
    
    
    departmentButtonStackView.addArrangedSubview(buttonStackView)
    
    // Department 버튼 생성
    let departmentButton = UIButton(type: .system)
    departmentButton.backgroundColor = UIColor(hexCode: "F3F5F6")
    departmentButton.setTitleColor(UIColor(hexCode: "68737D"), for: .normal)
    departmentButton.setTitle(department, for: .normal)
    departmentButton.layer.cornerRadius = 20
    departmentButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    departmentButton.contentHorizontalAlignment = .center // 텍스트 정렬
    
    // 삭제 버튼 생성
    let deleteButton = UIButton(type: .system)
    deleteButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
    deleteButton.tintColor = .lightGray
    
    // 문자열 길이에 따라 버튼 가로 길이 동적 조절
    let buttonWidth = department.width(withConstrainedHeight: 30, font: departmentButton.titleLabel!.font)
    departmentButton.widthAnchor.constraint(equalToConstant: buttonWidth + 50).isActive = true
    
    buttonStackView.addArrangedSubview(departmentButton)
    buttonStackView.addArrangedSubview(deleteButton)
  }
  
  // 키보드 내리기 위한 탭 제스처 핸들러
  @objc func handleTap() {
    // 키보드를 내립니다.
    view.endEditing(true)
  }
  
  // MARK: - 벌금 있을 때 함수
  @objc func haveFineButtonTapped(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    noFineButton.isSelected = !sender.isSelected
    
    if sender.isSelected {
      // Create a label for "어떤 벌금인가요?"
      let fineTypeLabel = createLabel(title:"어떤 벌금인가요?",
                                      textColor: UIColor(hexCode: "#49545C"),
                                      fontSize: 14)
      
      // Create a text field for chat link input
      let fineTypesTextField = UITextField()
      fineTypesTextField.placeholder = "지각비, 결석비"
      fineTypesTextField.textColor = UIColor(hexCode: "#A1AAB0")
      fineTypesTextField.font = UIFont.systemFont(ofSize: 14)
      fineTypesTextField.borderStyle = .roundedRect  // Add rounded border
      
      // Create a text field for "얼마인가요?"
      let fineAmountLabel = createLabel(title: "얼마인가요?",
                                        textColor: UIColor(hexCode: "#49545C"),
                                        fontSize: 14)
      // Create a label for
      let countLabel2 = createLabel(title: "원",
                                    textColor: UIColor(hexCode: "#68737D"),
                                    fontSize: 15)
      
      fineAmountTextField.addSubview(countLabel2)
      
      finefixStackView.addArrangedSubview(fineTypeLabel)
      finefixStackView.addArrangedSubview(fineTypesTextField)
      finefixStackView.addArrangedSubview(fineAmountLabel)
      finefixStackView.addArrangedSubview(fineAmountTextField)
      
      // Constraints for chatLinkTextField
      fineTypesTextField.snp.makeConstraints { make in
        make.leading.equalTo(fineButtonsStackView)
        make.trailing.equalTo(fineButtonsStackView)
        make.width.equalTo(fineButtonsStackView).offset(-30)
      }
      
      fineAmountTextField.snp.makeConstraints { make in
        make.leading.equalTo(fineButtonsStackView)
        make.trailing.equalTo(fineButtonsStackView)
        make.width.equalTo(fineButtonsStackView).offset(-30)
      }
      
      countLabel2.snp.makeConstraints { make in
        make.centerY.equalTo(fineAmountTextField)
        make.trailing.equalTo(fineAmountTextField).offset(-8)
        make.width.equalTo(20)
        make.height.equalTo(20)
      }
      
    } else {
      // Remove the labels and text fields from the fineButtonsStackView
      fineButtonsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
  }
  
  // MARK: - 완료버튼 누를 때 함수
  @objc func completeButtonTapped() {
    // 입력된 정보 JSON
    let chatUrl = chatLinkTextField.text ?? ""
    let content = studyproduceTextField.text ?? ""
    
    //        // 선택한 학과에 따라 major 값을 설정
    var major = "COMPUTER_SCIENCE_ENGINEERING"
    //        if selectedDepartment == "컴퓨터공학과" {
    //            major = "COMPUTER_SCIENCE_ENGINEERING"
    //        } else if selectedDepartment == "정보통신공학과" {
    //            major = "INFORMATION_TELECOMMUNICATION_ENGINEERING"
    //        }
    
    let penalty = Int(fineAmountTextField.text ?? "0") ?? 0
    let studyEndDate = endDateTextField.text ?? ""
    let studyPerson = Int(studymemberTextField.text ?? "0") ?? 0
    let studyStartDate = startDateTextField.text ?? ""
    var gender = ""
    if maleOnlyButton.isSelected {
      gender = "MALE"
    } else if femaleOnlyButton.isSelected {
      gender = "FEMALE"
    } else {
      gender = "ALLGENDER"
    }
    var studyWay = ""
    if contactButton.isSelected {
      studyWay = "CONTACT"
    } else if untactButton.isSelected {
      studyWay = "UNCONTACT"
    } else {
      studyWay = "MIXMEET"
    }
    let title = studytitleTextField.text ?? ""
    
    // JSON 데이터 생성
    let studyData: [String: Any] = [
      "chatUrl": chatUrl,
      "close": false,
      "content": content,
      "gender": gender,
      "major": major,
      "penalty": penalty,
      "studyEndDate": studyEndDate,
      "studyPerson": studyPerson,
      "studyStartDate": studyStartDate,
      "studyWay": studyWay,
      "title": title
    ]
    
    // JSON 데이터를 서버로 전송
    if let url = URL(string: "https://study-hub.site:443/api/study-posts") {
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      do {
        let jsonData = try JSONSerialization.data(withJSONObject: studyData, options: .prettyPrinted)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          if let error = error {
            print("Error: \(error)")
          } else if let response = response as? HTTPURLResponse {
            if (200...299).contains(response.statusCode) {
              // 서버 응답이 200대 범위일 때 (성공적인 응답)
              DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
              }
            } else {
              // 서버 응답이 오류인 경우
              print("Server Error: \(response.statusCode)")
            }
          }
          
          if let data = data {
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
              print("\(chatUrl)")
              print("\(close)")
              print("\(content)")
              print("\(gender)")
              print("\(major)")
              print("\(penalty)")
              print("\(studyEndDate)")
              print("\(studyPerson)")
              print("\(studyStartDate)")
              print("\(studyWay)")
              print("\(title)")
              
              
              print("Response JSON: \(json)")
              // 서버 응답을 처리하는 코드를 추가하세요.
            }
          }
        }
        task.resume()
      } catch {
        print("Error creating JSON: \(error)")
      }
    }
  }
  
  // MARK: - 벌금 없을 때 함수
  @objc func noFineButtonTapped(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    haveFineButton.isSelected = !sender.isSelected
    
    // Remove the labels and text fields from the finefixStackView
    finefixStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
  }
  
  @objc func departmentArrowButtonTapped() {
    let departmentselectViewController = DepartmentselectViewController()
    let navigationController = UINavigationController(rootViewController: departmentselectViewController)
    navigationController.modalPresentationStyle = .fullScreen
    present(navigationController, animated: true, completion: nil)
  }
  
  // MARK: - 성별 눌렸을 때 함수
  @objc func genderButtonTapped(_ sender: UIButton) {
    // Reset colors of all buttons
    allGenderButton.backgroundColor = .white
    allGenderButton.setTitleColor(.gray, for: .normal)
    
    maleOnlyButton.backgroundColor = .white
    maleOnlyButton.setTitleColor(.gray, for: .normal)
    
    femaleOnlyButton.backgroundColor = .white
    femaleOnlyButton.setTitleColor(.gray, for: .normal)
    
    // Set the tapped button to orange background
    sender.backgroundColor = UIColor(hexCode: "#FF5530")
    sender.setTitleColor(.white, for: .normal)
  }
  
  // MARK: - 스터디 방식 눌렸을 때 함수
  @objc func meetButtonTapped(_ sender: UIButton) {
    // Reset colors of all buttons
    contactButton.backgroundColor = .white
    contactButton.setTitleColor(.gray, for: .normal)
    
    untactButton.backgroundColor = .white
    untactButton.setTitleColor(.gray, for: .normal)
    
    mixmeetButton.backgroundColor = .white
    mixmeetButton.setTitleColor(.gray, for: .normal)
    
    // Set the tapped button to orange background
    sender.backgroundColor = UIColor(hexCode: "#FF5530")
    sender.setTitleColor(.white, for: .normal)
  }
  
  // MARK: - date 선택
  @objc func startDateButtonTapped() {
    // Create a date picker
    startDatePicker.datePickerMode = .date
    startDatePicker.preferredDatePickerStyle = .inline // You can choose the style you prefer
    startDatePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    
    // Create an input view for the date picker
    startDateTextField.inputView = startDatePicker
    
    let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissDatePicker))
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    toolbar.setItems([flexibleSpace, doneButton], animated: false)
    startDateTextField.inputAccessoryView = toolbar
    
    // Add the text field to the view
    view.addSubview(startDateTextField)
    
    // Set up constraints for the text field (adjust as needed)
    startDateTextField.translatesAutoresizingMaskIntoConstraints = false
    startDateTextField.topAnchor.constraint(equalTo: startDateButton.bottomAnchor, constant: -35).isActive = true
    startDateTextField.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 40).isActive = true
    startDateTextField.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: -16).isActive = true
    
    // Show the date picker
    startDateTextField.becomeFirstResponder()
  }
  
  @objc func datePickerValueChanged() {
    // Update the selectedStartDate when the date picker's value changes
    selectedStartDate = startDatePicker.date
    updateStartDateTextField() // Update the text field to display the selected date
  }
  
  @objc func dismissDatePicker() {
    // Dismiss the date picker when the Done button is tapped
    startDateTextField.resignFirstResponder()
  }
  
  func updateStartDateTextField() {
    // Update the text field with the selected date
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy년 MM월 dd일" // You can choose the date format you prefer
    startDateTextField.text = dateFormatter.string(from: selectedStartDate ?? Date())
    // Hide the "선택하기" title of startDateButton
    startDateButton.setTitle("", for: .normal)
  }
  
  @objc func endDateButtonTapped() {
    // Create a date picker
    endDatePicker.datePickerMode = .date
    endDatePicker.preferredDatePickerStyle = .inline // You can choose the style you prefer
    endDatePicker.addTarget(self, action: #selector(endDatePickerValueChanged), for: .valueChanged)
    
    // Create an input view for the date picker
    endDateTextField.inputView = endDatePicker
    
    // Set titleTextField's inputAccessoryView to a toolbar with a done button
    let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissEndDatePicker))
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    toolbar.setItems([flexibleSpace, doneButton], animated: false)
    endDateTextField.inputAccessoryView = toolbar
    
    // Assign the toolbar as the input accessory view for the date picker
    endDateTextField.inputAccessoryView = toolbar
    
    // Add the text field to the view
    view.addSubview(endDateTextField)
    
    // Set up constraints for the text field (adjust as needed)
    endDateTextField.translatesAutoresizingMaskIntoConstraints = false
    endDateTextField.topAnchor.constraint(equalTo: endDateButton.bottomAnchor, constant: -35).isActive = true
    endDateTextField.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 40).isActive = true
    endDateTextField.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: -16).isActive = true
    
    // Show the date picker
    endDateTextField.becomeFirstResponder()
  }
  
  @objc func endDatePickerValueChanged() {
    // Update the selectedEndDate when the date picker's value changes
    selectedEndDate = endDatePicker.date
    updateEndDateTextField() // Update the text field to display the selected date
  }
  
  @objc func dismissEndDatePicker() {
    // Dismiss the date picker when the Done button is tapped
    endDateTextField.resignFirstResponder()
  }
  
  func updateEndDateTextField() {
    // Update the text field with the selected date
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy년 MM월 dd일" // You can choose the date format you prefer
    endDateTextField.text = dateFormatter.string(from: selectedEndDate ?? Date())
    // Hide the "선택하기" title of endDateButton
    endDateButton.setTitle("", for: .normal)
  }
  
  // Function to handle back button tap and navigate back to HomeViewController
  @objc func goBack() {
    
    self.dismiss(animated: true, completion: nil)
  }
  

}
