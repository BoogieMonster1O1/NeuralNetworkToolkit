//
//  NeuralNetworkToolkitTests.m
//  NeuralNetworkToolkitTests
//
//  Created by Shrish Deshpande on 4/6/23.
//

#import <XCTest/XCTest.h>
#import <NeuralNetworkToolkit/NeuralNetworkToolkit.h>

@interface NeuralNetworkToolkitTests : XCTestCase

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
    id<NNTKActivationFunction> func = [[NNTKSigmoidActivationFunction alloc] init];
    NNTKNeuralNetwork* network = [[NNTKNeuralNetwork alloc] initWithInputDimension:8 outputDimension: 2 outputActivation:func];
    [self measureBlock:^{
        NSLog(@"bruh moment");
        [network addHiddenLayer:25 activationFunction:func];
    }];
}

@end
