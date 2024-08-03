/// Copyright (c) 2023 Kodeco LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import SwiftData

class Object: Codable, Identifiable, Hashable {
  let objectID: Int
  let title: String
  let creditLine: String
  let objectURL: String
  let isPublicDomain: Bool
  let primaryImageSmall: String
  
  init(objectID: Int, title: String, creditLine: String, objectURL: String, isPublicDomain: Bool, primaryImageSmall: String) {
    self.objectID = objectID
    self.title = title
    self.creditLine = creditLine
    self.objectURL = objectURL
    self.isPublicDomain = isPublicDomain
    self.primaryImageSmall = primaryImageSmall
  }
  
  enum CodingKeys: CodingKey {
    case objectID
    case title
    case creditLine
    case objectURL
    case isPublicDomain
    case primaryImageSmall
  }
  
  required init(from decoder: any Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.objectID = try values.decode(Int.self, forKey: .objectID)
    self.title = try values.decode(String.self, forKey: .title)
    self.creditLine = try values.decode(String.self, forKey: .creditLine)
    self.objectURL = try values.decode(String.self, forKey: .objectURL)
    self.isPublicDomain = try values.decode(Bool.self, forKey: .isPublicDomain)
    self.primaryImageSmall = try values.decode(String.self, forKey: .primaryImageSmall)
  }
  
  func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(objectID, forKey: .objectID)
    try container.encode(title, forKey: .title)
    try container.encode(creditLine, forKey: .creditLine)
    try container.encode(objectURL, forKey: .objectURL)
    try container.encode(isPublicDomain, forKey: .isPublicDomain)
    try container.encode(primaryImageSmall, forKey: .primaryImageSmall)
  }
  
  static func == (lhs: Object, rhs: Object) -> Bool {
    lhs.objectID == rhs.objectID
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(objectID)
  }
}

class ObjectIDs: Codable {
  let total: Int
  let objectIDs: [Int]
}
