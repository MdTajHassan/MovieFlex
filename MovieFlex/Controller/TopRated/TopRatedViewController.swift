//
//  TopRatedViewController.swift
//  MovieFlex
//
//  Created by mehtab alam on 15/01/2021.
//

import UIKit

class TopRatedViewController: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Instance Created
    private var serviceInstance = Service()
    var topRatedObject = [TopResults]()
    
    //MARK:- UI components for showing Activity indicator
    private let messageView: MessageView = {
        let view = MessageView(showCancelButton: false, addBlurBackground: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Function Call
        getDataForTopRated()
        
        //activity indicator function call
        showActivityIndicator(messageView:messageView)
        print("viewDidLoad")
    }
    
    //MARK:- Function For Get Data From Srver
    func getDataForTopRated() {
        serviceInstance.getRequest(url: "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed", decodingType: TopRatedModel.self) { (result) in
            
            switch result {
            case.success(let data):
                self.topRatedObject = data.results!
                print("topRatedObject\(self.topRatedObject)")
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
extension TopRatedViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topRatedObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopRatedTableViewCell", for: indexPath) as! TopRatedTableViewCell
        let topRatedData = topRatedObject[indexPath.row]
        cell.configCellForTopRated(data: topRatedData)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let TRVC = self.storyboard?.instantiateViewController(identifier: "TopRatedDetailViewController") as! TopRatedDetailViewController
        TRVC.detailTopRatedObject = topRatedObject[indexPath.row]
        self.navigationController?.pushViewController(TRVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
