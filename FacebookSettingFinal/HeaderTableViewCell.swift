//
//  HeaderCollectionViewCell.swift
//  FacebookSettingFinal
//
//  Created by Tandem on 21/06/2018.
//  Copyright © 2018 Tandem. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var ivHeader: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.white
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        self.layer.mask = rectShape

        //this to show shadow
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 1)
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowRadius = 3
//        self.layer.masksToBounds = false
    }
}
