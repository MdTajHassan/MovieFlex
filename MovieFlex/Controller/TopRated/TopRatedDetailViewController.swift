//
//  TopRatedDetailViewController.swift
//  MovieFlex
//
//  Created by mehtab alam on 15/01/2021.
//

import UIKit

class TopRatedDetailViewController: UIViewController {
    
    @IBOutlet weak var detailTopImage: UIImageView!
    @IBOutlet weak var detailTopTitleLbl: UILabel!
    @IBOutlet weak var detailTOpDateLbl: UILabel!
    @IBOutlet weak var detailView: UITextView!
    
    
    var detailTopRatedObject:TopResults?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let imageLink = "https://image.tmdb.org/t/p/w342/"
        let completeLink = (imageLink + detailTopRatedObject!.poster_path!)
        detailTopImage.downloaded(from: completeLink)
        
        detailTopTitleLbl.text = detailTopRatedObject?.original_title
        detailTOpDateLbl.text = detailTopRatedObject?.release_date
        detailView.text = detailTopRatedObject?.overview
        
    }
}
