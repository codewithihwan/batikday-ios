//
//  DetailViewController.swift
//  batikday
//
//  Created by Ihwan ID on 04/10/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageBatik: UIImageView!

    @IBOutlet weak var originBatik: UILabel!
    @IBOutlet weak var nameBatik: UILabel!

    @IBOutlet weak var meanBatik: UILabel!

    var batik: Batik?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = batik {
            nameBatik.text = result.nama_batik
            originBatik.text = result.daerah_batik
            meanBatik.text = result.makna_batik
            imageBatik.load(url: URL(string: result.link_batik!)!)
        }

    }
    


}
