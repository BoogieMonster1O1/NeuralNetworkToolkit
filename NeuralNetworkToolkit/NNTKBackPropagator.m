//
//  NNTKBackPropagator.m
//  NeuralNetworkToolkit
//
//  Created by Shrish Deshpande on 4/6/23.
//

#import "NNTKBackPropagator.h"

@implementation NNTKBackPropagator

- (instancetype)initWithNeuralNetwork:(NNTKNeuralNetwork *)network data:(NSData *)data batchSize:(short)batchSize {
    self = [super init];
    if (self) {
        self.network = network;
        self.data = data;
        self.batchSize = batchSize;
    }
    return self;
}

- (float *)getCostGradient {
    NSInputStream *stream = [NSInputStream inputStreamWithData:self.data];
    [stream open];
    NSUInteger vectorSize = 0;
    NSUInteger index = 0;
    NSArray<NNTKLayer *> *reversedLayers = [[self.network.layers reverseObjectEnumerator] allObjects];
    for (NNTKLayer *layer in reversedLayers) {
        NSUInteger n = layer.inputSize;
        NSUInteger m = layer.outputSize;
        vectorSize += n * m; // Weights
        vectorSize += m; // Biases
    }
    float *gradientVector = malloc(vectorSize * sizeof(float));
    for (int i = 0; i < self.batchSize; i++) {
        NSData *inputData = [self readBytesFromStream:stream length:self.network.inputDimension * sizeof(float)];
        NSData *outputActual = [self.network forward:inputData];
        const float *outputActualBytes = [outputActual bytes];
        NSData *outputExpected = [self readBytesFromStream:stream length:self.network.outputDimension * sizeof(float)];
        const float *outputExpectedBytes = [outputExpected bytes];
        for (NNTKLayer *layer in reversedLayers) {
            NSUInteger weights = layer.inputSize * layer.outputSize;
            for (NSUInteger i = 0; i < weights; i++) {
                
            }
            NSUInteger biases = layer.outputSize;
            for (NSUInteger i = 0; i < biases; i++) {
                
            }
        }
    }
    [stream close];
    return NULL;
}

- (NSData *)readBytesFromStream:(NSInputStream *)stream length:(NSUInteger)length {
    NSMutableData *data = [NSMutableData dataWithCapacity:length];
    uint8_t buffer[length];
    NSInteger bytesRead = 0;
    
    while ([data length] < length && [stream hasBytesAvailable]) {
        bytesRead = [stream read:buffer maxLength:length - [data length]];
        if (bytesRead == -1) {
            // Handle error
            return nil;
        } else if (bytesRead == 0) {
            // End of stream
            break;
        } else {
            [data appendBytes:buffer length:bytesRead];
        }
    }
    
    if ([data length] != length) {
        // Handle error
        return nil;
    }
    
    return [NSData dataWithData:data];
}

@end
