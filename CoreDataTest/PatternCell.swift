//
//  PatternCell.swift
//  CoreDataTest
//
//  Created by yishain chen on 2016/3/27.
//  Copyright © 2016年 Inno-orz. All rights reserved.
//

import UIKit

struct pattern {
    let image: String
    let name: String
}

class PatternCell: UITableViewCell {

    @IBOutlet weak var patternNameLabel: UILabel!
    @IBOutlet weak var patternImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
