//
//  MatchedPetsCollectionViewController.swift
//  PetFinder
//
//  Created by Luke Parham on 8/31/15.
//  Copyright © 2015 Luke Parham. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PetCell"

class MatchedPetsCollectionViewController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    clearsSelectionOnViewWillAppear = false
    
    collectionView!.backgroundColor = UIColor.clear
    
    title = "Matches"
  }
  
    override func viewDidAppear(_ animated: Bool) {
        let selectedItems: [IndexPath]? = collectionView?.indexPathsForSelectedItems
    if selectedItems?.count != 0 {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: { () -> Void in
            self.collectionView!.deselectItem(at: (selectedItems?.first)! as IndexPath, animated: true)
        }, completion: nil)
    }
    
  }
  
    override func viewWillAppear(_ animated: Bool) {
        if MatchedPetsManager.sharedManager.matchedPets.count != collectionView?.numberOfItems(inSection: 0) {
      collectionView?.reloadData()
    }
  }
  
  // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell: PetCell? = sender as? PetCell
        let vc: PetDetailsViewController? = segue.destination as? PetDetailsViewController
        
        if let cell = cell, let vc = vc {
            cell.isSelected = true
          vc.petId = cell.petId
        }
    }
  
  // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MatchedPetsManager.sharedManager.matchedPets.count
    }
  
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = 
        collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PetCell
        cell.petId = MatchedPetsManager.sharedManager.matchedPets[indexPath.row].id
        
        return cell
    }
  
  // MARK: UICollectionViewDelegate
  
  // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
  
  // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }
  
    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
}
