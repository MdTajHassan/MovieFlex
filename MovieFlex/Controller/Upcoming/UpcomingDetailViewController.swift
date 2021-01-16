//
//  UpcomingDetailViewController.swift
//  MovieFlex
//
//  Created by mehtab alam on 15/01/2021.
//

import UIKit

class UpcomingDetailViewController: UIViewController {
    @IBOutlet weak var detailPlayImage: UIImageView!
    @IBOutlet weak var detailTitleLbl: UILabel!
    @IBOutlet weak var releseDateLbl: UILabel!
    @IBOutlet weak var detailView: UITextView!
    
    
    var detailUpcomingObject:UpcomingResult?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageLink = "https://image.tmdb.org/t/p/w342/"
        let completeLink = (imageLink + (detailUpcomingObject?.poster_path)!)
        detailPlayImage.downloaded(from: completeLink)
        
        detailTitleLbl.text = detailUpcomingObject?.original_title
        releseDateLbl.text = detailUpcomingObject?.release_date
        detailView.text = detailUpcomingObject?.overview
    }
}
