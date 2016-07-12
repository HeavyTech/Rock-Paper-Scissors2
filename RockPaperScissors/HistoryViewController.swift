//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Jose Virgen on 7/11/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
 

    @IBOutlet weak var tableView: UITableView!
    var history: [RPSMatch]!
    
    // Table View Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let CellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellID, forIndexPath: indexPath)
    
        let match = self.history[indexPath.row]
        
        cell.textLabel!.text = victoryStatusDescription(match)
        
        //Testing if it contains a value 
        if cell.detailTextLabel != nil {
            print("Contains a value!")
        } else {
            print("Doesn’t contain a value.")
        }
        
        cell.detailTextLabel!.text = "\(match.p1) vs. \(match.p2)"
        
        
        return cell
   
        
        
    }
    
    func victoryStatusDescription(match: RPSMatch) -> String {
        
        if (match.p1 == match.p2) {
            return "Tie."
        } else if (match.p1.defeats(match.p2)) {
            return "Win!"
        } else {
            return "Loss."
        }
    }
    @IBAction func dismissHistory(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
