//
//  ViewController.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 06-05-21.
//

import UIKit

class MainVC: UIViewController {

    
    var feeds:[Child]!
    var selected: ChildData?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        API.getTop { (response) in
            if let resp = response {
                self.feeds = resp.data.children
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func dismiss(sender: UIButton){
        let alert = UIAlertController(title: "Dismiss", message: "This feed wil be removed from this context", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            let tag = sender.tag
            self.feeds.remove(at: tag)
            self.tableView.deleteRows(at: [IndexPath(row: tag, section: 0)], with: .automatic)
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              print("bleh")
        }))

        present(alert, animated: true, completion: nil)
    }
    
    @objc func visit(sender: UIButton){
        let tag = sender.tag
        var child = feeds[tag]
        var data = child.data
        data.visited = true
        child.data = data
        feeds[tag] = child
        tableView.reloadData()
        performSegue(withIdentifier: Constants.detailVC , sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailVC, let vc = segue.destination as? DetailVC{
            vc.childData = self.selected
        }
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        let count = feeds.count
        feeds.removeAll()
        for i in 0..<count{
            self.tableView.deleteRows(at: [IndexPath(row: i, section: 0)], with: .automatic)
        }
    }
    
}

extension MainVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.feedTVC) as? FeedTVC{
            let pos = indexPath.row
            let childData = feeds[pos].data
            cell.performViews(childData: childData, dismiss: #selector(dismiss(sender:)), visit: #selector(visit(sender:)), row: pos)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

