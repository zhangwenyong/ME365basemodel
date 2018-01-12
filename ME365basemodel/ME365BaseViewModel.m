//
//  ME365BaseViewModel.m
//  BaseModel
//
//  Created by 张文勇 on 2018/1/12.
//  Copyright © 2018年 张文勇. All rights reserved.
// 这是一个 半抽象类 需要 我们的 子类继承并且 事项某些方法。
#import "ME365BaseViewModel.h"
#import "AFNetworking.h"
#import "MJExtension/MJExtension.h"

// 根据枚举类型获取 具体的请求地址 根据枚举类型获取具体的请求类型
#define ME365Path(_path_)   getURLBasePath(_path_)
//定义一个 抛出异常的类
#define AbstractMethodNotImplement() @throw  [NSException exceptionWithName:NSInternalInconsistencyException reason:@"viewModel没有实现协议规定的类" userInfo:nil];
static NSString *getURLBasePath(MYpath path)
{
    switch (path) {
        case Path1:
            return @"";
            break;
        case Path2:
            return @"";
            break;
        case Path3:
            return @"";
            break;
        default:
            return @"";
            break;
    }
}

@interface ME365BaseViewModel()
//viewmodel 和model 相联系。
@property(nonatomic,strong,nullable)Me365BaseModel *model;
@end
@implementation ME365BaseViewModel
/*
 主要是 关于数据请求的一些基本的操作。都封装在这个基类里面
 
 
 */
-(instancetype)init
{
    NSAssert(![self isMemberOfClass:[ME365BaseViewModel class]], @"不能直接使用 需要继承 并且需要实现某些方法");
    self = [super init];
    if (self) {
        
        [self subclassSetmodel];
    }
    return self;
}
-(void)GetdataWithPath:( MYpath )path andParameters:(nullable id)parameters andSucess:(void(^)(ME365BaseViewModel *viewModel))Zsuccess andfailure:(void(^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull)) Zfailure;

{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //防止循环引用
    __weak ME365BaseViewModel *weaksef = self;
    [manager GET:ME365Path(path) parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        Zsuccess(weaksef);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        NSLog(@"===%@====",error);
        
        Zfailure(task,error);
        
    }];
}
//这个主要是给自己的子类的Viewmodel的 model属性复制。复制 复制 复制 复制
-(void)subclassSetmodel
{
    AbstractMethodNotImplement();
}
//把返回的数据整理成model合适的Json数据
-(id)responseObjectTOModelJson
{
      AbstractMethodNotImplement();
    return nil;
}









@end
