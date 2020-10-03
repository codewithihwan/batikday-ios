//
//  BatikCell.swift
//  batikday
//
//  Created by Ihwan ID on 03/10/20.
//

import UIKit

class BatikCell: UITableViewCell {

    @IBOutlet weak var imageBatik: UIImageView!
    @IBOutlet weak var labelBatik: UILabel!

    func configure(with model: Batik){
        labelBatik.text = model.nama_batik!
        imageBatik.load(url: URL(string: model.link_batik!)!)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
