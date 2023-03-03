//
//  NoButtonNotificationTableViewCell.swift
//  TBV_CLTV
//
//  Created by Vu Khanh on 03/03/2023.
//

import UIKit

class NoButtonNotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var imvAvata: UIImageView!
    var fontSize:CGFloat { return 16 }
    var boldFont:UIFont { return UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "AvenirNext-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        // Initialization code
    }
    
    func setUpView() {
        self.imvAvata.layer.cornerRadius = self.imvAvata.frame.width/2
        self.imvAvata.layer.masksToBounds = true
        
    }

    func configure(item: NotificationModel) {
        self.imvAvata.image = UIImage(named: item.imgUrl)
        self.lbDescription.attributedText = getTextNotification(title: item.title, detail: item.detail)
    }
    
    func getTextNotification(title: String, detail: String) -> NSMutableAttributedString {
        
        var boldStr = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: boldFont])
        let normalStr = NSMutableAttributedString(string: " \(detail)", attributes: [NSAttributedString.Key.font: normalFont])
        
        boldStr.append(normalStr)
        return boldStr
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
