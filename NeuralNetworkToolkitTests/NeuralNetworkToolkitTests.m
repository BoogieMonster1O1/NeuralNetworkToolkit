//
//  NeuralNetworkToolkitTests.m
//  NeuralNetworkToolkitTests
//
//  Created by Shrish Deshpande on 4/6/23.
//

#import <XCTest/XCTest.h>
#import <NeuralNetworkToolkit/NeuralNetworkToolkit.h>

@interface NeuralNetworkToolkitTests : XCTestCase <NNTKActivationFunction>

@end

@implementation NeuralNetworkToolkitTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    id<NNTKActivationFunction> e = NULL;
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
