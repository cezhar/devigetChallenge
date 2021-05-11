//
//  FileStream.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 07-05-21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let feed = try Feed(json)

import Foundation

// MARK: - Feed
struct Feed: Codable {
    let kind: String
    let data: FeedData
}

// MARK: Feed convenience initializers and mutators

extension Feed {
    init(data: Data) throws {
        self = try JSONUtils.newJSONDecoder().decode(Feed.self, from: data)
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
        kind: String? = nil,
        data: FeedData? = nil
    ) -> Feed {
        return Feed(
            kind: kind ?? self.kind,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try JSONUtils.newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
