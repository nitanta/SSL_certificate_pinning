//
//  ViewController.swift
//  SSL_certpinning
//
//  Created by Nitanta Adhikari on 10/11/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var refreshControl = UIRefreshControl()
    
    var users: [User] = [] {
        didSet {
            if refreshControl.isRefreshing {
                refreshControl.endRefreshing()
            }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        loadData()
    }

    private func loadData() {
        NetworkClient
            .request(Router.users)
            .responseDecodable { (response: DataResponse<UserList, AFError>) in
                switch response.result {
                case .success(let value):
                    self.users = value.users
                case .failure(let error):
                    let isServerTrustEvaluationError =  error.asAFError?.isServerTrustEvaluationError ?? false
                    let message: String
                    if isServerTrustEvaluationError {
                        message = "Certificate Pinning Error"
                    } else {
                        message = error.localizedDescription
                    }
                    self.presentError(withTitle: "Oops!", message: message)
                }
            }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = user.displayName
        return cell
    }
}

extension UIViewController {
    func presentError(withTitle title: String, message: String, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .default)]) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        actions.forEach { action in
            alertController.addAction(action)
        }
        present(alertController, animated: true)
    }
}
