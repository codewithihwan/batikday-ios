//
//  ViewController.swift
//  batikday
//
//  Created by Ihwan ID on 03/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var listBatik = [Batik]()
    let url = "https://batikita.herokuapp.com/index.php/batik/all"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        getBatikData()
    }

    func getBatikData(){
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in

            guard let data = data, error == nil else{
                print(error)
                return
            }

            var result: BatikResponse?
            do{
                result = try JSONDecoder().decode(BatikResponse.self, from: data)
            }catch{

            }

            DispatchQueue.main.async {
                self.listBatik = result!.hasil
                self.tableView.reloadData()
            }
        }.resume()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetail"){
            guard let object = sender as? Batik else { return }
            let vc = segue.destination as! DetailViewController
            vc.batik = object
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBatik.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: listBatik[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "batikcell", for: indexPath) as! BatikCell
        cell.configure(with: listBatik[indexPath.row])
        return cell
    }


}
