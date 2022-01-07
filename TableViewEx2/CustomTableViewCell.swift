//
//  CustomTableViewCell.swift
//  TableViewEx2
//
//  Created by kakao on 2022/01/07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
