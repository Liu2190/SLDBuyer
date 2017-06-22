//
//  DSaleCateServer.m
//  SLDBuyer
//
//  Created by Dbuyer mac1 on 14-6-6.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "DSaleCateServer.h"
#import "DCate.h"

@implementation DSaleCateServer

- (void)getAllCateData:(void(^)(NSArray *datas))callback
       failureCallback:(void(^)(NSString *resp))failureCallback {
    
    NSMutableArray *datas = [[NSMutableArray alloc]init];
    
    NSMutableArray *childDatas = [[NSMutableArray alloc]init];
    DCate *cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"10";
    cate.parentId = @"1";
    [childDatas addObject:cate];
    
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"11";
    cate.parentId = @"1";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.serverId = @"12";
    cate.parentId = @"1";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"13";
    cate.parentId = @"1";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"14";
    cate.parentId = @"1";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"15";
    cate.parentId = @"1";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"16";
    cate.parentId = @"1";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"17";
    cate.parentId = @"1";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/4965534871730L84x84.jpg";
    cate.cateTitle = @"牛奶乳品";
    cate.serverId = @"1";
    cate.childCate = childDatas;
    [datas addObject:cate];
    
    //--------------------------
    childDatas = [[NSMutableArray alloc]init];
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"18";
    cate.parentId = @"2";
    [childDatas addObject:cate];
    
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"19";
    cate.parentId = @"2";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.serverId = @"20";
    cate.parentId = @"2";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"21";
    cate.parentId = @"2";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"22";
    cate.parentId = @"2";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"23";
    cate.parentId = @"2";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"24";
    cate.parentId = @"2";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"25";
    cate.parentId = @"2";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"2";
    cate.childCate = childDatas;
    [datas addObject:cate];
    
    
    //--------------------------
    childDatas = [[NSMutableArray alloc]init];
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"26";
    cate.parentId = @"3";
    [childDatas addObject:cate];
    
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"27";
    cate.parentId = @"3";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.serverId = @"28";
    cate.parentId = @"3";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"29";
    cate.parentId = @"3";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"30";
    cate.parentId = @"3";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"31";
    cate.parentId = @"3";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"32";
    cate.parentId = @"3";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"33";
    cate.parentId = @"3";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"3";
    cate.childCate = childDatas;
    [datas addObject:cate];
    
    //--------------------------
    childDatas = [[NSMutableArray alloc]init];
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"34";
    cate.parentId = @"4";
    [childDatas addObject:cate];
    
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"35";
    cate.parentId = @"4";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.serverId = @"36";
    cate.parentId = @"4";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"37";
    cate.parentId = @"4";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"38";
    cate.parentId = @"4";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"39";
    cate.parentId = @"4";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"40";
    cate.parentId = @"4";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"41";
    cate.parentId = @"4";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.childCate = childDatas;
    cate.serverId = @"4";
    [datas addObject:cate];
    
    //--------------------------
    childDatas = [[NSMutableArray alloc]init];
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"42";
    cate.parentId = @"5";
    [childDatas addObject:cate];
    
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"43";
    cate.parentId = @"5";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.serverId = @"44";
    cate.parentId = @"5";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"45";
    cate.parentId = @"5";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"46";
    cate.parentId = @"5";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"47";
    cate.parentId = @"5";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"48";
    cate.parentId = @"5";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"49";
    cate.parentId = @"5";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"5";
    cate.childCate =childDatas;
    [datas addObject:cate];
    
    //--------------------------
    childDatas = [[NSMutableArray alloc]init];
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"50";
    cate.parentId = @"6";
    [childDatas addObject:cate];
    
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"51";
    cate.parentId = @"6";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.serverId = @"52";
    cate.parentId = @"6";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"53";
    cate.parentId = @"6";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"54";
    cate.parentId = @"6";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"55";
    cate.parentId = @"6";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"56";
    cate.parentId = @"6";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"57";
    cate.parentId = @"6";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"6";
    cate.childCate =childDatas;
    [datas addObject:cate];
    
    //--------------------------
    childDatas = [[NSMutableArray alloc]init];
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"58";
    cate.parentId = @"7";
    [childDatas addObject:cate];
    
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"59";
    cate.parentId = @"7";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.serverId = @"60";
    cate.parentId = @"7";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"61";
    cate.parentId = @"7";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"62";
    cate.parentId = @"7";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"63";
    cate.parentId = @"7";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"64";
    cate.parentId = @"7";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"65";
    cate.parentId = @"7";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"7";
    cate.childCate = childDatas;
    [datas addObject:cate];
    
    //--------------------------
    childDatas = [[NSMutableArray alloc]init];
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"66";
    cate.parentId = @"8";
    [childDatas addObject:cate];
    
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"67";
    cate.parentId = @"8";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.serverId = @"68";
    cate.parentId = @"8";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"69";
    cate.parentId = @"8";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"70";
    cate.parentId = @"8";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"71";
    cate.parentId = @"8";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"72";
    cate.parentId = @"8";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"73";
    cate.parentId = @"8";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"8";
    cate.childCate = childDatas;
    [datas addObject:cate];
    
    //--------------------------
    childDatas = [[NSMutableArray alloc]init];
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8858830800008L84x84.JPG";
    cate.cateTitle = @"进口食品 进口牛奶 进口红酒";
    cate.serverId = @"74";
    cate.parentId = @"9";
    [childDatas addObject:cate];
    
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image5/6001240100905L84x84.JPG";
    cate.cateTitle = @"饮料 酒水 咖啡 茶";
    cate.serverId = @"75";
    cate.parentId = @"9";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://www.dbuyer.cn/image4/6932205629066L84X84.JPG";
    cate.cateTitle = @"零食 糖果 饼干";
    cate.serverId = @"76";
    cate.parentId = @"9";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8030009042000L84x84.JPG";
    cate.cateTitle = @"粮油 生鲜干货 方便速食";
    cate.serverId = @"77";
    cate.parentId = @"9";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/8809003411033L84x84.JPG";
    cate.cateTitle = @"美容护理 洗发";
    cate.serverId = @"78";
    cate.parentId = @"9";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6902088108224L84x84.jpg";
    cate.cateTitle = @"厨房清洁 纸 清洁剤 洗衣液 洗衣粉";
    cate.serverId = @"79";
    cate.parentId = @"9";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/6941655900502L84x84.JPG";
    cate.cateTitle = @"奶粉 母婴 孕妇装 玩具";
    cate.serverId = @"80";
    cate.parentId = @"9";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"81";
    cate.parentId = @"9";
    [childDatas addObject:cate];
    
    cate = [[DCate alloc]init];
    cate.cateImageUrl = @"http://dbuyer.com.cn/appImage/627843146322L84x84.JPG";
    cate.cateTitle = @"家具 家纺 衣物";
    cate.serverId = @"9";
    cate.childCate = childDatas;
    [datas addObject:cate];
    
    ((void(^)(NSArray*))callback)(datas);
}
@end
