//
//  GroupListViewController.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import UIKit

protocol GroupListDelegate: AnyObject {
    func updateView()
    func showErrorAlert(message: String)
}

class GroupListViewController: ParentViewController {
    private let TAG = String(describing: self)
    
    @IBOutlet weak var container_view_loading: UIView!
    @IBOutlet weak var progress_indicator: UIActivityIndicatorView!
    @IBOutlet weak var tv_loading: UILabel!
    @IBOutlet weak var table_view: UITableView!
    
    private var _presenter: GroupListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _presenter = GroupListPresenter(view: self)
        
        configureNavigationBar()
        configureView()

        loadData()
    }
    
    private func configureView() {
        tv_loading.text = Literals.msg_loading_groups
        
        configureTableView()
    }
    
    private func configureNavigationBar() {
        let buttonRefresh = UIButton(type: .custom)
        buttonRefresh.frame = CGRect(x: 0, y: 0, width: 0, height: 5)
        buttonRefresh.setImage(UIImage(named: "refresh_black"), for: UIControl.State.normal)
        buttonRefresh.addTarget(self, action: #selector(refreshButtonAction), for: .touchUpInside)
        
        
        let labelFavourite = UILabel()
        labelFavourite.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        labelFavourite.text = "FAV"
        
        let barButtonRefresh = UIBarButtonItem(customView: buttonRefresh)
        let barButtonFavourite = UIBarButtonItem(customView: labelFavourite)
        
        navigationItem.setRightBarButtonItems([barButtonFavourite, barButtonRefresh], animated: true)
    }
    
    private func configureTableView() {
        table_view.delegate   = self
        table_view.dataSource = self
        table_view.rowHeight  = 200
    }
    
    private func loadData() {
        switchDataVisibility()
        
        _presenter?.getData(isNewSearch: true)
    }
    
    @objc private func refreshButtonAction() {
        loadData()
    }
    
    private func switchDataVisibility() {
        table_view.isHidden             = !table_view.isHidden
        container_view_loading.isHidden = !table_view.isHidden
        
        if container_view_loading.isHidden {
            progress_indicator.stopAnimating()
            
        } else {
            progress_indicator.startAnimating()
        }
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
        return _presenter?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table_view.dequeueReusableCell(withIdentifier: GroupListCell.reuseIdentifier, for: indexPath) as? GroupListCell else {
            fatalError("The dequeued cell is not an instance of GroupListCell.")
        }
        
        cell.setData(group: _presenter!.list[indexPath.row])
        
        return cell
    }
}

extension GroupListViewController: GroupListDelegate {
    func updateView() {
        switchDataVisibility()
        
        table_view.reloadData()
    }
    
    func showErrorAlert(message: String) {
        progress_indicator.stopAnimating()
        progress_indicator.isHidden = true
        
        tv_loading.text = Literals.msg_no_groups
        
        let alert = UIAlertController(title: Literals.alert_error_title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: Literals.alert_error_accept_button,
                                      style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
