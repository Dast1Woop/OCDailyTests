//
//  FirstViewController.swift
//  PetFinder
//
//  Created by Luke Parham on 8/31/15.
//  Copyright © 2015 Luke Parham. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController, CAAnimationDelegate {
    
    @IBOutlet weak var petProfileView: UIView!
    @IBOutlet weak var petProfilePictureImageView: UIImageView!
    @IBOutlet weak var petNameAgeLabel: UILabel!
    
    var originalProfileCenter = CGPoint.zero
    var lastTouchPoint = CGPoint.zero
    
    var currentPet = Pet.randomPet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPetProfile()
        
        petProfileView.layer.cornerRadius = 8.0
        
        petProfilePictureImageView.layer.cornerRadius = 8.0
        petProfilePictureImageView.backgroundColor = UIColor.lightGray
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(IntroductionViewController.didPan(pan:)))
        petProfileView.addGestureRecognizer(pan)
    }
    
    override func viewDidLayoutSubviews() {
        originalProfileCenter = petProfileView.center
        view.bringSubviewToFront(petProfileView)
    }
    
    @IBAction func rejectButtonWasTapped(sender: UIButton) {
        animateProfileViewLeft()
    }
    
    @IBAction func acceptButtonWasTapped(sender: UIButton) {
        animateProfileViewRight()
    }
    
    @objc func didPan(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            lastTouchPoint = pan.location(in: view)
        case .changed:
            let deltaX = pan.location(in: view).x - lastTouchPoint.x
            let deltaY = pan.location(in: view).y - lastTouchPoint.y
            
            petProfileView.center = CGPoint(x: petProfileView.center.x + deltaX, y: petProfileView.center.y + deltaY)
            lastTouchPoint = pan.location(in: view)
        case .ended:
            let velocity = pan.velocity(in: view)
            
            if abs(velocity.x) < 100 && abs(velocity.y) < 100 {
                animateProfileViewToOriginalPostion()
            } else {
                animateProfileViewOffscreen(withVelocity: velocity)
            }
        case .cancelled, .failed:
            animateProfileViewToOriginalPostion()
        default:
            break
        }
    }
    
    func animateProfileViewOffscreen(withVelocity velocity: CGPoint) {
        if petProfileView.center.x < UIScreen.main.bounds.size.width/2.0 {
            animateProfileViewLeft()
        } else {
            animateProfileViewRight()
        }
    }
    
    func animateProfileViewLeft() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.toValue = NSValue(cgPoint: CGPoint(x: -(petProfileView.bounds.size.width), y: petProfileView.center.y))
        animation.fromValue = NSValue(cgPoint: petProfileView.center)
        animation.duration = 0.25
        animation.timingFunction =  CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.isRemovedOnCompletion = true
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            self.resetPet()
        }
        
        petProfileView.layer.add(animation, forKey: "position")
        petProfileView.layer.position = (animation.toValue! as AnyObject).cgPointValue
        CATransaction.commit()
    }
    
    func animateProfileViewRight() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.toValue = NSValue(cgPoint: CGPoint(x: UIScreen.main.bounds.size.width + petProfileView.bounds.size.width, y: petProfileView.center.y))
        animation.fromValue = NSValue(cgPoint: petProfileView.center)
        animation.duration = 0.25
        animation.timingFunction =  CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.isRemovedOnCompletion = true
        
        animation.delegate = self
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            if let image = self.petProfilePictureImageView.image {
                self.currentPet.imageData = image.jpegData(compressionQuality: 0)! as NSData
            }
            self.currentPet.id = MatchedPetsManager.sharedManager.matchedPets.count + 1
            MatchedPetsManager.sharedManager.addPet(pet: self.currentPet)
            self.resetPet()
        }
        
        petProfileView.layer.add(animation, forKey: "position")
        petProfileView.layer.position = (animation.toValue! as AnyObject).cgPointValue
        CATransaction.commit()
    }
    
    func resetPet() {
        petProfileView.alpha = 0.0
        petProfilePictureImageView.image = nil
        currentPet = Pet.randomPet()
        setPetProfile()
        petProfileView.center = originalProfileCenter
        fadeInProfileView()
    }
    
    func animateProfileViewToOriginalPostion() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.toValue = NSValue(cgPoint: originalProfileCenter)
        animation.fromValue = NSValue(cgPoint: petProfileView.center)
        animation.duration = 0.25
        animation.timingFunction =  CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.isRemovedOnCompletion = true
        
        petProfileView.layer.add(animation, forKey: "position")
        petProfileView.layer.position = (animation.toValue! as AnyObject).cgPointValue
    }
    
    func fadeInProfileView() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.toValue = NSNumber(value: 1.0)
        animation.fromValue = NSNumber(value: 0.0)
        animation.duration = 0.25
        
        petProfileView.layer.add(animation, forKey: "opacity")
        petProfileView.layer.opacity = 1.0
    }
    
    func setPetProfile() {
        petNameAgeLabel.text = "\(currentPet.name), \(currentPet.age)"
        petProfilePictureImageView.loadURL(url: currentPet.imageURL)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
