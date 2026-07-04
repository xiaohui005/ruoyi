/**
 * 閺佺増宓佺€涙鍚€瀹搞儱鍙跨猾?
 */
import { useDictStoreWithOut } from '@/store/modules/dict'
import { ElementPlusInfoType } from '@/types/elementPlus'

const dictStore = useDictStoreWithOut()

/**
 * 閼惧嘲褰?dictType 鐎电懓绨查惃鍕殶閹诡喖鐡ч崗鍛婃殶缂?
 *
 * @param dictType 閺佺増宓佺猾璇茬€?
 * @returns {*|Array} 閺佺増宓佺€涙鍚€閺佹壆绮?
 */
export interface DictDataType {
  dictType: string
  label: string
  value: string | number | boolean
  colorType: ElementPlusInfoType | ''
  cssClass: string
}

export interface NumberDictDataType extends DictDataType {
  value: number
}

export interface StringDictDataType extends DictDataType {
  value: string
}

export interface BooleanDictDataType extends DictDataType {
  value: boolean
}

export const getDictOptions = (dictType: string) => {
  return dictStore.getDictByType(dictType) || []
}

export const getIntDictOptions = (dictType: string): NumberDictDataType[] => {
  // 閼惧嘲绶遍柅姘辨暏閻?DictDataType 閸掓銆?
  const dictOptions: DictDataType[] = getDictOptions(dictType)
  // 鏉烆剚宕查幋?number 缁鐎烽惃?NumberDictDataType 缁鐎?
  // why 闂団偓鐟曚胶澹掑▓濠呮祮閹诡澁绱伴柆鍨帳 IDEA 閸?v-for="dict in getIntDictOptions(...)" 閺冭绱漞l-option 閻?key 娴兼艾鎲＄拃?
  const dictOption: NumberDictDataType[] = []
  dictOptions.forEach((dict: DictDataType) => {
    dictOption.push({
      ...dict,
      value: parseInt(dict.value + '')
    })
  })
  return dictOption
}

export const getStrDictOptions = (dictType: string) => {
  // 閼惧嘲绶遍柅姘辨暏閻?DictDataType 閸掓銆?
  const dictOptions: DictDataType[] = getDictOptions(dictType)
  // 鏉烆剚宕查幋?string 缁鐎烽惃?StringDictDataType 缁鐎?
  // why 闂団偓鐟曚胶澹掑▓濠呮祮閹诡澁绱伴柆鍨帳 IDEA 閸?v-for="dict in getStrDictOptions(...)" 閺冭绱漞l-option 閻?key 娴兼艾鎲＄拃?
  const dictOption: StringDictDataType[] = []
  dictOptions.forEach((dict: DictDataType) => {
    dictOption.push({
      ...dict,
      value: dict.value + ''
    })
  })
  return dictOption
}

export const getBoolDictOptions = (dictType: string): BooleanDictDataType[] => {
  const dictOption: BooleanDictDataType[] = []
  const dictOptions: DictDataType[] = getDictOptions(dictType)
  dictOptions.forEach((dict: DictDataType) => {
    dictOption.push({
      ...dict,
      value: dict.value + '' === 'true'
    })
  })
  return dictOption
}

/**
 * 閼惧嘲褰囬幐鍥х暰鐎涙鍚€缁鐎烽惃鍕瘹鐎规艾鈧厧顕惔鏃傛畱鐎涙鍚€鐎电钖?
 * @param dictType 鐎涙鍚€缁鐎?
 * @param value 鐎涙鍚€閸?
 * @return DictDataType 鐎涙鍚€鐎电钖?
 */
export const getDictObj = (dictType: string, value: any): DictDataType | undefined => {
  const dictOptions: DictDataType[] = getDictOptions(dictType)
  for (const dict of dictOptions) {
    if (dict.value === value + '') {
      return dict
    }
  }
}

/**
 * 閼惧嘲绶辩€涙鍚€閺佺増宓侀惃鍕瀮閺堫剙鐫嶇粈?
 *
 * @param dictType 鐎涙鍚€缁鐎?
 * @param value 鐎涙鍚€閺佺増宓侀惃鍕偓?
 * @return 鐎涙鍚€閸氬秶袨
 */
export const getDictLabel = (dictType: string, value: any): string => {
  const dictOptions: DictDataType[] = getDictOptions(dictType)
  const dictLabel = ref('')
  dictOptions.forEach((dict: DictDataType) => {
    if (dict.value === value + '') {
      dictLabel.value = dict.label
    }
  })
  return dictLabel.value
}

export enum DICT_TYPE {
  USER_TYPE = 'user_type',
  COMMON_STATUS = 'common_status',
  TERMINAL = 'terminal', // 缂佸牏顏?
  DATE_INTERVAL = 'date_interval', // 閺佺増宓侀梻鎾

  // ========== SYSTEM 濡€虫健 ==========
  SYSTEM_USER_SEX = 'system_user_sex',
  SYSTEM_MENU_TYPE = 'system_menu_type',
  SYSTEM_ROLE_TYPE = 'system_role_type',
  SYSTEM_DATA_SCOPE = 'system_data_scope',
  SYSTEM_NOTICE_TYPE = 'system_notice_type',
  SYSTEM_LOGIN_TYPE = 'system_login_type',
  SYSTEM_LOGIN_RESULT = 'system_login_result',
  SYSTEM_SMS_CHANNEL_CODE = 'system_sms_channel_code',
  SYSTEM_SMS_TEMPLATE_TYPE = 'system_sms_template_type',
  SYSTEM_SMS_SEND_STATUS = 'system_sms_send_status',
  SYSTEM_SMS_RECEIVE_STATUS = 'system_sms_receive_status',
  SYSTEM_OAUTH2_GRANT_TYPE = 'system_oauth2_grant_type',
  SYSTEM_MAIL_SEND_STATUS = 'system_mail_send_status',
  SYSTEM_NOTIFY_TEMPLATE_TYPE = 'system_notify_template_type',
  SYSTEM_SOCIAL_TYPE = 'system_social_type',

  // ========== INFRA 濡€虫健 ==========
  INFRA_BOOLEAN_STRING = 'infra_boolean_string',
  INFRA_JOB_STATUS = 'infra_job_status',
  INFRA_JOB_LOG_STATUS = 'infra_job_log_status',
  INFRA_API_ERROR_LOG_PROCESS_STATUS = 'infra_api_error_log_process_status',
  INFRA_CONFIG_TYPE = 'infra_config_type',
  INFRA_CODEGEN_TEMPLATE_TYPE = 'infra_codegen_template_type',
  INFRA_CODEGEN_FRONT_TYPE = 'infra_codegen_front_type',
  INFRA_CODEGEN_SCENE = 'infra_codegen_scene',
  INFRA_FILE_STORAGE = 'infra_file_storage',
  INFRA_OPERATE_TYPE = 'infra_operate_type',

  // ========== BPM 濡€虫健 ==========

  // ========== Member 娴兼艾鎲冲Ο鈥虫健 ==========

  // ========== MALL - 閸熷棗鎼уΟ鈥虫健 ==========
  PRODUCT_SPU_STATUS = 'product_spu_status', //閸熷棗鎼ч悩鑸碘偓?

  // ========== MALL - 娴溿倖妲楀Ο鈥虫健 ==========
  EXPRESS_CHARGE_MODE = 'trade_delivery_express_charge_mode', //韫囶偊鈧帞娈戠拋陇鍨傞弬鐟扮础
  TRADE_AFTER_SALE_STATUS = 'trade_after_sale_status', // 閸烆喖鎮?- 閻樿埖鈧?
  TRADE_AFTER_SALE_WAY = 'trade_after_sale_way', // 閸烆喖鎮?- 閺傜懓绱?
  TRADE_AFTER_SALE_TYPE = 'trade_after_sale_type', // 閸烆喖鎮?- 缁鐎?
  TRADE_ORDER_TYPE = 'trade_order_type', // 鐠併垹宕?- 缁鐎?
  TRADE_ORDER_STATUS = 'trade_order_status', // 鐠併垹宕?- 閻樿埖鈧?
  TRADE_ORDER_ITEM_AFTER_SALE_STATUS = 'trade_order_item_after_sale_status', // 鐠併垹宕熸い?- 閸烆喖鎮楅悩鑸碘偓?
  TRADE_DELIVERY_TYPE = 'trade_delivery_type', // 闁板秹鈧焦鏌熷?
  BROKERAGE_ENABLED_CONDITION = 'brokerage_enabled_condition', // 閸掑棔鍓戝Ο鈥崇础
  BROKERAGE_BIND_MODE = 'brokerage_bind_mode', // 閸掑棝鏀㈤崗宕囬兇缂佹垵鐣惧Ο鈥崇础
  BROKERAGE_BANK_NAME = 'brokerage_bank_name', // 娴ｏ綁鍣鹃幓鎰箛闁炬儼顢?
  BROKERAGE_WITHDRAW_TYPE = 'brokerage_withdraw_type', // 娴ｏ綁鍣鹃幓鎰箛缁鐎?
  BROKERAGE_RECORD_BIZ_TYPE = 'brokerage_record_biz_type', // 娴ｏ綁鍣炬稉姘缁鐎?
  BROKERAGE_RECORD_STATUS = 'brokerage_record_status', // 娴ｏ綁鍣鹃悩鑸碘偓?
  BROKERAGE_WITHDRAW_STATUS = 'brokerage_withdraw_status', // 娴ｏ綁鍣鹃幓鎰箛閻樿埖鈧?

  // ========== MALL - 閽€銉╂敘濡€虫健 ==========
  PROMOTION_DISCOUNT_TYPE = 'promotion_discount_type', // 娴兼ɑ鍎猾璇茬€?
  PROMOTION_PRODUCT_SCOPE = 'promotion_product_scope', // 閽€銉╂敘閻ㄥ嫬鏅㈤崫浣藉瘱閸?
  PROMOTION_COUPON_TEMPLATE_VALIDITY_TYPE = 'promotion_coupon_template_validity_type', // 娴兼ɑ鍎崝鍨侀弶璺ㄦ畱閺堝妾洪張鐔鸿閸?
  PROMOTION_COUPON_STATUS = 'promotion_coupon_status', // 娴兼ɑ鍎崝鐢垫畱閻樿埖鈧?
  PROMOTION_COUPON_TAKE_TYPE = 'promotion_coupon_take_type', // 娴兼ɑ鍎崝鐢垫畱妫板棗褰囬弬鐟扮础
  PROMOTION_CONDITION_TYPE = 'promotion_condition_type', // 閽€銉╂敘閻ㄥ嫭娼禒鍓佽閸ㄥ鐏囨稉?
  PROMOTION_BARGAIN_RECORD_STATUS = 'promotion_bargain_record_status', // 閻秳鐜拋鏉跨秿閻ㄥ嫮濮搁幀?
  PROMOTION_COMBINATION_RECORD_STATUS = 'promotion_combination_record_status', // 閹风厧娲熺拋鏉跨秿閻ㄥ嫮濮搁幀?
  PROMOTION_BANNER_POSITION = 'promotion_banner_position', // banner 鐎规矮缍?

  // ========== AI - 娴滃搫浼愰弲楦垮厴濡€虫健  ==========
  AI_PLATFORM = 'ai_platform', // AI 楠炲啿褰?
  AI_MODEL_TYPE = 'ai_model_type', // AI 濡€崇€风猾璇茬€?
  AI_IMAGE_STATUS = 'ai_image_status', // AI 閸ュ墽澧栭悩鑸碘偓?
  AI_MUSIC_STATUS = 'ai_music_status', // AI 闂婂厖绠伴悩鑸碘偓?
  AI_GENERATE_MODE = 'ai_generate_mode', // AI 閻㈢喐鍨氬Ο鈥崇础
  AI_WRITE_TYPE = 'ai_write_type', // AI 閸愭瑤缍旂猾璇茬€?
  AI_WRITE_LENGTH = 'ai_write_length', // AI 閸愭瑤缍旈梹鍨
  AI_WRITE_FORMAT = 'ai_write_format', // AI 閸愭瑤缍旈弽鐓庣础
  AI_WRITE_TONE = 'ai_write_tone', // AI 閸愭瑤缍旂拠顓熺毜
  AI_WRITE_LANGUAGE = 'ai_write_language', // AI 閸愭瑤缍旂拠顓♀枅
  AI_MCP_CLIENT_NAME = 'ai_mcp_client_name', // AI MCP Client 閸氬秴鐡?
  // ========== IM - 閸楄櫕妞傞柅姘愁唵濡€虫健  ==========
  IM_CONTENT_TYPE = 'im_content_type', // IM 閸愬懎顔愮猾璇茬€?
  IM_MESSAGE_STATUS = 'im_message_status', // IM 濞戝牊浼呴悩鑸碘偓渚婄窗0=濮濓絽鐖?/ 2=瀹稿弶鎸欓崶鐑囩礄缁変浇浜?/ 缂囥倛浜伴崗杈╂暏閿?
  IM_MESSAGE_RECEIPT_STATUS = 'im_message_receipt_status', // IM 濞戝牊浼呴崶鐐村⒔閻樿埖鈧緤绱?=娑撳秹娓剁憰?/ 1=瀵板懎鐣幋?/ 2=瀹告彃鐣幋?
  IM_FRIEND_STATUS = 'im_friend_status', // IM 婵傝棄寮搁悩鑸碘偓?
  IM_FRIEND_ADD_SOURCE = 'im_friend_add_source', // IM 婵傝棄寮稿ǎ璇插閺夈儲绨?
  IM_FRIEND_REQUEST_HANDLE_RESULT = 'im_friend_request_handle_result', // IM 婵傝棄寮搁悽瀹狀嚞婢跺嫮鎮婄紒鎾寸亯
  IM_GROUP_STATUS = 'im_group_status', // IM 缂囥倗濮搁幀?
  IM_GROUP_MEMBER_ROLE = 'im_group_member_role', // IM 缂囥倖鍨氶崨妯款潡閼?
  IM_GROUP_ADD_SOURCE = 'im_group_add_source', // IM 閸旂姷鍏㈤弶銉︾爱
  IM_GROUP_REQUEST_HANDLE_RESULT = 'im_group_request_handle_result', // IM 閸旂姷鍏㈤悽瀹狀嚞婢跺嫮鎮婄紒鎾寸亯
  IM_RTC_CALL_MEDIA_TYPE = 'im_rtc_call_media_type', // IM 闁俺鐦芥刊鎺嶇秼缁鐎烽敍?=鐠囶參鐓?/ 2=鐟欏棝顣?
  IM_RTC_CALL_CONVERSATION_TYPE = 'im_rtc_call_conversation_type', // IM 闁俺鐦芥导姘崇樈缁鐎烽敍?=缁変浇浜?/ 2=缂囥倛浜?
  IM_RTC_CALL_STATUS = 'im_rtc_call_status', // IM 闁俺鐦介悩鑸碘偓渚婄窗10=閸掓稑缂?/ 20=鏉╂稖顢戞稉?/ 30=瀹歌尙绮ㄩ弶?
  IM_RTC_CALL_END_REASON = 'im_rtc_call_end_reason', // IM 闁俺鐦界紒鎾存将閸樼喎娲滈敍?=闁俺鐦界紒鎾存将 / 2=瀹稿弶瀚嗙紒?/ 3=瀹告彃褰囧☉?/ 4=閺冪姳姹夐幒銉ユ儔 / 5=鐎佃鏌熷锝呯箹 / 9=闁俺鐦藉鍌氱埗
  IM_RTC_PARTICIPANT_ROLE = 'im_rtc_participant_role', // IM 闁俺鐦介崣鍌欑瑢鐟欐帟澹婇敍?=閸欐垼鎹ｆ禍?/ 2=鐞氼偊鍊嬬拠鐤偓?/ 3=娑撹濮╅崝鐘插弳閼?
  IM_RTC_PARTICIPANT_STATUS = 'im_rtc_participant_status', // IM 闁俺鐦介崣鍌欑瑢閻樿埖鈧緤绱?0=闁偓鐠囪渹鑵?/ 20=瀹告彃濮為崗?/ 30=瀹稿弶瀚嗙紒?/ 40=閺堫亜绨茬粵?/ 50=瀹歌尙顬囧鈧?
  IM_CHANNEL_MATERIAL_TYPE = 'im_channel_material_type' // IM 妫版垿浜剧槐鐘虫綏閸愬懎顔愮猾璇茬€烽敍?=鐎靛本鏋冮張?/ 2=婢舵牠鎽?
}
