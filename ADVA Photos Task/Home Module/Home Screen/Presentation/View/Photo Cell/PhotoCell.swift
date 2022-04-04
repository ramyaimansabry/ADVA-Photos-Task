//
//  PhotoCell.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 03/04/2022.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var ownerProfileImageView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var data: PhotoData? {
        didSet {
            setImage(using: data?.urls?.regular)
            setOwnerProfileImage(using: data?.sponsorship?.sponsor?.profileImage?.small)
            setTitleLabel(using: data?.user?.name)
            setSubTitleLabel(using: data?.sponsorship?.tagline)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.layer.cornerRadius = 10
        photoImageView.layer.masksToBounds = true
        
        ownerProfileImageView.layer.cornerRadius = 12.5
        ownerProfileImageView.layer.masksToBounds = true
    }

    private func setImage(using url: String?) {
        photoImageView.sd_setImage(with: URL(string: url.value), completed: nil)
    }
    
    private func setOwnerProfileImage(using url: String?) {
        ownerProfileImageView.sd_setImage(with: URL(string: url.value), completed: nil)
        ownerProfileImageView.isHidden = url.isNil
    }
    
    private func setTitleLabel(using value: String?) {
        titleLabel.text = value.value
        titleLabel.isHidden = value.isNil
    }
    
    private func setSubTitleLabel(using value: String?) {
        subTitleLabel.text = value.value
        subTitleLabel.isHidden = value.isNil
    }
}
