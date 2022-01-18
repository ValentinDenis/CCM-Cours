//
//  ViewController.swift
//  CCM Cours
//
//  Created by Valentin Denis on 17/01/2022.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var compteurLabel: UILabel!
    @IBOutlet weak var compteurButton: UIButton!
    @IBOutlet weak var goToTableButton: UIButton!
    @IBOutlet weak var catImageView: UIImageView!
    
    //Properties
    var compteurValue: Int = 0 {
        didSet {
            compteurLabel.text = "Compteur: \(compteurValue)"
            catImageView.isHidden = compteurValue < 10
        }
    }
    
    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Miaou"
        
        compteurLabel.textColor = .blue
        compteurLabel.font = .systemFont(ofSize: 14.0, weight: .bold)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    //Actions
    @IBAction func didTouchCompteurAction(_ sender: Any) {
        compteurValue += 1
    }
    
    @IBAction func goToTableAction(_ sender: Any) {
        //Here we go to table
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ListVCID") as? ListViewController
        vc?.passedCar = Car(name: "", make: "", image: UIImage.add)
        vc?.passedString = "Coucou"
        
        if let vc = vc {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

