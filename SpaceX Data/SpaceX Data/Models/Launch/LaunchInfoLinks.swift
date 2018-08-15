//
//  LaunchInfoLinks.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchInfoLinks {
    let missionPatchImageURL: URL?
    let smallMissionPatchImageURL: URL?
    let redditCampaignURL: URL?
    let redditLaunchURL: URL?
    let redditRecoveryURL: URL?
    let redditMediaURL: URL?
    let presskitURL: URL?
    let articleURL: URL?
    let wikipediaURL: URL?
    let videoLinkURL: URL?
}

extension LaunchInfoLinks: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        missionPatchImageURL = "mission_patch",
        smallMissionPatchImageURL = "mission_patch_small",
        redditCampaignURL = "reddit_campaign",
        redditLaunchURL = "reddit_launch",
        redditRecoveryURL = "reddit_recovery",
        redditMediaURL = "reddit_media",
        presskitURL = "presskit",
        articleURL = "article_link",
        wikipediaURL = "wikipedia",
        videoLinkURL = "video_link"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.missionPatchImageURL = try values.decodeIfPresent(URL.self, forKey: .missionPatchImageURL)
        self.smallMissionPatchImageURL = try values.decodeIfPresent(URL.self, forKey: .smallMissionPatchImageURL)
        self.redditCampaignURL = try values.decodeIfPresent(URL.self, forKey: .redditCampaignURL)
        self.redditLaunchURL = try values.decodeIfPresent(URL.self, forKey: .redditLaunchURL)
        self.redditRecoveryURL = try values.decodeIfPresent(URL.self, forKey: .redditRecoveryURL)
        self.redditMediaURL = try values.decodeIfPresent(URL.self, forKey: .redditMediaURL)
        self.presskitURL = try values.decodeIfPresent(URL.self, forKey: .presskitURL)
        self.articleURL = try values.decodeIfPresent(URL.self, forKey: .articleURL)
        self.wikipediaURL = try values.decodeIfPresent(URL.self, forKey: .wikipediaURL)
        self.videoLinkURL = try values.decodeIfPresent(URL.self, forKey: .videoLinkURL)
    }
    
}
