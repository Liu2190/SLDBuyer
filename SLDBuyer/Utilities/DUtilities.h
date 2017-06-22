//
//  DUtilities.h
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-5-21.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZActivityIndicatorView.h"
#import "DLoginUser.h"
#import "NZAlertView.h"

#define IsIOS7 [[UIDevice currentDevice].systemVersion floatValue] >= 7
#define isIphone5 fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568) < DBL_EPSILON;

#define PhoneRegex @"^1[3|4|5|8]\\d{9}$"
#define PwdRegex @"^\\S{6,16}$"
#define EmailRegex @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
@interface DUtilities : NSObject

@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) NSDateFormatter *longFormatter;
@property (nonatomic, retain) NSDateFormatter *dateParserFormatter;
@property (nonatomic, retain) NSDateFormatter *hzdateParserFormatter;

@property (nonatomic,retain) HZActivityIndicatorView *activityIndicator;

@property (nonatomic,retain) NZAlertView *alert;

+ (DUtilities *)sharedInstance;

/**
 * 日期处理
 */
- (NSString*) formatDateAsOriginal:(NSDate*)date;
- (NSString*) formatDate:(NSDate*)date;
- (NSString*) simpleFormatDate:(NSDate *)date;
- (NSString*) formatDateFromString:(NSString *)dateStr;
- (NSString*) prettyTime:(NSDate *)date;
- (NSString*) prettyTimeFromString:(NSString *)dateStr;
- (NSString*) prettyTimeFromString:(NSString *)dateStr longFormat:(BOOL)longFormat;
- (NSDate*) dateParserFromString:(NSString*)dateStr;
- (NSDate*) dateLongFromString:(NSString*)dateStr;
- (NSDate*) dateSimplyFromString:(NSString*)dateStr;
- (NSString*) stringFromDate:(NSDate*)date;
- (NSString*) stringLongFromDate:(NSDate *)date;
- (NSString*) stringHzFromDate:(NSDate*)date;

/**
 * 获取App版本号
 */
- (NSString*)getAppVersionNo;

/**
 * 直接动画
 */
- (CAKeyframeAnimation*) objectMoveFrom:(CGPoint)fromPoint toPoint:(CGPoint)toPoint duration:(float)durTime;


/**
 * 获取本地dbuyer用户对象
 */
- (DLoginUser*)getLoginUser;

/**
 * 当用户退出登录的时候，删除用户记录
 */
- (void)deleteUserRecordForExitLogin;

/**
 * 判断当前APP程序是否登录
 */
- (BOOL)hadLogin;


- (void)dismiss;
- (void) popTarget:(UIView*)view;
- (void) popMessageError:(NSString*)message target:(id)deleObj completion:(void(^)(BOOL isFinish))callback;
- (void) popMessage:(NSString*)message target:(id)deleObj completion:(void(^)(BOOL isFinish))callback;

- (void) popMessage:(NSString*)message target:(id)deleObj delTime:(float)delTime completion:(void(^)(BOOL isFinish))callback;
- (void) popMessageError:(NSString*)message target:(id)deleObj delTime:(float)delTime completion:(void(^)(BOOL isFinish))callback;

- (CGSize)imageScalImage:(UIImage*)image andWidth:(CGFloat)fixedWidth;
- (CGSize) scaleImage:(CGSize)imageSize reference:(float)theParm isWidth:(BOOL)isWidth;

@end
