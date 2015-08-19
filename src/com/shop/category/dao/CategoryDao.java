package com.shop.category.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.shop.category.vo.Category;


/**
 * 一级分类的持久层对象
 *1、        继承了HibernateDaoSupport类的类获取session时，已不可用SessionFactory.OpenSessioon的形式来获 取Session了，由于HibernateDaoSupport本身已有获取session的方法getSession(),所以直接用Session se=this.getSession();来获取，

  2、        在依据hql获取用户信息时，继承了HibernateDaoSupport类的类中不能在使用Query类了，而是用List<Ssh> list = this.getHibernateTemplate().find(hql);形式来获取实体类集合
 */
public class CategoryDao extends HibernateDaoSupport{

	//DAO层的查询所有一级分类的方法
	public List<Category> findAll() {
		String hql = "from Category order by cid";//按ID排序
		List<Category> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	// Dao中的保存一级分类的方法
	public void save(Category category) {
		this.getHibernateTemplate().save(category);
	}

	// Dao中根据一级分类id查询一级分类
	public Category findByCid(Integer cid) {
		return this.getHibernateTemplate().get(Category.class, cid);
	}

	// DAO中删除一级分类
	public void delete(Category category) {
		this.getHibernateTemplate().delete(category);
	}

	// Dao中修改一级分类
	public void update(Category category) {
		this.getHibernateTemplate().update(category);
	}
	
}
