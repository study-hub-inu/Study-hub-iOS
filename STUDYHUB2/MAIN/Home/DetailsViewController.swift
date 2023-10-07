
import UIKit

class DetailsViewController:UIViewController{
  
  
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
    
    // Add a flexible spacer to push the title label to the center
    let spacerView = UIView()
    spacerView.translatesAutoresizingMaskIntoConstraints = false
    spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    
    // "이용방법" label
    let howtouseLabel = UILabel()
    howtouseLabel.text = "이용 방법"
    howtouseLabel.textColor = .white
    howtouseLabel.font = UIFont.boldSystemFont(ofSize: 18)
    howtouseLabel.translatesAutoresizingMaskIntoConstraints = false
    
    // Add the backButton and studyLabel to the header stack view
    headerStackView.addArrangedSubview(backButton)
    headerStackView.addArrangedSubview(spacerView)
    headerStackView.addArrangedSubview(howtouseLabel)
    
    
    // Add the header stack view to the view
    view.addSubview(headerStackView)
    
    
    let headerContentStackView = UIStackView()
    headerContentStackView.axis = .vertical
    headerContentStackView.spacing = 0
    headerContentStackView.translatesAutoresizingMaskIntoConstraints = false
    
    // Image view for the large image
    let largeImageView = UIImageView(image: UIImage(named: "Image 6"))
    largeImageView.contentMode = .scaleAspectFill
    largeImageView.clipsToBounds = true
    largeImageView.translatesAutoresizingMaskIntoConstraints = false
    headerContentStackView.addArrangedSubview(largeImageView)
    
    // Image view for the large image
    let largeImage2View = UIImageView(image: UIImage(named: "Image 8"))
    largeImage2View.contentMode = .scaleAspectFill
    largeImage2View.clipsToBounds = true
    largeImage2View.translatesAutoresizingMaskIntoConstraints = false
    headerContentStackView.addArrangedSubview(largeImage2View)
    
    // Image view for the large image
    let largeImage3View = UIImageView(image: UIImage(named: "Image 9"))
    largeImage3View.contentMode = .scaleAspectFill
    largeImage3View.clipsToBounds = true
    largeImage3View.translatesAutoresizingMaskIntoConstraints = false
    headerContentStackView.addArrangedSubview(largeImage3View)
    
    // Image view for the large image
    let largeImage4View = UIImageView(image: UIImage(named: "Image 10"))
    largeImage4View.contentMode = .scaleAspectFill
    largeImage4View.clipsToBounds = true
    largeImage4View.translatesAutoresizingMaskIntoConstraints = false
    headerContentStackView.addArrangedSubview(largeImage4View)
    
    // Image view for the large image
    let largeImage5View = UIImageView(image: UIImage(named: "Image 11"))
    largeImage5View.contentMode = .scaleAspectFill
    largeImage5View.clipsToBounds = true
    largeImage5View.translatesAutoresizingMaskIntoConstraints = false
    headerContentStackView.addArrangedSubview(largeImage5View)
    
    // Image view for the large image
    let largeImage6View = UIImageView(image: UIImage(named: "Image 12"))
    largeImage6View.contentMode = .scaleAspectFill
    largeImage6View.clipsToBounds = true
    largeImage6View.translatesAutoresizingMaskIntoConstraints = false
    headerContentStackView.addArrangedSubview(largeImage6View)
    
    // Image view for the large image
    let largeImage7View = UIImageView(image: UIImage(named: "Image 13"))
    largeImage7View.contentMode = .scaleAspectFill
    largeImage7View.clipsToBounds = true
    largeImage7View.translatesAutoresizingMaskIntoConstraints = false
    headerContentStackView.addArrangedSubview(largeImage7View)
    
    // Image view for the large image
    let largeImage8View = UIImageView(image: UIImage(named: "Image 14"))
    largeImage8View.contentMode = .scaleAspectFill
    largeImage8View.clipsToBounds = true
    largeImage8View.translatesAutoresizingMaskIntoConstraints = false
    headerContentStackView.addArrangedSubview(largeImage8View)
    
    // '작성하기' 버튼
    let writeButton = UIButton(type: .system)
    writeButton.setTitle("작성하기", for: .normal)
    writeButton.setTitleColor(.white, for: .normal)
    writeButton.backgroundColor = UIColor(hexCode: "FF5935")
    writeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    writeButton.layer.cornerRadius = 10
    writeButton.translatesAutoresizingMaskIntoConstraints = false
    writeButton.addTarget(self, action: #selector(writeButtonTapped), for: .touchUpInside)
    view.addSubview(writeButton)
    headerContentStackView.addArrangedSubview(writeButton)
    
    
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
      headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
      
      // Header content stack view constraints
      headerContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      headerContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      headerContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      headerContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      headerContentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      
      // Large image view constraints (assuming fixed height)
      largeImageView.heightAnchor.constraint(equalToConstant: 305),
      largeImageView.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor), // No left margin
      largeImageView.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor), // No right margin
      
      // Large image view constraints (assuming fixed height)
      largeImage2View.heightAnchor.constraint(equalToConstant: 650),
      largeImage2View.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor), // No left margin
      largeImage2View.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor), // No right margin
      
      // Large image view constraints (assuming fixed height)
      largeImage3View.heightAnchor.constraint(equalToConstant: 600),
      largeImage3View.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor), // No left margin
      largeImage3View.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor), // No right margin
      
      // Large image view constraints (assuming fixed height)
      largeImage4View.heightAnchor.constraint(equalToConstant: 900),
      largeImage4View.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor), // No left margin
      largeImage4View.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor), // No right margin
      
      // Large image view constraints (assuming fixed height)
      largeImage5View.heightAnchor.constraint(equalToConstant: 300),
      largeImage5View.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor), // No left margin
      largeImage5View.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor), // No right margin
      
      // Large image view constraints (assuming fixed height)
      largeImage6View.heightAnchor.constraint(equalToConstant: 400),
      largeImage6View.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor), // No left margin
      largeImage6View.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor), // No right margin
      
      // Large image view constraints (assuming fixed height)
      largeImage7View.heightAnchor.constraint(equalToConstant: 700),
      largeImage7View.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor), // No left margin
      largeImage7View.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor), // No right margin
      
      // Large image view constraints (assuming fixed height)
      largeImage8View.heightAnchor.constraint(equalToConstant: 250),
      largeImage8View.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor), // No left margin
      largeImage8View.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor), // No right margin
      
      writeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      writeButton.topAnchor.constraint(equalTo: largeImage8View.bottomAnchor, constant: 40),
      writeButton.leadingAnchor.constraint(equalTo: headerContentStackView.leadingAnchor, constant: 20), // No left margin
      writeButton.trailingAnchor.constraint(equalTo: headerContentStackView.trailingAnchor),
      writeButton.heightAnchor.constraint(equalToConstant: 55),
      writeButton.widthAnchor.constraint(equalToConstant: 400),
      
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

    
    self.dismiss(animated: true, completion: nil)
  }
  @objc func writeButtonTapped() {
    let createStudyViewController = CreateStudyViewController()
    let navigationController = UINavigationController(rootViewController: createStudyViewController)
    navigationController.modalPresentationStyle = .fullScreen
    
    // Present the navigation controller modally
    present(navigationController, animated: true, completion: nil)
  }
  
}
