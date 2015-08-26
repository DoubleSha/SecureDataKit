//
//  SecureData+swift.swift
//  SecureDataKit
//
//  Created by Kevin Greene on 12/30/14.
//  Copyright (c) 2014 DoubleSha. All rights reserved.
//

import Foundation

public func ==(left: SecureData, right: SecureData) -> Bool {
  return left.mutableData == right.mutableData
}

extension SecureData: Equatable {

  public subscript(subRange: Range<Int>) -> SecureData {
    precondition(subRange.startIndex >= 0 && subRange.startIndex < mutableData.length)
    precondition(subRange.endIndex > subRange.startIndex &&
        subRange.endIndex <= mutableData.length)
    let length = subRange.endIndex - subRange.startIndex
    let range = NSRange(location: subRange.startIndex, length: length)
    var subData = SecureData(length: UInt(length))
    memcpy(subData.mutableBytes, mutableBytes.advancedBy(subRange.startIndex), length)
    return subData
  }
}
