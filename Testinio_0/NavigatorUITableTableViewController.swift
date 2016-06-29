//
//  NavigatorUITableTableViewController.swift
//  Testinio_0
//
//  Created by Mateusz Orzoł on 22.06.2016.
//  Copyright © 2016 Mateusz Orzoł. All rights reserved.
//

import UIKit

class NavigatorUITableTableViewController: UITableViewController {
    
    private struct TableViewIdentifiers{
        static let numbers = "numbresIndetifier"
        static let bigPicture = "bigPictureIdentifire"
        static let animation = "animationIdentifire"
        static let game = "gameIdentifire"
    }
    
    let tableRows = [Rows.numbers, Rows.bigPicture, Rows.animation, Rows.game]
    let tableDetails = [details.numbers, details.bigPicture, details.animation, details.game]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRows.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("SubtitleCell", forIndexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.textLabel?.text = tableRows[indexPath.row]
        cell.detailTextLabel?.text = tableDetails[indexPath.row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let indetifier = segue.identifier{
            switch indetifier {
            case TableViewIdentifiers.numbers:
                if let numbers = segue.destinationViewController as? NumbersViewController{
                numbers.title = "NUMBERS"
                }
            case TableViewIdentifiers.bigPicture:
                if let bigPicture = segue.destinationViewController as? BigPictureViewController{
                    bigPicture.title = "BIG PICTURES"
                }
            case TableViewIdentifiers.animation:
                if let animation = segue.destinationViewController as? AnimationViewController{
                    animation.title = "ANIAMTION"
                }
//            case TableViewIdentifiers.game:
//                if let game = segue.destinationViewController as? GameViewController{
//                    game.title = "SIMPLE GAME"
//                }
            default:
                break
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath){
            let cellTitle = cell.textLabel?.text
            switch cellTitle {
            case Rows.numbers?:
                performSegueWithIdentifier(TableViewIdentifiers.numbers, sender:self)
            case Rows.bigPicture?:
                performSegueWithIdentifier(TableViewIdentifiers.bigPicture, sender: self)
            case Rows.animation?:
                performSegueWithIdentifier(TableViewIdentifiers.animation, sender: self)
//            case Rows.game?:
//                performSegueWithIdentifier(TableViewIdentifiers.game, sender: self)
            default:
                break
            }
        }
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
