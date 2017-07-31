//
//  Utils.h
//  BNRSDKLib
//
//  Created by JustinYang on 2017/7/31.
//  Copyright © 2017年 JustinYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

//将数字时间转换为 xx小时xx分钟，如果转换失败，则放回plcae字符
+(NSString *)timeIntCovertToTimeStr:(id)time withPlaceString:(NSString *)place;
@end