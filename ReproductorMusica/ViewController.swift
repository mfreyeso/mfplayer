//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Mario on 29/08/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let songs = ["Ella", "Bajito", "Otra vez", "Australia", "Cold Water", "Island in the Sun", "Quemando Amor"]
    var songItem :String?
    
    
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songState: UILabel!
    
    @IBOutlet weak var songSelector: UIPickerView!
    
    @IBAction func playButton() {
        songTitle.text = songItem!
        songState.text = "Now Playing"
    }
    
    @IBAction func pauseButton() {
        songTitle.text = songItem!
        songState.text = "Paused"
    }
    
    @IBAction func stopButton() {
        songTitle.text = songItem!
        songState.text = "Stopped"
    }
    
    
    @IBOutlet weak var optionShuffle: UILabel!
    
    @IBOutlet weak var sliderVolume: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songSelector.delegate = self
        songSelector.dataSource = self
        songSelector.selectRow(1, inComponent: 0, animated: false)
        songItem = songs[1]
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return songs.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return songs[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        songItem = songs[songSelector.selectedRowInComponent(0)]
    }


}

