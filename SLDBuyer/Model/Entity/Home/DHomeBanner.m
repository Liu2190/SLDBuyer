//
//  DHomeBannerForm.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-23.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DHomeBanner.h"

@implementation DHomeBanner

- (void)updateWithJSonDictionary:(NSDictionary *)dic {
    self.imgURL = [dic objectForKey:@"imgURL"];
    self.pageID = [[dic objectForKey:@"pageID"]intValue];
    self.pageURL = [dic objectForKey:@"pageURL"];
    self.resultID = [dic objectForKey:@"resultID"];
    self.sharetext = [dic objectForKey:@"sharetext"];
}

@end
