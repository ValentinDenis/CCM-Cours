//
//  ListViewController.swift
//  CCM Cours
//
//  Created by Valentin Denis on 17/01/2022.
//

import UIKit
import Alamofire

class ListViewController: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Properties
    private var datasource: [String] = []
    public var passedCar: Car?
    public var passedString: String?
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Je dis au tableau que je suis le delegate et le datasource, je vais implémenter ces interfaces
        tableView.dataSource = self
        tableView.delegate = self
        
        //Automatic dimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        self.loadDogFacts()
    }
    
    //Private Functions
    private func loadDogFacts() {
        let parameters: Parameters = ["number": 5]

        AF.request("https://dog-api.kinduff.com/api/facts", method: .get, parameters: parameters)
            .validate(statusCode: [200])
            .responseDecodable(of: DogFactResponse.self) {[weak self] resp in
                switch resp.result {
                case .success(let dogfactresponse):
                    //Attribuer à un datasource local
                    //Mettre à jour mon tableau
                    print("Success: \(dogfactresponse.success ?? false)")
                    self?.datasource = dogfactresponse.facts ?? []
                    self?.tableView.reloadData()
                    
                case .failure(let aferror):
                    print(aferror.localizedDescription)
                }
            }
    }
    
    private func storeToUserDefaults(valueToStore value: String) {
        let ud = UserDefaults.standard
        ud.set(value, forKey: "stored_value")
    }
    
    private func getFromUserDefaults() -> String? {
        let ud = UserDefaults.standard
        let stringSaved = ud.string(forKey: "stored_value")
        return stringSaved
    }
}

extension ListViewController: UITableViewDelegate {
    
}

//Implémentation de l'interface UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    //Le nombre de lignes dans mon tableau
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    //Le nombre de sections dans mon tableau
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Mon tableau me demande (car je (self) suis le "delegate") la cellule à afficher à l'index donné
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Je récupère le fact au bon index dans mon datasource
        let fact = datasource[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCellID", for: indexPath) as? CarTableViewCell
        
        //J'assigne aux bonnes propriétés
        cell?.modeleLabel.text = fact
        cell?.carImageView.image = nil
        
        //Je renvoie la cellule
        if let cell = cell {
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    
}
