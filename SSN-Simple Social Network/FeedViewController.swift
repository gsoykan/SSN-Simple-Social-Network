//
//  ViewController.swift
//  SSN-Simple Social Network
//
//  Created by gurkan soykan on 12.04.2022.
//

import UIKit
import iOSDropDown

class FeedViewController: BaseViewController,
                          FeedDelegate {
    private var presenter: FeedPresenter!
    var posts: [Post]? {
        didSet {
            // TODO: @gsoykan make this better
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
        selectUserDropDown.optionArray = posts?.map{ $0.user.name } ?? []
        selectUserDropDown.didSelect(completion: didSelectDropDown)
        selectUserDropDown.selectedIndex = presenter.currentUserIndex
    }
    
    private func didSelectDropDown(_ selectedText: String, _ index: Int , _ id:Int ) -> () {
        presenter.setCurrentUser(index)
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
        guard let post =  posts?[safeIndex: indexPath.item] else {
            cell.reset()
            return cell
        }
        cell.configure(with: post)
        return cell
    }
}
