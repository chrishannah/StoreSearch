//
//  Media.swift
//  StoreSearch
//
//  Created by Christopher Hannah on 14/11/2016.
//  Copyright © 2016 Christopher Hannah. All rights reserved.
//

import Foundation

struct MediaType {
    var name: String
    var parameter: String
}

class Media {
    
    var types: [MediaType] = []

    init() {
        types.append(MediaType(name: "", parameter: ""))
        types.append(MediaType(name: "Movie", parameter: "movie"))
        types.append(MediaType(name: "Podcast", parameter: "podcast"))
        types.append(MediaType(name: "Music", parameter: "music"))
        types.append(MediaType(name: "Music Video", parameter: "musicVideo"))
        types.append(MediaType(name: "Audiobook", parameter: "audiobook"))
        types.append(MediaType(name: "Short Film", parameter: "shortFilm"))
        types.append(MediaType(name: "TV Show", parameter: "tvShow"))
        types.append(MediaType(name: "Software", parameter: "software"))
        types.append(MediaType(name: "eBook", parameter: "eBook"))
        types.append(MediaType(name: "All", parameter: "all"))
    }
    
    func getMediaLabels() -> [String] {
        var labels: [String] = []
        for type in types {
            labels.append(type.name)
        }
        return labels
    }
    
    func getParameterForLabel(label: String) -> String {
        var parameter = ""
        for type in types {
            if (type.name == label) {
                parameter = type.parameter
                return parameter
            }
        }
        return parameter
    }
}
