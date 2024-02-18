//
//  DetailsTableViewCell.swift
//  ParseArrayJSON
//
//  Created by Daniil Zolotarev on 20.01.24.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
