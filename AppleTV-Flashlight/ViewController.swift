//
//  ViewController.swift
//  AppleTV-Flashlight
//
//  Created by Abhilash k George on 01/12/22.
//

import UIKit
import GameplayKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    var activeCells = [IndexPath]()
    var flashSequence = [IndexPath]()
    var levelCounter = 0
    
    let levels = [
    [6,7,8],
    [1,3,11,13],
    [5,6,7,8,9],
    [0,4,5,9,10,14],
    [1,2,3,7,11,12,13],
    [0,2,4,5,9,10,12,14],
    [1,2,3,6,7,8,11,12,13],
    [0,1,2,3,4,10,11,12,13,14],
    [1,2,3,4,5,6,7,8,9,10,13],
    [0,1,2,3,4,5,6,7,10,11,12,13],
    [0,1,2,3,4,6,7,8,9,10,11,12,13],
    [0,1,2,3,4,5,6,8,9,10,11,12,13,14],
    [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
    
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createLevel()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    }
    
    func createLevel() {
        guard levelCounter < levels.count else {return}
        
        resultImage.alpha = 0
        
        collectionView.visibleCells.forEach({$0.isHidden = true})
        
        activeCells.removeAll()
        
        
        for item in levels[levelCounter] {
            let indexPath = IndexPath(item: item, section: 0)
            activeCells.append(indexPath)
            
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.isHidden = false
        }
        
        activeCells = (activeCells as NSArray).shuffled() as! [IndexPath]
        flashSequence = Array(activeCells.dropFirst())
    }


}

