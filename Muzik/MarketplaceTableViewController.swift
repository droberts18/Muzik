//
//  MuzikDefaultTableViewController.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/7/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class MarketplaceTableViewController: UITableViewController {
    
    var postList = [MarketplacePostModel]()
    var refPosts: DatabaseReference!
    
    @IBOutlet var marketplaceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        refPosts = Database.database().reference().child("posts")
        
        refPosts.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.postList.removeAll()
                
                for posts in snapshot.children.allObjects as! [DataSnapshot] {
                    let postObject = posts.value as? [String: AnyObject]
                    let retrievedPostTitle = postObject?["postTitle"]
                    let retrievedContactInfo = postObject?["contactInfo"]
                    
                    let post = MarketplacePostModel(postTitle: retrievedPostTitle as! String, contactInfo: retrievedContactInfo as! String)
                    
                    self.postList.append(post)
                }
                self.marketplaceTableView.reloadData()
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
//
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MarketplaceCell", for: indexPath) as? MarketplaceCell else {
            fatalError("The dequeued cell is not an instance of MarketplaceCell.")
            }
        
        let post: MarketplacePostModel
        
        post = postList[indexPath.row]
        
        cell.headingTitle.text = post.postTitle
        cell.contactInfo.text = post.contactInfo

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
