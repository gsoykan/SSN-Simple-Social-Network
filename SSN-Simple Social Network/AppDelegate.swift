//
//  AppDelegate.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if !UserDefaults.standard.bool(forKey: Constants.General.isNotFirstOpenUserDefaults) {
            setInitialAppData()
            UserDefaults.standard.set(true, forKey: Constants.General.isNotFirstOpenUserDefaults)
        }
        return true
    }
    
    private func setInitialAppData() {
        let mockUserOne = User(name: "Charlie", username: "Charliee!", profileImage: SSNImage(path: "ProfileOne", source: .asset), isCurrent: true)
        let mockPostOne = Post(user: mockUserOne, text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", image: SSNImage(path: "PostOne", source: .asset))
        let mockUserTwo = User(name: "Dakota", username: "Dakky", profileImage: SSNImage(path: "ProfileTwo", source: .asset))
        let mockPostTwo = Post(user: mockUserTwo, text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", image: SSNImage(path: "PostTwo", source: .asset))
        let mockUserThree = User(name: "Justice", username: "JusticeLL", profileImage: SSNImage(path: "ProfileThree", source: .asset))
        let mockPostThree = Post(user: mockUserThree, text: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. ", image: SSNImage(path: "PostThree", source: .asset))
        UserRepository.shared.storeInfo(data: [mockUserOne, mockUserTwo, mockUserThree])
        PostRepository.shared.storeInfo(data: [mockPostOne, mockPostTwo, mockPostThree])
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

