import UIKit

class StudyViewController: UIViewController {
    
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
        studyHubLabel.text = "스터디"
        studyHubLabel.font = UIFont.boldSystemFont(ofSize: 18)
        studyHubLabel.textColor = .white
        studyHubLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the studyHubLabel to the header stack view
        headerStackView.addArrangedSubview(studyHubLabel)
        
        //  magnifyingglassbutton
        let magnifyingglassButton = UIButton(type: .system)
        magnifyingglassButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        magnifyingglassButton.tintColor = .white
        magnifyingglassButton.translatesAutoresizingMaskIntoConstraints = false
        
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
        headerStackView.addArrangedSubview(magnifyingglassButton)
        headerStackView.addArrangedSubview(bellButton)
        
        // Add the header stack view to the view
        view.addSubview(headerStackView)
        
        let headerContentStackView = UIStackView()
        headerContentStackView.axis = .vertical
        headerContentStackView.spacing = 16
        headerContentStackView.translatesAutoresizingMaskIntoConstraints = false

        // Create a scroll view to make the content scrollable
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(headerContentStackView)
        view.addSubview(scrollView)
        
        
        // Create a gray vertical line
        let verticalGrayLine = UIView()
        verticalGrayLine.backgroundColor = UIColor(hexCode: "#D8DCDE")
        verticalGrayLine.translatesAutoresizingMaskIntoConstraints = false
        verticalGrayLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Create the "최신순" button
        recentButton.setTitle("최신순", for: .normal)
        recentButton.setTitleColor(.gray, for: .normal)
        recentButton.translatesAutoresizingMaskIntoConstraints = false
        recentButton.addTarget(self, action: #selector(sortingButtonTapped(_:)), for: .touchUpInside)
        
        // Create the "인기순" button
        popularButton.setTitle("인기순", for: .normal)
        popularButton.setTitleColor(.gray, for: .normal)
        popularButton.translatesAutoresizingMaskIntoConstraints = false
        popularButton.addTarget(self, action: #selector(sortingButtonTapped(_:)), for: .touchUpInside)
        
        // Create a horizontal stack view for "최신순" button, gray line, and "인기순" button
        let sortingButtonsStackView = UIStackView(arrangedSubviews: [recentButton, verticalGrayLine, popularButton])
        sortingButtonsStackView.axis = .horizontal
        sortingButtonsStackView.spacing = 8
        sortingButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the sortingButtonsStackView to the headerContentStackView
        headerContentStackView.addArrangedSubview(sortingButtonsStackView)
        
        //sortingButtons까지 나누는 선
        let sortingButtonsGrayLine = UIView()
        sortingButtonsGrayLine.backgroundColor = UIColor(hexCode: "#F3F5F6")
        sortingButtonsGrayLine.translatesAutoresizingMaskIntoConstraints = false
        headerContentStackView.addArrangedSubview(sortingButtonsGrayLine)
        sortingButtonsGrayLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
    


        // Create a UIImageView for the center image
        let centerImageView = UIImageView()
        centerImageView.image = UIImage(named: "Image 5") // Replace with the actual image name
        centerImageView.contentMode = .scaleAspectFit
        centerImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerImageView)

        // Create the "+" button
        let addButton = UIButton(type: .system)
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = UIColor(hexCode: "FF5935")
        addButton.layer.cornerRadius = 30 // Increase the corner radius to make the button rounder
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        view.addSubview(addButton)

        
    
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
            
//            recentButton.leadingAnchor.constraint(equalTo: sortingButtonsStackView.leadingAnchor, constant: -250),
////            recentButton.trailingAnchor.constraint(equalTo: sortingButtonsStackView.trailingAnchor, constant: 5),
////            popularButton.leadingAnchor.constraint(equalTo: sortingButtonsStackView.leadingAnchor, constant: 80),

            // Constraints for "최신순" button
            recentButton.leadingAnchor.constraint(equalTo: sortingButtonsStackView.leadingAnchor, constant: 20),

            
            // Constraints for verticalGrayLine
            verticalGrayLine.widthAnchor.constraint(equalToConstant: 1),
            popularButton.leadingAnchor.constraint(equalTo: recentButton.trailingAnchor, constant: -260), // 6 points to the right of recentButton
            
            
            // Constraints for centerImageView
            centerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerImageView.widthAnchor.constraint(equalToConstant: 150), // Adjust the width as needed
            centerImageView.heightAnchor.constraint(equalToConstant: 150), // Adjust the height as needed
            
            // Scroll view constraints
            scrollView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Place the sortingButtonsGrayLine just above the sortingButtonsStackView
            sortingButtonsGrayLine.bottomAnchor.constraint(equalTo: sortingButtonsStackView.topAnchor, constant: 35),
            
            
            // Add button constraints
            addButton.widthAnchor.constraint(equalToConstant: 60), // Increase the width
            addButton.heightAnchor.constraint(equalToConstant: 60), // Increase the height
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        // Set the background color of the scrollView to white
        scrollView.backgroundColor = .white
        
        // Set the scroll view's content size to fit the content
        headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    @objc func addButtonTapped() {
        let createStudyViewController = CreateStudyViewController()
        let navigationController = UINavigationController(rootViewController: createStudyViewController)
        navigationController.modalPresentationStyle = .fullScreen
        
        // Present the navigation controller modally
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func sortingButtonTapped(_ sender: UIButton) {
        // Reset colors of all buttons
        recentButton.setTitleColor(.gray, for: .normal)
        popularButton.setTitleColor(.gray, for: .normal)
    
        // Set the tapped button to orange background
        sender.setTitleColor(.black, for: .normal)
    }
}
