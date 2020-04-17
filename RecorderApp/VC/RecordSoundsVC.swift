//
//  RecordSoundsVC.swift
//  RecorderApp
//
//  Created by Patrick Groß on 16.04.20.
//  Copyright © 2020 Patrick Groß. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsVC: UIViewController, AVAudioRecorderDelegate {

	@IBOutlet weak var recordBtn: UIButton!
	@IBOutlet weak var recordLabel: UILabel!
	@IBOutlet weak var stopBtn: UIButton!
	
	var audioRecorder: AVAudioRecorder!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		switchButtons(stop: false, record: true)
	}

	// MARK: When recording has been successfully stopped and saved poerform segue to play screen
	func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
		if flag {
			performSegue(withIdentifier: "recordingSegue", sender: audioRecorder.url)
		} else {
			print("Recording was not successfull")
		}
	}

	
	// MARK: Start the Recording
	@IBAction func startRecording(_ sender: UIButton) {
		recordLabel.text = "Recording in Progress"
				switchButtons(stop: true, record: false)

		let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
		let recordingName = "recordedVoice.wav"
		let pathArray = [dirPath, recordingName]
		let filePath = URL(string: pathArray.joined(separator: "/"))

		let session = AVAudioSession.sharedInstance()
		try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

		try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
		audioRecorder.delegate = self
		audioRecorder.isMeteringEnabled = true
		audioRecorder.prepareToRecord()
		audioRecorder.record()
	}
	
	// MARK: Stop the Recording
	@IBAction func stopRecording(_ sender: UIButton) {
		recordLabel.text = "Tab to record"
		switchButtons(stop: false, record: true)

		
		audioRecorder.stop()
		let audioSession = AVAudioSession.sharedInstance()
		try! audioSession.setActive(false)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "recordingSegue" {
			let playSoundsVC = segue.destination as! PlaySoundsVC
			let recordedSoundURL = sender as! URL
			playSoundsVC.recordedAudioURL = recordedSoundURL
		}
	}
	
	func switchButtons(stop: Bool, record: Bool) {
		stopBtn.isEnabled = stop
		recordBtn.isEnabled = record
	}
}

