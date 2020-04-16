//
//  PlaySoundsVC.swift
//  RecorderApp
//
//  Created by Patrick Groß on 16.04.20.
//  Copyright © 2020 Patrick Groß. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsVC : UIViewController {
	
	@IBOutlet weak var slowBtn: UIButton!
	@IBOutlet weak var fastBtn: UIButton!
	@IBOutlet weak var highPitchBtn: UIButton!
	@IBOutlet weak var lowPitchBtn: UIButton!
	@IBOutlet weak var reverbBtn: UIButton!
	@IBOutlet weak var echoBtn: UIButton!
	@IBOutlet weak var stopBtn: UIButton!
	
	var recordedAudioUrl: URL!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func playSoundForButton(_ sender: UIButton) {
	}
	
	@IBAction func stopButtonPressed(_ sender: Any) {
		print("stop button pressed")
	}
	
}
