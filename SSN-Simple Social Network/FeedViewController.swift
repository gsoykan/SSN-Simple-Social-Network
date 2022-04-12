//
//  ViewController.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import UIKit

class FeedViewController: BaseViewController,
                          FeedDelegate {
    private var presenter: FeedPresenter!
    var posts: [Post]? {
        didSet {
            // TODO: @gsoykan this can be better implemented by adding a single element instead of reloading all data at once!
            tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var selectUserDropDown: DropDown!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        presenter = FeedPresenter(delegate: self)
        tableView.register(PostTableViewCell.self)
        presenter.loadPosts()
    }
    
    func setDropDownUsers() {
        selectUserDropDown.optionArray = presenter.allUsers?.map({$0.name}) ?? []
        selectUserDropDown.didSelect(completion: didSelectDropDown)
        selectUserDropDown.selectedIndex = presenter.currentUserIndex
    }
    
    private func didSelectDropDown(_ selectedText: String, _ index: Int , _ id:Int ) -> () {
        presenter.setCurrentUser(index)
    }
    
    @IBAction func didTapAddPost(_ sender: UIButton) {
        let createPostVC = UIStoryboard.main.instantiate(CreatePostViewController.self)
        createPostVC?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        createPostVC?.feedDelegate = self
        presentNullable(createPostVC)
    }
    
    func addNewPost(_ post: Post) {
        posts?.append(post)
    }
}

extension FeedViewController: UITableViewDelegate {
    
}

// TODO: @gsoykan add empty list view, if you'd implement remove post
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.typeName, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        guard let post =  posts?.reversed()[safeIndex: indexPath.item] else {
            cell.reset()
            return cell
        }
        cell.configure(with: post)
        return cell
    }
}
