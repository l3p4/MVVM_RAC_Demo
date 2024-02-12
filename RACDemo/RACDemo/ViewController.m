//
//  ViewController.m
//  RACDemo
//
//  Created by simon on 2024/2/12.
//

#import "ViewController.h"
#import <ReactiveObjC.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *textF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testBtn];
    [self testTextField];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self testSingal];
}

-(void)testSingal{
    RACSignal *singal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"testSingal"];
        
        return  [RACDisposable disposableWithBlock:^{
            NSLog(@"testSingal销毁了");
        }];
    }];
    
    [singal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}

-(void)testBtn{
    [[self.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"%@",x);
    }];
}

-(void)testTextField{
    [self.textF.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
}

@end
