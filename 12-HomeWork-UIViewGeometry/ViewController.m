//
//  ViewController.m
//  12-HomeWork-UIViewGeometry
//
//  Created by Slava on 26.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *createBlackField = [UIView new];
    createBlackField = [self field:CGRectMake(16, 100, 288, 288) viewColor:[UIColor blackColor] viewParent:self.view];
    UIView *createWiteField = [UIView new];
    createWiteField = [self field:CGRectMake(17, 101, 286, 286) viewColor:[UIColor whiteColor] viewParent:self.view];
    CGRect blackRect = CGRectMake(3, 3, 35, 35);
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 4; j++) {
            UIView *blackRectView = [UIView new];
            blackRectView = [self field:blackRect viewColor:[UIColor blackColor] viewParent:createWiteField];
            blackRect.origin.x +=70;
        }
        if (i % 2) {
            blackRect.origin.x = 3;
        } else {
            blackRect.origin.x = 38;
        }
        blackRect.origin.y +=35;
    }
}

- (UIView *) field:(CGRect) borderField viewColor:(UIColor *) fieldColor viewParent:(UIView *) fieldParent {
    UIView *viewField = [[UIView alloc] initWithFrame:borderField];
    viewField.backgroundColor = fieldColor;
    [fieldParent addSubview:viewField];
    viewField.autoresizingMask =    UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    return viewField;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
