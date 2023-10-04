import UIKit

class SearchViewController:UIViewController{

  
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

        
        // Add the backButton and studyLabel to the header stack view
        headerStackView.addArrangedSubview(backButton)
        
        //  bookmarkButton
        let bookmarkButton = UIButton(type: .system)
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmarkButton.tintColor = .white
        bookmarkButton.addTarget(self, action: #selector(bookmarkpageButtonTapped), for: .touchUpInside)
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        
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
        headerStackView.addArrangedSubview(bookmarkButton)
        headerStackView.addArrangedSubview(bellButton)
        
        // Add the header stack view to the view
        view.addSubview(headerStackView)

        
        let headerContentStackView = UIStackView()
        headerContentStackView.axis = .vertical
        headerContentStackView.spacing = 16
        headerContentStackView.translatesAutoresizingMaskIntoConstraints = false
      
        
        
        // Search Bar
        let searchBar = UISearchBar()
        searchBar.placeholder = "관심있는 스터디를 검색해 보세요"
        searchBar.backgroundImage = UIImage() // Remove background image
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        // Add the search icon button to the search bar
        headerContentStackView.addArrangedSubview(searchBar)
        
        
        
        //최근검색어
        let recentallStackView = UIStackView()
        recentallStackView.axis = .vertical
        recentallStackView.spacing = 16
        recentallStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(recentallStackView)
        
        let recentaskStackView = UIStackView()
        recentaskStackView.axis = .horizontal
        recentaskStackView.spacing = 16
        recentaskStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        recentallStackView.addArrangedSubview(recentaskStackView)
        
        // Create a label for "최근 검색어"
        let recentaskLabel = UILabel()
        recentaskLabel.text = "최근 검색어"
        recentaskLabel.textColor = .black
        recentaskLabel.font = UIFont.systemFont(ofSize: 15)
        recentaskLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //삭제 버튼
        let deleteButton = UIButton(type: .system)
        deleteButton.setTitle("삭제", for: .normal)
        deleteButton.setTitleColor(UIColor(hexCode: "#636363"), for: .normal)
        deleteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        //        associatedepartButton.addTarget(self, action: #selector(departmentArrowButtonTapped), for: .touchUpInside)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false

        recentaskStackView.addArrangedSubview(recentaskLabel)
        recentaskStackView.addArrangedSubview(deleteButton)
        
        // Create a label for "최근 검색어가 없습니다"
        let norecentaskLabel = UILabel()
        norecentaskLabel.text = "최근 검색어가 없습니다"
        norecentaskLabel.textColor = UIColor(hexCode: "#C2C8CC")
        norecentaskLabel.font = UIFont.systemFont(ofSize: 15)
        norecentaskLabel.translatesAutoresizingMaskIntoConstraints = false
        
    
        let recentallStackViewDividerLine = UIView()
        recentallStackViewDividerLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        recentallStackViewDividerLine.translatesAutoresizingMaskIntoConstraints = false
        recentallStackViewDividerLine.heightAnchor.constraint(equalToConstant: 10).isActive = true // Adjust the thickness here

        

        recentallStackView.addArrangedSubview(recentaskStackView)
        recentallStackView.addArrangedSubview(norecentaskLabel)
        headerContentStackView.addArrangedSubview(recentallStackViewDividerLine)
        
        //추천 검색어
        let recommendStackView = UIStackView()
        recommendStackView.axis = .horizontal
        recommendStackView.spacing = 16
        recommendStackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the buttons stack view to the header content stack view
        headerContentStackView.addArrangedSubview(recommendStackView)
        
        // Create a label for "최근 검색어"
        let recommendLabel = UILabel()
        recommendLabel.text = "추천 검색어"
        recommendLabel.textColor = .black
        recommendLabel.font = UIFont.systemFont(ofSize: 15)
        recommendLabel.translatesAutoresizingMaskIntoConstraints = false
        
        recommendStackView.addArrangedSubview(recommendLabel)
        
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
            
            // Search bar constraints
            searchBar.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
   
            
//            searchIconButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
//            searchIconButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -8),
//            searchIconButton.widthAnchor.constraint(equalToConstant: 20),
//            searchIconButton.heightAnchor.constraint(equalToConstant: 20),
            
            
            // Header content stack view constraints
            headerContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            headerContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            recentaskStackView.leadingAnchor.constraint(equalTo: recentallStackView.leadingAnchor, constant: 16),
            recentaskStackView.trailingAnchor.constraint(equalTo: recentallStackView.trailingAnchor),
                
            deleteButton.leadingAnchor.constraint(equalTo: recentaskStackView.leadingAnchor, constant: 300),
            deleteButton.trailingAnchor.constraint(equalTo: recentaskStackView.trailingAnchor),
            
            // Constraints for norecentaskLabel
            norecentaskLabel.topAnchor.constraint(equalTo: recentaskLabel.bottomAnchor, constant: 30 ),
            norecentaskLabel.leadingAnchor.constraint(equalTo: recentallStackView.leadingAnchor, constant: 16),
            norecentaskLabel.trailingAnchor.constraint(equalTo: recentallStackView.trailingAnchor, constant: 100),
            

            recommendLabel.leadingAnchor.constraint(equalTo: recommendStackView.leadingAnchor, constant: 16),
            recommendLabel.trailingAnchor.constraint(equalTo: recommendStackView.trailingAnchor, constant: 100),
            
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
    
    // Function to handle back button tap and navigate back to HomeViewController
     @objc func goBack() {
//
//         let homeViewController = HomeViewController()
//         let navController = UINavigationController(rootViewController: homeViewController) // Wrap the SignUpViewController in a navigation controller
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
         self.dismiss(animated: true, completion: nil)
     }
    
    
    @objc func bookmarkpageButtonTapped() {
        let bookmarkViewController = BookmarkViewController()
        // Create a UINavigationController with HomeViewController as the root view controller
        let navigationController = UINavigationController(rootViewController: bookmarkViewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        
        
        // Present the UINavigationController modally
        present(navigationController, animated: true, completion: nil)
    }
    
         
 
    
}
