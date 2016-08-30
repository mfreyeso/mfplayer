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
    var player: AVAudioPlayer!
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songState: UILabel!
    
    @IBOutlet weak var songSelector: UIPickerView!
    
    @IBOutlet weak var optionShuffle: UILabel!
    @IBOutlet weak var sliderVolume: UISlider!

    
    @IBOutlet weak var switchShuffle: UISwitch!
    
    @IBAction func buttonShuffle(sender: UISwitch) {
        if switchShuffle.on{
            let randomSongIndex = Int(arc4random_uniform(UInt32(self.songs.count - 1)))
            songSelector.selectRow(randomSongIndex, inComponent: 0, animated: false)
            songItem = self.songs[randomSongIndex]
            connectSong(songItem!)
            songTitle.text = songItem
            songState.text = ""
        }
    }
    
    
    @IBAction func actionVolume(sender: UISlider) {
        if player.playing{
            player.volume = sender.value
        }
    }
    
    @IBAction func playButton() {
        if !player.playing{
            songState.text = "Now Playing"
            player.play()
        }
    }
    
    @IBAction func pauseButton() {
        if player.playing{
            songState.text = "Paused"
            player.pause()
        }else{
            player.play()
            songState.text = "Now Playing"
        }
    }
    
    @IBAction func stopButton() {
        if player.playing{
            player.stop()
            player.currentTime = 0.0
            songState.text = "Stopped"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songSelector.delegate = self
        songSelector.dataSource = self
        songSelector.selectRow(1, inComponent: 0, animated: false)
        songItem = songs[1]
        songTitle.text = songItem
        
        connectSong(songItem!)
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
        songTitle.text = songItem
        if player.playing{
            songState.text = ""
        }
        connectSong(songItem!)
    }
    
    func connectSong(songItem: String){
        let songUrl = NSBundle.mainBundle().URLForResource(songItem, withExtension:"mp3")
        do{
            try player = AVAudioPlayer(contentsOfURL: songUrl!)
        }catch{
            print("Error Connect to Song")
        }
        
    }


}

