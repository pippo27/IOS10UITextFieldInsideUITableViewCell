//
//  TopicTableViewCell.swift
//  IOS10UITextFieldInsideUITableViewCell
//
//  Created by Arthit Thongpan on 3/4/17.
//  Copyright © 2017 Arthit Thongpan. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bgHeaderView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var topic: Topic! {
        didSet {
            titleLabel.text = "หัวข้อ: \(topic.title)"
            detailLabel.text = "รายละเอียด: \n\n\(topic.detail)"
            nameLabel.text = "โดย: \(topic.name)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5.0
        containerView.clipsToBounds = true
        bgHeaderView.round([.topLeft, .topRight], radius: 5.0)
        
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(false, animated: true)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        containerView.showShadow()
    }
}
