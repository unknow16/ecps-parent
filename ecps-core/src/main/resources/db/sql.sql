select * from eb_item;

select * from eb_para_value t where t.item_id = 3083

select * from eb_sku t where t.item_id = 3083

select * from eb_spec_value t where t.sku_id = 3063;

select * from eb_item_clob t where t.item_id = 3083;

select * from eb_console_log;

select * from ts_ptl_user --会员用户表


/**
 * 首页高级搜索
价格： 最低价（minPrice) 最高价（maxPrice)
品牌：品牌的id
**/
select min(es.sku_price) sku_price, ei.*
from eb_item ei,eb_sku es
where ei.ITEM_ID = es.item_id
and es.SKU_PRICE BETWEEN 0 and 499999
-- and ei.BRAND_ID = 1043
and exists (select * 
            from eb_para_value t
            where ei.item_id = t.item_id
            and t.para_value = 'Android')
and exists (select * 
            from eb_para_value t
            where ei.item_id = t.item_id
            and t.para_value = 'Android')
group by ei.ITEM_ID, 
        ei.ITEM_NAME, 
        ei.ITEM_NO, 
        ei.BRAND_ID, 
        ei.CAT_ID, 
        ei.TAG_IMG_ID, 
        ei.TAG_IMG, 
        ei.IS_NEW, 
        ei.IS_GOOD, 
	    ei.IS_HOT, 
	    ei.PROMOTION, 
	    ei.AUDIT_STATUS, 
	    ei.SHOW_STATUS, 
	    ei.IMGS, 
	    ei.KEYWORDS, 
	    ei.PAGE_DESC, 
	    ei.ITEM_RECYCLE, 
	    ei.ON_SALE_TIME, 
	    ei.CHECK_TIME, 
	    ei.UPDATE_TIME, 
	    ei.UPDATE_USER_ID, 
	    ei.CREATE_TIME, 
	    ei.CHECKER_USER_ID, 
	    ei.FULL_PATH_DEPLOY, 
	    ei.FULL_PATH_DEPLOY_OFFER, 
	    ei.ORIGINAL_ITEM_ID, 
	    ei.LAST_STATUS, 
	    ei.MERCHANT_ID, 
	    ei.ITEM_SORT, 
	    ei.SALES, 
	    ei.CREATE_USER_ID, 
	    ei.SIM_LEVEL, 
	    ei.GIFT_DESC, 
	    ei.GIFT_IMG, 
	    ei.GIFT_SHOW_TYPE, 
	    ei.IMG_SIZE1
order by ei.item_id desc


-- 商品单品页查询
select * 
from eb_item ei, -- 商品
    eb_item_clob ic, -- 商品详情
    eb_para_value pv, -- 商品规格
    eb_sku es,        -- 最小销售单员
    eb_spec_value sv,  -- sku spec
    eb_feature ef      -- 规格key
    where 
       ei.item_id = pv.ITEM_ID
       and  ei.item_id = ic.ITEM_ID
        and ei.item_id = es.item_id
        and es.sku_id = sv.sku_id(+)
        and pv.feature_id = ef.feature_id
        and ei.item_id = 3061
    



select ei.* 
from eb_item ei
where exists (select * 
                from eb_para_value ev
                where ei.item_id = ev.item_id
                and ev.para_value = 'Android')
    and exists (select *
                from eb_para_value ev
                where ei.item_id = ev.item_id
                and ev.para_value = '直板')
