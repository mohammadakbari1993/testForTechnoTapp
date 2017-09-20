//
//  TableViewCell.swift
//  A
//
//  Created by MacBook Pro on 1396/6/27 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var Bgimabe: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!

    @IBOutlet weak var familyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
