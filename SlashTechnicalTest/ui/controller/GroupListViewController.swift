//
//  GroupListViewController.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import UIKit

class GroupListViewController: UIViewController {
    private let TAG = String(describing: self)
    
    @IBOutlet weak var table_view: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
        configureTableView()
    }
    
    private func configureTableView() {
        table_view.delegate   = self
        table_view.dataSource = self
        table_view.rowHeight  = 200
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

extension GroupListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Navigate to GroupDetailViewController
        performSegue(withIdentifier: "segueToGroupDetailViewController", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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

        // cell.setData()
        
        return cell
    }
}
