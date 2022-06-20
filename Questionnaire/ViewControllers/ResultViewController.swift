//
//  ResultViewController.swift
//  Questionnaire
//
//  Created by Nikolai Maksimov on 19.06.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        var animals: [Animal] = []
        
        for answer in answers {
            animals.append(answer.animal)
        }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted {$0.value > $1.value}
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
        
    }
    
    private func updateUI(with animal: Animal?) {
        animalLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        answerLabel.text = animal?.definition ?? ""
    }
}
