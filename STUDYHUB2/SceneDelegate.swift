//
//  SceneDelegate.swift
//  STUDYHUB2
//
//  Created by HYERYEONG on 2023/08/05.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  let tokenManager = TokenManager.shared
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    // Create view controllers for each tab
    let homeViewController = HomeViewController() // Your HomeViewController instance
    let studyViewController = StudyViewController() // Your StudyViewController instance
    let myPageViewController = MyPageViewController() // Your MyPageViewController instance
    
    // Set the view controllers for the tab bar controller
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [homeViewController, studyViewController, myPageViewController]
    
    // Set tab bar item titles and images
    homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
    studyViewController.tabBarItem = UITabBarItem(title: "스터디", image: UIImage(systemName: "book"), tag: 1)
    myPageViewController.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person"), tag: 2)
    
    // Create a line view to wrap the tab bar controller
    let lineView = UIView()
    lineView.backgroundColor = UIColor.black // Set the color of the line
    lineView.translatesAutoresizingMaskIntoConstraints = false
    
    // Add line view to the tab bar controller's view
    tabBarController.view.addSubview(lineView)
    
    // Set constraints for the line view (placing it at the top of the tab bar)
    NSLayoutConstraint.activate([
      lineView.leadingAnchor.constraint(equalTo: tabBarController.view.leadingAnchor),
      lineView.trailingAnchor.constraint(equalTo: tabBarController.view.trailingAnchor),
      lineView.topAnchor.constraint(equalTo: tabBarController.view.topAnchor),
      lineView.heightAnchor.constraint(equalToConstant: 1) // Adjust the height as needed
    ])
    
    // Create a navigation controller for the tab bar controller
    let navigationController = UINavigationController(rootViewController: tabBarController)
    
    // Set the window's root view controller to the navigation controller
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    
    // MARK: - 자동 로그인?
    if let accessToken = TokenManager.shared.loadAccessToken() {
      // 로그인 성공한 경우 HomeViewController 표시
      let homeViewController = HomeViewController()
      tabBarController.selectedIndex = 0 // 홈 탭 선택
      window?.rootViewController = navigationController
    } else {
      // 로그인하지 않은 경우 LoginViewController 표시
      let loginViewController = LoginViewController()// Fixed typo
      window?.rootViewController = navigationController
    }
    
    window?.makeKeyAndVisible()
  }
  
  
  
  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }
  
  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }
  
  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }
  
  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }
  
  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }
  
  
}

