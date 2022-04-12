//
//  CreatePostViewController.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import UIKit
import KMPlaceholderTextView

class CreatePostViewController: BaseViewController,
                                CreatePostDelegate {
    private var presenter: CreatePostPresenter!
    weak var feedDelegate: FeedDelegate?
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var textView: KMPlaceholderTextView!
    
    var imagePicker: ImagePicker!
    private var imagePath: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        presenter = CreatePostPresenter(delegate: self)
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        postImageView.isUserInteractionEnabled = true
        postImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func didCreatePost(_ post: Post) {
        feedDelegate?.addNewPost(post)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapAddPost(_ sender: UIButton) {
        guard let imagePath = imagePath else {
            showError("You should pick/take an image!")
            return
        }
        let text = textView.text ?? ""
        guard text.count > 3 else {
            showError("Post text should be more than 3 characters!")
            return
        }
        presenter.createPost(imagePath: imagePath, text: text)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImageView = tapGestureRecognizer.view as! UIImageView
        self.imagePicker.present(from: tappedImageView)
    }
}

extension CreatePostViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?, path: String?) {
        guard let image = image, let path = path else {
            return
        }
        imagePath = path
        self.postImageView.image = image
    }
}
