import UIKit

class CreateStudyViewController: UIViewController {
    
    // 선택한 학과를 저장할 프로퍼티
    var selectedDepartment: String? {
        didSet {
            // selectedDepartment가 설정되면 버튼을 생성
            if let department = selectedDepartment {
                addDepartmentButton(department)
            }
        }
    }
    
    // 선택한 학과에 대한 버튼을 생성하고 departmentButtonStackView에 추가하는 함수
    func addDepartmentButton(_ department: String) {
        // Department 버튼과 삭제 버튼을 수평으로 나열하는 스택 뷰 생성
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 0
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        // 버튼 스택 뷰를 departmentButtonStackView에 추가
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
//        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        // 문자열 길이에 따라 버튼 가로 길이 동적 조절
        let buttonWidth = department.width(withConstrainedHeight: 30, font: departmentButton.titleLabel!.font)
        departmentButton.widthAnchor.constraint(equalToConstant: buttonWidth + 50).isActive = true
        
        buttonStackView.addArrangedSubview(departmentButton)
        buttonStackView.addArrangedSubview(deleteButton)
            
        
    }

    private let completeButton = UIButton()
    let departmentButton = UIButton(type: .system)
    private let categoryStackView = UIStackView()
    private let departmentButtonStackView = UIStackView()
    
    private let allGenderButton = UIButton(type: .system)
    private let maleOnlyButton = UIButton(type: .system)
    private let femaleOnlyButton = UIButton(type: .system)
    
    private let contactButton = UIButton(type: .system)
    private let untactButton = UIButton(type: .system)
    private let mixmeetButton = UIButton(type: .system)
    
    private let haveFineButton = UIButton(type: .system)
    private let noFineButton = UIButton(type: .system)
    
    private let fineButtonsStackView = UIStackView()
    private let finefixStackView = UIStackView()
    
    private let  periodStackView = UIStackView()
    private let startDateButton = UIButton()
    
    private let  periodStackView2 = UIStackView()
    private let endDateButton = UIButton()
    
    private var selectedDepartments: [String] = [] // 선택된 학과를 저장할 배열
    
    private let chatLinkTextField = UITextField()
    private let studyproduceTextField = UITextField()
    private let fineAmountTextField = UITextField()
    private let studymemberTextField = UITextField()
    private let studytitleTextField = UITextField()

    
    // Add these properties to your UIViewController
    let startDatePicker = UIDatePicker()
    let startDateTextField = UITextField()
    var selectedStartDate: Date?
    
    // Add these properties to your UIViewController
    let endDatePicker = UIDatePicker()
    let endDateTextField = UITextField()
    var selectedEndDate: Date?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // Create the top stack view for the header
        let headerStackView = UIStackView()
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 8
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Back button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        // "스터디 만들기" label
        let createStudyLabel = UILabel()
        createStudyLabel.text = "스터디 만들기"
        createStudyLabel.textColor = .white
        createStudyLabel.font = UIFont.boldSystemFont(ofSize: 18)
        createStudyLabel.translatesAutoresizingMaskIntoConstraints = false
        

//        // Spacer view to push saveLabel to the right
//        let spacerView = UIView()
//        spacerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the views to the header stack view
        headerStackView.addArrangedSubview(backButton)
        headerStackView.addArrangedSubview(createStudyLabel)
//        headerStackView.addArrangedSubview(spacerView)
      
        
        // Add the header stack view to the view
        view.addSubview(headerStackView)

        
        let headerContentStackView = UIStackView()
        headerContentStackView.axis = .vertical
        headerContentStackView.spacing = 40
        headerContentStackView.translatesAutoresizingMaskIntoConstraints = false
      
        ///////////////////  chatLink
        let chatLinkStackView = UIStackView()
        chatLinkStackView.axis = .vertical
        chatLinkStackView.spacing = 16
        chatLinkStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(chatLinkStackView)
        
        // Create a label for "채팅방 링크"
        let chatLinkLabel = UILabel()
        chatLinkLabel.text = "채팅방 링크"
        chatLinkLabel.textColor = .black
        chatLinkLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        chatLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for description
        let descriptionLabel = UILabel()
        descriptionLabel.text = "참여코드가 없는 카카오톡 오픈 채팅방 링크로 첨부"
        descriptionLabel.textColor = .gray
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a text field for chat link input
        chatLinkTextField.placeholder = "채팅방 링크를 첨부해 주세요"
        chatLinkTextField.textColor = .gray
        chatLinkTextField.font = UIFont.systemFont(ofSize: 14)
        chatLinkTextField.borderStyle = .roundedRect  // Add rounded border
        chatLinkTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // 키보드 내리기를 위한 탭 제스처 추가
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    
        let chatLinkDividerLine = UIView()
        chatLinkDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        chatLinkDividerLine.translatesAutoresizingMaskIntoConstraints = false
        chatLinkDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        
        // Add UI elements to the headerContentStackView
        chatLinkStackView.addArrangedSubview(chatLinkLabel)
        chatLinkStackView.addArrangedSubview(descriptionLabel)
        chatLinkStackView.addArrangedSubview(chatLinkTextField)
        headerContentStackView.addArrangedSubview(chatLinkDividerLine)
        
        //////////////////////// studyinfo
        let studyinfoStackView = UIStackView()
        studyinfoStackView.axis = .vertical
        studyinfoStackView.spacing = 16
        studyinfoStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(studyinfoStackView)
        
        // Create a label for "스터디 제목"
        let studytitleLabel = UILabel()
        studytitleLabel.text = "스터디 제목"
        studytitleLabel.textColor = .black
        studytitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studytitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a text field for chat link input
        studytitleTextField.placeholder = "제목입니다"
        studytitleTextField.textColor = .gray
        studytitleTextField.font = UIFont.systemFont(ofSize: 14)
        studytitleTextField.borderStyle = .roundedRect  // Add rounded border
        studytitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for "채팅방 링크"
        let studyproduceLabel = UILabel()
        studyproduceLabel.text = "스터디 소개"
        studyproduceLabel.textColor = .black
        studyproduceLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studyproduceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a text field for chat link input
        studyproduceTextField.placeholder = "스터디에 대해 알려주세요"
        studyproduceTextField.textColor = .gray
        studyproduceTextField.font = UIFont.systemFont(ofSize: 14)
        studyproduceTextField.borderStyle = .roundedRect  // Add rounded border
        studyproduceTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Adjust the height constraint of the studyproduceTextField
        studyproduceTextField.heightAnchor.constraint(equalToConstant: 150).isActive = true
        // Set the contentVerticalAlignment to .top
        studyproduceTextField.contentVerticalAlignment = .top
    
        let studyinfoStackViewDividerLine = UIView()
        studyinfoStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        studyinfoStackViewDividerLine.translatesAutoresizingMaskIntoConstraints = false
        studyinfoStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        
        // Add UI elements to the headerContentStackView
        studyinfoStackView.addArrangedSubview(studytitleLabel)
        studyinfoStackView.addArrangedSubview(studytitleTextField)
        studyinfoStackView.addArrangedSubview(studyproduceLabel)
        studyinfoStackView.addArrangedSubview(studyproduceTextField)
        headerContentStackView.addArrangedSubview(studyinfoStackViewDividerLine)
        
        //////////////////////// category
        categoryStackView.axis = .vertical
        categoryStackView.spacing = 16
        categoryStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(categoryStackView)
        
        let associatedepartStackView = UIStackView()
        associatedepartStackView.axis = .horizontal
        associatedepartStackView.spacing = 16
        associatedepartStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        categoryStackView.addArrangedSubview(associatedepartStackView)
        
        // Create a label for " 관련 학과 선택"
        let associatedepartLabel = UILabel()
        associatedepartLabel.text = "관련 학과 선택"
        associatedepartLabel.textColor = .black
        associatedepartLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        associatedepartLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a button with ">" image
        let associatedepartButton = UIButton(type: .system)
        associatedepartButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        associatedepartButton.tintColor = .black
        associatedepartButton.addTarget(self, action: #selector(departmentArrowButtonTapped), for: .touchUpInside)
        associatedepartButton.translatesAutoresizingMaskIntoConstraints = false
        
        associatedepartStackView.addArrangedSubview(associatedepartLabel)
        associatedepartStackView.addArrangedSubview(associatedepartButton)
        

        departmentButtonStackView.axis = .vertical
        departmentButtonStackView.spacing = 16
        departmentButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        categoryStackView.addArrangedSubview(departmentButtonStackView)

        
        let categoryStackViewDividerLine = UIView()
        categoryStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        categoryStackViewDividerLine.translatesAutoresizingMaskIntoConstraints = false
        categoryStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

  

//        categoryStackView.addArrangedSubview(departmentButton)
        headerContentStackView.addArrangedSubview(categoryStackViewDividerLine)
        
        //////////////////////// studymember
        let studymemberStackView = UIStackView()
        studymemberStackView.axis = .vertical
        studymemberStackView.spacing = 16
        studymemberStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(studymemberStackView)
        
        // Create a label for "스터디 팀원"
        let studymemberLabel = UILabel()
        studymemberLabel.text = "스터디 팀원"
        studymemberLabel.textColor = .black
        studymemberLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studymemberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let grayDividerLine = UIView()
        grayDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        grayDividerLine.translatesAutoresizingMaskIntoConstraints = false
        grayDividerLine.heightAnchor.constraint(equalToConstant: 2).isActive = true // Adjust the thickness here

        // Create a label for "인원"
        let studymembercountLabel = UILabel()
        studymembercountLabel.text = "인원"
        studymembercountLabel.textColor = .black
        studymembercountLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studymembercountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for description
        let description4Label = UILabel()
        description4Label.text = "최대 50명 참여 가능"
        description4Label.textColor = UIColor(hexCode: "#A1AAB0")
        description4Label.font = UIFont.systemFont(ofSize: 12)
        description4Label.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a text field for chat link input
        studymemberTextField.placeholder = "인원을 알려주세요"
        studymemberTextField.textColor = .gray
        studymemberTextField.font = UIFont.systemFont(ofSize: 14)
        studymemberTextField.borderStyle = .roundedRect  // Add rounded border
        studymemberTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for
        let countLabel = UILabel()
        countLabel.text = "명"
        countLabel.textColor = UIColor(hexCode: "#68737D")
        countLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        studymemberTextField.addSubview(countLabel)
        
        // Create a label for "성별"
        let genderLabel = UILabel()
        genderLabel.text = "성별"
        genderLabel.textColor = .black
        genderLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a label for description
        let description5Label = UILabel()
        description5Label.text = "참여자의 성별 선택"
        description5Label.textColor = UIColor(hexCode: "#A1AAB0")
        description5Label.font = UIFont.systemFont(ofSize: 12)
        description5Label.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the buttons to a horizontal stack view
        let genderButtonsStackView = UIStackView()
        genderButtonsStackView.axis = .horizontal
        genderButtonsStackView.spacing = 16
        genderButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the three buttons
        allGenderButton.setTitle("남녀무관", for: .normal)
        allGenderButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        allGenderButton.layer.borderWidth = 1
        allGenderButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        allGenderButton.layer.cornerRadius = 5
        allGenderButton.backgroundColor = .white
        allGenderButton.translatesAutoresizingMaskIntoConstraints = false
        allGenderButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)


        maleOnlyButton.setTitle("남자만", for: .normal)
        maleOnlyButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        maleOnlyButton.layer.borderWidth = 1
        maleOnlyButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        maleOnlyButton.layer.cornerRadius = 5
        maleOnlyButton.backgroundColor = .white
        maleOnlyButton.translatesAutoresizingMaskIntoConstraints = false
        maleOnlyButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)

        femaleOnlyButton.setTitle("여자만", for: .normal)
        femaleOnlyButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        femaleOnlyButton.layer.borderWidth = 1
        femaleOnlyButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        femaleOnlyButton.layer.cornerRadius = 5
        femaleOnlyButton.backgroundColor = .white
        femaleOnlyButton.translatesAutoresizingMaskIntoConstraints = false
        femaleOnlyButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
       
        genderButtonsStackView.addArrangedSubview(allGenderButton)
        genderButtonsStackView.addArrangedSubview(maleOnlyButton)
        genderButtonsStackView.addArrangedSubview(femaleOnlyButton)
        

        let studymemberStackViewDividerLine = UIView()
        studymemberStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        studymemberStackViewDividerLine.translatesAutoresizingMaskIntoConstraints = false
        studymemberStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        
        // Add UI elements to the headerContentStackView
        studymemberStackView.addArrangedSubview(studymemberLabel)
        studymemberStackView.addArrangedSubview(grayDividerLine)
        studymemberStackView.addArrangedSubview(studymembercountLabel)
        studymemberStackView.addArrangedSubview(description4Label)
        studymemberStackView.addArrangedSubview(studymemberTextField)
        studymemberStackView.addArrangedSubview(genderLabel)
        studymemberStackView.addArrangedSubview(description5Label)
        studymemberStackView.addArrangedSubview(genderButtonsStackView)
        headerContentStackView.addArrangedSubview(studymemberStackViewDividerLine)
        
        //////////////////////// studymethod
        let studymethodStackView = UIStackView()
        studymethodStackView.axis = .vertical
        studymethodStackView.spacing = 16
        studymethodStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(studymethodStackView)

        // Create a label for "스터디 방식"
        let studymethodLabel = UILabel()
        studymethodLabel.text = "스터디 방식"
        studymethodLabel.textColor = .black
        studymethodLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studymethodLabel.translatesAutoresizingMaskIntoConstraints = false

        let grayDividerLine2 = UIView()
        grayDividerLine2.backgroundColor = UIColor(hexCode: "#F3F5F6")
        grayDividerLine2.translatesAutoresizingMaskIntoConstraints = false
        grayDividerLine2.heightAnchor.constraint(equalToConstant: 2).isActive = true // Adjust the thickness here

        // Create a label for "인원"
        let meetLabel = UILabel()
        meetLabel.text = "대면여부"
        meetLabel.textColor = .black
        meetLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        meetLabel.translatesAutoresizingMaskIntoConstraints = false

        // Create a label for description
        let description6Label = UILabel()
        description6Label.text = "혼합일 경우, 관련 내용에 대한 계획을 소개에 적어주세요"
        description6Label.textColor = UIColor(hexCode: "#A1AAB0")
        description6Label.font = UIFont.systemFont(ofSize: 12)
        description6Label.translatesAutoresizingMaskIntoConstraints = false

        // Add the buttons to a horizontal stack view
        let meetButtonsStackView = UIStackView()
        meetButtonsStackView.axis = .horizontal
        meetButtonsStackView.spacing = 16
        meetButtonsStackView.translatesAutoresizingMaskIntoConstraints = false

        // Create the three buttons
        contactButton.setTitle("대면", for: .normal)
        contactButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        contactButton.layer.borderWidth = 1
        contactButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        contactButton.layer.cornerRadius = 5
        contactButton.backgroundColor = .white
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.addTarget(self, action: #selector(meetButtonTapped(_:)), for: .touchUpInside)

        untactButton.setTitle("비대면", for: .normal)
        untactButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        untactButton.layer.borderWidth = 1
        untactButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        untactButton.layer.cornerRadius = 5
        untactButton.backgroundColor = .white
        untactButton.translatesAutoresizingMaskIntoConstraints = false
        untactButton.addTarget(self, action: #selector(meetButtonTapped(_:)), for: .touchUpInside)


        mixmeetButton.setTitle("혼합", for: .normal)
        mixmeetButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
        mixmeetButton.layer.borderWidth = 1
        mixmeetButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
        mixmeetButton.layer.cornerRadius = 5
        mixmeetButton.backgroundColor = .white
        mixmeetButton.translatesAutoresizingMaskIntoConstraints = false
        mixmeetButton.addTarget(self, action: #selector(meetButtonTapped(_:)), for: .touchUpInside)


        meetButtonsStackView.addArrangedSubview(contactButton)
        meetButtonsStackView.addArrangedSubview(untactButton)
        meetButtonsStackView.addArrangedSubview(mixmeetButton)

        // Create a label for "벌금"
        let fineLabel = UILabel()
        fineLabel.text = "벌금"
        fineLabel.textColor = .black
        fineLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fineLabel.translatesAutoresizingMaskIntoConstraints = false
    
        finefixStackView.axis = .vertical
        finefixStackView.spacing = 10
        finefixStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add check buttons and labels to a horizontal stack view

        fineButtonsStackView.axis = .horizontal
        fineButtonsStackView.spacing = 10
        fineButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
    
        
        // Create check buttons
        
        haveFineButton.setImage(UIImage(named: "circle"), for: .normal) // Replace with your unchecked image
        haveFineButton.setImage(UIImage(named: "checkmark.circle."), for: .selected) // Replace with your checked image
        haveFineButton.tintColor = UIColor(hexCode: "#FF5530")
        haveFineButton.translatesAutoresizingMaskIntoConstraints = false
        haveFineButton.addTarget(self, action: #selector(haveFineButtonTapped(_:)), for: .touchUpInside)

      
        noFineButton.setImage(UIImage(named: "circle"), for: .normal) // Replace with your unchecked image
        noFineButton.setImage(UIImage(named: "checkmark.circle"), for: .selected) // Replace with your checked image
        noFineButton.tintColor = UIColor(hexCode: "#FF5530")
        noFineButton.translatesAutoresizingMaskIntoConstraints = false
        noFineButton.addTarget(self, action: #selector(noFineButtonTapped(_:)), for: .touchUpInside)

        // Create labels for check buttons
        let haveFineLabel = UILabel()
        haveFineLabel.text = "있어요"
        haveFineLabel.textColor = .black
        haveFineLabel.translatesAutoresizingMaskIntoConstraints = false

        let noFineLabel = UILabel()
        noFineLabel.text = "없어요"
        noFineLabel.textColor = .black
        noFineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        fineButtonsStackView.addArrangedSubview(haveFineButton)
        fineButtonsStackView.addArrangedSubview(haveFineLabel)
        fineButtonsStackView.addArrangedSubview(noFineButton)
        fineButtonsStackView.addArrangedSubview(noFineLabel)
        

        
        let studymethodStackViewDividerLine = UIView()
        studymethodStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        studymethodStackViewDividerLine.translatesAutoresizingMaskIntoConstraints = false
        studymethodStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here


        // Add UI elements to the headerContentStackView
        studymethodStackView.addArrangedSubview(studymethodLabel)
        studymethodStackView.addArrangedSubview(grayDividerLine2)
        studymethodStackView.addArrangedSubview(meetLabel)
        studymethodStackView.addArrangedSubview(description6Label)
        studymethodStackView.addArrangedSubview(meetButtonsStackView)
        studymethodStackView.addArrangedSubview(fineLabel)
        studymethodStackView.addArrangedSubview(fineButtonsStackView)
        studymethodStackView.addArrangedSubview(finefixStackView)
        headerContentStackView.addArrangedSubview(studymethodStackViewDividerLine)
        
        //////////////////////// period
         periodStackView.axis = .vertical
         periodStackView.spacing = 16
         periodStackView.translatesAutoresizingMaskIntoConstraints = false
         // Add the buttons stack view to the header content stack view
         headerContentStackView.addArrangedSubview(periodStackView)
         
         // Create a label for "기간"
         let periodLabel = UILabel()
         periodLabel.text = "기간"
         periodLabel.textColor = .black
         periodLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
         periodLabel.translatesAutoresizingMaskIntoConstraints = false
         
         let grayDividerLine3 = UIView()
         grayDividerLine3.backgroundColor = UIColor(hexCode: "#F3F5F6")
         grayDividerLine3.translatesAutoresizingMaskIntoConstraints = false
         grayDividerLine3.heightAnchor.constraint(equalToConstant: 2).isActive = true // Adjust the thickness here

         // Create a label for "시작하는 날"
         let startLabel = UILabel()
         startLabel.text = "시작하는 날"
         startLabel.textColor = .black
         startLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
         startLabel.translatesAutoresizingMaskIntoConstraints = false
         
         // Create a button for "시작일 선택하기"
         startDateButton.setTitle("선택하기", for: .normal)
         startDateButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
         startDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
         startDateButton.backgroundColor = .white
         startDateButton.layer.borderWidth = 1
         startDateButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
         startDateButton.layer.cornerRadius = 2
         startDateButton.translatesAutoresizingMaskIntoConstraints = false
         startDateButton.addTarget(self, action: #selector(startDateButtonTapped), for: .touchUpInside)
         
      
         
         // Create a label for "성별"
         let endLabel = UILabel()
         endLabel.text = "종료하는 날"
         endLabel.textColor = .black
         endLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
         endLabel.translatesAutoresizingMaskIntoConstraints = false
         
         // Create a button for "종료일 선택하기"
         endDateButton.setTitle("선택하기", for: .normal)
         endDateButton.setTitleColor(UIColor(hexCode: "#A1AAB0"), for: .normal)
         endDateButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
         endDateButton.backgroundColor = .white
         endDateButton.layer.borderWidth = 1
         endDateButton.layer.borderColor = UIColor(hexCode: "#D8DCDE").cgColor
         endDateButton.layer.cornerRadius = 2
         endDateButton.translatesAutoresizingMaskIntoConstraints = false
         endDateButton.addTarget(self, action: #selector(endDateButtonTapped), for: .touchUpInside)
         
         // Create a button for "완료하기"
         completeButton.setTitle("완료하기", for: .normal)
         completeButton.setTitleColor(.white, for: .normal)
         completeButton.backgroundColor = UIColor(hexCode: "#FF5530")
         completeButton.layer.cornerRadius = 5
         completeButton.translatesAutoresizingMaskIntoConstraints = false
         completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
     
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
         let scrollView = UIScrollView()
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         scrollView.addSubview(headerContentStackView)
         view.addSubview(scrollView)
         
         // Set up constraints
         NSLayoutConstraint.activate([
             // Header stack view constraints
             headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -60),
             headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                     
             // "스터디 만들기" label constraints
             createStudyLabel.centerXAnchor.constraint(equalTo: headerStackView.centerXAnchor, constant: 100),
                       
 //            // Spacer view constraints
 //            spacerView.widthAnchor.constraint(equalTo: headerStackView.widthAnchor, multiplier: 0.15),
                      

 //            // "임시저장" label constraints
 //            saveLabel.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor),
                        
              
             // Header content stack view constraints
             headerContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
             headerContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             headerContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
             headerContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
             
             //(1)채팅방링크 뷰
             // Constraints for chatLinkLabel
             chatLinkLabel.leadingAnchor.constraint(equalTo: chatLinkStackView.leadingAnchor, constant: 16),
             chatLinkLabel.trailingAnchor.constraint(equalTo: chatLinkStackView.trailingAnchor, constant: 10),
             
             // Constraints for descriptionLabel
             descriptionLabel.leadingAnchor.constraint(equalTo: chatLinkStackView.leadingAnchor, constant: 16),
             descriptionLabel.trailingAnchor.constraint(equalTo: chatLinkStackView.trailingAnchor, constant: 100),
             
             // Constraints for chatLinkTextField
             chatLinkTextField.leadingAnchor.constraint(equalTo: chatLinkStackView.leadingAnchor, constant: 16),
             chatLinkTextField.trailingAnchor.constraint(equalTo: chatLinkStackView.trailingAnchor),
             chatLinkTextField.widthAnchor.constraint(equalTo: chatLinkStackView.widthAnchor, constant: -50),
             
             //(2)스터디소개 뷰
             // Constraints for chatLinkLabel
             studytitleLabel.leadingAnchor.constraint(equalTo: studyinfoStackView.leadingAnchor, constant: 16),
             studytitleLabel.trailingAnchor.constraint(equalTo: studyinfoStackView.trailingAnchor, constant: 5),
             
             // Constraints for descriptionLabel
             studytitleTextField.leadingAnchor.constraint(equalTo: studyinfoStackView.leadingAnchor, constant: 16),
             studytitleTextField.trailingAnchor.constraint(equalTo: studyinfoStackView.trailingAnchor, constant: 100),
             
             // Constraints for chatLinkLabel
             studyproduceLabel.leadingAnchor.constraint(equalTo: studyinfoStackView.leadingAnchor, constant: 16),
             studyproduceLabel.trailingAnchor.constraint(equalTo: studyinfoStackView.trailingAnchor, constant: 10),
     
             
             // Constraints for chatLinkTextField
             studyproduceTextField.leadingAnchor.constraint(equalTo: studyinfoStackView.leadingAnchor, constant: 16),
             studyproduceTextField.trailingAnchor.constraint(equalTo: studyinfoStackView.trailingAnchor),
             studyproduceTextField.widthAnchor.constraint(equalTo: studyinfoStackView.widthAnchor, constant: -50),
             
             //(3)카테고리 뷰
         
             associatedepartStackView.leadingAnchor.constraint(equalTo: categoryStackView.leadingAnchor, constant: 16),
             associatedepartStackView.trailingAnchor.constraint(equalTo: categoryStackView.trailingAnchor),
             
             associatedepartButton.leadingAnchor.constraint(equalTo: associatedepartStackView.leadingAnchor, constant: 300),
             associatedepartButton.trailingAnchor.constraint(equalTo: associatedepartStackView.trailingAnchor),
             
     
             
             //(4)스터디멤버 뷰
             // Constraints for chatLinkLabel
             studymemberLabel.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
             studymemberLabel.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 5),
             
             // Constraints for chatLinkLabel
             grayDividerLine.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 0),
             grayDividerLine.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 10),
             
             studymembercountLabel.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
             studymembercountLabel.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 5),
         
             
             // Constraints for descriptionLabel
             description4Label.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
             description4Label.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 100),
             
             // Constraints for chatLinkTextField
             studymemberTextField.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
             studymemberTextField.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor),
             studymemberTextField.widthAnchor.constraint(equalTo: studymemberStackView.widthAnchor, constant: -50),
             
             countLabel.centerYAnchor.constraint(equalTo: studymemberTextField.centerYAnchor),
             countLabel.trailingAnchor.constraint(equalTo: studymemberTextField.trailingAnchor, constant: -8),
             countLabel.widthAnchor.constraint(equalToConstant: 20),
             countLabel.heightAnchor.constraint(equalToConstant: 20),
             
             // Constraints for chatLinkLabel
             genderLabel.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
             genderLabel.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 10),
             
             
             description5Label.leadingAnchor.constraint(equalTo: studymemberStackView.leadingAnchor, constant: 16),
             description5Label.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: 10),
     
             genderButtonsStackView.trailingAnchor.constraint(equalTo: studymemberStackView.trailingAnchor, constant: -16),
             genderButtonsStackView.topAnchor.constraint(equalTo: description5Label.bottomAnchor, constant: 8),
             genderButtonsStackView.heightAnchor.constraint(equalToConstant: 30),

             allGenderButton.widthAnchor.constraint(equalToConstant: 100),
             maleOnlyButton.widthAnchor.constraint(equalToConstant: 80),
             femaleOnlyButton.widthAnchor.constraint(equalToConstant: 80),
             
             //(5)스터디방식 뷰
             // Constraints for chatLinkLabel
             studymethodLabel.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
             studymethodLabel.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 5),


             meetLabel.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
             meetLabel.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 5),


             // Constraints for descriptionLabel
             description6Label.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
             description6Label.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 100),

             meetButtonsStackView.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: -16),
 //            meetButtonsStackView.topAnchor.constraint(equalTo: studymethodStackView.bottomAnchor, constant: 8),
 //            meetButtonsStackView.heightAnchor.constraint(equalToConstant: 30),

             contactButton.widthAnchor.constraint(equalToConstant: 80),
             untactButton.widthAnchor.constraint(equalToConstant: 100),
             mixmeetButton.widthAnchor.constraint(equalToConstant: 80),
             
             fineLabel.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
             fineLabel.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 100),
             
             fineButtonsStackView.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
             fineButtonsStackView.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 50),
             
 //            finefixStackView.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 16),
 //            finefixStackView.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 50),


             // Constraints for chatLinkLabel
             grayDividerLine2.leadingAnchor.constraint(equalTo: studymethodStackView.leadingAnchor, constant: 0),
             grayDividerLine2.trailingAnchor.constraint(equalTo: studymethodStackView.trailingAnchor, constant: 10),
             
             //(6)스터디기간 뷰
             // Constraints for chatLinkLabel
             periodLabel.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 16),
             periodLabel.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: 5),
             
             // Constraints for chatLinkLabel
             grayDividerLine3.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 0),
             grayDividerLine3.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: 10),
             
             // Constraints for chatLinkLabel
             startLabel.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 16),
             startLabel.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: 10),
             
             startDateButton.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 16),
             startDateButton.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: -16),
             startDateButton.heightAnchor.constraint(equalToConstant: 50),
             
             // Constraints for chatLinkLabel
             endLabel.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 16),
             endLabel.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: 10),
         

             endDateButton.leadingAnchor.constraint(equalTo: periodStackView.leadingAnchor, constant: 16),
             endDateButton.trailingAnchor.constraint(equalTo: periodStackView.trailingAnchor, constant: -16),
             endDateButton.heightAnchor.constraint(equalToConstant: 50),
         
 //            completeButton.topAnchor.constraint(equalTo: periodStackView.bottomAnchor, constant: 8),
             // Add spacing between endDateButton and completeButton
             endDateButton.bottomAnchor.constraint(equalTo: completeButton.topAnchor, constant: -40), // You can adjust the spacing as needed


             
             // Scroll view constraints
             scrollView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
             scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
         ])
         
         // Set the background color of the scrollView to black
         scrollView.backgroundColor = .white
         
         
         // Set the scroll view's content size to fit the content
         headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
     }
    
    
    // 키보드 내리기 위한 탭 제스처 핸들러
    @objc func handleTap() {
        // 키보드를 내립니다.
        view.endEditing(true)
    }

     @objc func haveFineButtonTapped(_ sender: UIButton) {
         sender.isSelected = !sender.isSelected
         noFineButton.isSelected = !sender.isSelected

         if sender.isSelected {
             // Create a label for "어떤 벌금인가요?"
             let fineTypeLabel = UILabel()
             fineTypeLabel.text = "어떤 벌금인가요?"
             fineTypeLabel.textColor = UIColor(hexCode: "#49545C")
             fineTypeLabel.font = UIFont.systemFont(ofSize: 14)
             fineTypeLabel.translatesAutoresizingMaskIntoConstraints = false

             // Create a text field for chat link input
             let fineTypesTextField = UITextField()
             fineTypesTextField.placeholder = "지각비, 결석비"
             fineTypesTextField.textColor = UIColor(hexCode: "#A1AAB0")
             fineTypesTextField.font = UIFont.systemFont(ofSize: 14)
             fineTypesTextField.borderStyle = .roundedRect  // Add rounded border
             fineTypesTextField.translatesAutoresizingMaskIntoConstraints = false
             
             // Create a text field for "얼마인가요?"
             let fineAmountLabel = UILabel()
             fineAmountLabel.text = "얼마인가요?"
             fineAmountLabel.textColor = UIColor(hexCode: "#49545C")
             fineAmountLabel.font = UIFont.systemFont(ofSize: 14)
             fineAmountLabel.translatesAutoresizingMaskIntoConstraints = false
             
             // Create a text field for chat link input
             fineAmountTextField.placeholder = "가격을 알려주세요"
             fineAmountTextField.textColor = UIColor(hexCode: "#A1AAB0")
             fineAmountTextField.font = UIFont.systemFont(ofSize: 14)
             fineAmountTextField.borderStyle = .roundedRect  // Add rounded border
             fineAmountTextField.translatesAutoresizingMaskIntoConstraints = false
             
             // Create a label for
             let countLabel2 = UILabel()
             countLabel2.text = "원"
             countLabel2.textColor = UIColor(hexCode: "#68737D")
             countLabel2.font = UIFont.systemFont(ofSize: 15, weight: .bold)
             countLabel2.translatesAutoresizingMaskIntoConstraints = false
             fineAmountTextField.addSubview(countLabel2)
             
             // Add the labels and text fields to the fineButtonsStackView
             finefixStackView.addArrangedSubview(fineTypeLabel)
             finefixStackView.addArrangedSubview(fineTypesTextField)
             finefixStackView.addArrangedSubview(fineAmountLabel)
             finefixStackView.addArrangedSubview(fineAmountTextField)
             
             // Set up constraints
             NSLayoutConstraint.activate([
                 // Constraints for chatLinkTextField
                 fineTypesTextField.leadingAnchor.constraint(equalTo: fineButtonsStackView.leadingAnchor, constant: 0),
                 fineTypesTextField.trailingAnchor.constraint(equalTo: fineButtonsStackView.trailingAnchor),
                 fineTypesTextField.widthAnchor.constraint(equalTo: fineButtonsStackView.widthAnchor, constant: -30),
                 
                 fineAmountTextField.leadingAnchor.constraint(equalTo: fineButtonsStackView.leadingAnchor, constant: 0),
                 fineAmountTextField.trailingAnchor.constraint(equalTo: fineButtonsStackView.trailingAnchor),
                 fineAmountTextField.widthAnchor.constraint(equalTo: fineButtonsStackView.widthAnchor, constant: -30),
                 
                 countLabel2.centerYAnchor.constraint(equalTo: fineAmountTextField.centerYAnchor),
                 countLabel2.trailingAnchor.constraint(equalTo: fineAmountTextField.trailingAnchor, constant: -8),
                 countLabel2.widthAnchor.constraint(equalToConstant: 20),
                 countLabel2.heightAnchor.constraint(equalToConstant: 20),
             ])
                 
         } else {
             // Remove the labels and text fields from the fineButtonsStackView
             fineButtonsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
         }
         
         
     }

//    @objc func completeButtonTapped() {
//        self.dismiss(animated: true, completion: nil)
//    }
//
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
     
     @objc func startDateButtonTapped() {
         // Create a date picker
         startDatePicker.datePickerMode = .date
         startDatePicker.preferredDatePickerStyle = .inline // You can choose the style you prefer
         startDatePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)

         // Create an input view for the date picker
         startDateTextField.inputView = startDatePicker


         // Set titleTextField's inputAccessoryView to a toolbar with a done button
         let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
                 let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissDatePicker))
                 let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                 toolbar.setItems([flexibleSpace, doneButton], animated: false)
         startDateTextField.inputAccessoryView = toolbar

         // Assign the toolbar as the input accessory view for the date picker
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
         
         //         let studyViewController = StudyViewController()
         //         let navController = UINavigationController(rootViewController: studyViewController)
         //         navController.modalPresentationStyle = .fullScreen
         //
         //         _ = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButtonTapped))
         //
         //
         //         self.present(navController, animated: true, completion: nil) // Present the navigation controller modally
         //
         //
         //     }
         //     @objc func backButtonTapped() {
         //         self.dismiss(animated: true, completion: nil)
         //     }
         
         self.dismiss(animated: true, completion: nil)
     }
    

     
 }
// 문자열의 너비를 계산하는 확장 함수
extension String {
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}
