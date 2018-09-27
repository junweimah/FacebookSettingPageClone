//
//  ViewController.swift
//  FacebookSettingFinal
//
//  Created by Tandem on 21/06/2018.
//  Copyright © 2018 Tandem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tvSetting: UITableView!
    
    let sampleData = [
        ["Privacy","Control who sees what you share on Facebook, and manage data that helps us personalise experience",["Review a few important privacy settings", "Learn about your privacy on Facebook", "Manage your location settings", "Control face recognition"]],
        ["Account Security","Take actions to make your account more secure",["Review a few important privacy settings", "Learn about your privacy on Facebook", "Manage your location settings"]],
        ["Privacy 3","Control who sees what you share on Facebook, and manage data that helps us personalise experience",["Review a few important privacy settings", "Learn about your privacy on Facebook"]],
        ["Privacy 4","Control who sees what you share on Facebook, and manage data that helps us personalise experience",["Review a few important privacy settings"]]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.98, green:0.97, blue:0.98, alpha: 0.8)
        
        tvSetting.delegate = self
        tvSetting.dataSource = self
        
        tvSetting.backgroundColor = UIColor.clear
        
        tvSetting.showsVerticalScrollIndicator = false
        
        //add these 2 lines to solve the dynamic header height problem
        tvSetting.sectionHeaderHeight = UITableViewAutomaticDimension;
        tvSetting.estimatedSectionHeaderHeight = 238;
        
        //this to control the seperator line
//        tvSetting.separatorInset = UIEdgeInsetsMake(0, 100, 0, 0)  //top, left, bottom, right
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sampleData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let childArray = sampleData[section][2] as? [String]
        if(section == 0) {
            return (childArray?.count)!
        } else if(section == 1) {
            return (childArray?.count)!
        }else if(section == 2){
            return (childArray?.count)!
        }else {
            return (childArray?.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell_Identifier") as! HeaderTableViewCell
        
        //if get data from backend, just remove this whole switch statement, use below code
        switch (section) {
        case 0:
            headerCell.ivHeader.image = UIImage(named: "header1");
        case 1:
            headerCell.ivHeader.image = UIImage(named: "header2");
        case 2:
            headerCell.ivHeader.image = UIImage(named: "header1");
        default:
            headerCell.ivHeader.image = UIImage(named: "header2");
        }
        
//        headerCell.lblTitle.text = sampleData[section][0] as? String; //if set image from api, just use like this
        headerCell.lblTitle.text = sampleData[section][0] as? String;
        headerCell.lblSubtitle.text = sampleData[section][1] as? String;
        
        return headerCell

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowDataCell = tableView.dequeueReusableCell(withIdentifier: "RowDataTableViewCell_Identifier") as! RowDataTableViewCell
        
        if indexPath.item == 1 {
            rowDataCell.ivRowIcon.image = UIImage(named: "sub-image-1")
        }else if (indexPath.item == 2){
            rowDataCell.ivRowIcon.image = UIImage(named: "sub-image-2")
        }else{
            rowDataCell.ivRowIcon.image = UIImage(named: "sub-image-3")
        }
        
        let childArray = sampleData[indexPath.section][2] as? [String]
        rowDataCell.lblRowTitle.text = childArray?[indexPath.item]
        
        if indexPath.row + 1 == childArray?.count { //last cell, set corner radius
            let rectShape = CAShapeLayer()
            rectShape.bounds = rowDataCell.frame
            rectShape.position = rowDataCell.center
            rectShape.path = UIBezierPath(roundedRect: rowDataCell.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
            rowDataCell.layer.mask = rectShape
        }else{
            print("mask : ", rowDataCell.layer.mask)
            if(rowDataCell.layer.mask != nil){
                print("cell mask is not nil")
                rowDataCell.layer.mask = nil
            }
        }
        
        rowDataCell.layer.masksToBounds = true
        return rowDataCell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You selected cell #\(indexPath.item) for section : \(indexPath.section)")
    }
    
}
