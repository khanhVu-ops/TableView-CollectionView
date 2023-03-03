//
//  PhotoCollectionViewCell.swift
//  TBV_CLTV
//
//  Created by Vu Khanh on 03/03/2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lbPhoto: UILabel!
    @IBOutlet weak var imvPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(item: PhotoModel) {
        self.imvPhoto.image = UIImage(named: item.imgUrl)
        self.lbPhoto.text = item.title
    }

}
