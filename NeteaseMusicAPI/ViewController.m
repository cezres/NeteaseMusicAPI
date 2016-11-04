//
//  ViewController.m
//  NeteaseMusicAPI
//
//  Created by 翟泉 on 2016/11/3.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "ViewController.h"
#import "NeteaseMusicAPI.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NeteaseMusicAPICompletionHandler handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:NULL];
            NSLog(@"%@", dict);
        }
    };
    
    // 搜索-单曲
//    [NeteaseMusicAPI searchWithQuery:@"你的名字" type:NMSearch_Music offset:0 limit:3 completionHandler:handler];
    // 搜索-专辑
//    [NeteaseMusicAPI searchWithQuery:@"你的名字" type:NMSearch_Album offset:0 limit:3 completionHandler:handler];
    // 搜索-歌手
//    [NeteaseMusicAPI searchWithQuery:@"泠鸢yousa" type:NMSearch_Singer offset:0 limit:3 completionHandler:handler];
    // 搜索-歌单
//    [NeteaseMusicAPI searchWithQuery:@"秒速五厘米" type:NMSearch_PlayList offset:0 limit:3 completionHandler:handler];
    // 搜索-用户
//    [NeteaseMusicAPI searchWithQuery:@"双笙" type:NMSearch_User offset:0 limit:3 completionHandler:handler];
    // 搜索-MV
//    [NeteaseMusicAPI searchWithQuery:@"双笙" type:NMSearch_Mv offset:0 limit:3 completionHandler:handler];
    // 搜索-歌词
//    [NeteaseMusicAPI searchWithQuery:@"嘟嘟嘟噜" type:NMSearch_Lyric offset:0 limit:3 completionHandler:handler];
    // 搜索-电台
    [NeteaseMusicAPI searchWithQuery:@"双笙" type:NMSearch_Radio offset:0 limit:3 completionHandler:handler];
    
    // 音乐信息
//    [NeteaseMusicAPI musicInfoWithId:422104949 completionHandler:handler];
    // 歌手专辑列表
//    [NeteaseMusicAPI artistAlbumWithArtistId:1047282 limit:3 completionHandler:handler];
    // 专辑信息
//    [NeteaseMusicAPI albumInfoWithAlbumId:3233355 completionHandler:handler];
    // 歌单信息
//    [NeteaseMusicAPI playlistInfoWithPlaylistId:8486041 completionHandler:handler];
    // 歌词
//    [NeteaseMusicAPI musicLyricWithMusicId:426881506 completionHandler:handler];
    // 电台节目信息
//    [NeteaseMusicAPI programInfoWithProgramId:795437823 completionHandler:handler];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
