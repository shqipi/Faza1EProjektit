//
//  Constants.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 11.04.23.
//

import Foundation

struct K {
    static let main = "Main"
    static let identifierOfProfileVC = "ProfileViewController"
    static let identifierOfMainTbC = "MainTabBarController"
    static let identifierOfMapVC = "MapViewController"
    static let identifierOfTrackVC = "TrackViewController"
    
    struct segueIdentifier {
        static let segueGo2Home = "go2Home"
        static let segueAddNewMap = "addNewMap"
    }
    
    struct uiNibeNames {
        static let userCellNibName = "UserCell"
        static let trackCellNibName = "TrackCell"
    }
    
    struct cellResudeIdentifierName {
        static let userCellIdentifierName = "UserCell"
        static let trackCellIdentifierName = "TrackCell"
    }
    
    struct mapTitlesForAnnotationsPoints {
        static let startOfTrack = "Start of the track"
        static let endOfTrack = "End of the track"
    }
}
