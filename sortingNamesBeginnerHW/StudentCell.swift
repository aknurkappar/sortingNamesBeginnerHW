//
//  StudentCell.swift
//  sortingNamesBeginnerHW
//
//  Created by коня on 05.10.2023.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var surname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
