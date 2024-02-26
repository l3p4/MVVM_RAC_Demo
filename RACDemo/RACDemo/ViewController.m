//
//  ViewController.m
//  RACDemo
//
//  Created by simon on 2024/2/12.
//

#import "ViewController.h"
#import "ProductViewController.h"
#import <ReactiveObjC.h>

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *textF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testBtn];
    [self testTextField];
    [self testNoti];
    [self testDeletage];
    [self testKVO];
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
    @weakify(self)
    [[self.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        ProductViewController *vc = [[ProductViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        vc.title = @"ProductTableVC";
    }];
}

-(void)testTextField{
    [self.textF.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
    }];
}

-(void)testNoti{
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
            
        NSLog(@"UIKeyboardDidShowNotification");
    }];
}

-(void)testDeletage{
    [[self rac_signalForSelector:@selector(textFieldDidBeginEditing:) fromProtocol:@protocol(UITextFieldDelegate)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"textFieldDidBeginEditing");
    }];
    self.textF.delegate = self;
}

-(void)testKVO{
    [RACObserve(self, title) subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    NSLog(@"will modify title");
    self.title = @"modify title";
}
@end
