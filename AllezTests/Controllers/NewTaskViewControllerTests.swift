//
//  NewTaskViewControllerTests.swift
//  AllezTests
//
//  Created by Makarov_Maxim on 28.03.2022.
//

import XCTest
@testable import Allez

class NewTaskViewControllerTests: XCTestCase {
    
    var sut: NewTaskViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: NewTaskViewController.self)) as? NewTaskViewController
        sut.loadViewIfNeeded()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHasTitleTextField() {
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.view))
    }
    //locationTextField
    //dateTextField
    //addressTextField
    //descriptionTextField
    
    //save / cancel buttons
}
