//
//  ArrayCell.swift
//  SortedArray
//
//  Created by Angelos Staboulis on 2/4/21.
//

import UIKit

class ArrayCell: UITableViewCell {

    @IBOutlet var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
            self.accessoryType = .none
       
    }
    
    
}
