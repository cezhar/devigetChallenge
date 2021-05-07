//
//  ChildData.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 07-05-21.
//

import Foundation

// MARK: - ChildData
struct ChildData: Codable {
    let domain: String
    let bannedBy: JSONNull?
    let mediaEmbed: MediaEmbed
    let subreddit: String
    let selftextHTML: String?
    let selftext: String
    let likes: JSONNull?
    let userReports: [JSONAny]
    let secureMedia: Media?
    let linkFlairText: String?
    let id: String
    let gilded: Int
    let secureMediaEmbed: MediaEmbed
    let clicked: Bool
    let reportReasons: JSONNull?
    let author: String
    let media: Media?
    let score: Int
    let approvedBy: JSONNull?
    let over18, hidden: Bool
    let thumbnail: String
    let subredditID: String
    let edited: Edited
    let linkFlairCSSClass: String?
    let authorFlairCSSClass: JSONNull?
    let downs: Int
    let modReports: [JSONAny]
    let saved, isSelf: Bool
    let name, permalink: String
    let stickied: Bool
    let created: Int
    let url: String
    let authorFlairText: JSONNull?
    let title: String
    let createdUTC, ups, numComments: Int
    let visited: Bool
    let numReports, distinguished: JSONNull?

    enum CodingKeys: String, CodingKey {
        case domain
        case bannedBy = "banned_by"
        case mediaEmbed = "media_embed"
        case subreddit
        case selftextHTML = "selftext_html"
        case selftext, likes
        case userReports = "user_reports"
        case secureMedia = "secure_media"
        case linkFlairText = "link_flair_text"
        case id, gilded
        case secureMediaEmbed = "secure_media_embed"
        case clicked
        case reportReasons = "report_reasons"
        case author, media, score
        case approvedBy = "approved_by"
        case over18 = "over_18"
        case hidden, thumbnail
        case subredditID = "subreddit_id"
        case edited
        case linkFlairCSSClass = "link_flair_css_class"
        case authorFlairCSSClass = "author_flair_css_class"
        case downs
        case modReports = "mod_reports"
        case saved
        case isSelf = "is_self"
        case name, permalink, stickied, created, url
        case authorFlairText = "author_flair_text"
        case title
        case createdUTC = "created_utc"
        case ups
        case numComments = "num_comments"
        case visited
        case numReports = "num_reports"
        case distinguished
    }
}

// MARK: ChildData convenience initializers and mutators

extension ChildData {
    init(data: Data) throws {
        self = try JSONUtils.newJSONDecoder().decode(ChildData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        domain: String? = nil,
        bannedBy: JSONNull?? = nil,
        mediaEmbed: MediaEmbed? = nil,
        subreddit: String? = nil,
        selftextHTML: String?? = nil,
        selftext: String? = nil,
        likes: JSONNull?? = nil,
        userReports: [JSONAny]? = nil,
        secureMedia: Media?? = nil,
        linkFlairText: String?? = nil,
        id: String? = nil,
        gilded: Int? = nil,
        secureMediaEmbed: MediaEmbed? = nil,
        clicked: Bool? = nil,
        reportReasons: JSONNull?? = nil,
        author: String? = nil,
        media: Media?? = nil,
        score: Int? = nil,
        approvedBy: JSONNull?? = nil,
        over18: Bool? = nil,
        hidden: Bool? = nil,
        thumbnail: String? = nil,
        subredditID: String? = nil,
        edited: Edited? = nil,
        linkFlairCSSClass: String?? = nil,
        authorFlairCSSClass: JSONNull?? = nil,
        downs: Int? = nil,
        modReports: [JSONAny]? = nil,
        saved: Bool? = nil,
        isSelf: Bool? = nil,
        name: String? = nil,
        permalink: String? = nil,
        stickied: Bool? = nil,
        created: Int? = nil,
        url: String? = nil,
        authorFlairText: JSONNull?? = nil,
        title: String? = nil,
        createdUTC: Int? = nil,
        ups: Int? = nil,
        numComments: Int? = nil,
        visited: Bool? = nil,
        numReports: JSONNull?? = nil,
        distinguished: JSONNull?? = nil
    ) -> ChildData {
        return ChildData(
            domain: domain ?? self.domain,
            bannedBy: bannedBy ?? self.bannedBy,
            mediaEmbed: mediaEmbed ?? self.mediaEmbed,
            subreddit: subreddit ?? self.subreddit,
            selftextHTML: selftextHTML ?? self.selftextHTML,
            selftext: selftext ?? self.selftext,
            likes: likes ?? self.likes,
            userReports: userReports ?? self.userReports,
            secureMedia: secureMedia ?? self.secureMedia,
            linkFlairText: linkFlairText ?? self.linkFlairText,
            id: id ?? self.id,
            gilded: gilded ?? self.gilded,
            secureMediaEmbed: secureMediaEmbed ?? self.secureMediaEmbed,
            clicked: clicked ?? self.clicked,
            reportReasons: reportReasons ?? self.reportReasons,
            author: author ?? self.author,
            media: media ?? self.media,
            score: score ?? self.score,
            approvedBy: approvedBy ?? self.approvedBy,
            over18: over18 ?? self.over18,
            hidden: hidden ?? self.hidden,
            thumbnail: thumbnail ?? self.thumbnail,
            subredditID: subredditID ?? self.subredditID,
            edited: edited ?? self.edited,
            linkFlairCSSClass: linkFlairCSSClass ?? self.linkFlairCSSClass,
            authorFlairCSSClass: authorFlairCSSClass ?? self.authorFlairCSSClass,
            downs: downs ?? self.downs,
            modReports: modReports ?? self.modReports,
            saved: saved ?? self.saved,
            isSelf: isSelf ?? self.isSelf,
            name: name ?? self.name,
            permalink: permalink ?? self.permalink,
            stickied: stickied ?? self.stickied,
            created: created ?? self.created,
            url: url ?? self.url,
            authorFlairText: authorFlairText ?? self.authorFlairText,
            title: title ?? self.title,
            createdUTC: createdUTC ?? self.createdUTC,
            ups: ups ?? self.ups,
            numComments: numComments ?? self.numComments,
            visited: visited ?? self.visited,
            numReports: numReports ?? self.numReports,
            distinguished: distinguished ?? self.distinguished
        )
    }

    func jsonData() throws -> Data {
        return try JSONUtils.newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
