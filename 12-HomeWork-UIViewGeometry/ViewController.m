//
//  ViewController.m
//  12-HomeWork-UIViewGeometry
//
//  Created by Slava on 26.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [NSMutableArray new];
    
    UIView *bigBlackRect = [UIView new];
    bigBlackRect = [self field:CGRectMake(10, 100, 300, 300) colorBigRectView:[UIColor blackColor] viewParent:self.view];
    UIView *bigWhiteRect = [UIView new];
    bigWhiteRect = [self field:CGRectMake(12, 102, 296, 296) colorBigRectView:[UIColor whiteColor] viewParent:self.view];
    
    UIView *smallRect = [UIView new];
    
    CGRect blackRect = CGRectMake(3, 3, 35, 35);
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 4; j++) {
            smallRect = [self field:blackRect colorBigRectView:[UIColor blackColor] viewParent:bigWhiteRect];
            blackRect.origin.x +=70;
            [self.array addObject:smallRect];
        }
        if (i % 2) {
            blackRect.origin.x = 3;
        } else {
            blackRect.origin.x = 38;
        }
        blackRect.origin.y +=35;
    }
    
}

- (CGFloat) countFromZeroToOne {
    return (float)(arc4random() % 256) / 255;
}

- (UIColor *) randomColor {
    CGFloat r = [self countFromZeroToOne];
    CGFloat g = [self countFromZeroToOne];
    CGFloat b = [self countFromZeroToOne];
    UIColor *color = [[UIColor alloc] initWithRed:r
                                            green:g
                                             blue:b
                                            alpha:1];
    return color;
}

- (UIView *) field:(CGRect) borderField colorBigRectView:(UIColor *) colorBigRect viewParent:(UIView *) fieldParent {
    UIView *viewField = [[UIView alloc] initWithFrame:borderField];
    viewField.backgroundColor = colorBigRect;
    [fieldParent addSubview:viewField];
    viewField.autoresizingMask =    UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    return viewField;
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    for (UIView *view in self.array) {
        view.backgroundColor = [self randomColor];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//Студент
//Доска должна быть вписана в максимально возможный квадрат, т.е. либо бока, либо верх или низ должны касаться границ экрана
//Применяя соответствующие маски сделайте так, чтобы когда устройство меняет ориентацию, то все клетки растягивались соответственно и ничего не вылетало за пределы экрана.

//Мастер
//При повороте устройства все черные клетки должны менять цвет :)
//Сделайте так, чтобы доска при поворотах всегда строго находилась по центру

//Супермен
//Поставьте белые и красные шашки (квадратные вьюхи) так как они стоят на доске. Они должны быть сабвьюхами главной вьюхи (у них и у клеток один супервью)
//После каждого переворота шашки должны быть перетасованы используя соответствующие методы иерархии UIView

@end
