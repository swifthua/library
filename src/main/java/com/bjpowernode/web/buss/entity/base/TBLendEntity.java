package com.bjpowernode.web.buss.entity.base;
import java.math.BigDecimal;
import java.util.Date;
import java.lang.String;
import java.lang.Double;
import java.lang.Integer;
import java.math.BigDecimal;
import javax.xml.soap.Text;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 借阅表
 * @author onlineGenerator
 * @date 2014-04-21 13:17:53
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_b_lend", schema = "")
@SuppressWarnings("serial")
public class TBLendEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**图书id*/
	private java.lang.String bookid;
	/**书名*/
	private java.lang.String bookname;
	/**作者*/
	private java.lang.String author;
	/**isbn*/
	private java.lang.String isbn;
	/**读者id*/
	private java.lang.String userid;
	/**读者姓名*/
	private java.lang.String realname;
	/**借阅时间*/
	private java.util.Date lenddate;
	/**归还时间*/
	private java.util.Date returndate;
	/**扣款*/
	private java.math.BigDecimal debit;
	/**续借次数*/
	private java.lang.String totalcount;
	/**状态*/
	private java.lang.String status;
	/**读者编号*/
	private java.lang.String username;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=36)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图书id
	 */
	@Column(name ="BOOKID",nullable=true,length=36)
	public java.lang.String getBookid(){
		return this.bookid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图书id
	 */
	public void setBookid(java.lang.String bookid){
		this.bookid = bookid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  书名
	 */
	@Column(name ="BOOKNAME",nullable=true,length=30)
	public java.lang.String getBookname(){
		return this.bookname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  书名
	 */
	public void setBookname(java.lang.String bookname){
		this.bookname = bookname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  作者
	 */
	@Column(name ="AUTHOR",nullable=true,length=20)
	public java.lang.String getAuthor(){
		return this.author;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  作者
	 */
	public void setAuthor(java.lang.String author){
		this.author = author;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  isbn
	 */
	@Column(name ="ISBN",nullable=true,length=30)
	public java.lang.String getIsbn(){
		return this.isbn;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  isbn
	 */
	public void setIsbn(java.lang.String isbn){
		this.isbn = isbn;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  读者id
	 */
	@Column(name ="USERID",nullable=true,length=36)
	public java.lang.String getUserid(){
		return this.userid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  读者id
	 */
	public void setUserid(java.lang.String userid){
		this.userid = userid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  读者姓名
	 */
	@Column(name ="REALNAME",nullable=true,length=30)
	public java.lang.String getRealName(){
		return this.realname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  读者姓名
	 */
	public void setRealName(java.lang.String realname){
		this.realname = realname;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  借阅时间
	 */
	@Column(name ="LENDDATE",nullable=true,length=10)
	public java.util.Date getLenddate(){
		return this.lenddate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  借阅时间
	 */
	public void setLenddate(java.util.Date lenddate){
		this.lenddate = lenddate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  归还时间
	 */
	@Column(name ="RETURNDATE",nullable=true,length=10)
	public java.util.Date getReturndate(){
		return this.returndate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  归还时间
	 */
	public void setReturndate(java.util.Date returndate){
		this.returndate = returndate;
	}
	/**
	 *方法: 取得java.math.BigDecimal
	 *@return: java.math.BigDecimal  扣款
	 */
	@Column(name ="DEBIT",nullable=true)
	public java.math.BigDecimal getDebit(){
		return this.debit;
	}

	/**
	 *方法: 设置java.math.BigDecimal
	 *@param: java.math.BigDecimal  扣款
	 */
	public void setDebit(java.math.BigDecimal debit){
		this.debit = debit;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  续借次数
	 */
	@Column(name ="TOTALCOUNT",nullable=true,length=1)
	public java.lang.String getTotalcount(){
		return this.totalcount;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  续借次数
	 */
	public void setTotalcount(java.lang.String totalcount){
		this.totalcount = totalcount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态
	 */
	@Column(name ="STATUS",nullable=true,length=1)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  读者编号
	 */
	@Column(name ="USERNAME",nullable=true,length=30)
	public java.lang.String getUserName(){
		return this.username;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  读者编号
	 */
	public void setUserName(java.lang.String username){
		this.username = username;
	}
}
