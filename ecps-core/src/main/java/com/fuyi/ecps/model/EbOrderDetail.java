package com.fuyi.ecps.model;

import java.math.BigDecimal;

public class EbOrderDetail {
    private Long orderDetailId;

    private Long orderId;

    private Long itemId;

    private String itemName;

    private String itemNo;

    private Long skuId;

    private String sku;

    private String skuImg;

    private String skuName;

    private Integer skuCatType;

    private String skuSpec;

    private BigDecimal marketPrice;

    private BigDecimal skuDiscount;

    private BigDecimal skuPrice;

    private Long offerGroupId;

    private String offerGroupName;

    private Short offerType;

    private String shortName;

    private Long offerId;

    private String offerName;

    private String offerNo;

    private String shortName2;

    private Short offerTerm;

    private BigDecimal commitMonthly;

    private BigDecimal prepaid;

    private Short period;

    private BigDecimal refundMonthly;

    private BigDecimal refund1stMonth;

    private BigDecimal refundLastMonth;

    private Short orderDetailType;

    private Long merchantId;

    private Integer quantity;

    private BigDecimal price;

    private String seriescode;

    private String offerGroupNo;

    private Short promoType;

    private String condId;

    private String productId;

    private BigDecimal paymentPrice;

    private BigDecimal purchasePrice;

    private Long simcardSuitId;

    private String simcardPackageId;

    public Long getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Long orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
    }

    public String getItemNo() {
        return itemNo;
    }

    public void setItemNo(String itemNo) {
        this.itemNo = itemNo == null ? null : itemNo.trim();
    }

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku == null ? null : sku.trim();
    }

    public String getSkuImg() {
        return skuImg;
    }

    public void setSkuImg(String skuImg) {
        this.skuImg = skuImg == null ? null : skuImg.trim();
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName == null ? null : skuName.trim();
    }

    public Integer getSkuCatType() {
        return skuCatType;
    }

    public void setSkuCatType(Integer skuCatType) {
        this.skuCatType = skuCatType;
    }

    public String getSkuSpec() {
        return skuSpec;
    }

    public void setSkuSpec(String skuSpec) {
        this.skuSpec = skuSpec == null ? null : skuSpec.trim();
    }

    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    public BigDecimal getSkuDiscount() {
        return skuDiscount;
    }

    public void setSkuDiscount(BigDecimal skuDiscount) {
        this.skuDiscount = skuDiscount;
    }

    public BigDecimal getSkuPrice() {
        return skuPrice;
    }

    public void setSkuPrice(BigDecimal skuPrice) {
        this.skuPrice = skuPrice;
    }

    public Long getOfferGroupId() {
        return offerGroupId;
    }

    public void setOfferGroupId(Long offerGroupId) {
        this.offerGroupId = offerGroupId;
    }

    public String getOfferGroupName() {
        return offerGroupName;
    }

    public void setOfferGroupName(String offerGroupName) {
        this.offerGroupName = offerGroupName == null ? null : offerGroupName.trim();
    }

    public Short getOfferType() {
        return offerType;
    }

    public void setOfferType(Short offerType) {
        this.offerType = offerType;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName == null ? null : shortName.trim();
    }

    public Long getOfferId() {
        return offerId;
    }

    public void setOfferId(Long offerId) {
        this.offerId = offerId;
    }

    public String getOfferName() {
        return offerName;
    }

    public void setOfferName(String offerName) {
        this.offerName = offerName == null ? null : offerName.trim();
    }

    public String getOfferNo() {
        return offerNo;
    }

    public void setOfferNo(String offerNo) {
        this.offerNo = offerNo == null ? null : offerNo.trim();
    }

    public String getShortName2() {
        return shortName2;
    }

    public void setShortName2(String shortName2) {
        this.shortName2 = shortName2 == null ? null : shortName2.trim();
    }

    public Short getOfferTerm() {
        return offerTerm;
    }

    public void setOfferTerm(Short offerTerm) {
        this.offerTerm = offerTerm;
    }

    public BigDecimal getCommitMonthly() {
        return commitMonthly;
    }

    public void setCommitMonthly(BigDecimal commitMonthly) {
        this.commitMonthly = commitMonthly;
    }

    public BigDecimal getPrepaid() {
        return prepaid;
    }

    public void setPrepaid(BigDecimal prepaid) {
        this.prepaid = prepaid;
    }

    public Short getPeriod() {
        return period;
    }

    public void setPeriod(Short period) {
        this.period = period;
    }

    public BigDecimal getRefundMonthly() {
        return refundMonthly;
    }

    public void setRefundMonthly(BigDecimal refundMonthly) {
        this.refundMonthly = refundMonthly;
    }

    public BigDecimal getRefund1stMonth() {
        return refund1stMonth;
    }

    public void setRefund1stMonth(BigDecimal refund1stMonth) {
        this.refund1stMonth = refund1stMonth;
    }

    public BigDecimal getRefundLastMonth() {
        return refundLastMonth;
    }

    public void setRefundLastMonth(BigDecimal refundLastMonth) {
        this.refundLastMonth = refundLastMonth;
    }

    public Short getOrderDetailType() {
        return orderDetailType;
    }

    public void setOrderDetailType(Short orderDetailType) {
        this.orderDetailType = orderDetailType;
    }

    public Long getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(Long merchantId) {
        this.merchantId = merchantId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getSeriescode() {
        return seriescode;
    }

    public void setSeriescode(String seriescode) {
        this.seriescode = seriescode == null ? null : seriescode.trim();
    }

    public String getOfferGroupNo() {
        return offerGroupNo;
    }

    public void setOfferGroupNo(String offerGroupNo) {
        this.offerGroupNo = offerGroupNo == null ? null : offerGroupNo.trim();
    }

    public Short getPromoType() {
        return promoType;
    }

    public void setPromoType(Short promoType) {
        this.promoType = promoType;
    }

    public String getCondId() {
        return condId;
    }

    public void setCondId(String condId) {
        this.condId = condId == null ? null : condId.trim();
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId == null ? null : productId.trim();
    }

    public BigDecimal getPaymentPrice() {
        return paymentPrice;
    }

    public void setPaymentPrice(BigDecimal paymentPrice) {
        this.paymentPrice = paymentPrice;
    }

    public BigDecimal getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(BigDecimal purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public Long getSimcardSuitId() {
        return simcardSuitId;
    }

    public void setSimcardSuitId(Long simcardSuitId) {
        this.simcardSuitId = simcardSuitId;
    }

    public String getSimcardPackageId() {
        return simcardPackageId;
    }

    public void setSimcardPackageId(String simcardPackageId) {
        this.simcardPackageId = simcardPackageId == null ? null : simcardPackageId.trim();
    }
}