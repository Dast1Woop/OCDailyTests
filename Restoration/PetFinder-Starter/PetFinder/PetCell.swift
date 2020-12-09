//
//  PetCell.swift
//  PetFinder
//
//  Created by Luke Parham on 9/1/15.
//  Copyright © 2015 Luke Parham. All rights reserved.
//

import UIKit

class PetCell: UICollectionViewCell {
  
  @IBOutlet weak var profileImageView: UIImageView!
  
    override var isSelected: Bool {
    didSet {
        profileImageView.alpha = isSelected ? 0.5 : 1.0
    }
  }
  
  private var currentPet: Pet!
  private var currentPetId = 0

  var petId: Int {
    get {
      return currentPetId
    }
    set(newPetId) {
      currentPetId = newPetId
        currentPet = MatchedPetsManager.sharedManager.petForId(id: petId)!
      
        profileImageView.image = UIImage(data: currentPet.imageData as Data)
    }
  }
  
  override func prepareForReuse() {
    profileImageView.image = UIImage(data: currentPet.imageData as Data)
  }
  
  override func layoutSubviews() {
    profileImageView.image = UIImage(data: currentPet.imageData as Data)

    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 2.0
    layer.cornerRadius = 4.0
  }
}
