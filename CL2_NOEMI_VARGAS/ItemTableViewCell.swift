//
//  ItemTableViewCell.swift
//  CL2_NOEMI_VARGAS
//
//  Created by DAMII on 29/10/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var lblDni: UILabel!
    
    
    @IBOutlet weak var lblCliente: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
