//
//  FeedCell.swift
//  PhotoSharingApp
//
//  Created by Aydın Kutlu on 6.07.2024.
//

import UIKit

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var commentText: UILabel!
    @IBOutlet weak var emailText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
