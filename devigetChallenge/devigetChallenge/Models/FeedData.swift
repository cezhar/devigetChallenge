//
//  File.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 07-05-21.
//

import Foundation


// MARK: - FeedData
struct FeedData: Codable {
    let modhash: String
    let children: [Child]
    let after: String
    let before: String?
}

// MARK: FeedData convenience initializers and mutators

extension FeedData {
    init(data: Data) throws {
        self = try JSONUtils.newJSONDecoder().decode(FeedData.self, from: data)
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
        modhash: String? = nil,
        children: [Child]? = nil,
        after: String? = nil,
        before: String?? = nil
    ) -> FeedData {
        return FeedData(
            modhash: modhash ?? self.modhash,
            children: children ?? self.children,
            after: after ?? self.after,
            before: before ?? self.before
        )
    }

    func jsonData() throws -> Data {
        return try JSONUtils.newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
