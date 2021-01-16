//
//  UpcomingTableViewCell.swift
//  MovieFlex
//
//  Created by mehtab alam on 15/01/2021.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell {
    @IBOutlet weak var upcomingImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var storyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCellForUpcoming(data: UpcomingResult) {
        
        let imageLink = "https://image.tmdb.org/t/p/w342/"
        let completeLink = imageLink + data.poster_path!
        upcomingImageView.downloaded(from: completeLink)
        titleLbl.text = data.title
        storyLbl.text = data.overview
    }
}
