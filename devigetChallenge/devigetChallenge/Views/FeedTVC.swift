//
//  FeedTVC.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 12-05-21.
//

import UIKit

class FeedTVC: UITableViewCell {

    @IBOutlet weak var circle: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var timeAgo: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var dismiss: UIButton!
    @IBOutlet weak var commentCounter: UILabel!
    
    
    func performViews(childData: ChildData, target: Any, dismiss:Selector, visit: Selector, row: Int){
        
        self.username.text = childData.author
        self.timeAgo.text = Date(timeIntervalSince1970: TimeInterval(childData.created)).timeAgoDisplay()
        if let url = URL(string: childData.thumbnail){
            self.img.downloaded(from: url)
        }
        self.detail.text = childData.title
        self.commentCounter.text = "\(childData.numComments) Comments"
        self.circle.isHidden = childData.visited
        self.dismiss.addTarget(target, action: dismiss, for: .touchUpInside)
        self.dismiss.tag = row
        self.right.addTarget(target, action: visit, for: .touchUpInside)
        self.right.tag = row
    }
    
}
