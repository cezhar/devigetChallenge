//
//  DetailVC.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 12-05-21.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var detail: UILabel!
    
    var childData: ChildData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        user.text = childData.author
        if let image = UIImage.gifImageWithURL(childData.url){
            img.image = image
        }
        detail.text = childData.title
        // Do any additional setup after loading the view.
    }
    

}
