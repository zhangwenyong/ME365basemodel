//
//  ME365BaseViewModel.h
//  BaseModel
//
//  Created by 张文勇 on 2018/1/12.
//  Copyright © 2018年 张文勇. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Me365BaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol Me365SetBaseModle <NSObject>

@required

//给 VIewmodel 赋值
-(void)subclassSetmodel;
// 把网络请求的数据整理成适合model的json数据
-(id)responseObjectTOModelJson;

@end

typedef enum : NSUInteger {
    Path1,
    Path2,
    Path3,
} MYpath;

@interface ME365BaseViewModel : NSObject<Me365SetBaseModle>

-(void)GetdataWithPath:( MYpath )path andParameters:(nullable id)parameters andSucess:(void(^)(ME365BaseViewModel *viewModel))Zsuccess andfailure:(void(^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull)) Zfailure;

@end
NS_ASSUME_NONNULL_END
