//
//  TableViewCell.swift
//  TableViewRxSwift
//
//  Created by Nathaniel Whittington on 3/19/22.
//

import UIKit

class CustomCell: UITableViewCell {

   
    @IBOutlet weak var tlbLabel: UILabel!
    
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
