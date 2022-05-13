//
//  timerTests.swift
//  timerTests
//
//  Created by Douglas Henrique de Souza Pereira on 12/05/22.
//

import XCTest
@testable import timer

class timerTests: XCTestCase {

    func testTimezone() async{
        do{
            let timezone = try await API.fetchTimezone("America__Sao_Paulo")
            XCTAssertEqual(timezone.data.id, "America__Sao_Paulo")
            XCTAssertEqual(timezone.data.name, "Brasilia Standard Time")
            XCTAssertEqual(timezone.data.rawUtcOffsetHours, -3)
        }catch{
            XCTFail(error.localizedDescription)
        }
    }

}
