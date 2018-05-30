//
//  ListOfUsersTableVC.swift
//  Hairs
//
//  Created by Станислав Тищенко on 28.05.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class ListOfUsersTableVC: UITableViewController {
    var user: [User]? = nil
    var event: [Event]? = nil
    var master: [Master]? = nil
    var masterName = ""
    var userName = ""
    var indexOfSelectedRow = 0
    var arrayOfUsers: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        indexOfSelectedRow = 0
        master = Master.fetchObject()
        user = User.fetchObject()
        event = Event.fetchObject()
        tableView.tableFooterView = UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        event = Event.fetchObject()
        var k = 0
        for i in event! {
            if i.date != nil && i.master != nil && i.user != nil {
                if i.master?.name == masterName {
                    k += 1
                    arrayOfUsers.append((i.user?.name)!)
                }
            }
        }
        return k
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arrayOfUsers[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexOfSelectedRow = indexPath.row
        performSegue(withIdentifier: "toUserInfo", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! infoAboutUserVC
        destination.userName = arrayOfUsers[indexOfSelectedRow]
        destination.masterName = masterName
        for i in event! {
            if i.date != nil && i.user != nil && i.master != nil
                || i.date == nil && i.user != nil && i.master == nil && i.user?.name == userName {
            } else {
                Event.deleteObject(event: i)
                event = Event.fetchObject()
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
