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
        
        let imageExtensions = ["png", "jpg", "gif"]
        //...
        // Iterate & match the URL objects from your checking results
        if let url: URL = URL(string: childData.url){
            let pathExtention = url.pathExtension
            if imageExtensions.contains(pathExtention)
            {
                print("Image URL: \(String(describing: url))")
                if pathExtention == "gif"{
                    self.img.image = UIImage.gifImageWithURL(childData.url)
                }else{
                    self.img.downloaded(from: self.childData.url)
                    
                }
            }else
            {
                self.img.downloaded(from: self.childData.thumbnail)
            }
        }
        

        
        detail.text = childData.title
    }
    
    @IBAction func go(_ sender: Any) {
        if let url = URL(string: childData.url){
            UIApplication.shared.open(url)
        }
    }

}
