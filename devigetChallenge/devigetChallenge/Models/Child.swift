//
//  Child.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 07-05-21.
//

import Foundation
// MARK: - Child
struct Child: Codable {
    let kind: Kind
    let data: ChildData
}

// MARK: Child convenience initializers and mutators

extension Child {
    init(data: Data) throws {
        self = try JSONUtils.newJSONDecoder().decode(Child.self, from: data)
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
        kind: Kind? = nil,
        data: ChildData? = nil
    ) -> Child {
        return Child(
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
