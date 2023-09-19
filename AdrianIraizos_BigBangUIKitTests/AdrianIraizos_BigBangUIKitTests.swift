//
//  AdrianIraizos_BigBangUIKitTests.swift
//  AdrianIraizos_BigBangUIKitTests
//
//  Created by Adrian Iraizos Mendoza on 14/9/23.
//

import XCTest

@testable import AdrianIraizos_BigBangUIKit
final class AdrianIraizos_BigBangUIKitTests: XCTestCase {
    var paths: TestingPaths!
    var fileManager: FileManager!
    
    
    override func setUpWithError() throws {
        let paths = TestingPaths()
        fileManager = FileManager.default
        Persistence.stubbedInstance = Persistence(paths: paths)
        
    }
    
    override func tearDownWithError() throws {
        paths = nil
        fileManager = nil
        Persistence.stubbedInstance = nil
        deleteAllFilesInTemporaryDirectory()
    }
    
    //    func testExample() throws {
    //       XCTFail("Debe fallar")
    //    }
    
    func test_LoadEpisodes_ShouldBe2() throws {
        let sut = Persistence.shared
        
        let episodes = try sut.loadEpisodes()
        
        XCTAssertEqual(episodes.count, 2)
    }
    
    func test_Favorites_ShouldBe5() throws {
        let sut = Persistence.shared
        let favoritesIds = [1,2,3,4,5]
        
        try sut.saveFavorites(ids: favoritesIds)
        
        let favorites = try sut.loadFavorites()
        XCTAssertEqual(favorites.count, 5)
    }
    
    func test_Watched_ShouldBe5() throws {
        let sut = Persistence.shared
        let ids = [1,2,3,4,5]
        
        try sut.saveWatched(ids: ids)
        
        let watched = try sut.loadWatched()
        XCTAssertEqual(watched.count, 5)
    }
    
    func test_Ratings_ShouldBe5() throws {
        let sut = Persistence.shared
        let ratings = [1:5,2:1,3:3,4:0,5:5]
        
        try sut.saveRatings(ratings)
        
        let watched = try sut.loadRatings()
        XCTAssertEqual(watched.count, 5)
    }
    func test_Checked_ShouldBe5() throws {
        let sut = Persistence.shared
        let ids = [1,2,3,4,5]
        
        try sut.saveChecked(ids: ids)
        
        let watched = try sut.loadChecks()
        XCTAssertEqual(watched.count, 5)
    }
}

func deleteAllFilesInTemporaryDirectory() {
    let fileManager = FileManager.default
    let tempDirectory = fileManager.temporaryDirectory
    
    do {
        let fileList = try fileManager.contentsOfDirectory(atPath: tempDirectory.path)
        for file in fileList {
            let filePath = tempDirectory.appendingPathComponent(file)
            try fileManager.removeItem(at: filePath)
        }
    } catch {
    }
}
