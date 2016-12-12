//Class DTTypingManager ;
#import "DingTalkHead.h"
#import "DingTalkRedEnvelop.h"
@interface SSSDKFLEXLoader : NSObject

@end

@implementation SSSDKFLEXLoader

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static SSSDKFLEXLoader *_sharedInstance;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (void)show
{
	NSLog(@"lingdaiping  load buding");
	//UIAlertView * alart = [[UIAlertView alloc]initWithTitle:@"lingTest" message:@"lingTest" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
  //[alart show];
}

@end



%ctor {
    
                NSLog(@"lingdaiping  load buding");
                [[NSNotificationCenter defaultCenter] addObserver:[SSSDKFLEXLoader sharedInstance] 
											selector:@selector(show) 
											name:UIApplicationDidBecomeActiveNotification 
											object:nil];
                    

}



%hook DTOpenLuckyMoneyEntityView
- (void)setShowPickButton:(_Bool )showPickButton { %log; %orig; }
- (_Bool )showPickButton { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setViewRandomDetailButton:(UIButton *)viewRandomDetailButton { %log; %orig; }
- (UIButton *)viewRandomDetailButton { %log; UIButton * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setOpenBtnBackgroundImageView:(UIImageView *)openBtnBackgroundImageView { %log; %orig; }

- (void)setOpenLuckyMoneyButton:(UIButton *)openLuckyMoneyButton { %log; %orig; }
- (UIButton *)openLuckyMoneyButton { %log; UIButton * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setViewEnterpriseMoreButton:(UIButton *)viewEnterpriseMoreButton { %log; %orig; }
- (UIButton *)viewEnterpriseMoreButton { %log; UIButton * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setViewMoreButton:(UIButton *)viewMoreButton { %log; %orig; }
- (UIButton *)viewMoreButton { %log; UIButton * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setMoneyLabel:(UILabel *)moneyLabel { %log; %orig; }
- (UILabel *)moneyLabel { %log; UILabel * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setCongratulationsLabel:(UILabel *)congratulationsLabel { %log; %orig; }
- (UILabel *)congratulationsLabel { %log; UILabel * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setSendToListView:(NSObject *)sendToListView { %log; %orig; }
- (NSObject *)sendToListView { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setLuckMoneyTypeInfoLabel:(NSObject *)luckMoneyTypeInfoLabel { %log; %orig; }
- (NSObject *)luckMoneyTypeInfoLabel { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setSenderFromLabel:(NSObject *)senderFromLabel { %log; %orig; }
- (NSObject *)senderFromLabel { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setEnterpriseAvatarView:(NSObject *)enterpriseAvatarView { %log; %orig; }
- (NSObject *)enterpriseAvatarView { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setLuckMoneySenderAvatarView:(NSObject *)luckMoneySenderAvatarView { %log; %orig; }
- (NSObject *)luckMoneySenderAvatarView { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setSealMoneyPartImageView:(UIImageView *)sealMoneyPartImageView { %log; %orig; }
- (UIImageView *)sealMoneyPartImageView { %log; UIImageView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setBackgroundImageView:(UIImageView *)backgroundImageView { %log; %orig; }
- (UIImageView *)backgroundImageView { %log; UIImageView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setPickingModel:(NSObject *)pickingModel { %log; %orig; }
- (NSObject *)pickingModel { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setDelegate:( id  )delegate { %log; %orig; }


- (void)loadViewsFromModel:(id)arg1 { %log; %orig; }
- (void)_configRandomRedEnvelop:(id)arg1 { %log; %orig; }
- (void)_configNormalRedEnvelop:(id)arg1 { %log; %orig; }
- (void)userNameLabelTextDidChange:(id)arg1 change:(id)arg2 { %log; %orig; }
- (void)_configEnterpriseRedEnvelop:(id)arg1 { %log; %orig; }
- (id)currentCluster { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)openLuckyMoney:(double)arg1 stopDuration:(double)arg2 completionBlock:(id)arg3 { %log; %orig; }
- (void)startRotateOpenLuckyMoneyBtn:(long long)arg1 angle:(double)arg2 { %log; %orig; }
- (void)stopLoading { %log; %orig; }
- (void)performLoading { %log; %orig; }
- (void)sizeCtrlToFit { %log; %orig; }
- (void)didClickViewMoreBtn:(id)arg1 { %log; %orig; }
- (void)didClickOpenLuckyMoneyBtn:(id)arg1 { %log; %orig; }
- (void)layoutSubviews { %log; %orig; }
- (void)layoutSubviewsForOthers { %log; %orig; }
- (void)layoutSubviewsForRandom { %log; %orig; }
- (void)layoutSubviewsForEnterprise { %log; %orig; }
- (_Bool)isRandomLuckyMoney { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)isEnterpriseLuckyMoney { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }

- (double)infoMarginTop { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (double)sendFromTopMargin { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }

%end



%hook DTOpenLuckyMoneyView
+ (void)showLuckyMoneyWithPickingStatus:(NSObject *)arg1 withController:(id)arg2 delegate:(id)arg3 
{ 
	NSLog(@"WithPickingStatus = %@,className = %@",arg1,NSStringFromClass(arg1.class));
	%log; %orig;
}
+ (void)queryAndOpenPageWithClusterId:(id)arg1 senderId:(long long)arg2 withController:(id)arg3 { %log; %orig; }
+ (void)pushDetailPageWithPickingStatus:(id)arg1 withController:(id)arg2 { %log; %orig; }
+ (void)pushDetailPageWithDetailModel:(id)arg1 withController:(id)arg2 { %log; %orig; }
+ (id)topPresentedViewController { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)convertMode2PickingModel:(id)arg1 pickingStatus:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)viewWithDelegate:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setStatusModel:(NSObject *)statusModel { %log; %orig; }
- (NSObject *)statusModel { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setAllStarArray:(NSMutableArray *)allStarArray { %log; %orig; }
- (NSMutableArray *)allStarArray { %log; NSMutableArray * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setTapGesture:(UITapGestureRecognizer *)tapGesture { %log; %orig; }
- (UITapGestureRecognizer *)tapGesture { %log; UITapGestureRecognizer * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setBlinkStarArray:(NSArray *)blinkStarArray { %log; %orig; }
- (NSArray *)blinkStarArray { %log; NSArray * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setBackView:(UIView *)backView { %log; %orig; }
- (UIView *)backView { %log; UIView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setBackLightingImageView:(UIImageView *)backLightingImageView { %log; %orig; }
- (UIImageView *)backLightingImageView { %log; UIImageView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setLuckyMoneyEntityView:(NSObject *)luckyMoneyEntityView { %log; %orig; }
- (NSObject *)luckyMoneyEntityView { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }



- (void)presentDetailPageAnimated:(id)arg1 { %log; %orig; }
- (void)dismiss { %log; %orig; }
- (void)didClickViewMore:(id)arg1 { %log; %orig; }
- (void)didClickOpenLuckyMoney:(id)arg1 { %log; %orig; }
- (void)utSeeRedEnvelop:(id)arg1 { %log; %orig; }
- (void)utOpenRedEnvelop:(id)arg1 { %log; %orig; }
- (void)dismissWithAnimated:(_Bool)arg1 progressFinish:(id)arg2 completion:(id)arg3 { %log; %orig; }
- (void)animateWindowMask:(double)arg1 fadeLightDuration:(double)arg2 completionBlock:(id)arg3 { %log; %orig; }
- (void)endLoading { %log; %orig; }
- (void)beginLoading { %log; %orig; }
- (void)loadViewsFromModel:(id)arg1 { %log; %orig; }

- (void)showBackLighting { %log; %orig; }
- (id)createStartImageView { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (struct CGRect)generateRandomRect:(struct CGRect)arg1 maxSize:(struct CGSize)arg2 { %log; struct CGRect r = %orig; return r; }
- (id)createStarForRect:(struct CGRect)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)randomStarsForRect:(struct CGRect)arg1 count:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)performAnimation:(id)arg1 startTime:(double)arg2 { %log; %orig; }

- (void)showBlinkStars { %log; %orig; }
- (void)showLuckMoneyEntityView:(id)arg1 { %log; %orig; }
- (void)reloadData:(id)arg1 { %log; %orig; }
- (void)showWithLuckyMoneyPickingModel:(id)arg1 { %log; %orig; }
- (_Bool)checkLuckyMoneyTypeValid:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)didTap:(id)arg1 { %log; %orig; }
- (void)addTapGestureIfNeeds { %log; %orig; }
- (void)conversationUpdatedNotification:(id)arg1 { %log; %orig; }



%end





%hook DTRedEnvelopPickIService
+ (id)sharedInstance {
  %log; id r = %orig; HBLogDebug(@" = %@", r); return r;
}
+ (id)_appname__ { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)_serviceKey__ { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)leaveMessageToRedEnvelopFlow:(id)arg1 clusterId:(id)arg2 flowId:(id)arg3 leaveMessage:(id)arg4 callback:(id)arg5 { %log; %orig; }
- (void)pickRedEnvelopCluster:(id)arg1 clusterId:(id)arg2 callback:(id)arg3 { %log; %orig; }
- (void)checkRedEnvelopClusterPickingStatus:(id)arg1 clusterId:(id)arg2 callback:(id)arg3 { %log; %orig; }
%end



/*
%hook DTRedEnvelopQueryIService
+ (id)_appname__ { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)_serviceKey__ { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)fetchBalance:(id)arg1 { %log; %orig; }
- (void)queryRedEnvelopClusterByPage:(id)arg1 clusterId:(id)arg2 startTime:(id)arg3 size:(id)arg4 flowId:(id)arg5 callback:(id)arg6 { %log; %orig; }
- (void)queryRedEnvelopCluster:(id)arg1 clusterId:(id)arg2 start:(id)arg3 size:(id)arg4 callback:(id)arg5 { %log; %orig; }
- (void)queryReceivedRedEnvelops:(id)arg1 start:(id)arg2 size:(id)arg3 callback:(id)arg4 { %log; %orig; }
- (void)querySentRedEnvelopClusters:(id)arg1 start:(id)arg2 size:(id)arg3 callback:(id)arg4 { %log; %orig; }
%end
*/

/*
%hook DTRedEnvelopSendIService
+ (id)_appname__ { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (id)_serviceKey__ { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)generateRedEnvelopClusterV2:(id)arg1 clusterId:(id)arg2 amount:(id)arg3 size:(id)arg4 receivers:(id)arg5 type:(id)arg6 cid:(id)arg7 congratulations:(id)arg8 oid:(id)arg9 signString:(id)arg10 signType:(id)arg11 redEnvelopeSubscribeLifecycleModel:(id)arg12 callback:(id)arg13 { %log; %orig; }
- (void)generateRedEnvelopCluster:(id)arg1 clusterId:(id)arg2 amount:(id)arg3 size:(id)arg4 receivers:(id)arg5 type:(id)arg6 cid:(id)arg7 congratulations:(id)arg8 oid:(id)arg9 signString:(id)arg10 signType:(id)arg11 callback:(id)arg12 { %log; %orig; }
%end
*/


%hook DTRedEnvelopServiceFactory
+ (id)createServiceIMPWithPersistence:(id)arg1 network:(id)arg2 { %log; id r = %orig; HBLogDebug(@"createServiceIMPWithPersistence = %@", r); return r; }
+ (id)defaultServiceIMP 
{
 %log; id r = %orig; HBLogDebug(@"DTRedEnvelopServiceFactory,defaultServiceIMP = %@", r); return r; 
}
%end


%hook DTRedEnvelopServiceIMP
- (void)setBindAlipayAccount:(NSString *)bindAlipayAccount { %log; %orig; }
- (NSString *)bindAlipayAccount { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setPersistenceIMP:(id  )persistenceIMP { %log; %orig; }
- (id  )persistenceIMP { %log; id   r = %orig; HBLogDebug(@" = 0x%@", r); return r; }
- (void)setNetworkIMP:(id  )networkIMP { %log; %orig; }
- (id  )networkIMP { %log; id  r = %orig; HBLogDebug(@" = 0x%@", r); return r; }

- (void)onAccountLoggedOut:(id)arg1 { %log; %orig; }
- (void)onAccountLoggedUp:(id)arg1 { %log; %orig; }
- (void)onAccountLoggedIn:(id)arg1 { %log; %orig; }
- (id)unsendRedenvelopRecordInConversationId:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)clearRedenvelopRecordInConversationId:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)redEnvelopRecordWithBusinessId:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)saveRedEnvelopRecord:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)verifierAuthResult:(id)arg1 openId:(id *)arg2 authCode:(id *)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)verifierAliPayResult:(id)arg1 redEnvelopRecord:(id *)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)alipayAuthSign:(id)arg1 successBlock:(id)arg2 failureBlock:(id)arg3 { %log; %orig; }
- (void)alipaySign:(id)arg1 signType:(id)arg2 successBlock:(id)arg3 failureBlock:(id)arg4 { %log; %orig; }
- (void)queryAcquireResult:(id)arg1 successBlock:(id)arg2 failureBlock:(id)arg3 { %log; %orig; }
- (void)getBindAlipaySuccessBlock:(id)arg1 failureBlock:(id)arg2 { %log; %orig; }
- (void)unbindAlipaySuccessBlock:(id)arg1 failureBlock:(id)arg2 { %log; %orig; }
- (void)bindAlipay:(id)arg1 authCode:(id)arg2 successBlock:(id)arg3 failureBlock:(id)arg4 { %log; %orig; }
- (void)fetchBalanceSuccessBlock:(id)arg1 failureBlock:(id)arg2 { %log; %orig; }
- (void)queryRedEnvelopCluster:(long long)arg1 clusterId:(id)arg2 startTime:(long long)arg3 size:(int)arg4 flowId:(long long)arg5 successBlock:(id)arg6 failureBlock:(id)arg7 { %log; %orig; }
- (void)queryReceivedRedEnvelops:(int)arg1 start:(int)arg2 size:(int)arg3 successBlock:(id)arg4 failureBlock:(id)arg5 { %log; %orig; }
- (void)querySentRedEnvelopClusters:(int)arg1 start:(int)arg2 size:(int)arg3 successBlock:(id)arg4 failureBlock:(id)arg5 { %log; %orig; }
- (void)leaveMessageToRedEnvelopFlow:(long long)arg1 clusterId:(id)arg2 flowId:(int)arg3 leaveMessage:(id)arg4 successBlock:(id)arg5 failureBlock:(id)arg6 { %log; %orig; }
- (void)pickRedEnvelopCluster:(long long)arg1 clusterId:(NSObject *)arg2 successBlock:(id)arg3 failureBlock:(id)arg4 
{ 
   
   NSLog(@"clusterId = %@,className = %@",arg2,NSStringFromClass(arg2.class));
   %log; %orig; 
}
- (void)checkRedEnvelopClusterPickingStatus:(long long)arg1 clusterId:(id)arg2 successBlock:(id)arg3 failureBlock:(id)arg4 { %log; %orig; }
- (void)generateRedEnvelopCluster:(long long)arg1 clusterId:(id)arg2 amount:(id)arg3 size:(int)arg4 receivers:(id)arg5 type:(long long)arg6 cid:(id)arg7 congratulations:(id)arg8 oid:(long long)arg9 redEnvelopeSubscribeLifecycleModel:(id)arg10 successBlock:(id)arg11 failureBlock:(id)arg12 { %log; %orig; }
- (id)signStringWithSender:(long long)arg1 clusterId:(id)arg2 amount:(id)arg3 size:(int)arg4 receivers:(id)arg5 type:(long long)arg6 cid:(id)arg7 oid:(long long)arg8 {
 			%log; id r = %orig; HBLogDebug(@" = %@", r); return r; 
 }
- (id)getBindAlipayAccount { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)generateClusterId { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)sendInitAlipay { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }

%end


/*%hook DTRedEnvelopServiceNetworkIMP
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)alipayAuthSign:(id)arg1 successBlock:(id)arg2 failureBlock:(id)arg3 { %log; %orig; }
- (void)alipaySign:(id)arg1 signType:(id)arg2 successBlock:(id)arg3 failureBlock:(id)arg4 { %log; %orig; }
- (void)queryAcquireResult:(id)arg1 successBlock:(id)arg2 failureBlock:(id)arg3 { %log; %orig; }
- (void)getBindAlipaySuccessBlock:(id)arg1 failureBlock:(id)arg2 { %log; %orig; }
- (void)unbindAlipaySuccessBlock:(id)arg1 failureBlock:(id)arg2 { %log; %orig; }
- (void)bindAlipay:(id)arg1 authCode:(id)arg2 signString:(id)arg3 signType:(id)arg4 successBlock:(id)arg5 failureBlock:(id)arg6 { %log; %orig; }
- (void)fetchBalanceSuccessBlock:(id)arg1 failureBlock:(id)arg2 { %log; %orig; }
- (void)queryRedEnvelopCluster:(long long)arg1 clusterId:(id)arg2 startTime:(long long)arg3 size:(int)arg4 flowId:(long long)arg5 successBlock:(id)arg6 failureBlock:(id)arg7 { %log; %orig; }
- (void)queryReceivedRedEnvelops:(int)arg1 start:(int)arg2 size:(int)arg3 successBlock:(id)arg4 failureBlock:(id)arg5 { %log; %orig; }
- (void)querySentRedEnvelopClusters:(int)arg1 start:(int)arg2 size:(int)arg3 successBlock:(id)arg4 failureBlock:(id)arg5 { %log; %orig; }
- (void)leaveMessageToRedEnvelopFlow:(long long)arg1 clusterId:(id)arg2 flowId:(int)arg3 leaveMessage:(id)arg4 successBlock:(id)arg5 failureBlock:(id)arg6 { %log; %orig; }
- (void)pickRedEnvelopCluster:(long long)arg1 clusterId:(id)arg2 successBlock:(id)arg3 failureBlock:(id)arg4 { %log; %orig; }
- (void)checkRedEnvelopClusterPickingStatus:(long long)arg1 clusterId:(id)arg2 successBlock:(id)arg3 failureBlock:(id)arg4 { %log; %orig; }
- (void)generateRedEnvelopClusterV2:(long long)arg1 clusterId:(id)arg2 amount:(id)arg3 size:(int)arg4 receivers:(id)arg5 type:(long long)arg6 cid:(id)arg7 congratulations:(id)arg8 oid:(long long)arg9 redEnvelopeSubscribeLifecycleModel:(id)arg10 signString:(id)arg11 signType:(id)arg12 successBlock:(id)arg13 failureBlock:(id)arg14 { %log; %orig; }
- (void)generateRedEnvelopCluster:(long long)arg1 clusterId:(id)arg2 amount:(id)arg3 size:(int)arg4 receivers:(id)arg5 type:(long long)arg6 cid:(id)arg7 congratulations:(id)arg8 oid:(long long)arg9 signString:(id)arg10 signType:(id)arg11 successBlock:(id)arg12 failureBlock:(id)arg13 { %log; %orig; }

%end
*/


/*%hook DTRedEnvelopServicePersistenceIMP
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setRedEnvelopHandler:(NSObject *)redEnvelopHandler { %log; %orig; }
- (NSObject *)redEnvelopHandler { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setDbConnection:(NSObject *)dbConnection { %log; %orig; }
- (NSObject *)dbConnection { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (id)unsendRedenvelopRecordInConversationId:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)clearRedenvelopRecordInConversationId:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)redEnvelopRecordWithBusinessId:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)saveRedEnvelopRecord:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)initWithDbConnection:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }




%end
*/


%hook DTMessageMTMViewController
- (void)setNeedRefreshWatermark:(_Bool )needRefreshWatermark { %log; %orig; }
- (_Bool )needRefreshWatermark { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
//- (void)setWaterView:(DTWaterMarkView *)waterView { %log; %orig; }
//- (DTWaterMarkView *)waterView { %log; DTWaterMarkView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setEnterpriseRedEnvelopModes:(NSArray *)enterpriseRedEnvelopModes { %log; %orig; }
- (NSArray *)enterpriseRedEnvelopModes { %log; NSArray * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setEnterpriseRedEnvelopTransitionView:(DTEnterpriseRedEnvelopTransitionView *)enterpriseRedEnvelopTransitionView { %log; %orig; }
//- (DTEnterpriseRedEnvelopTransitionView *)enterpriseRedEnvelopTransitionView { %log; DTEnterpriseRedEnvelopTransitionView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setRightBarSettingView:(UIView *)rightBarSettingView { %log; %orig; }
- (UIView *)rightBarSettingView { %log; UIView * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (_Bool)hasNewAnnounce { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)currentDataSourceType { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)showRibbonViewSafety { %log; %orig; }
- (void)checkShowRibbonWithMessages:(id)arg1 { %log; %orig; }
- (void)checkShowRibbonWithRedEnvelops:(id)arg1 { %log; %orig; }
- (void)openLuckyMoneyWithMessage:(NSObject *)arg1 redEnvelopMode:(NSObject *)arg2 
{ 
NSLog(@"openLuckyMoneyWithMessage = %@,className = %@",arg1,NSStringFromClass(arg1.class));
NSLog(@"openLuckyMoneyWithMessage,redEnvelopMode = %@,className = %@",arg2,NSStringFromClass(arg2.class));
%log; %orig; 
}
- (void)onClose { %log; %orig; }
- (void)onClickRedEnvelop:(NSObject *)arg1 {
  NSLog(@"onClickRedEnvelop = %@,className = %@",arg1,NSStringFromClass(arg1.class));
 %log; %orig; 
 }
- (void)didTouchReadCountButtonOnMessageCollectionViewCell:(id)arg1 { %log; %orig; }
- (void)didTouchReadAlertButtonOnMessageCollectionViewCell:(id)arg1 { %log; %orig; }
- (void)handleNotificationMessages:(id)arg1 { %log; %orig; }
- (void)receivedMessageListNotification:(id)arg1 { %log; %orig; }
- (void)receivedMessageNotification:(id)arg1 { %log; %orig; }
- (void)conversationUpdatedNotification:(id)arg1 { %log; %orig; }
- (void)refreshWatarMarkIfNeeded { %log; %orig; }


- (_Bool)hasAnnouce { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)refreshSettingHotDot { %log; %orig; }
- (void)configRightNavigationBar { %log; %orig; }
- (void)configureMessagesNavigationBar { %log; %orig; }
- (void)configureMessagesViewController { %log; %orig; }
- (id)buildMessageDataSource { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)groupAnnounceHadRead:(id)arg1 { %log; %orig; }

- (void)isAttentionDidChange:(id)arg1 { %log; %orig; }
- (void)addObserver { %log; %orig; }

- (id)initWithNibName:(id)arg1 bundle:(id)arg2 conversation:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }

%end



%hook DTMessageOTOViewController

+ (id)messagesViewControllerWithConversation:(NSObject *)arg1 cmailMode:(NSObject *)arg2 { 
 NSLog(@"messagesViewControllerWithConversation = %@,className = %@",arg1,NSStringFromClass(arg1.class));
 NSLog(@"messagesViewControllerWithConversation,cmailMode = %@,className = %@",arg2,NSStringFromClass(arg2.class));
%log; id r = %orig; HBLogDebug(@" = %@", r); return r; 
}

//- (DTBadgeView *)bossChatNoticeBtnBadgeView { %log; DTBadgeView * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setBossChatNoticeBtn:(UIButton *)bossChatNoticeBtn { %log; %orig; }
- (UIButton *)bossChatNoticeBtn { %log; UIButton * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setTypingManager:(DTTypingManager *)typingManager { %log; %orig; }
//- (DTTypingManager *)typingManager { %log; DTTypingManager * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setEmailTransitionView:(DTCEmailTransitionView *)emailTransitionView { %log; %orig; }
//- (DTCEmailTransitionView *)emailTransitionView { %log; DTCEmailTransitionView * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setCmailMode:(DTCMailMode *)cmailMode { %log; %orig; }
//- (DTCMailMode *)cmailMode { %log; DTCMailMode * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (id)badgeViewStringWithValue:(long long)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isBossMessage:(id)arg1 cId:(id *)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)delayRefreshBossIconWithSecretChatId:(id)arg1 { %log; %orig; }
- (void)refreshBossIconWithSecretChatId:(id)arg1 { %log; %orig; }
- (void)keyboardDidFinishChange:(_Bool)arg1 { %log; %orig; }
- (void)handleNotificationMessage:(id)arg1 { %log; %orig; }
- (void)receivedMessageListNotification:(id)arg1 { %log; %orig; }
- (void)receivedMessageNotification:(id)arg1 { %log; %orig; }
- (void)typingCommandDidChange:(id)arg1 { %log; %orig; }
- (void)cancelTyping { %log; %orig; }
- (void)didTouchReadCountButtonOnMessageCollectionViewCell:(id)arg1 { %log; %orig; }
- (void)growingTextView:(id)arg1 willChangeHeight:(float)arg2 { %log; %orig; }
- (_Bool)growingTextView:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementText:(id)arg3 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)growingTextViewShouldEndEditing:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (_Bool)growingTextViewShouldBeginEditing:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)showUnreadCountBtn { %log; %orig; }
- (void)setCmailTransitionViewUp:(_Bool)arg1 dismiss:(_Bool)arg2 { %log; %orig; }
- (void)dismissCEmailTransitionView { %log; %orig; }
- (void)sendCEmailMessageToConversation { %log; %orig; }
- (void)loadMoreData { %log; %orig; }
- (void)dismissGuideView { %log; %orig; }
- (void)showGuideViewIfNeed { %log; %orig; }
- (void)beginDrop { %log; %orig; }
- (void)dropboxIsOpened { %log; %orig; }
- (void)willMoveToParentViewController:(id)arg1 { %log; %orig; }
- (void)didReceiveMemoryWarning { %log; %orig; }
- (void)onBossChatNoticeBtnClick:(id)arg1 { %log; %orig; }
- (void)refreshBossNoticeBtn { %log; %orig; }
- (void)configRightNavigationBar { %log; %orig; }
- (void)configureMessagesNavigationBar { %log; %orig; }
- (void)configureMessagesViewController { %log; %orig; }
- (void)viewDidAppear:(_Bool)arg1 { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
- (void)addObserver { %log; %orig; }
- (id)initWithNibName:(id)arg1 bundle:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }

%end




%hook DTConversationListController
//- (void)setAdditionManager:(DTExternalContactAdditionManager *)additionManager { %log; %orig; }
//- (DTExternalContactAdditionManager *)additionManager { %log; DTExternalContactAdditionManager * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setLastHeaderStatus:(long long )lastHeaderStatus { %log; %orig; }
- (long long )lastHeaderStatus { %log; long long  r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (void)setShowNetStatusHelper:(_Bool )showNetStatusHelper { %log; %orig; }
- (_Bool )showNetStatusHelper { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
//- (void)setNetStatusMonitor:(DTNetStatusMonitor *)netStatusMonitor { %log; %orig; }
//- (DTNetStatusMonitor *)netStatusMonitor { %log; DTNetStatusMonitor * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setLoginTipView:(DTRLoginTipView *)loginTipView { %log; %orig; }
//- (DTRLoginTipView *)loginTipView { %log; DTRLoginTipView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setRightBarMenuView:(UIView *)rightBarMenuView { %log; %orig; }
- (UIView *)rightBarMenuView { %log; UIView * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setBannerView:(DTBannerView *)bannerView { %log; %orig; }
//- (DTBannerView *)bannerView { %log; DTBannerView * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setGuide:(DTAIGuide *)guide { %log; %orig; }
//- (DTAIGuide *)guide { %log; DTAIGuide * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setLeftBtnBadgeView:(DTBadgeView *)leftBtnBadgeView { %log; %orig; }
//- (DTBadgeView *)leftBtnBadgeView { %log; DTBadgeView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setLeftBarItem:(UIBarButtonItem *)leftBarItem { %log; %orig; }
//- (UIBarButtonItem *)leftBarItem { %log; UIBarButtonItem * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setIsHookStopped:(_Bool )isHookStopped { %log; %orig; }
- (_Bool )isHookStopped { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setAutoStopPushReconnectTimer:(NSTimer *)autoStopPushReconnectTimer { %log; %orig; }
- (NSTimer *)autoStopPushReconnectTimer { %log; NSTimer * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setIsIMSyncUser:(_Bool )isIMSyncUser { %log; %orig; }
- (_Bool )isIMSyncUser { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setPushReconnecting:(_Bool )pushReconnecting { %log; %orig; }
- (_Bool )pushReconnecting { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setDelayUpdateTimer:(NSTimer *)delayUpdateTimer { %log; %orig; }
- (NSTimer *)delayUpdateTimer { %log; NSTimer * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setAppStatusChangeTime:(NSDate *)appStatusChangeTime { %log; %orig; }
- (NSDate *)appStatusChangeTime { %log; NSDate * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setAppStatus:(int )appStatus { %log; %orig; }
- (int )appStatus { %log; int  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setLastConnectionStatus:(int )lastConnectionStatus { %log; %orig; }
- (int )lastConnectionStatus { %log; int  r = %orig; HBLogDebug(@" = %d", r); return r; }
//- (void)setTipsView:(DTTipsView *)tipsView { %log; %orig; }
//- (DTTipsView *)tipsView { %log; DTTipsView * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setQuickActionView:(DTQuickActionView *)quickActionView { %log; %orig; }
//- (DTQuickActionView *)quickActionView { %log; DTQuickActionView * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setSearchBar:(DTSearchBar *)searchBar { %log; %orig; }
//- (DTSearchBar *)searchBar { %log; DTSearchBar * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setSearchDC:(DTSearchDisplayController *)searchDC { %log; %orig; }
//- (DTSearchDisplayController *)searchDC { %log; DTSearchDisplayController * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setSelectedConversation:(NSObject *)selectedConversation { %log; %orig; }
//- (NSObject *)selectedConversation { %log; DTBizConversation * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setDataSource:(NSObject *)dataSource { %log; %orig; }
- (NSObject *)dataSource { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setTableView:(DTTableView *)tableView { %log; %orig; }
//- (DTTableView *)tableView { %log; DTTableView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setConnectIndicator:(UIActivityIndicatorView *)connectIndicator { %log; %orig; }
- (UIActivityIndicatorView *)connectIndicator { %log; UIActivityIndicatorView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setTitleLabel:(UILabel *)titleLabel { %log; %orig; }
- (UILabel *)titleLabel { %log; UILabel * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setTitleView:(UIView *)titleView { %log; %orig; }
- (UIView *)titleView { %log; UIView * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void).cxx_destruct { %log; %orig; }
- (void)viewWillLayoutSubviews { %log; %orig; }
- (void)searchDisplayController:(id)arg1 willHideSearchResultsTableView:(id)arg2 { %log; %orig; }
- (void)searchDisplayController:(id)arg1 willShowSearchResultsTableView:(id)arg2 { %log; %orig; }
- (void)searchDisplayControllerDidBeginSearch:(id)arg1 { %log; %orig; }
- (id)homePageForSearchWithFrame:(struct CGRect)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)shouldShowHomePageForSearch { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)viewControllerName { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)previewingContext:(id)arg1 commitViewController:(id)arg2 { %log; %orig; }
- (id)previewingContext:(id)arg1 viewControllerForLocation:(struct CGPoint)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)tipsViewDidClick:(id)arg1 { %log; %orig; }
- (_Bool)quitOrDisbandConversation:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (id)handleCellDidSelectForIndexPath:(id)arg1 isPreview:(_Bool)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 { %log; %orig; }
//- (double)tableView:(id)arg1 heightForFooterInSection:(long long)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
//- (id)tableView:(id)arg1 viewForHeaderInSection:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (double)tableView:(id)arg1 heightForHeaderInSection:(long long)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
//- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (long long)headerStatus { %log; long long r = %orig; HBLogDebug(@" = %lld", r); return r; }
- (void)restartHook { %log; %orig; }
- (void)stopHook { %log; %orig; }
- (void)updateConnectionAppStatus:(int)arg1 { %log; %orig; }
- (void)onNetStatusWarning:(id)arg1 { %log; %orig; }
- (void)delayUpdateConnectionAppStatus:(id)arg1 { %log; %orig; }
- (void)updateConnectionStatusTitleWithFlag:(_Bool)arg1 { %log; %orig; }
- (void)updateConnectionStatusTitle { %log; %orig; }
- (void)delayUpdateConnectionStatusTitle:(id)arg1 { %log; %orig; }
- (void)endAutoStopPushReconnectTimer { %log; %orig; }
- (void)beginAutoStopPushReconnectTimer { %log; %orig; }
- (void)onReconnectEnd:(id)arg1 { %log; %orig; }
- (void)loadIMSyncUserInfo { %log; %orig; }
- (void)onRecvMsg:(NSObject *)arg1 {
   NSLog(@"DTConversationListController onRecvMsg = %@,className = %@",arg1,NSStringFromClass(arg1.class));
   %log; %orig; 
 }
- (void)onReconnectBegin:(id)arg1 { %log; %orig; }
- (void)onThirdPartyEncryptRefreshKeySuccess:(id)arg1 { %log; %orig; }
- (void)workInfoChanged:(id)arg1 { %log; %orig; }
- (void)conversationListCustomSortChanged:(id)arg1 { %log; %orig; }
- (void)enterpriseOrgAuthEmailModified:(id)arg1 { %log; %orig; }
- (void)onBossModeUnreadCountChanged:(id)arg1 { %log; %orig; }
- (void)onBossIconChanged:(id)arg1 { %log; %orig; }
- (void)onBossModeHideChanged:(id)arg1 { %log; %orig; }
- (void)onBannerChanged:(id)arg1 { %log; %orig; }
- (void)onRLoginAPNEnableChanged:(id)arg1 { %log; %orig; }
- (void)onDeviceStatuChanged:(id)arg1 { %log; %orig; }
- (void)onAppDidBecomeActive:(id)arg1 { %log; %orig; }
- (void)onClientStatusChanged:(id)arg1 { %log; %orig; }
- (void)onNetworkStatusChanged:(id)arg1 { %log; %orig; }
- (void)tabBarItemDoubleClicked { %log; %orig; }
- (void)goBossModeList:(id)arg1 { %log; %orig; }
- (void)onScan:(id)arg1 { %log; %orig; }
- (void)onSpace:(id)arg1 { %log; %orig; }
- (void)onMail:(id)arg1 { %log; %orig; }
- (void)onAddFriend:(id)arg1 { %log; %orig; }
- (void)onCreateConversation:(id)arg1 { %log; %orig; }
- (void)onMakeConference:(id)arg1 { %log; %orig; }
- (void)checkShowBossHideGuide { %log; %orig; }
- (id)leftBadgeViewStringWithValue:(long long)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)refreshBossUnreadNoticeWithOldCount:(unsigned long long)arg1 newCount:(unsigned long long)arg2 { %log; %orig; }
- (void)onNetStatusHelperPressed:(id)arg1 { %log; %orig; }
- (void)refreshTableTopBar { %log; %orig; }
- (void)onRLoginTipPressed:(id)arg1 { %log; %orig; }
- (void)guideSetting { %log; %orig; }
- (void)assignmentDataSource { %log; %orig; }
- (void)loadTableView { %log; %orig; }
- (void)loadSearchView { %log; %orig; }
- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4 { %log; %orig; }
- (void)loadTitleView { %log; %orig; }
- (void)loadComponents { %log; %orig; }
- (void)showsGuideView { %log; %orig; }
- (void)layoutQuickActionView { %log; %orig; }
- (void)dismissMenu { %log; %orig; }
- (void)showMenu { %log; %orig; }
- (void)setRightNavigationItem { %log; %orig; }
- (void)setNavigationItem { %log; %orig; }
- (void)viewDidDisappear:(_Bool)arg1 { %log; %orig; }
- (void)viewDidLoad { %log; %orig; }
- (void)viewDidAppear:(_Bool)arg1 { %log; %orig; }
- (void)viewWillDisappear:(_Bool)arg1 { %log; %orig; }
- (void)viewWillAppear:(_Bool)arg1 { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (void)setUpDataSource { %log; %orig; }
- (id)initWithNibName:(id)arg1 bundle:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }

%end


%hook DTMessageBaseViewController
- (void)checkRedEnvelopPickingStatus:(NSObject *)arg1 redEnvelopMode:(NSObject *)arg2 callback:(id)arg3{
NSLog(@"DTMessageBaseViewController,checkRedEnvelopPickingStatus = %@,className = %@,redEnvelopMode = %@,%@",arg1,NSStringFromClass(arg1.class),arg2,NSStringFromClass(arg2.class));

%log; %orig;
}



- (void)openLuckyMoneyWithMessage:(NSObject *)arg1 redEnvelopMode:(NSObject *)arg2{
NSLog(@"DTMessageBaseViewController,openLuckyMoneyWithMessage = %@,className = %@,redEnvelopMode = %@,%@",arg1,NSStringFromClass(arg1.class),arg2,NSStringFromClass(arg2.class));
%log; %orig;
}

- (void)utShowRedEnvelop:(NSObject *)arg1{
NSLog(@"DTMessageBaseViewController,utShowRedEnvelop = %@,className = %@",arg1,NSStringFromClass(arg1.class));
%log; %orig;
}

- (void)openLuckyMoneyWithMessage:(NSObject *)arg1{
NSLog(@"DTMessageBaseViewController,openLuckyMoneyWithMessage = %@,className = %@",arg1,NSStringFromClass(arg1.class));
%log; %orig;
}
%end





/*%hook LWPMessenger
- (void)setSessionReuseContext:(NSObject *)sessionReuseContext { %log; %orig; }
- (NSObject *)sessionReuseContext { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setLastBackgroundDate:(NSDate *)lastBackgroundDate { %log; %orig; }
- (NSDate *)lastBackgroundDate { %log; NSDate * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setServerUrl:(NSString *)serverUrl { %log; %orig; }
- (NSString *)serverUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setIsStarted:(_Bool )isStarted { %log; %orig; }
- (_Bool )isStarted { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)setMasterStatus:(int )masterStatus { %log; %orig; }
- (int )masterStatus { %log; int  r = %orig; HBLogDebug(@" = %d", r); return r; }

- (void)updateMasterTryLaterTime { %log; %orig; }
- (void)_endNetDetectTimer { %log; %orig; }
- (void)_startSlowConnNetDetectTimerIfNeed:(id)arg1 { %log; %orig; }
- (_Bool)shouldStartNetDetectTimer { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)_endSlowSendDetectTimer { %log; %orig; }
- (void)_processSlowSendTask:(id)arg1 withLastMasterAuthDate:(id)arg2 { %log; %orig; }
- (_Bool)_shouldCheckSlowSend:(id)arg1 lastMasterAuthDate:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)_startSlowSendDetectTimerIfNeed:(id)arg1 message:(id)arg2 { %log; %orig; }
- (void)_didConnectionBroken:(id)arg1 { %log; %orig; }
- (id)slaveServerUrls { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)masterServerUrl { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)updateSlavePoolSize:(long long)arg1 subMode:(long long)arg2 { %log; %orig; }
- (void)lwpConnectionRecvMessage:(id)arg1 message:(id)arg2 { %log; %orig; }


- (void)lwpConnectionWillRecvMessage:(id)arg1 message:(id)arg2 
{ %log; %orig;
 }
 
 
 
- (void)lwpConnection:(id)arg1 willSendMessage:(id)arg2 isFirstMessage:(_Bool)arg3 { %log; %orig; }
- (void)lwpConnectionTokenInvalid:(id)arg1 { %log; %orig; }
- (void)lwpConnectionTokenAuthed:(id)arg1 { %log; %orig; }
- (void)lwpConnectionBroken:(id)arg1 { %log; %orig; }
- (void)lwpConnectionConnectFail:(id)arg1 error:(id)arg2 { %log; %orig; }
- (void)lwpConnection:(id)arg1 didUpdateSessionContext:(id)arg2 reuse:(_Bool)arg3 { %log; %orig; }
- (void)lwpConnection:(id)arg1 didUpdateSessionContext:(id)arg2 { %log; %orig; }
- (void)lwpConnectionConnected:(id)arg1 context:(id)arg2 sessionReuse:(_Bool)arg3 { %log; %orig; }
- (void)lwpConnection:(id)arg1 triggerHandshakeEvent:(int)arg2 { %log; %orig; }
- (void)lwpConnectionStartConnect:(id)arg1 { %log; %orig; }
- (id)contextForLwpConnection:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)serverUrlForLwpConnection:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)lwpConnectionBuildAuthRequest:(id)arg1 token:(id)arg2 header:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)buildCacheHeaders:(id)arg1 isFullBuild:(_Bool)arg2 { %log; %orig; }
- (void)didRecvAutoConnectConfigNtf:(id)arg1 { %log; %orig; }
- (void)didEnterBackgrounddNotification:(id)arg1 { %log; %orig; }
- (void)willEnterForegroundNotification:(id)arg1 { %log; %orig; }
- (void)willTerminateNotification:(id)arg1 { %log; %orig; }
- (void)didBecomeActiveNotification:(id)arg1 { %log; %orig; }
- (void)cleanObserver { %log; %orig; }
- (void)setupObserver { %log; %orig; }
- (void)networkStatusChanged:(unsigned long long)arg1 { %log; %orig; }
- (id)reachabilityHost { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setupNetwork { %log; %orig; }
- (void)postNotificationName:(id)arg1 object:(id)arg2 userInfo:(id)arg3 { %log; %orig; }
- (void)updateAuthToken:(id)arg1 header:(id)arg2 callback:(NSObject *)arg3 { %log; %orig; }
- (double)calcAutoDisconnectTime:(int)arg1 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (void)newSlaveConnectionIfNeed:(id)arg1 { %log; %orig; }
- (void)newSlaveConnectionWithSid:(id)arg1 subMode:(long long)arg2 { %log; %orig; }
- (id)internalWhiteUrls { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)sendMessage:(id)arg1 message:(id)arg2 mode:(unsigned long long)arg3 { %log; %orig; }
- (void)sendResponse:(id)arg1 response:(id)arg2 mode:(unsigned long long)arg3 { %log; %orig; }
- (void)sendRequest:(id)arg1 mode:(unsigned long long)arg2 { %log; %orig; }
- (void)reconnectIfNeccessary:(unsigned long long)arg1 subModes:(id)arg2 { %log; %orig; }
- (void)requestDestoryed:(id)arg1 error:(id)arg2 withResponse:(id)arg3 { %log; %orig; }
- (void)process:(id)arg1 { %log; %orig; }
- (void)disconnectAway { %log; %orig; }
- (id)getOneSlaveConnection:(long long)arg1 uniqueSid:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)disconnectConnWithId:(id)arg1 { %log; %orig; }
- (void)disconnectAllConnection { %log; %orig; }
- (void)clear { %log; %orig; }
- (void)shutdown { %log; %orig; }
- (id)buildConnection:(unsigned long long)arg1 subMode:(long long)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)startup { %log; %orig; }
- (_Bool)isMasterConnected { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)dealloc { %log; %orig; }
- (id)initWithQueue:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)debugDescription { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (NSString *)description { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; HBLogDebug(@" = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; HBLogDebug(@" = %@", r); return r; }
%end
*/

/*
%hook WKSyncProtocol
+ (id)sharedInstance { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setIsSyncing:(_Bool )isSyncing { %log; %orig; }
- (_Bool )isSyncing { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
//- (void)setProtocolProcessQueue:(OpenGCDQueue *)protocolProcessQueue { %log; %orig; }
//- (OpenGCDQueue *)protocolProcessQueue { %log; OpenGCDQueue * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void).cxx_destruct { %log; %orig; }
- (void)alarmConverException:(id)arg1 totalCount:(long long)arg2 { %log; %orig; }
- (void)exceptionCheck:(id)arg1 persistence:(id)arg2 { %log; %orig; }
- (void)recordSyncPackage:(id)arg1 { %log; %orig; }
- (id)syncInfoDescription:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)alarmToolong2:(id)arg1 { %log; %orig; }
- (void)_syncData:(id)arg1 persistence:(id)arg2 msgAckBlock:(id)arg3 finishBlock:(id)arg4 { %log; %orig; }
- (_Bool)isSyncPackageValid:(id)arg1 syncInfo:(id)arg2 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)syncData:(id)arg1 persistence:(id)arg2 msgAckBlock:(id)arg3 finishBlock:(id)arg4 { %log; %orig; }
- (void)getStateWithSyncInfo:(id)arg1 successBlock:(id)arg2 failureBlock:(id)arg3 { %log; %orig; }
- (void)getDiffWithSyncInfo:(id)arg1 successBlock:(id)arg2 finishBlock:(id)arg3 { %log; %orig; }
- (void)manualSyncWithSyncInfo:(id)arg1 persistence:(id)arg2 finishBlock:(id)arg3 { %log; %orig; }
- (void)ackDiff:(id)arg1 finishBlock:(id)arg2 { %log; %orig; }
- (id)parseSyncData2Array:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (double)timeoutForTypes:(id)arg1 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (id)errorWithCode:(long long)arg1 msg:(id)arg2 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)getAllBizData:(id)arg1 successBlock:(id)arg2 failureBlock:(id)arg3 { %log; %orig; }
- (void)_dispatch_async:(NSObject *)arg1 { %log; %orig; }
- (void)dispatchData:(id)arg1 finishBlock:(NSObject *)arg2 { %log; %orig; }
- (id)syncHandlerKey:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)filterSyncHandlerWithTypesArray:(id)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }

- (void)registerSyncTypes:(id)arg1 modelClasses:(id)arg2 virtualTopic:(id)arg3 delegate:(id)arg4 { %log; %orig; }
- (void)unregisterSyncHandler:(id)arg1 virtualTopic:(id)arg2 { %log; %orig; }
- (void)unregisterSyncTypes:(id)arg1 modelClasses:(id)arg2 virtualTopic:(id)arg3 delegate:(id)arg4 { %log; %orig; }
- (void)unregisterSyncType:(id)arg1 modelClass:(Class)arg2 virtualTopic:(id)arg3 delegate:(id)arg4 { %log; %orig; }
- (void)registerSyncType:(id)arg1 modelClass:(Class)arg2 virtualTopic:(id)arg3 delegate:(id)arg4 { %log; %orig; }
- (void)unregisterSyncNoticeHandler:(id)arg1 virtualTopic:(id)arg2 { %log; %orig; }
- (void)registerSyncNoticeHandler:(id)arg1 virtualTopic:(id)arg2 { %log; %orig; }
- (void)registerSyncHandler:(id)arg1 virtualTopic:(id)arg2 { %log; %orig; }
- (id)_findHandlerWithTypes:(id)arg1 modelClasses:(id)arg2 delegate:(id)arg3 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (_Bool)isValidClasses:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
- (void)clearSyncHandler { %log; %orig; }
- (void)dealloc { %log; %orig; }
- (void)configInternalSyncNoticeTopic { %log; %orig; }
- (void)setProcessQueue:(id)arg1 { %log; %orig; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }

- (void)dispatchData:(NSObject *)arg1 toSyncHandler:(NSObject *)arg2 finishBlock:(NSObject *)arg3{
//WKSyncDataItem
NSLog(@"WKSyncProtocol,dispatchData = %@,className = %@,toSyncHandler = %@,%@",arg1,NSStringFromClass(arg1.class),arg2,NSStringFromClass(arg2.class));
 %log; %orig;
}
%end
*/


/*
%hook WKSyncDataItem
+ (id)itemWithModel:(NSObject *)arg1 modelType:(long long)arg2{
//WKIDLMessageModel
%log; id r = %orig; HBLogDebug(@" = %@", r); return r; 
NSLog(@"WKSyncDataItem,itemWithModel = %@,modelType = %@",arg1,NSStringFromClass(arg1.class));
//NSObject *ob = arg1.baseMessage;
}

//WKIDLBaseMessageModel
- (id)initWithModel:(NSObject *)arg1 modelType:(long long)arg2{
%log; id r = %orig; HBLogDebug(@" = %@", r); return r;
NSLog(@"WKSyncDataItem,initWithModel = %@,modelType = %@",arg1,NSStringFromClass(arg1.class));
}
%end
*/


/*
%hook WKIDLBaseMessageModel
- (void)setGroupNickTag:(NSNumber *)groupNickTag { %log; %orig; }
- (NSNumber *)groupNickTag { %log; NSNumber * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setRecallStatus:(NSNumber *)recallStatus { %log; %orig; }
- (NSNumber *)recallStatus { %log; NSNumber * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setMemberExtension:(NSDictionary *)memberExtension { %log; %orig; }
- (NSDictionary *)memberExtension { %log; NSDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setMemberTag:(NSNumber *)memberTag { %log; %orig; }
- (NSNumber *)memberTag { %log; NSNumber * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setExtension:(NSDictionary *)extension { %log; %orig; }
- (NSDictionary *)extension { %log; NSDictionary * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setTag:(NSNumber *)tag { %log; %orig; }
- (NSNumber *)tag { %log; NSNumber * r = %orig; HBLogDebug(@" = %@", r); return r; }

//- (void)setContent:(WKIDLContentModel *)content { %log; %orig; }
//- (WKIDLContentModel *)content { %log; WKIDLContentModel * r = %orig; HBLogDebug(@" = %@", r); return r; }


- (void)setCreatedAt:(NSNumber *)createdAt { %log; %orig; }
- (NSNumber *)createdAt { %log; NSNumber * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setCreatorType:(NSNumber *)creatorType { %log; %orig; }
- (NSNumber *)creatorType { %log; NSNumber * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setType:(NSNumber *)type { %log; %orig; }
- (NSNumber *)type { %log; NSNumber * r = %orig; HBLogDebug(@" = %@", r); return r; }

//- (void)setOpenIdEx:(WKIDLOpenIdExModel *)openIdEx { %log; %orig; }

//- (WKIDLOpenIdExModel *)openIdEx { %log; WKIDLOpenIdExModel * r = %orig; HBLogDebug(@" = %@", r); return r; }


- (void)setConversationId:(NSString *)conversationId { %log; %orig; }
- (NSString *)conversationId { %log; NSString * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setMessageId:(NSNumber *)messageId { %log; %orig; }
- (NSNumber *)messageId { %log; NSNumber * r = %orig; HBLogDebug(@" = %@", r); return r; }

- (id)filedsMeta__ { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (id)init { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
%end
*/


%hook DTConversationListDataSource
- (void)setLoadingIndicator:(UIActivityIndicatorView *)loadingIndicator { %log; %orig; }
- (UIActivityIndicatorView *)loadingIndicator { %log; UIActivityIndicatorView * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setConversationList:(NSMutableArray *)conversationList { %log; %orig; }
- (NSMutableArray *)conversationList { %log; id  r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setEmptyResultView:(NSObject *)emptyResultView { %log; %orig; }
- (NSObject *)emptyResultView { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)setShowBossConversations:(_Bool )showBossConversations { %log; %orig; }
- (_Bool )showBossConversations { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return r; }
//- (void)setTableView:(__weak DTTableView *)tableView { %log; %orig; }
//- (__weak UITableView *)tableView { %log; __weak UITableView * r = %orig; HBLogDebug(@" = 0x%x", (unsigned int)r); return r; }
//- (void)setEmptyViewClickBlock:(CDUnknownBlockType )emptyViewClickBlock { %log; %orig; }
//- (CDUnknownBlockType )emptyViewClickBlock { %log; CDUnknownBlockType  r = %orig; HBLogDebug(@" = 0x%x", (unsigned int)r); return r; }
- (void)setFetchController:(NSObject *)fetchController { %log; %orig; }
- (NSObject *)fetchController { %log; NSObject * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void).cxx_destruct { %log; %orig; }
- (double)cellHeightWithIndex:(unsigned long long)arg1 { %log; double r = %orig; HBLogDebug(@" = %f", r); return r; }
- (id)conversationAtRow:(unsigned long long)arg1 { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
- (void)controllerDidRollback:(id)arg1 { %log; %orig; }
- (void)controllerDidChangeContent:(id)arg1 { %log; %orig; }
- (void)controller:(id)arg1 didChangeObject:(id)arg2 atIndex:(unsigned long long)arg3 forChangeType:(long long)arg4 newIndex:(unsigned long long)arg5
 { 
 %log; %orig; 
 //在这里处理
   NSMutableArray *attachArr = [DingTalkRedEnvelop disposeConversation:arg2];
  [attachArr enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
    DTRedEnvelopServiceIMP *imp = [%c(DTRedEnvelopServiceFactory) defaultServiceIMP];
    long long sid = [obj[@"sid"] longLongValue];
    NSString *cluseId = obj[@"clusterid"];
    HBLogDebug(@"lingdaiping_sid = %lld,cluseid = %@",sid,cluseId);
    if (cluseId.length > 0){
     [imp pickRedEnvelopCluster:sid clusterId:cluseId successBlock:nil failureBlock:nil];
    }
    
  }];
 }

%end