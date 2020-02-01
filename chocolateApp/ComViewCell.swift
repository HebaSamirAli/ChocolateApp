//
//  ComTableViewCell.swift
//  abseil
//
//  Created by HebaMac on 1/29/20.
//

import UIKit

class ComViewCell: UICollectionViewCell {
    
// cell items
    
    @IBOutlet weak var cellimg: UIImageView!
    @IBOutlet weak var celllbl: UILabel!
    
/*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
*/
    func setProduct(product: Products) {
        cellimg.image = product.img
        celllbl.text = product.title
    }
    
}
