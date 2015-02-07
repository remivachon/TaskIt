//
//  ViewController.swift
//  TaskIt
//
//  Created by Rémi on 2015-02-06.
//  Copyright (c) 2015 Rémi Vachon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray: [TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: "01/14/2014")
        let task2 = TaskModel(task: "Eat", subTask: "Eat Dinner", date: "01/14/2014")
        let task3 = TaskModel(task: "Gym", subTask: "Leg day", date: "01/14/2014")
        
        taskArray = [task1, task2, task3]
        
        //Dans le vidéo il écrit let task1: Dictionary <String, String> = ..., mais c'est pas nécessaire dans Swift, comme les autres type
        //Il détecte automatiquement que c'est un Dictionary
//        let task1 = ["task": "Study French", "subtask": "Verbs", "date": "01/14/2014"]
//        let task2 = ["task": "Eat", "subtask": "Eat Dinner", "date": "01/14/2014"]
//        let task3 = ["task": "Gym", "subtask": " Leg day", "date": "01/14/2014"]
//        taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
        
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = thisTask.date
        
        return cell
    }
    
    //UITableViewDelegate
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }

    
}

