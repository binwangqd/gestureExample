//
//  AllRecordsVC.swift
//  GestureExample
//
//  Created by Bin Wang on 2017-12-07.
//  Copyright © 2017 Bin Wang. All rights reserved.
//

import UIKit

class AllRecordsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "All Options"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppSession.shared.allRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = AppSession.shared.allRecords[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as! RecordCell
        cell.configureCell(record: record)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let record = AppSession.shared.allRecords[indexPath.row]
        
        var editAction = UITableViewRowAction()
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 56))
        backView.backgroundColor = UIColor.red
        
        let myImage = UIImageView(frame: CGRect(x: 30, y: 10, width: 20, height: 20))
        
        backView.addSubview(myImage)
        
        let label = UILabel(frame: CGRect(x: 0, y: myImage.frame.origin.y+20, width: 80, height: 25))
        
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: label.font.fontName, size: 14)
        backView.addSubview(label)
        
        if AppSession.shared.favorite.contains(record.recordNo){
            editAction = UITableViewRowAction(style: .default, title: "          ", handler: { (action, indexPath) in
                AppSession.shared.favorite = AppSession.shared.favorite.filter{$0 != record.recordNo}
                AppSession.shared.updateFavorite()
                tableView.reloadData()
            })
            backView.backgroundColor = UIColor.red
            myImage.image = UIImage(named: "white-heart")
            label.text = "Remove"
        }else{
            editAction = UITableViewRowAction(style: .default, title: "          ", handler: { (action, indexPath) in
                AppSession.shared.favorite.append(record.recordNo)
                AppSession.shared.updateFavorite()
                tableView.reloadData()
            })
            backView.backgroundColor = UIColor(red: 0, green: 204/255, blue: 0, alpha: 1)
            myImage.image = UIImage(named: "white-heart")
            label.text = "Add"
        }
        let imgSize: CGSize = tableView.frame.size
        UIGraphicsBeginImageContextWithOptions(imgSize, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        backView.layer.render(in: context!)
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        editAction.backgroundColor = UIColor(patternImage: newImage)
        return [editAction]
    }

}

