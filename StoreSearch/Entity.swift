//
//  Entity.swift
//  StoreSearch
//
//  Created by Christopher Hannah on 14/11/2016.
//  Copyright © 2016 Christopher Hannah. All rights reserved.
//

import Foundation

struct EntityType {
    var name: String
    var parameter: String
}

class Entity {
    
    var movieEntities: [EntityType] = []
    var podcastEntities: [EntityType] = []
    var musicEntities: [EntityType] = []
    var musicVideoEntities: [EntityType] = []
    var audiobookEntities: [EntityType] = []
    var shortFilmEntities: [EntityType] = []
    var tvShowEntities: [EntityType] = []
    var softwareEntities: [EntityType] = []
    var eBookEntities: [EntityType] = []
    var allEntities: [EntityType] = []
    
    var selectedMediaType = ""
    
    init() {
        movieEntities.append(EntityType(name: "Artist", parameter: "movieArtist"))
        movieEntities.append(EntityType(name: "Movie", parameter: "movie"))
        
        podcastEntities.append(EntityType(name: "Artist", parameter: "podcastArtist"))
        podcastEntities.append(EntityType(name: "Podcast", parameter: "podcast"))
        
        musicEntities.append(EntityType(name: "Artist", parameter: "musicArtist"))
        musicEntities.append(EntityType(name: "Track", parameter: "musicTrack"))
        musicEntities.append(EntityType(name: "Album", parameter: "album"))
        musicEntities.append(EntityType(name: "Video", parameter: "musicVideo"))
        musicEntities.append(EntityType(name: "Mix", parameter: "mix"))
        musicEntities.append(EntityType(name: "Song", parameter: "song"))
        
        musicVideoEntities.append(EntityType(name: "Artist", parameter: "musicArtist"))
        musicVideoEntities.append(EntityType(name: "Video", parameter: "musicVideo"))
        
        audiobookEntities.append(EntityType(name: "Author", parameter: "audiobookAuthor"))
        audiobookEntities.append(EntityType(name: "Audiobook", parameter: "audiobook"))
        
        shortFilmEntities.append(EntityType(name: "Artist", parameter: "shortFilmArtist"))
        shortFilmEntities.append(EntityType(name: "Short Film", parameter: "shortFilm"))
        
        tvShowEntities.append(EntityType(name: "Episode", parameter: "tvEpisode"))
        tvShowEntities.append(EntityType(name: "Season", parameter: "tvSeason"))
        
        softwareEntities.append(EntityType(name: "Software", parameter: "software"))
        softwareEntities.append(EntityType(name: "iPad", parameter: "iPadSoftware"))
        softwareEntities.append(EntityType(name: "Mac", parameter: "macSoftware"))
        
        eBookEntities.append(EntityType(name: "eBook", parameter: "ebook"))
        
        allEntities.append(EntityType(name: "Movie", parameter: "movie"))
        allEntities.append(EntityType(name: "Album", parameter: "album"))
        allEntities.append(EntityType(name: "Artist", parameter: "allArtist"))
        allEntities.append(EntityType(name: "Podcast", parameter: "podcast"))
        allEntities.append(EntityType(name: "Music Video", parameter: "musicVideo"))
        allEntities.append(EntityType(name: "Mix", parameter: "mix"))
        allEntities.append(EntityType(name: "Audiobook", parameter: "audiobook"))
        allEntities.append(EntityType(name: "TV Season", parameter: "tvSeason"))
        allEntities.append(EntityType(name: "Track", parameter: "allTrack"))

    }
    
    func setSelectedMediaType(type: String) {
        self.selectedMediaType = type
    }
    
    func getEntityLabels() -> [String] {
        var entities: [EntityType] = []
        
        switch selectedMediaType {
            case "movie":
                entities = movieEntities
                break
            case "podcast":
                entities = podcastEntities
                break
            case "music":
                entities = musicEntities
                break
            case "musicVideo":
                entities = musicVideoEntities
                break
            case "audiobook":
                entities = audiobookEntities
                break
            case "shortFilm":
                entities = shortFilmEntities
                break
            case "tvShow":
                entities = tvShowEntities
                break
            case "software":
                entities = softwareEntities
                break
            case "ebook":
                entities = eBookEntities
                break
            case "all":
                entities = allEntities
                break
            default:
                break
            
        }
        var labels: [String] = []
        labels.append("")
        for entity in entities {
            labels.append(entity.name)
        }
        return labels
    }
    
    func getParameterForLabel(label: String) -> String {
        var entities: [EntityType] = []
        
        switch selectedMediaType {
        case "movie":
            entities = movieEntities
            break
        case "podcast":
            entities = podcastEntities
            break
        case "music":
            entities = musicEntities
            break
        case "musicVideo":
            entities = musicVideoEntities
            break
        case "audiobook":
            entities = audiobookEntities
            break
        case "shortFilm":
            entities = shortFilmEntities
            break
        case "tvShow":
            entities = tvShowEntities
            break
        case "software":
            entities = softwareEntities
            break
        case "ebook":
            entities = eBookEntities
            break
        case "all":
            entities = allEntities
            break
        default:
            break
            
        }
        
        var parameter = ""
        for entity in entities {
            if (entity.name == label) {
                parameter = entity.parameter
                return parameter
            }
        }
        return parameter
    }

}
