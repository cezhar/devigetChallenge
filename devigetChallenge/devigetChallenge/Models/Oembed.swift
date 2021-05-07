//
//  Oembed.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 07-05-21.
//

import Foundation

// MARK: - Oembed
struct Oembed: Codable {
    let providerURL: String
    let oembedDescription, title: String
    let url: String
    let type, authorName: String
    let height, width: Int
    let html: String
    let thumbnailWidth: Int
    let version, providerName: String
    let thumbnailURL: String
    let thumbnailHeight: Int
    let authorURL: String

    enum CodingKeys: String, CodingKey {
        case providerURL = "provider_url"
        case oembedDescription = "description"
        case title, url, type
        case authorName = "author_name"
        case height, width, html
        case thumbnailWidth = "thumbnail_width"
        case version
        case providerName = "provider_name"
        case thumbnailURL = "thumbnail_url"
        case thumbnailHeight = "thumbnail_height"
        case authorURL = "author_url"
    }
}

// MARK: Oembed convenience initializers and mutators

extension Oembed {
    init(data: Data) throws {
        self = try JSONUtils.newJSONDecoder().decode(Oembed.self, from: data)
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
        providerURL: String? = nil,
        oembedDescription: String? = nil,
        title: String? = nil,
        url: String? = nil,
        type: String? = nil,
        authorName: String? = nil,
        height: Int? = nil,
        width: Int? = nil,
        html: String? = nil,
        thumbnailWidth: Int? = nil,
        version: String? = nil,
        providerName: String? = nil,
        thumbnailURL: String? = nil,
        thumbnailHeight: Int? = nil,
        authorURL: String? = nil
    ) -> Oembed {
        return Oembed(
            providerURL: providerURL ?? self.providerURL,
            oembedDescription: oembedDescription ?? self.oembedDescription,
            title: title ?? self.title,
            url: url ?? self.url,
            type: type ?? self.type,
            authorName: authorName ?? self.authorName,
            height: height ?? self.height,
            width: width ?? self.width,
            html: html ?? self.html,
            thumbnailWidth: thumbnailWidth ?? self.thumbnailWidth,
            version: version ?? self.version,
            providerName: providerName ?? self.providerName,
            thumbnailURL: thumbnailURL ?? self.thumbnailURL,
            thumbnailHeight: thumbnailHeight ?? self.thumbnailHeight,
            authorURL: authorURL ?? self.authorURL
        )
    }

    func jsonData() throws -> Data {
        return try JSONUtils.newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
