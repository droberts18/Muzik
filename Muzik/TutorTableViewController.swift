//
//  TutorTableViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/8/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class TutorTableViewController: UITableViewController {

    var tutorPostList = [TutorPostModel]()
    var refTutorPosts: DatabaseReference!
    
    @IBOutlet var tutorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        refTutorPosts = Database.database().reference().child("tutorPosts")
        
        refTutorPosts.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.tutorPostList.removeAll()
            
                for tutorPosts in snapshot.children.allObjects as! [DataSnapshot] {
                    let tutorPostObject = tutorPosts.value as? [String: AnyObject]
                    let retrievedTutorName = tutorPostObject?["tutorName"]
                    let retrievedInstrumentName = tutorPostObject?["instrumentName"]
                    let retrievedContactInfo = tutorPostObject?["contactInfo"]
                    
                    let tutorPost = TutorPostModel(tutorName: retrievedTutorName as! String, instrumentName: retrievedInstrumentName as! String, contactInfo: retrievedContactInfo as! String)
                    
                    self.tutorPostList.append(tutorPost)
                }
                self.tutorTableView.reloadData()
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tutorPostList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TutorCell", for: indexPath) as? TutorCell else {
            fatalError("The dequeued cell is not an instance of TutorCell.")
        }
        
        let tutorPost: TutorPostModel
        
        tutorPost = tutorPostList[indexPath.row]
        
        cell.tutorName.text = tutorPost.tutorName
        cell.instrumentName.text = tutorPost.instrumentName
        cell.postImg.image = UIImage(named: "defaultProfilePhoto.jpg")
        cell.contactInfo.text = tutorPost.contactInfo
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
