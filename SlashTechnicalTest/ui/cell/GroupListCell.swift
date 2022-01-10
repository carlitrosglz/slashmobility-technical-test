//
//  GroupListCell.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import UIKit
import AVKit
import AVFoundation
import Kingfisher

class GroupListCell: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descriptionShort: UILabel!
    
    class var reuseIdentifier: String { return "GroupListCell" }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureView() {
        name.textColor             = .black
        date.textColor             = .black
        descriptionShort.textColor = .black
        
        name.backgroundColor             = UIColor(white: 1, alpha: 0.6)
        date.backgroundColor             = UIColor(white: 1, alpha: 0.6)
        descriptionShort.backgroundColor = UIColor(white: 1, alpha: 0.6)
        
    }
    
    public func setData(group: Group) {
        let url = URL(string: group.urlImage!)
        
        name.text = group.name!
        date.text = DateHelper.convertIntToFormattedDate(ms: group.date!, format: "dd/MM/yyyy")
        descriptionShort.text = group.descriptionShort!
        groupImage.kf.setImage(with: ImageResource(downloadURL: url!))
    }
}
