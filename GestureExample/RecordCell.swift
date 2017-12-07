//
//  RecordCell.swift
//  GestureExample
//
//  Created by Bin Wang on 2017-12-07.
//  Copyright © 2017 Bin Wang. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {
    
    @IBOutlet weak var favoriteIcon: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    func configureCell(record: Record){
        self.favoriteIcon.isHidden = !(AppSession.shared.favorite.contains(record.recordNo))
        self.detailLabel.text = record.recordDesc
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
