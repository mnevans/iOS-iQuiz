//
//  ViewController.swift
//  iQuiz
//
//  Created by Morgan Evans on 11/3/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
   
    private let questionSeque = "questionSeque"
    
    private let questionList =
        ["Mathematics" : ["8 * 3", "4 - 2", "1 + 6"],
            "Marvel Super Heroes" : ["What is Spiderman's lovers name?", "What color is the Hulk?", "What is Spiderman's real name?"],
            "Science" : ["What's the first color of the the color spectrum?", "What is the first element on the periodic table?", "What is the closest planet to the sun?"]]
    

    private let answerList =
    ["8 * 3": ["5", "24", "11"],
    "4 - 2": ["2", "6", "8"],
    "1 + 6": ["6", "5", "7"],
    "What is Spiderman's lovers name?" :["Mary Jane", "Janet Marie", "Helga"],
    "What color is the Hulk?": ["Red", "Green", "Blue"],
    "What is Spiderman's real name?" : ["Spidey", "Parker Peter", "Peter Parker"],
    "What's the first color of the color spectrum?":["Orange", "Red", "Yellow"],
    "What is the first element on the periodic table?" : ["Gold", "Oxygen", "Hydrogen"],
    "What is the closest planet to the sun?": ["Mercury", "Earth", "Pluto"]]
    
    let cellTableIdentifier = "CellTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settings(sender: UIBarButtonItem) {
        let title = "Settings go here"
        let controller = UIAlertController(title: title, message: nil,
            preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK",
            style: .Default, handler: nil)
        controller.addAction(action)
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return subjects.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier)
                as UITableViewCell!
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellTableIdentifier)
            }
            
            let image = UIImage(named: "8bit")
            cell!.imageView?.image = image
            let highlightedImage = UIImage(named: "8bit")
            cell!.imageView?.highlightedImage = highlightedImage
            
            cell!.textLabel?.text = subjects[indexPath.row]
            cell!.textLabel?.font = UIFont .boldSystemFontOfSize(18)
            cell!.detailTextLabel?.text = "Quizzes quizzes are so fun, quizzes are for everyone!"
            cell!.detailTextLabel?.font = UIFont.systemFontOfSize(12)
            return cell!
    }
    
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            performSegueWithIdentifier(questionSeque, sender: cell)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == questionSeque {
            let cell = sender as! UITableViewCell
            let key = cell.textLabel?.text
            let problems = questionList[key!]
            let questionViewController = segue.destinationViewController as! QuestionViewController
            
            questionViewController.questions = problems!
            questionViewController.answers = answerList
        }
    }
}

