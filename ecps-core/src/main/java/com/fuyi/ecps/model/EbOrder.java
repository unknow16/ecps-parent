package com.fuyi.ecps.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class EbOrder {
	
	private List<EbOrderDetail> detailList;
	
	//********************************
    private Long orderId;

    private Long ptlUserId;

    private String username;

    private String orderNum;

    private Short payment;

    private Short payPlatform;

    private Short delivery;

    private Short isConfirm;

    private BigDecimal orderSum;

    private BigDecimal shipFee;

    private Short isPaid;

    private Short orderState;

    private Short paymentCash;

    private Long distriId;

    private Short deliveryMethod;

    private String paymentNo;

    private Date orderTime;

    private Date payTime;

    private Date depositTime;

    private Date successTime;

    private Date updateTime;

    private Short srvType;

    private String selfCollectSite;

    private Long selfCollectSiteId;

    private Short isDeleted;

    private Short isDisplay;

    private String notes;

    private String shipName;

    private String province;

    private String city;

    private String district;

    private String zipCode;

    private String addr;

    private String phone;

    private Short payable;

    private String company;

    private Short contents;

    private Short isCall;

    private String deliveryNo;

    private String areaCode;

    private String areaName;

    private Short isPrint;

    private Date crmCallsTime;

    private Short isOfferRelease;

    private String jobNum;

    private Short orderType;

    private String fixedPhone;

    private String attachFile;

    private Long returnType;

    private Long seckillId;

    private Short orderSource;

    private String orderExt1;

    private String orderExt2;

    private String orderExt3;

    private String orderExt4;

    private String orderExt5;

    
    public List<EbOrderDetail> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<EbOrderDetail> detailList) {
		this.detailList = detailList;
	}

	public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getPtlUserId() {
        return ptlUserId;
    }

    public void setPtlUserId(Long ptlUserId) {
        this.ptlUserId = ptlUserId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum == null ? null : orderNum.trim();
    }

    public Short getPayment() {
        return payment;
    }

    public void setPayment(Short payment) {
        this.payment = payment;
    }

    public Short getPayPlatform() {
        return payPlatform;
    }

    public void setPayPlatform(Short payPlatform) {
        this.payPlatform = payPlatform;
    }

    public Short getDelivery() {
        return delivery;
    }

    public void setDelivery(Short delivery) {
        this.delivery = delivery;
    }

    public Short getIsConfirm() {
        return isConfirm;
    }

    public void setIsConfirm(Short isConfirm) {
        this.isConfirm = isConfirm;
    }

    public BigDecimal getOrderSum() {
        return orderSum;
    }

    public void setOrderSum(BigDecimal orderSum) {
        this.orderSum = orderSum;
    }

    public BigDecimal getShipFee() {
        return shipFee;
    }

    public void setShipFee(BigDecimal shipFee) {
        this.shipFee = shipFee;
    }

    public Short getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(Short isPaid) {
        this.isPaid = isPaid;
    }

    public Short getOrderState() {
        return orderState;
    }

    public void setOrderState(Short orderState) {
        this.orderState = orderState;
    }

    public Short getPaymentCash() {
        return paymentCash;
    }

    public void setPaymentCash(Short paymentCash) {
        this.paymentCash = paymentCash;
    }

    public Long getDistriId() {
        return distriId;
    }

    public void setDistriId(Long distriId) {
        this.distriId = distriId;
    }

    public Short getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(Short deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }

    public String getPaymentNo() {
        return paymentNo;
    }

    public void setPaymentNo(String paymentNo) {
        this.paymentNo = paymentNo == null ? null : paymentNo.trim();
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getDepositTime() {
        return depositTime;
    }

    public void setDepositTime(Date depositTime) {
        this.depositTime = depositTime;
    }

    public Date getSuccessTime() {
        return successTime;
    }

    public void setSuccessTime(Date successTime) {
        this.successTime = successTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Short getSrvType() {
        return srvType;
    }

    public void setSrvType(Short srvType) {
        this.srvType = srvType;
    }

    public String getSelfCollectSite() {
        return selfCollectSite;
    }

    public void setSelfCollectSite(String selfCollectSite) {
        this.selfCollectSite = selfCollectSite == null ? null : selfCollectSite.trim();
    }

    public Long getSelfCollectSiteId() {
        return selfCollectSiteId;
    }

    public void setSelfCollectSiteId(Long selfCollectSiteId) {
        this.selfCollectSiteId = selfCollectSiteId;
    }

    public Short getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Short isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Short getIsDisplay() {
        return isDisplay;
    }

    public void setIsDisplay(Short isDisplay) {
        this.isDisplay = isDisplay;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes == null ? null : notes.trim();
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName == null ? null : shipName.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode == null ? null : zipCode.trim();
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Short getPayable() {
        return payable;
    }

    public void setPayable(Short payable) {
        this.payable = payable;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company == null ? null : company.trim();
    }

    public Short getContents() {
        return contents;
    }

    public void setContents(Short contents) {
        this.contents = contents;
    }

    public Short getIsCall() {
        return isCall;
    }

    public void setIsCall(Short isCall) {
        this.isCall = isCall;
    }

    public String getDeliveryNo() {
        return deliveryNo;
    }

    public void setDeliveryNo(String deliveryNo) {
        this.deliveryNo = deliveryNo == null ? null : deliveryNo.trim();
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode == null ? null : areaCode.trim();
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }

    public Short getIsPrint() {
        return isPrint;
    }

    public void setIsPrint(Short isPrint) {
        this.isPrint = isPrint;
    }

    public Date getCrmCallsTime() {
        return crmCallsTime;
    }

    public void setCrmCallsTime(Date crmCallsTime) {
        this.crmCallsTime = crmCallsTime;
    }

    public Short getIsOfferRelease() {
        return isOfferRelease;
    }

    public void setIsOfferRelease(Short isOfferRelease) {
        this.isOfferRelease = isOfferRelease;
    }

    public String getJobNum() {
        return jobNum;
    }

    public void setJobNum(String jobNum) {
        this.jobNum = jobNum == null ? null : jobNum.trim();
    }

    public Short getOrderType() {
        return orderType;
    }

    public void setOrderType(Short orderType) {
        this.orderType = orderType;
    }

    public String getFixedPhone() {
        return fixedPhone;
    }

    public void setFixedPhone(String fixedPhone) {
        this.fixedPhone = fixedPhone == null ? null : fixedPhone.trim();
    }

    public String getAttachFile() {
        return attachFile;
    }

    public void setAttachFile(String attachFile) {
        this.attachFile = attachFile == null ? null : attachFile.trim();
    }

    public Long getReturnType() {
        return returnType;
    }

    public void setReturnType(Long returnType) {
        this.returnType = returnType;
    }

    public Long getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(Long seckillId) {
        this.seckillId = seckillId;
    }

    public Short getOrderSource() {
        return orderSource;
    }

    public void setOrderSource(Short orderSource) {
        this.orderSource = orderSource;
    }

    public String getOrderExt1() {
        return orderExt1;
    }

    public void setOrderExt1(String orderExt1) {
        this.orderExt1 = orderExt1 == null ? null : orderExt1.trim();
    }

    public String getOrderExt2() {
        return orderExt2;
    }

    public void setOrderExt2(String orderExt2) {
        this.orderExt2 = orderExt2 == null ? null : orderExt2.trim();
    }

    public String getOrderExt3() {
        return orderExt3;
    }

    public void setOrderExt3(String orderExt3) {
        this.orderExt3 = orderExt3 == null ? null : orderExt3.trim();
    }

    public String getOrderExt4() {
        return orderExt4;
    }

    public void setOrderExt4(String orderExt4) {
        this.orderExt4 = orderExt4 == null ? null : orderExt4.trim();
    }

    public String getOrderExt5() {
        return orderExt5;
    }

    public void setOrderExt5(String orderExt5) {
        this.orderExt5 = orderExt5 == null ? null : orderExt5.trim();
    }
}