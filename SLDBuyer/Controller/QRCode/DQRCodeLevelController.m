//
//  DQRCodeController.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-10.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DQRCodeLevelController.h"

@implementation DQRCodeLevelController

+ (id)sharedInstance {
    static DQRCodeLevelController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DQRCodeLevelController alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    self.menuTitle = @"扫一扫吧";
    self.menuImage = @"Bracket_QRCode.png";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.menuTitle;
    
}




@end
