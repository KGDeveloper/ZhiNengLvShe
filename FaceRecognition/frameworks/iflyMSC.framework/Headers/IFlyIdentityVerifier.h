//
//  IFlyIdentityVerifier.h
//  IFlyMSC
//
//  Created by 张剑 on 15/4/22.
//  Copyright (c) 2015年 iflytek. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "IFlyIdentityVerifierDelegate.h"

/**
 *  身份验证功能类
 */
@interface IFlyIdentityVerifier : NSObject

/*!
 *  设置委托对象
 */
@property (nonatomic, assign) id <IFlyIdentityVerifierDelegate> delegate;

/**
 *  返回身份验证对象的单例
 *
 *  @return 身份验证对象的单例
 */
+ (instancetype) sharedInstance;

/**
 *  销毁身份验证对象单例。
 *
 *  @return 成功返回YES，失败返回NO。
 */
+ (void)purgeSharedInstance;

/**
 *  设置参数
 *
 *  @param value 参数值
 *  @param key   参数名
 *
 *  @return 设置的参数和取值正确返回YES,失败返回NO
 */
- (BOOL)setParameter:(NSString *)value forKey:(NSString *)key;

/**
 *  开始会话
 *  在这之后会开始各项业务。
 */
- (void)startWorking;

/*
 *  | ------------- |-----------------------------------------------------------
 *  | ifr 参数       | 描述
 *  | ------------- |-----------------------------------------------------------
 *  | data_format   |数据格式:即图片格式，支持jpg(默认)，gif
 *  | ------------- |-----------------------------------------------------------
 *  | data_encoding |数据压缩编码：即图片压缩编码，支持raw(不压缩，默认值)
 *  | ------------- |-----------------------------------------------------------
 *  | wtt           |等待超时时间: 支持大于0的整数，默认为3000ms
 *  | ------------- |-----------------------------------------------------------
 *  | ivp 参数       | 描述
 *  | ------------- |-----------------------------------------------------------
 *  | rgn           |训练次数：取值2~9.无默认值，必须明确指定。
 *  | ------------- |-----------------------------------------------------------
 *  |               |声纹确认门限值，验证得分>=tsd验证通过，否则验证失败（该参数目前不支持，
 *  | tsd           |作为保留参数。）却只范围：0~100.
 *  | ------------- |-----------------------------------------------------------
 *  | ptxt          |密码文本。从服务端下载，比如数字密码所需要的数字串。
 *  | ------------- |-----------------------------------------------------------
 *  | pwdt          |密码类型。取值：1(文本密码),2(自由说),3(数字密码).
 *  | ------------- |-----------------------------------------------------------
 *  | fin           |取消注册。取值：0(不取消，即不生效),1(取消本次注册).
 *  | ------------- |-----------------------------------------------------------
 *  | wtt           |等待超时时间:描述客户端等待结果的超时时间
 *  | ------------- |-----------------------------------------------------------
 *  | vad_enable    |VAD功能开关。是否启用VAD处理，取值：1(开启,默认),0(不开启)。
 *  | ------------- |-----------------------------------------------------------
 *  |               |头部静音最大长度。如果静音长度超过此值，则认为用户此次无有效音频输入。
 *  | vad_bos       |此参数仅在打开VAD功能时生效。(云端暂时没有)。取值：0~30000ms,
 *  |               |默认为10000ms
 *  | ------------- |-----------------------------------------------------------
 *  |               |尾部静音长度。如果尾部静音长度超过了此值，则认为音频已经结束。
 *  |               |此参数仅在打开VAD功能时生效。(云端暂时没有)。取值：0~30000ms,
 *  | vad_eos       |默认为2000ms
 *  | ------------- |-----------------------------------------------------------
 *  | data_encoding |数据压缩编码，音频压缩编码。
 *  | ------------- |-----------------------------------------------------------
 *  | data_format   |在声纹业务中为音频采样率，取值：16000(默认)，8000
 *  | ------------- |-----------------------------------------------------------
 *
 */

/**
 *  写入子业务数据、或者进行模型操作、下载密码。
 *
 *  @param ssub   子业务名
 *  @param data   数据
 *  @param offset 偏移量
 *  @param length 长度
 *  @param params 参数
 *  <table>
 *  <thead>
 *  <tr><th>*ifr参数</th><th><em>描述</em></th></tr>
 *  </thead>
 *  <tbody>
 *  <tr><td>data_format</td><td>数据格式:即图片格式，支持jpg(默认)，gif</td></tr>
 *  <tr><td>data_encoding</td><td>数据压缩编码：即图片压缩编码，支持raw(不压缩，默认值)</td></tr>
 *  <tr><td>wtt</td><td>等待超时时间: 支持大于0的整数，默认为3000ms</td></tr>
 *  </tbody>
 *  <thead>
 *  <tr><th>*ivp参数</th><th><em>描述</em></th></tr>
 *  </thead>
 *  <tbody>
 *  <tr><td>rgn</td><td>训练次数：取值2~9.无默认值，必须明确指定。</td></tr>
 *  <tr><td>tsd</td><td>声纹确认门限值，验证得分>=tsd验证通过，否则验证失败（该参数目前不支持，作为保留参数。）却只范围：0~100.</td></tr>
 *  <tr><td>ptxt</td><td>密码文本。从服务端下载，比如数字密码所需要的数字串。</td></tr>
 *  <tr><td>pwdt</td><td>密码类型。取值：1(文本密码),2(自由说),3(数字密码).</td></tr>
 *  <tr><td>fin</td><td>取消注册。取值：0(不取消，即不生效),1(取消本次注册).</td></tr>
 *  <tr><td>wtt</td><td>等待超时时间:描述客户端等待结果的超时时间.</td></tr>
 *  <tr><td>vad_enable</td><td>VAD功能开关。是否启用VAD处理，取值：1(开启,默认),0(不开启)。</td></tr>
 *  <tr><td>vad_bos</td><td>头部静音最大长度。如果静音长度超过此值，则认为用户此次无有效音频输入。</br>此参数仅在打开VAD功能时生效。(云端暂时没有)。</br>取值：0~30000ms,默认为10000ms</td></tr>
 *  <tr><td>vad_eos</td><td>尾部静音长度。如果尾部静音长度超过了此值，则认为音频已经结束。</br>此参数仅在打开VAD功能时生效。(云端暂时没有)。</br>取值：0~30000ms,默认为2000ms</td></tr>
 *  <tr><td>data_encoding</td><td>数据压缩编码，音频压缩编码。</td></tr>
 *  <tr><td>data_format</td><td>在声纹业务中为音频采样率，取值：16000(默认)，8000</td></tr>
 *  </tbody>
 *  </table>
 */
-(void)write:(NSString*)ssub data:(NSData*)data offset:(int)offset length:(int)length withParams:(NSString*)params;

/**
 *  停止子业务数据写入
 *
 *  @param ssub 子业务名:ivp,ifr
 */
-(void)stopWrite:(NSString*)ssub;

/**
 *  执行模型查询、删除和声纹密码下载等操作
 *  *注意此方法不能与startWorking方法同时使用。
 *
 *  @param ssub   子业务类型、可选值：ivp(声纹)、ifr(人脸)
 *  @param cmd    操作命令，可选值：query、delete、download
 *  @param params 子业务参数，参见write:data:offset:length:withParams:
 */
-(void)execute:(NSString*)ssub cmd:(NSString*)cmd params:(NSString*)params;

/**
 *  取消本次会话
 */
- (void)cancel;

@end

