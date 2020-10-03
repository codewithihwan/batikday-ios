//
//  Batik.swift
//  batikday
//
//  Created by Ihwan ID on 03/10/20.
//

import Foundation

struct BatikResponse: Codable{
    let hasil: [Batik]
}

struct Batik: Codable{
    let id: Int?
    let nama_batik: String?
    let link_batik: String?
    let daerah_batik: String?
    let makna_batik: String?
    let harga_rendah: Int?
    let harga_tinggi: Int?
}
