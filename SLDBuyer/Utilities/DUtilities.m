//
//  DUtilities.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-21.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DUtilities.h"
#import "SVProgressHUD.h"
#import "TUserCenterServer.h"

@implementation DUtilities

+ (DUtilities *)sharedInstance {
    static DUtilities *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DUtilities alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setLocale: [NSLocale currentLocale]];
    [_dateFormatter setDateFormat:@"yy-MM-dd"];
    
    _longFormatter = [[NSDateFormatter alloc] init];
    [_longFormatter setLocale: [NSLocale currentLocale]];
    [_longFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    _dateParserFormatter = [[NSDateFormatter alloc] init];
    [_dateParserFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    
    _hzdateParserFormatter = [[NSDateFormatter alloc] init];
    [_hzdateParserFormatter setLocale: [NSLocale currentLocale]];
    [_hzdateParserFormatter setDateFormat:@"MM月dd日 HH:mm"];
    
    _activityIndicator = [[HZActivityIndicatorView alloc] initWithFrame:CGRectMake(140, 250, 0, 0)];
    _activityIndicator.opaque = YES;
    _activityIndicator.steps = 12;
    _activityIndicator.finSize = CGSizeMake(3, 13);
    _activityIndicator.indicatorRadius = 8;
    _activityIndicator.stepDuration = 0.100;
    _activityIndicator.color = [UIColor colorWithRed:82./255.0 green:160.0/255 blue:73.0/255. alpha:.1];
    _activityIndicator.roundedCoreners = UIRectCornerTopRight;
    _activityIndicator.cornerRadii = CGSizeMake(5, 5);
    
    return self;
}

- (NSString*) formatDateAsOriginal:(NSDate*)date {
    return [_dateParserFormatter stringFromDate:date];
}

- (NSString*)formatDate:(NSDate *)date {
    return [_dateFormatter stringFromDate: date];
}

- (NSString*)simpleFormatDate:(NSDate *)date {
    if (date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setLocale: [NSLocale currentLocale]];
        [formatter setDateFormat:@"YYYY-MM"];
        
        return [formatter stringFromDate: date];
    } else {
        return @"最近";
    }
}

- (NSString*)formatDateFromString:(NSString *)dateStr {
    NSDate *date = [_dateParserFormatter dateFromString:dateStr];
    return [self formatDate:date];
}

- (NSString*) prettyTime:(NSDate *)date {
    return [self prettyTime:date longFormat:NO];
}

- (NSString*) prettyTime:(NSDate *)date longFormat:(BOOL)longFormat {
    NSTimeInterval elapsed = [[NSDate date] timeIntervalSince1970] - [date timeIntervalSince1970];
    if (elapsed < 60) {
        return @"片刻之前";
    }
    if (elapsed < 60*60) {
        double min = floor(elapsed/60);
        return [NSString stringWithFormat:@"%d分钟前", (int)min];
    }
    if (elapsed < 24*60*60) {
        double hour = floor(elapsed/3600);
        return [NSString stringWithFormat:@"%d小时前", (int)hour];
    }
    if (elapsed < 7*24*60*60) {
        double hour = floor(elapsed/86400);
        return [NSString stringWithFormat:@"%d天前", (int)hour];
    }
    
    return longFormat ? [_longFormatter stringFromDate:date]: [_dateFormatter stringFromDate:date];
}

- (NSString*) prettyTimeFromString:(NSString *)dateStr {
    return [self prettyTimeFromString:dateStr longFormat:NO];
}

- (NSString*) prettyTimeFromString:(NSString *)dateStr longFormat:(BOOL)longFormat {
    NSDate *date = [_dateParserFormatter dateFromString:dateStr];
    return [self prettyTime:date longFormat:longFormat];
}

- (NSDate*) dateParserFromString:(NSString*)dateStr {
    return [_dateParserFormatter dateFromString:dateStr];
}

- (NSDate*) dateLongFromString:(NSString*)dateStr {
    return [_longFormatter dateFromString:dateStr];
}

- (NSDate*) dateSimplyFromString:(NSString*)dateStr {
    return [_dateFormatter dateFromString:dateStr];
}


- (NSString*) stringFromDate:(NSDate*)date {
    return [_dateParserFormatter stringFromDate:date];
}

- (NSString*) stringLongFromDate:(NSDate *)date {
    return [_longFormatter stringFromDate:date];
}

-(NSString*) stringHzFromDate:(NSDate*)date {
    return [_hzdateParserFormatter stringFromDate:date];
}

- (NSString *)getAppVersionNo {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey];
}

- (CAKeyframeAnimation*) objectMoveFrom:(CGPoint)fromPoint toPoint:(CGPoint)toPoint duration:(float)durTime{
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:fromPoint];
    [path addLineToPoint:toPoint];
    
    moveAnimation.path = path.CGPath;
    moveAnimation.duration = durTime;
    
    return moveAnimation;
}


- (DLoginUser*)getLoginUser {
    return (DLoginUser*)[[TServerFactory getServerInstance:@"TUserCenterServer"]selectFirstRecord];
}

- (void)deleteUserRecordForExitLogin {
    [[TServerFactory getServerInstance:@"TUserCenterServer"]deleteAllRecord];
}

- (BOOL)hadLogin {
    return [[TServerFactory getServerInstance:@"TUserCenterServer"]hadUserLogin];
}

/*****************/
- (void)dismiss {
    [_activityIndicator stopAnimating];
    [_activityIndicator removeFromSuperview];
}

- (void) popTarget:(UIView*)view {
    [view addSubview:_activityIndicator];
    [_activityIndicator setFrame:CGRectMake((view.frame.size.width-40)/2, (view.frame.size.height-40)/2, 40, 40)];
    [_activityIndicator startAnimating];
}

- (void) popMessageError:(NSString*)message target:(id)deleObj completion:(void(^)(BOOL isFinish))callback{
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError
                                          title:@"错误提示"
                                        message:message
                                       delegate:self];
    
    [alert showWithCompletion:^{
        ((void(^)(BOOL))callback)(YES);
    }];
}

- (void) popMessage:(NSString*)message target:(id)deleObj completion:(void(^)(BOOL isFinish))callback {
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleSuccess
                                          title:@"友情提示"
                                        message:message
                                       delegate:self];
    
    [alert showWithCompletion:^{
        ((void(^)(BOOL))callback)(YES);
    }];
}

- (void) popMessage:(NSString*)message target:(id)deleObj
            delTime:(float)delTime completion:(void(^)(BOOL isFinish))callback {
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleSuccess
                                                      title:@"友情提示"
                                                    message:message
                                                   delegate:self];
    
    [alert showWithCompletion:^{
        ((void(^)(BOOL))callback)(YES);
    }];
}

- (void) popMessageError:(NSString*)message target:(id)deleObj
                 delTime:(float)delTime completion:(void(^)(BOOL isFinish))callback {
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError
                                                      title:@"错误提示"
                                                    message:message
                                                   delegate:self];
    
    [alert showWithCompletion:^{
        ((void(^)(BOOL))callback)(YES);
    }];
}


- (CGSize)imageScalImage:(UIImage*)image andWidth:(CGFloat)fixedWidth {
    CGFloat scale = image.size.width / fixedWidth;
    CGFloat compressHeight = image.size.height / scale;
    CGSize newSize = CGSizeMake(fixedWidth, compressHeight);
    
    return newSize;
}

- (CGSize) scaleImage:(CGSize)imageSize reference:(float)theParm isWidth:(BOOL)isWidth {
    CGSize size;
    int parm = 0;
    
    if (isWidth) {
        parm = theParm*imageSize.height/imageSize.width;
        size = CGSizeMake(theParm, parm);
    } else {
        parm = theParm*imageSize.width/imageSize.height;
        size = CGSizeMake(parm, theParm);
    }
    
    return size;
}


@end
