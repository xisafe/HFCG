package com.external.deposites.model.datasource;

import com.external.deposites.api.ApiParameter;
import com.external.deposites.api.HfValidations;
import com.external.deposites.api.Validated;

/**
 * <pre>
 * 企业开户
 * </pre>
 *
 * @author LUYANFENG @ 2017/11/15
 */
public class OpenAccount4ApiEnterpriseDataSource extends AbstractOpenAccount4ApiDataSource {
    @ApiParameter
    private String ver;
    @ApiParameter
    @Validated(type = {HfValidations.BasicValidation.NotNull})
    private String mchnt_cd; // 15 商户代码
    @ApiParameter
    @Validated(type = {HfValidations.BasicValidation.NotNull})
    private String mchnt_txn_ssn; // 30 流水号
    @ApiParameter
    @Validated(type = {HfValidations.BasicValidation.NotNull})
    private String cust_nm; // 30 企业名称
    @ApiParameter
    @Validated(type = {HfValidations.BasicValidation.NotNull})
    private String artif_nm; // 30 法人姓名
    @ApiParameter
    @Validated(type = {HfValidations.BasicValidation.NotNull})
    private String certif_id; // 20 身份证号码/证件
    @ApiParameter
    @Validated(type = {HfValidations.BasicValidation.Phone})
    private String mobile_no; // 11 手机号码
    @ApiParameter
    @Validated(type = {HfValidations.BasicValidation.NotNull})
    private String city_id; // 4 开户行地区代码
    @ApiParameter
    @Validated(type = {HfValidations.BasicValidation.NotNull})
    private String parent_bank_id;// 4 开户行行别
    @ApiParameter
    @Validated(type = {HfValidations.BasicValidation.NotNull})
    private String capAcntNo; // 10-30 帐号
    @ApiParameter
    private String email;// 60
    @ApiParameter
    private String bank_nm;//250 开户行支行名称
    @ApiParameter
    private String password;// 32 提现密码
    @ApiParameter
    private String lpassword;// 32 登录密码
    @ApiParameter
    private String rem; //60备注


    public String getVer() {
        return ver;
    }

    public void setVer(String ver) {
        this.ver = ver;
    }

    public String getMchnt_cd() {
        return mchnt_cd;
    }

    public void setMchnt_cd(String mchnt_cd) {
        this.mchnt_cd = mchnt_cd;
    }

    public String getMchnt_txn_ssn() {
        return mchnt_txn_ssn;
    }

    public void setMchnt_txn_ssn(String mchnt_txn_ssn) {
        this.mchnt_txn_ssn = mchnt_txn_ssn;
    }

    public String getCust_nm() {
        return cust_nm;
    }

    public void setCust_nm(String cust_nm) {
        this.cust_nm = cust_nm;
    }

    public String getArtif_nm() {
        return artif_nm;
    }

    public void setArtif_nm(String artif_nm) {
        this.artif_nm = artif_nm;
    }

    public String getCertif_id() {
        return certif_id;
    }

    public void setCertif_id(String certif_id) {
        this.certif_id = certif_id;
    }

    public String getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(String mobile_no) {
        this.mobile_no = mobile_no;
    }

    public String getCity_id() {
        return city_id;
    }

    public void setCity_id(String city_id) {
        this.city_id = city_id;
    }

    public String getParent_bank_id() {
        return parent_bank_id;
    }

    public void setParent_bank_id(String parent_bank_id) {
        this.parent_bank_id = parent_bank_id;
    }

    public String getCapAcntNo() {
        return capAcntNo;
    }

    public void setCapAcntNo(String capAcntNo) {
        this.capAcntNo = capAcntNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBank_nm() {
        return bank_nm;
    }

    public void setBank_nm(String bank_nm) {
        this.bank_nm = bank_nm;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLpassword() {
        return lpassword;
    }

    public void setLpassword(String lpassword) {
        this.lpassword = lpassword;
    }

    public String getRem() {
        return rem;
    }

    public void setRem(String rem) {
        this.rem = rem;
    }

    @Override
    public String toString() {
        return "OpenAccount4EnterpriseDataSource{" +
                "ver='" + ver + '\'' +
                ", mchnt_cd='" + mchnt_cd + '\'' +
                ", mchnt_txn_ssn='" + mchnt_txn_ssn + '\'' +
                ", cust_nm='" + cust_nm + '\'' +
                ", artif_nm='" + artif_nm + '\'' +
                ", certif_id='" + certif_id + '\'' +
                ", mobile_no='" + mobile_no + '\'' +
                ", city_id='" + city_id + '\'' +
                ", parent_bank_id='" + parent_bank_id + '\'' +
                ", capAcntNo='" + capAcntNo + '\'' +
                ", email='" + email + '\'' +
                ", bank_nm='" + bank_nm + '\'' +
                ", password='" + password + '\'' +
                ", lpassword='" + lpassword + '\'' +
                ", rem='" + rem + '\'' +
                "} " + super.toString();
    }
}