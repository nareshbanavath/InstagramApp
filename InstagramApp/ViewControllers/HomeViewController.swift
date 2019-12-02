//
//  HomeViewController.swift
//  InstagramApp
//
//  Created by IOS User1 on 27/11/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    lazy var posts : [Post] = {
        let model = Model()
        return model.postList

    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = CGFloat(800)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        tableView.register(UINib(nibName: "StoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "StoriesTableViewCell")
        tableView.tableFooterView = UIView()
        let rightBarImage = UIImage(named: "send_nav_icon")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let rightBarButton = UIBarButtonItem(image: rightBarImage , style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButton

        let leftBarImage = UIImage(named: "camera_nav_icon")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let leftBarButton = UIBarButtonItem(image: leftBarImage , style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = leftBarButton

        let profileImageView = UIImageView(image: UIImage(named: "logo_nav_icon")!)
        self.navigationItem.titleView = profileImageView

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell", for: indexPath) as! StoriesTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
        let currentIndex = indexPath.row - 1
        let postData = posts[currentIndex]
        cell.profileImage.image = postData.user.profileImage
        cell.postImage.image = postData.postImage
        cell.likesCountLabel.text = "\(postData.likesCount) likes"
        cell.postCommentLabel.text = "\(postData.postComment)"
        cell.commentCountButton.setTitle("View \(postData.commentCount) Comments", for: .normal)
        cell.dateLabel.text = postData.datePosted
        cell.userNameTitleButton.setTitle(postData.user.name, for: .normal)

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return CGFloat(125.0)
        }
        return UITableView.automaticDimension
    }


}
