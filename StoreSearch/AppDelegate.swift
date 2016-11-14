//
//  AppDelegate.swift
//  StoreSearch
//
//  Created by Christopher Hannah on 13/11/2016.
//  Copyright © 2016 Christopher Hannah. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var termField: NSTextField!
    
    @IBOutlet weak var mediaPopUp: NSPopUpButton!
    @IBOutlet weak var countryPopUp: NSPopUpButton!
    @IBOutlet weak var entityPopUp: NSPopUpButton!
    @IBOutlet weak var attributePopUp: NSPopUpButton!
    @IBOutlet weak var languagePopUp: NSPopUpButton!
    @IBOutlet weak var explicitPopUp: NSPopUpButton!
    
    @IBOutlet var outputField: NSTextView!
    
    let baseURL:String = "https://itunes.apple.com/search"
    
    let media = Media()
    let country = Country()
    let entity = Entity()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
            setUpSearchFields()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func setUpSearchFields() {
        setUpMediaFields()
        setUpCountryFields()
        setUpEntityFields(mediaType: "")
    }
    
    func setUpMediaFields() {
        mediaPopUp.removeAllItems()
        mediaPopUp.addItems(withTitles: media.getMediaLabels())
    }
    
    func setUpCountryFields() {
        countryPopUp.removeAllItems()
        countryPopUp.addItems(withTitles: country.getCountryLabels())
    }
    
    func setUpEntityFields(mediaType: String) {
        entity.setSelectedMediaType(type: mediaType)
        entityPopUp.removeAllItems()
        entityPopUp.addItems(withTitles: entity.getEntityLabels())
    }
    
    func cleanString(string: String) -> String {
        let newString = string.replacingOccurrences(of: " ", with: "+")
        if let cleanString = newString.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) {
            return cleanString
        } else {
            return ""
        }
    }
    
    
    func getParameters() -> String {
        let term = cleanString(string: termField.stringValue)
        let mediaString = cleanString(string: (mediaPopUp.selectedItem?.title)!)
        let media = self.media.getParameterForLabel(label: mediaString)
        let countryString = cleanString(string: (countryPopUp.selectedItem?.title)!)
        let country = self.country.getParameterForLabel(label: countryString)
        let entityString = cleanString(string: (entityPopUp.selectedItem?.title)!)
        let entity = self.entity.getParameterForLabel(label: entityString)
        let attribute = ""
        let language = ""
        let explicit = ""
        
        
        var parameterString = "?term=\(term)"
        
        if (country != "") {
            parameterString += "&country=\(country)"
        }
        if (media != "") {
            parameterString += "&media=\(media)"
        }
        if (entity != "") {
            parameterString += "&entity=\(entity)"
        }
        if (attribute != "") {
            parameterString += "&attribute=\(attribute)"
        }
        if (language != "") {
            parameterString += "&language=\(language)"
        }
        if (explicit != "") {
            parameterString += "&explicit=\(explicit)"
        }
        
        return parameterString
    }
    
    func search() {
        let session = URLSession.shared
        let fullURLString = baseURL + getParameters()
        Swift.print(fullURLString)
        let fullURL:URL = URL(string: fullURLString)!
        var request = URLRequest(url: fullURL)
        request.httpMethod = "POST"
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            print("done")
            let dataString = String(data: data, encoding: String.Encoding.utf8)
            self.outputField.string = dataString!
        }
        
        task.resume()
        
    }


    @IBAction func searchButtonPressed(_ sender: Any) {
        search()
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        setUpEntityFields(mediaType: "")
    }
    @IBAction func mediaTypeSelected(_ sender: Any) {
        let mediaType = media.getParameterForLabel(label: (mediaPopUp.selectedItem?.title)!)
        setUpEntityFields(mediaType: mediaType)
    }
}

