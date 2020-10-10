//
//  ViewController.m
//  PerformDemo
//
//  Created by C on 2020/10/10.
//

#import "ViewController.h"

#import "NSObject+test.h"

@interface TestModel : NSObject

@property (nonatomic, strong) NSNumber *age;

- (instancetype)initWithA:(NSString *)a b:(NSString *)b c:(NSString *)c;

@end

@implementation TestModel

- (instancetype)initWithA:(NSString *)a b:(NSString *)b c:(NSString *)c {
    if (self = [super init]) {
        
    }
    return self;
}

@end

@interface ViewController () {
    TestModel *_teM;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Class class = NSClassFromString(@"TestModel");
    _teM = [[class alloc] performSelector:@selector(initWithA:b:c:) withObjects:@[@"1",@"1",@"1"]];
    
    [_teM performSelector:@selector(setAge:) withObject:@1];
}


@end
