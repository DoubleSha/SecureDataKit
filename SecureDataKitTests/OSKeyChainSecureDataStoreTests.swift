//
//  OSKeyChainSecureDataStoreTests.swift
//  SecureDataKit
//
//  Created by Kevin Greene on 1/29/15.
//  Copyright (c) 2015 DoubleSha. All rights reserved.
//

import SecureDataKit
import XCTest

class OSKeyChainSecureDataStoreTests: XCTestCase {

  private let key = "key"
  private var secureDataStore = OSKeyChainSecureDataStore(service: "com.SecureDataKit.test")

  override func setUp() {
    super.setUp()
    if secureDataStore.dataForKey(key) != nil {
      secureDataStore.deleteDataForKey(key)
    }
  }

  override func tearDown() {
    if secureDataStore.dataForKey(key) != nil {
      secureDataStore.deleteDataForKey(key)
    }
    super.tearDown()
  }

  func testStoreSecureData() {
    let bytes: [UInt8] = [0x00, 0x01, 0x02, 0x03]
    let data = SecureData(bytes: bytes, length: UInt(bytes.count))
    XCTAssertTrue(secureDataStore.saveData(data, forKey: key))
    XCTAssertEqual(secureDataStore.dataForKey(key)!, data)
    secureDataStore.deleteDataForKey(key)
    XCTAssertTrue(secureDataStore.dataForKey(key) == nil)
  }
}
