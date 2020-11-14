//
//  BreedsViewController.swift
//  Breeds
//
//  Created by Sergey on 11/12/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class BreedsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var objects: [BreedsData] = []
    var breedNames: [String] = [""]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup Table View
        tableView.delegate = self
        tableView.dataSource = self
        getBreeds { [self] in
            for i in 0..<result!.count {
                breedNames.append(result![i].name)
                
            }
            if result != nil {
                objects = result!
            } else {
                return
            }
            breedNames.remove(at: 0)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ToDetail" {
            let destVC = segue.destination as! DetailBreedsViewController
            destVC.objects = sender as? BreedsData
        }
    }


}

extension BreedsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breedNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedCell", for: indexPath) as! BreedsTableViewCell
        cell.breedsNameLabel.text = breedNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let object = self.objects[indexPath.row]
        performSegue(withIdentifier: "ToDetail", sender: object)
        
    }
    
}
