//
//  ViewController.swift
//  iQuiz
//
//  Created by Morgan Evans on 11/3/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let topics = [
        ["Subject" : "Mathematics", "Description" : "Mathematics Quiz!"],
        ["Subject" : "Marvel Super Heroes", "Description" : "Marvel Super Heroes Quiz!"],
        ["Subject" : "Science", "Description" : "Science Quiz!"]
    ]
    
    let cellTableIdentifier = "CellTableIdentifier"
    
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return topics.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath) as! QuizCellTableViewCell
        
        let imageView = UIImageView(frame: CGRectMake(10, 10, 5, 5))
        let image = UIImage(named: "quiz")
        imageView.image = image
        cell.imageView?.image = image
        let rowData = topics[indexPath.row]
        cell.subject = rowData["Subject"]!
        cell.desc = rowData["Description"]!
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

