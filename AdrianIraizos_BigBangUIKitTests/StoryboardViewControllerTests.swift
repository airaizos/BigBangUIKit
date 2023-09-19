//
//  StoryboardViewControllerTests.swift
//  AdrianIraizos_BigBangUIKitTests
//
//  Created by Adrian Iraizos Mendoza on 14/9/23.
//

import XCTest
import UIKit

@testable import AdrianIraizos_BigBangUIKit
final class StoryboardViewControllerTests: XCTestCase {

//    func test_zero() {
//        XCTFail("Falla")
//    }
    
    func test_seasonsTableViewController_shouldBeNotNil() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut:SeasonsTableViewController = sb.instantiateViewController(identifier: String(describing: SeasonsTableViewController.self))
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.WatchedButtonLabel)
        XCTAssertNotNil(sut.CheckedButtonLabel)
        XCTAssertNotNil(sut.WatchedButtonPressed(sut.WatchedButtonLabel))
        XCTAssertNotNil(sut.CheckedButtonPressed(sut.CheckedButtonLabel))
        
    }
    
    func test_detailViewController_shouldBeNotNil() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: DetailViewController = sb.instantiateViewController(identifier: String(describing: DetailViewController.self))
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.nameLabel)
        XCTAssertNotNil(sut.seasonNumberLabel)
        XCTAssertNotNil(sut.episodeImage)
        XCTAssertNotNil(sut.episodeNumberLabel)
        XCTAssertNotNil(sut.summaryTextView)
        XCTAssertNotNil(sut.airDateString)
        XCTAssertNotNil(sut.favoriteButton)
        XCTAssertNotNil(sut.watchedButton)
        XCTAssertNotNil(sut.checkButton)
        XCTAssertNotNil(sut.rating1)
        XCTAssertNotNil(sut.rating2)
        XCTAssertNotNil(sut.rating3)
        XCTAssertNotNil(sut.rating4)
        XCTAssertNotNil(sut.rating5)
        
        XCTAssertNotNil(sut.favoritePressed(sut.favoriteButton))
        XCTAssertNotNil(sut.watchedPressed(sut.watchedButton))
        XCTAssertNotNil(sut.checkPressed(sut.checkButton))
        XCTAssertNotNil(sut.rating1Pressed(sut.rating1))
        XCTAssertNotNil(sut.rating2Pressed(sut.rating2))
        XCTAssertNotNil(sut.rating3Pressed(sut.rating3))
        XCTAssertNotNil(sut.rating4Pressed(sut.rating4))
        XCTAssertNotNil(sut.rating5Pressed(sut.rating5))
        XCTAssertNotNil(sut.externalLinkPressed(sut.checkButton))
    }
}
