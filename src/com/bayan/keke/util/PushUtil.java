package com.bayan.keke.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

public class PushUtil {
	private static final String appKey = "6280e5782c6af5700335e228";
	private static final String masterSecret = "360dd3f3e0208ffabc3aa4ee";

	/**
	 * 所有平台，所有设备
	 * 
	 * @param content
	 * @return
	 */
	public static PushPayload buildPushObject_all_all_alert(String content) {
		return PushPayload.alertAll(content);
	}

	/**
	 * 所有平台，推送目标是别名为 alias,每个设备唯一 竞价推送
	 * */

	/*
	 * public static PushPayload buildPushObject_all_alias_alert( List<String>
	 * alias, String content, String title, DxProduct product) { Map<String,
	 * String> extras = new HashMap<String, String>(); extras.put("id",
	 * product.getId().toString()); extras.put("imageUrl",
	 * product.getImageUrl()); extras.put("title", product.getTitle());
	 * extras.put("price", product.getPrice() + ""); // type=1 jingjia
	 * extras.put("type", "1"); return
	 * PushPayload.newBuilder().setPlatform(Platform.android())
	 * .setAudience(Audience.alias(alias)).setNotification(
	 * Notification.android(content, title, extras)).build(); }
	 */

	/**
	 * 商品订单推送
	 * 
	 * @param alias
	 * @param content
	 * @param title
	 * @param id
	 * @return
	 */
	public static PushPayload buildPushObject_all_alias_alert(
			List<String> alias, String content, String title, String id,
			String orderType) {
		Map<String, String> extras = new HashMap<String, String>();
		extras.put("id", id);
		extras.put("type", "2");
		extras.put("orderType", orderType);
		return PushPayload.newBuilder().setPlatform(Platform.android())
				.setAudience(Audience.alias(alias)).setNotification(
						Notification.android(content, title, extras)).build();
	}

	/**
	 * 
	 */
	public static PushPayload buildPushObject_all_alias_alert(
			List<String> alias, String content, String title,String type) {
		Map<String, String> extras = new HashMap<String, String>();
		extras.put("type", type);
		return PushPayload.newBuilder().setPlatform(Platform.android())
				.setAudience(Audience.alias(alias)).setNotification(
						Notification.android(content, title, extras)).build();
	}

	/*
	 * public static Map<String, String> buildPushObject_all_alias_alerts(
	 * List<String> alias, String content, String title, Map<String, Object>
	 * map) { JPushClient jpushClient = new JPushClient(masterSecret, appKey,
	 * 10); Map<String, String> extras = new HashMap<String, String>();
	 * extras.put("type", map.get("type").toString()); extras.put("orderId",
	 * map.get("orderId").toString()); extras.put("toUserId",
	 * map.get("userId").toString()); PushPayload payload =
	 * PushPayload.newBuilder().setPlatform(
	 * Platform.android()).setAudience(Audience.alias(alias))
	 * .setNotification(Notification.android(content, title, extras)) .build();
	 * Map<String, String> mapLog = new HashMap<String, String>(); try {
	 * PushResult result = jpushClient.sendPush(payload); if (result != null &&
	 * !"".equals(result)) { mapLog.put("status", 1 + ""); } } catch
	 * (APIConnectionException e) { } catch (APIRequestException e) {
	 * mapLog.put("status", 0 + ""); } String str[] =
	 * JsonUtil.alterJson(payload.toJSON().toString()).get(
	 * "deviceId").split(","); for (int i = 0; i < str.length; i++) {
	 * mapLog.put("payload", JsonUtil.alterJson(
	 * payload.toJSON().toString()).get("payload")); mapLog.put("deviceId",
	 * str[i].toString()); } return mapLog; }
	 */

	/**
	 * 平台是 Android，每个设备唯一
	 * 
	 * */
	public static PushPayload buildPushObject_android_tag_alertWithTitle(
			String tag, String content, String title, Map<String, String> extras) {
		return PushPayload.newBuilder().setPlatform(Platform.android())
				.setAudience(Audience.tag(tag)).setNotification(
						Notification.android(content, title, extras)).build();
	}

	/**
	 * 
	 */
	public static PushPayload buildPushObject_android(List<String> aliases,
			String content, String title) {
		return PushPayload
				.newBuilder()
				.setPlatform(Platform.android())
				.setAudience(Audience.alias(aliases))
				.setNotification(
						Notification.newBuilder().setAlert(content)
								.addPlatformNotification(
										AndroidNotification.newBuilder()
												.setTitle(title).build())
								.addPlatformNotification(
										IosNotification.newBuilder().incrBadge(
												1).addExtra("extra_key",
												"extra_value").build()).build())
				.build();
	}

	/**
	 * 
	 */
	public static void main(String[] args) {
		List<String> alias = new ArrayList<String>();
		alias.add("77b768500b556b4702ce08e96640408a");
		String content = "中午吃啥";
		String title = "新消息";
		PushPayload payload = buildPushObject_all_alias_alert(alias, content,
				title,"2");
		JPushClient jpushClient = new JPushClient(masterSecret, appKey, 10);
		try {
			PushResult result = jpushClient.sendPush(payload);
			if (result.isResultOK()) {
				System.out.println("推送成功！");
			}
		} catch (Exception e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
