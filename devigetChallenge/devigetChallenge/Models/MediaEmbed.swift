//
//  MediaEmbed.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 07-05-21.
//

import Foundation

// MARK: - MediaEmbed
struct MediaEmbed: Codable {
    let content: String?
    let width: Int?
    let scrolling: Bool?
    let height: Int?
}

// MARK: MediaEmbed convenience initializers and mutators

extension MediaEmbed {
    init(data: Data) throws {
        self = try JSONUtils.newJSONDecoder().decode(MediaEmbed.self, from: data)
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
        content: String?? = nil,
        width: Int?? = nil,
        scrolling: Bool?? = nil,
        height: Int?? = nil
    ) -> MediaEmbed {
        return MediaEmbed(
            content: content ?? self.content,
            width: width ?? self.width,
            scrolling: scrolling ?? self.scrolling,
            height: height ?? self.height
        )
    }

    func jsonData() throws -> Data {
        return try JSONUtils.newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
