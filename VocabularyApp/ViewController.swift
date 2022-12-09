//
//  ViewController.swift
//  VocabularyApp
//
//  Created by Melih on 6.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText1: UILabel!
    @IBOutlet weak var labelText2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        
        }
    
    private func parseJSON(){
        guard let path = Bundle.main.path(forResource: "Vocabulary", ofType: "json") else { return }
        let url = URL(filePath: path)
        var result: Result?
        do{
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
            
             if let result = result {
                let randomInt1 = Int.random(in: 0..<6)
                let randomInt2 = Int.random(in: 0..<3)

                print(randomInt1)
                print(randomInt2)

                labelText1.text = result.data[randomInt1].item[randomInt2].german
                labelText2.text = result.data[randomInt1].item[randomInt2].turkish
                
            } else {
                print("Failed to Parse")
            }
            return
        } catch {
            print(error)
        }
    }
}
