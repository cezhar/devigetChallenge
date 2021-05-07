//
//  Media.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 07-05-21.
//

import Foundation

// MARK: - Media
struct Media: Codable {
    let oembed: Oembed
    let type: String
}

// MARK: Media convenience initializers and mutators

extension Media {
    init(data: Data) throws {
        self = try JSONUtils.newJSONDecoder().decode(Media.self, from: data)
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
        oembed: Oembed? = nil,
        type: String? = nil
    ) -> Media {
        return Media(
            oembed: oembed ?? self.oembed,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try JSONUtils.newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
