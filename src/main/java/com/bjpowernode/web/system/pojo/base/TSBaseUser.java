package com.bjpowernode.web.system.pojo.base;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.bjpowernode.core.common.entity.IdEntity;
import com.bjpowernode.poi.excel.annotation.Excel;
import com.bjpowernode.poi.excel.annotation.ExcelEntity;
import com.bjpowernode.poi.excel.annotation.ExcelTarget;

/**
 * 系统用户父类表
 * @author  
 */
@Entity
@Table(name = "t_s_base_user")
@Inheritance(strategy = InheritanceType.JOINED)
@ExcelTarget(id="baseUserEntity")
public class TSBaseUser extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	@Excel(exportName="用户名",orderNum="1")
	private String userName;// 用户名
	
	@Excel(exportName="真实姓名",orderNum="2")
	private String realName;// 真实姓名
	private String browser;// 用户使用浏览器类型
	private String userKey;// 用户验证唯一标示
	
	@Excel(exportName="密码",orderNum="3")
	private String password;//用户密码
	private Short activitiSync;//是否同步工作流引擎
	private Short status;// 状态1：在线,2：离线,0：禁用
	private byte[] signature;// 签名文件
	
	@ExcelEntity()
	private TSDepart TSDepart = new TSDepart();// 部门
	
	@Excel(exportName="余额",orderNum="5")
	private BigDecimal debit;
	
	@Column(name = "signature",length=3000)
	public byte[] getSignature() {
		return signature;
	}
	public void setSignature(byte[] signature) {
		this.signature = signature;
	}

	@Column(name = "browser", length = 20)
	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	@Column(name = "userkey", length = 200)
	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	@Column(name = "status")
	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}
	public Short getActivitiSync() {
		return activitiSync;
	}
	@Column(name = "activitisync")
	public void setActivitiSync(Short activitiSync) {
		this.activitiSync = activitiSync;
	}
	
	
	@Column(name = "password", length = 100)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	@JsonIgnore    //getList查询转换为列表时处理json转换异常
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "departid")
	public TSDepart getTSDepart() {
		return this.TSDepart;
	}

	public void setTSDepart(TSDepart TSDepart) {
		this.TSDepart = TSDepart;
	}
	@Column(name = "username", nullable = false, length = 10)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Column(name = "realname", length = 50)
	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(name = "debit",length=5)
	public BigDecimal getDebit() {
		return debit;
	}
	public void setDebit(BigDecimal debit) {
		this.debit = debit;
	}
}