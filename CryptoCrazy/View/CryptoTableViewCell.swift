//
//  CryptoTableViewCell.swift
//  CryptoCrazy
//
//  Created by TOS ANALYTICS on 14.04.2021.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
