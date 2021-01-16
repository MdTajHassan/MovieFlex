//
//  TopRatedTableViewCell.swift
//  MovieFlex
//
//  Created by mehtab alam on 15/01/2021.
//

import UIKit

class TopRatedTableViewCell: UITableViewCell {
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var storyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCellForTopRated(data: TopResults) {
        
        let imageLink = "https://image.tmdb.org/t/p/w342/"
        let completeLink = imageLink + data.poster_path!
        topImageView.downloaded(from: completeLink)
        titleLbl.text = data.title
        storyLbl.text = data.overview
    }
}
