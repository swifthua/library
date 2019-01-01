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

import com.bjpowernode.poi.excel.annotation.Excel;

import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 图书表
 * @author onlineGenerator
 * @date 2014-04-16 09:51:39
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_b_book", schema = "")
@SuppressWarnings("serial")
public class TBBookEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**书名*/
	@Excel(exportName="书名",orderNum="1")
	private java.lang.String bookname;
	/**作者*/
	@Excel(exportName="作者",orderNum="2")
	private java.lang.String author;
	/**分类*/
	@Excel(exportName="分类",orderNum="3")
	private java.lang.String booktype;
	/**isbn*/
	@Excel(exportName="isbn",orderNum="4")
	private java.lang.String isbn;
	/**出版社名称*/
	@Excel(exportName="出版社",orderNum="5")
	private java.lang.String pressname;
	/**状态*/
	private java.lang.String status;
	
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
	 *@return: java.lang.String  分类
	 */
	@Column(name ="BOOKTYPE",nullable=true,length=2)
	public java.lang.String getBooktype(){
		return this.booktype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  分类
	 */
	public void setBooktype(java.lang.String booktype){
		this.booktype = booktype;
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
	 *@return: java.lang.String  出版社名称
	 */
	@Column(name ="PRESSNAME",nullable=true,length=30)
	public java.lang.String getPressname(){
		return this.pressname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  出版社名称
	 */
	public void setPressname(java.lang.String pressname){
		this.pressname = pressname;
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
}
