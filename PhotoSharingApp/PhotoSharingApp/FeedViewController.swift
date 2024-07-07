//
//  FeedViewController.swift
//  PhotoSharingApp
//
//  Created by Aydın Kutlu on 7.06.2024.
//

import UIKit
import FirebaseFirestore
import Firebase
import FirebaseCore
import FirebaseStorage
import SDWebImage


class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    //var emailSeq = [String]()
    //var commentSeq = [String]()
    //var imageSeq = [String]()
    
    var postSeq = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        // Do any additional setup after loading the view.
        firestoreGetData()
    }
    func firestoreGetData(){
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Post").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            }  else {
                if snapshot?.isEmpty == false && snapshot != nil {
                    //self.emailSeq.removeAll(keepingCapacity: false)
                    //self.imageSeq.removeAll(keepingCapacity: false)
                    //self.commentSeq.removeAll(keepingCapacity: false)
                    self.postSeq.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        if let imgUrl = document.get("imgurl") as? String{
                            if let email = document.get("email") as? String{
                                if let comment = document.get("comment") as? String{
                                    let post = Post(email: email, comment: comment, imageUrl: imgUrl)
                                    self.postSeq.append(post)
                                }
                            }
                        }
                        
                        
                    }
                    self.tableview.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postSeq.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailText.text = postSeq[indexPath.row].email
        cell.postImageView.sd_setImage(with: URL(string: postSeq[indexPath.row].imageUrl))
        cell.commentText.text = postSeq[indexPath.row].comment
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
