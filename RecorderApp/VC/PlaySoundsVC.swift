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
	
	var recordedAudioURL:URL!
	var audioFile:AVAudioFile!
	var audioEngine:AVAudioEngine!
	var audioPlayerNode: AVAudioPlayerNode!
	var stopTimer: Timer!

	enum ButtonType: Int {
		case slow = 0, fast, highPitch, lowPitch, echo, reverb
	}
		
	override func viewDidLoad() {
		super.viewDidLoad()
		setupAudio()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		configureUI(.notPlaying)
	}
	
	@IBAction func playSoundForButton(_ sender: UIButton) {
		switch(ButtonType(rawValue: sender.tag)!) {
		case .slow:
			  playSound(rate: 0.5)
		  case .fast:
			  playSound(rate: 1.5)
		  case .highPitch:
			  playSound(pitch: 1000)
		  case .lowPitch:
			  playSound(pitch: -1000)
		  case .echo:
			  playSound(echo: true)
		  case .reverb:
			  playSound(reverb: true)
		  }

		  configureUI(.playing)
	}
	
	@IBAction func stopButtonPressed(_ sender: UIButton) {
		stopAudio()
	}
	
}
