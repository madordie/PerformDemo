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

        printf("initABC: %p\n", self);
    }
    return self;
}

- (void)dealloc {
    printf("model dealloc..\n");
}
@end

@interface ViewController () {
}

@end

@implementation ViewController

- (id)xx {
    return [ViewController new];
}

- (void)loadView {
    [super loadView];
    [self xx];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    TestModel *_teM;
    Class class = NSClassFromString(@"TestModel");
    _teM = [[class alloc] performSelector:@selector(initWithA:b:c:) withObjects:@[@"1",@"1",@"1"]];

    [_teM performSelector:@selector(setAge:) withObject:@1];
    printf("over\n");
}


@end
