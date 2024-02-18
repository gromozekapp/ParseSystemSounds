//
//  ViewController.swift
//  ParseArrayJSON
//
//  Created by Daniil Zolotarev on 20.01.24.
//

import UIKit
import AudioToolbox

struct ArrayModel: Codable {
    var id: Int
    var name: String
    var category: String
}
//MARK: -
class ViewController: UIViewController {
    
    var model = [ArrayModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchingJsonArray()
    }
//MARK: -
    func fetchingJsonArray() {
        guard let fileLocation = Bundle.main.url(forResource: "Sounds", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: fileLocation)
            let result = try JSONDecoder().decode([ArrayModel].self, from: data)
            self.model = result
        }catch{
            print("Parsing Error")
        }
    }
}
//MARK: -
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailsTableViewCell
        cell.idLbl.text = String(model[indexPath.row].id)
        cell.nameLbl.text = model[indexPath.row].name
        cell.categoryLbl.text = model[indexPath.row].category
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AudioServicesPlaySystemSound(SystemSoundID(model[indexPath.row].id))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
