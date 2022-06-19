//
//  ViewController.swift
//  TinyToyTank
//
//  Created by 朱彦谕 on 2021/11/6.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var tankAnchor: TinyToyTank._TinyToyTank?
    
    var isActionPlaying: Bool = false

    
    @IBAction func tankRightPressed(_ sender: Any) {
        
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor?.notifications.tankRight.post()
    }
    
    @IBAction func tankForwardPressed(_ sender: Any) {
        
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        
        tankAnchor?.notifications.tankForward.post()
    }
    
    @IBAction func tankLeftPressed(_ sender: Any) {
        
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor?.notifications.tankLeft.post()
    }
    
    
    @IBAction func turretRightPressed(_ sender: Any) {
        
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.turretRight.post()

    }
    
    
    @IBAction func turretLeftPressed(_ sender: Any) {
        
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.turretLeft.post()

    }
    
    @IBAction func cannonFirePressed(_ sender: Any) {
        
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.cannonFire.post()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! Experience.loadBox()
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        // Add the box anchor to the scene
        arView.scene.anchors.append(tankAnchor!)
        tankAnchor!.turret?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)
        tankAnchor?.actions.actionComplete.onAction = { _ in
          self.isActionPlaying = false
        }


    }
}
