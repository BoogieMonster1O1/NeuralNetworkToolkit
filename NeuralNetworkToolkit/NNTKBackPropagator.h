//
//  NNTKBackPropagator.h
//  NeuralNetworkToolkit
//
//  Created by Shrish Deshpande on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "NNTKNeuralNetwork.h"

NS_ASSUME_NONNULL_BEGIN

@interface NNTKBackPropagator : NSObject

@property (nonatomic,strong) NNTKNeuralNetwork *network;
@property (nonatomic,strong) NSData *data;
@property (nonatomic,assign) short batchSize;

- (instancetype)initWithNeuralNetwork:(NNTKNeuralNetwork *)network data:(NSData *)data batchSize:(short)batchSize;

- (float *)getCostGradient;

@end

NS_ASSUME_NONNULL_END
