import UIKit

class myPageViewController: UIViewController {
    
    private let recentButton = UIButton(type: .system)
    private let popularButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // Create the top stack view for the header
        let headerStackView = UIStackView()
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.spacing = 8
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Label for the "STUDY HUB" text
        let studyHubLabel = UILabel()
        studyHubLabel.text = "마이페이지"
        studyHubLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        studyHubLabel.textColor = .white
        studyHubLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the studyHubLabel to the header stack view
        headerStackView.addArrangedSubview(studyHubLabel)
        
        
        // Bell button
        let bellButton = UIButton(type: .system)
        bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
        bellButton.tintColor = .white
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Spacer view to push the bookmarkButton and bellButton to the right
        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        headerStackView.addArrangedSubview(spacerView)
        
        // Add the bookmarkButton and bellButton to the header stack view
        headerStackView.addArrangedSubview(bellButton)
        
        // Add the header stack view to the view
        view.addSubview(headerStackView)
        
        let headerContentStackView = UIStackView()
        headerContentStackView.axis = .vertical
        headerContentStackView.spacing = 16
        headerContentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a stack view for login and registration options
        let loginOrStackView = UIStackView()
        loginOrStackView.axis = .vertical
        loginOrStackView.spacing = 8
        loginOrStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add "나의 스터디 팀원을 만나보세요" label
        let grayTextLabel = UILabel()
        grayTextLabel.text = "나의 스터디 팀원을 만나보세요"
        grayTextLabel.textColor = .gray
        grayTextLabel.font = UIFont.systemFont(ofSize: 16)
        grayTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add "로그인/회원가입" label
        let blackTextLabel = UILabel()
        blackTextLabel.text = "로그인 / 회원가입"
        blackTextLabel.textColor = .black
        blackTextLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        blackTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the labels to the loginOrStackView
        loginOrStackView.addArrangedSubview(grayTextLabel)
        loginOrStackView.addArrangedSubview(blackTextLabel)
        
        // Add the loginOrStackView to the headerContentStackView
        headerContentStackView.addArrangedSubview(loginOrStackView)
        
        // Create a stack view for login and registration options
        let gotologinStackView = UIStackView()
        gotologinStackView.axis = .horizontal
        gotologinStackView.spacing = 8
        gotologinStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a chevron button
        let chevronButton = UIButton(type: .system)
        chevronButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        chevronButton.tintColor = .black
        chevronButton.addTarget(self, action: #selector(chevronButtonTapped), for: .touchUpInside)
        chevronButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the loginOrStackView to the headerContentStackView
        gotologinStackView.addArrangedSubview(loginOrStackView)
        gotologinStackView.addArrangedSubview(chevronButton)
        
        // Add the loginOrStackView to the headerContentStackView
        headerContentStackView.addArrangedSubview(gotologinStackView)
        
        // Create a stack view for login and registration options
        let buttonboxesStackView = UIStackView()
        buttonboxesStackView.axis = .horizontal
        buttonboxesStackView.spacing = 8
        buttonboxesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create a button for "작성한 글"
        let writtenButton = UIButton()
        writtenButton.backgroundColor = UIColor(hexCode: "#F8F9F9")
        writtenButton.layer.cornerRadius = 5
        writtenButton.translatesAutoresizingMaskIntoConstraints = false
        writtenButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
        writtenButton.heightAnchor.constraint(equalToConstant: 87).isActive = true
        
        // Add a label for the "작성한 글" text
        let writtenLabel = UILabel()
        writtenLabel.text = "작성한 글"
        writtenLabel.textColor = .gray
        writtenLabel.font = UIFont.systemFont(ofSize: 14)
        writtenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add a label for the "0" text
        let writtenCountLabel = UILabel()
        writtenCountLabel.text = "0"
        writtenCountLabel.textColor = .black
        writtenCountLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        writtenCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the labels to the button
        writtenButton.addSubview(writtenLabel)
        writtenButton.addSubview(writtenCountLabel)
        
        // Create a button for "참여한 스터디"
        let joinstudyButton = UIButton()
        joinstudyButton.backgroundColor = UIColor(hexCode: "#F8F9F9")
        joinstudyButton.layer.cornerRadius = 5
        joinstudyButton.translatesAutoresizingMaskIntoConstraints = false
        joinstudyButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
        joinstudyButton.heightAnchor.constraint(equalToConstant: 87).isActive = true
        
        // Add a label for the "참여한 스터디" text
        let joinstudyLabel = UILabel()
        joinstudyLabel.text = "참여한 스터디"
        joinstudyLabel.textColor = .gray
        joinstudyLabel.font = UIFont.systemFont(ofSize: 14)
        joinstudyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add a label for the "0" text
        let joinstudyCountLabel = UILabel()
        joinstudyCountLabel.text = "0"
        joinstudyCountLabel.textColor = .black
        joinstudyCountLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        joinstudyCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the labels to the button
        joinstudyButton.addSubview(joinstudyLabel)
        joinstudyButton.addSubview(joinstudyCountLabel)
        
        // Create a button for "북마크"
        let bookmarkButton = UIButton()
        bookmarkButton.backgroundColor = UIColor(hexCode: "#F8F9F9")
        bookmarkButton.layer.cornerRadius = 5
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
        bookmarkButton.heightAnchor.constraint(equalToConstant: 87).isActive = true
        bookmarkButton.addTarget(self, action: #selector(bookmarkpageButtonTapped), for: .touchUpInside)
        
        
        // Add a label for the "0" text
        let bookmarkCountLabel = UILabel()
        bookmarkCountLabel.text = "0"
        bookmarkCountLabel.textColor = .black
        bookmarkCountLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        bookmarkCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add a label for the "북마크" text
        let bookmarkLabel = UILabel()
        bookmarkLabel.text = "북마크"
        bookmarkLabel.textColor = .gray
        bookmarkLabel.font = UIFont.systemFont(ofSize: 14)
        bookmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Add the labels to the button
        bookmarkButton.addSubview(bookmarkCountLabel)
        bookmarkButton.addSubview(bookmarkLabel)
      
        
        
        // Add the buttons to the buttonboxesStackView
        buttonboxesStackView.addArrangedSubview(writtenButton)
        buttonboxesStackView.addArrangedSubview(joinstudyButton)
        buttonboxesStackView.addArrangedSubview(bookmarkButton)
        
        // Add the buttonboxesStackView to the headerContentStackView
        headerContentStackView.addArrangedSubview(buttonboxesStackView)
        
        let boxesDividerLine = UIView()
        boxesDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        boxesDividerLine.translatesAutoresizingMaskIntoConstraints = false
        boxesDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        headerContentStackView.addArrangedSubview(boxesDividerLine)
        
        // Create a stack view for the buttons (e.g., "공지사항", "문의하기", etc.)
        let normalButtonStackView = UIStackView()
        normalButtonStackView.axis = .vertical
        normalButtonStackView.spacing = 16
        normalButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        normalButtonStackView.alignment = .leading // 정렬을 왼쪽(leading)으로 설정

        // Create the "공지사항" button
        let informButton = UIButton(type: .system)
        informButton.setTitle("공지사항", for: .normal)
        informButton.setTitleColor(UIColor(hexCode: "#49545C"), for: .normal)
        informButton.translatesAutoresizingMaskIntoConstraints = false

        // Create the "문의하기" button
        let askButton = UIButton(type: .system)
        askButton.setTitle("문의하기", for: .normal)
        askButton.setTitleColor(UIColor(hexCode: "#49545C"), for: .normal)
        askButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the "이용방법" button
        let howtouseButton = UIButton(type: .system)
        howtouseButton.setTitle("이용방법", for: .normal)
        howtouseButton.setTitleColor(UIColor(hexCode: "#49545C"), for: .normal)
        howtouseButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the "서비스 이용약관" button
        let serviceButton = UIButton(type: .system)
        serviceButton.setTitle("서비스 이용약관", for: .normal)
        serviceButton.setTitleColor(UIColor(hexCode: "#49545C"), for: .normal)
        serviceButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the "개인 정보 처리 방침" button
        let informhandleButton = UIButton(type: .system)
        informhandleButton.setTitle("개인정보 처리 방침", for: .normal)
        informhandleButton.setTitleColor(UIColor(hexCode: "#49545C"), for: .normal)
        informhandleButton.translatesAutoresizingMaskIntoConstraints = false
        
       
        
        // Add the recentButton, verticalGrayLine, and popularButton to the sortingButtonsStackView
        normalButtonStackView.addArrangedSubview(informButton)
        normalButtonStackView.addArrangedSubview(serviceButton)
        normalButtonStackView.addArrangedSubview(howtouseButton)
        normalButtonStackView.addArrangedSubview(askButton)
        normalButtonStackView.addArrangedSubview(informhandleButton)

        // Add the buttonboxesStackView to the headerContentStackView
        headerContentStackView.addArrangedSubview(normalButtonStackView)
     
        
        
  
        // Create a scroll view to make the content scrollable
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(headerContentStackView)
        view.addSubview(scrollView)
     
        // Set up constraints
        NSLayoutConstraint.activate([
            // Header stack view constraints
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Header content stack view constraints
            headerContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            headerContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        
            
            grayTextLabel.topAnchor.constraint(equalTo: loginOrStackView.topAnchor, constant: 16),
            grayTextLabel.leadingAnchor.constraint(equalTo: loginOrStackView.leadingAnchor, constant: 16),
            grayTextLabel.trailingAnchor.constraint(equalTo: loginOrStackView.trailingAnchor, constant: 10),
            
            chevronButton.topAnchor.constraint(equalTo: loginOrStackView.topAnchor, constant: 50),
            chevronButton.trailingAnchor.constraint(equalTo: loginOrStackView.trailingAnchor, constant: 60),

          
            writtenCountLabel.centerXAnchor.constraint(equalTo: writtenButton.centerXAnchor),
            writtenCountLabel.topAnchor.constraint(equalTo: writtenButton.topAnchor, constant: 20),
            
            writtenLabel.centerXAnchor.constraint(equalTo: writtenButton.centerXAnchor),
            writtenLabel.topAnchor.constraint(equalTo: writtenCountLabel.bottomAnchor, constant: 4),
  
            joinstudyCountLabel.centerXAnchor.constraint(equalTo: joinstudyButton.centerXAnchor),
            joinstudyCountLabel.topAnchor.constraint(equalTo: joinstudyButton.topAnchor, constant: 20),
            
            joinstudyLabel.centerXAnchor.constraint(equalTo: joinstudyButton.centerXAnchor),
            joinstudyLabel.topAnchor.constraint(equalTo: joinstudyCountLabel.bottomAnchor, constant: 4),
  
            bookmarkCountLabel.centerXAnchor.constraint(equalTo: bookmarkButton.centerXAnchor),
            bookmarkCountLabel.topAnchor.constraint(equalTo: bookmarkButton.topAnchor, constant: 20),
            
            bookmarkLabel.centerXAnchor.constraint(equalTo: bookmarkButton.centerXAnchor),
            bookmarkLabel.topAnchor.constraint(equalTo: bookmarkCountLabel.bottomAnchor, constant: 4),
            
//            buttonboxesStackView.topAnchor.constraint(equalTo: headerContentStackView.bottomAnchor, constant: 8),
            buttonboxesStackView.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor, constant: 10),
            buttonboxesStackView.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor, constant: -20),
  
//            informButton.leadingAnchor.constraint(equalTo: normalButtonStackView.leadingAnchor, constant: -280),
//            informButton.trailingAnchor.constraint(equalTo: normalButtonStackView.trailingAnchor, constant: -10),
            
            boxesDividerLine.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor),
            boxesDividerLine.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor),
            
            normalButtonStackView.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor, constant: 20),
   
            
            // Scroll view constraints
            scrollView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
    
        ])
        
        
        
        // Set the background color of the scrollView to white
        scrollView.backgroundColor = .white
        
        // Set the scroll view's content size to fit the content
        headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    
        
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
        let viewController = ViewController()
        
        // If you want to present it modally, you can use the following code
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        // Present the ViewController modally
        present(navigationController, animated: true, completion: nil)
    }
    
  }
