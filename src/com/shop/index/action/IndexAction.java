package com.shop.index.action;

import com.shop.product.vo.Product;

import com.shop.product.service.ProductService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import com.shop.category.service.CategoryService;
import com.shop.category.vo.Category;

/**
 * 首页访问的Action
 * 
 *
 */

public class IndexAction extends ActionSupport{
	// 注入一级分类的Service:
	private CategoryService categoryService;
	// 注入商品的Service
	private ProductService productService;

	
	public ProductService getProductService() {
		return productService;
	}



	public void setProductService(ProductService productService) {
		this.productService = productService;
	}



	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}



	/**
	 * 执行的访问首页的方法:
	 */
	public String execute(){
		// 查询所有一级分类集合
		List<Category> cList = categoryService.findAll();
		
		// 将一级分类存入到Session的范围:
		ActionContext.getContext().getSession().put("cList", cList);
		
		// 查询热门商品:
		List<Product> hList = productService.findHot();
		// 保存到值栈中:仅此页面使用 针对当前的action 实例
		ActionContext.getContext().getValueStack().set("hList", hList);
		
		// 查询最新商品:
		List<Product> nList = productService.findNew();
		// 保存到值栈中:
		ActionContext.getContext().getValueStack().set("nList", nList);
		return "index";
	}
	
	
}
