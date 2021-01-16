//
//  UpcomingViewController.swift
//  MovieFlex
//
//  Created by mehtab alam on 15/01/2021.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Instance Created
    private var serviceInstance = Service()
    var upcomingObject = [UpcomingResult]()
    
    //MARK:- UI components for showing Activity indicator
    private let messageView: MessageView = {
        let view = MessageView(showCancelButton: false, addBlurBackground: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Function call
        getDataForUpcomingRated()
        
        //activity indicator function call
        showActivityIndicator(messageView:messageView)
        
        print("viewDidLoad")
    }
    
    //MARK:- Function For Get Data From Srver
    func getDataForUpcomingRated() {
        serviceInstance.getRequest(url: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed", decodingType: UpcomingModel.self) { (result) in
            
            switch result {
            case.success(let data):
                self.upcomingObject = data.results!
                print("upcomingObject\(self.upcomingObject)")
                DispatchQueue.main.async {
                    self.messageView.isHidden = true
                    self.messageView.animateActivityIndicator(animate: false)
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.messageView.isHidden = false
                self.messageView.animateActivityIndicator(animate: true)
            }
        }
    }
}

//MARK:- Extention For TableView DataSource
extension UpcomingViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingTableViewCell", for: indexPath) as! UpcomingTableViewCell
        let upcomingData = upcomingObject[indexPath.row]
        cell.configCellForUpcoming(data: upcomingData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let UCDVC = self.storyboard?.instantiateViewController(identifier: "UpcomingDetailViewController") as! UpcomingDetailViewController
        UCDVC.detailUpcomingObject = upcomingObject[indexPath.row]
        self.navigationController?.pushViewController(UCDVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
