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
 * @Description: 出版社
 * @author onlineGenerator
 * @date 2014-04-16 09:57:16
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_b_press", schema = "")
@SuppressWarnings("serial")
public class TBPressEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**出版社名称*/
	private java.lang.String pressname;
	/**出版社地址*/
	private java.lang.String pressaddr;
	/**出版社电话*/
	private java.lang.String presstel;
	
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
	 *@return: java.lang.String  出版社地址
	 */
	@Column(name ="PRESSADDR",nullable=true,length=40)
	public java.lang.String getPressaddr(){
		return this.pressaddr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  出版社地址
	 */
	public void setPressaddr(java.lang.String pressaddr){
		this.pressaddr = pressaddr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  出版社电话
	 */
	@Column(name ="PRESSTEL",nullable=true,length=15)
	public java.lang.String getPresstel(){
		return this.presstel;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  出版社电话
	 */
	public void setPresstel(java.lang.String presstel){
		this.presstel = presstel;
	}
}
