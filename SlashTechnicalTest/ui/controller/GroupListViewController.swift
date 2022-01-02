//
//  GroupListViewController.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import UIKit

class GroupListViewController: ParentViewController {
    private let TAG = String(describing: self)
    
    @IBOutlet weak var table_view: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    private func configureView() {
        configureTableView()
    }
    
    private func configureTableView() {
        table_view.delegate   = self
        table_view.dataSource = self
        table_view.rowHeight  = 200
    }
}

extension GroupListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Navigate to GroupDetailViewController
        performSegue(withIdentifier: "segueToGroupDetailViewController", sender: self)
    }
}

extension GroupListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table_view.dequeueReusableCell(withIdentifier: GroupListCell.reuseIdentifier, for: indexPath) as? GroupListCell else {
            fatalError("The dequeued cell is not an instance of GroupListCell.")
        }

        cell.setData()
        
        return cell
    }
}
