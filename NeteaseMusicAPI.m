//
//  NeteaseMusicAPI.m
//  NeteaseMusicAPI
//
//  Created by 翟泉 on 2016/11/3.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NeteaseMusicAPI.h"

NSURLSession *session;

NSString *urlEncode(NSString *input);

@implementation NeteaseMusicAPI

+ (void)initialize {
    session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

/**
 搜索
 */
+ (void)searchWithQuery:(NSString *)query type:(NMSearchType)type offset:(NSInteger)offset limit:(NSInteger)limit completionHandler:(NeteaseMusicAPICompletionHandler)completionHandler {
    NSString *HTTPBody = [NSString stringWithFormat:@"s=%@&type=%ld&offset=%ld&limit=%ld", urlEncode(query), type, offset, limit];
    NSMutableURLRequest *request = [self requestWithURLString:@"http://music.163.com/api/search/pc"];
    request.HTTPBody = [HTTPBody dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    [[session dataTaskWithRequest:request completionHandler:completionHandler] resume];
}

/**
 获取音乐信息
 */
+ (void)musicInfoWithId:(NSInteger)musicId completionHandler:(NeteaseMusicAPICompletionHandler)completionHandler {
    NSString *ids = [NSString stringWithFormat:@"[%ld]", musicId];
    NSString *parameters = [NSString stringWithFormat:@"id=%ld&ids=%@", musicId, urlEncode(ids)];
    NSString *URLString = [NSString stringWithFormat:@"http://music.163.com/api/song/detail?%@", parameters];
    NSMutableURLRequest *request = [self requestWithURLString:URLString];
    request.HTTPMethod = @"GET";
    [[session dataTaskWithRequest:request completionHandler:completionHandler] resume];
}

/**
 获取歌手专辑列表
 */
+ (void)artistAlbumWithArtistId:(NSInteger)artistId limit:(NSInteger)limit completionHandler:(NeteaseMusicAPICompletionHandler)completionHandler {
    NSString *URLString = [NSString stringWithFormat:@"http://music.163.com/api/artist/albums/%ld?limit=%ld", artistId, limit];
    NSMutableURLRequest *request = [self requestWithURLString:URLString];
    request.HTTPMethod = @"GET";
    [[session dataTaskWithRequest:request completionHandler:completionHandler] resume];
}

/**
 专辑信息
 */
+ (void)albumInfoWithAlbumId:(NSInteger)albumId completionHandler:(NeteaseMusicAPICompletionHandler)completionHandler {
    NSString *URLString = [NSString stringWithFormat:@"http://music.163.com/api/album/%ld", albumId];
    NSMutableURLRequest *request = [self requestWithURLString:URLString];
    request.HTTPMethod = @"GET";
    [[session dataTaskWithRequest:request completionHandler:completionHandler] resume];
}

/**
 歌单
 */
+ (void)playlistInfoWithPlaylistId:(NSInteger)playlistId completionHandler:(NeteaseMusicAPICompletionHandler)completionHandler {
    NSString *URLString = [NSString stringWithFormat:@"http://music.163.com/api/playlist/detail?id=%ld", playlistId];
    NSMutableURLRequest *request = [self requestWithURLString:URLString];
    request.HTTPMethod = @"GET";
    [[session dataTaskWithRequest:request completionHandler:completionHandler] resume];
}

/**
 歌词
 */
+ (void)musicLyricWithMusicId:(NSInteger)musicId completionHandler:(NeteaseMusicAPICompletionHandler)completionHandler {
    NSString *URLString = [NSString stringWithFormat:@"http://music.163.com/api/song/lyric?os=pc&id=%ld&lv=-1&kv=-1&tv=-1", musicId];
    NSMutableURLRequest *request = [self requestWithURLString:URLString];
    request.HTTPMethod = @"GET";
    [[session dataTaskWithRequest:request completionHandler:completionHandler] resume];
}

/**
 MV信息
 */
+ (void)mvInfoWithMvID:(NSInteger)mvId completionHandler:(NeteaseMusicAPICompletionHandler)completionHandler {
    NSString *URLString = [NSString stringWithFormat:@"http://music.163.com/api/mv/detail?id=%ld&type=mp4", mvId];
    NSMutableURLRequest *request = [self requestWithURLString:URLString];
    request.HTTPMethod = @"GET";
    [[session dataTaskWithRequest:request completionHandler:completionHandler] resume];
}


/**
 初始化请求对象
 
 @param URLString <#URLString description#>
 
 @return <#return value description#>
 */
+ (NSMutableURLRequest *)requestWithURLString:(NSString *)URLString {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    [request setValue:@"http://music.163.com/" forHTTPHeaderField:@"Referer"];
    [request setValue:@"appver=2.0.2" forHTTPHeaderField:@"Cookie"];
    request.HTTPShouldHandleCookies = NO;
    return request;
}


@end


NSString *urlEncode(NSString *input) {
    NSString *outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)input, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
    return outputStr;
}


