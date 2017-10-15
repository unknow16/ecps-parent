package com.fuyi.ecps.service.impl;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fuyi.ecps.dao.EbSkuDao;
import com.fuyi.ecps.model.EbCart;
import com.fuyi.ecps.model.EbSku;
import com.fuyi.ecps.model.EbSpecValue;
import com.fuyi.ecps.service.EbCartService;
import com.fuyi.ecps.utils.ECPSUtils;

@Service
public class EbCartServiceImpl implements EbCartService {
	
	@Autowired
	private EbSkuDao skuDao;

	public void addCart(HttpServletRequest request,
			HttpServletResponse response, Long skuId, Integer quantity) {
		//存car中的商品
		List<EbCart> cartList = new ArrayList<EbCart>();
		//json配置对象
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[]{"sku"});
		
		//获取当前网站的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length >0) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				String key = ECPSUtils.readProp("cart_key");
				if(StringUtils.equals(name, key)) {
					//获取cookie值
					String value = cookie.getValue();
					
					//[{"skuId":1002, "quantity":2},{"skuId":1002, "quantity":2}]
					value = URLDecoder.decode(value);
					
					//将jsonStr转成JOSON数组对象
					JSONArray ja = JSONArray.fromObject(value);
					
					//转成javaList
					cartList = (List<EbCart>) JSONSerializer.toJava(ja,jc);
					
					//在cookie中存在时，数量更新
					boolean isExist = false;
					for (EbCart ebCart : cartList) {
						if(ebCart.getSkuId().longValue() == skuId.longValue()) {
							ebCart.setQuantity(ebCart.getQuantity() + quantity);
							isExist = true;
						}
					}
					//不存在，新增
					if(!isExist) {
						EbCart cart = new EbCart();
						cart.setSkuId(skuId);
						cart.setQuantity(quantity);
						cartList.add(cart);
					}
					
				}
			}
		}
		
		//第一次访问该网站
		if(cartList.size() == 0) {
			EbCart cart = new EbCart();
			cart.setSkuId(skuId);
			cart.setQuantity(quantity);
			cartList.add(cart);
		}
		
		//list转json，存入cookie
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		
		Cookie cookie = new Cookie("cart_key", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);

	}

	public List<EbCart> listCart(HttpServletRequest request,
			HttpServletResponse response) {
		List<EbCart> cartList = new ArrayList<EbCart>();
		
		//获取当前网站的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length >0) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				String key = ECPSUtils.readProp("cart_key");
				if(StringUtils.equals(name, key)) {
					//获取cookie值
					String value = cookie.getValue();
					
					//[{"skuId":1002, "quantity":2},{"skuId":1002, "quantity":2}]
					value = URLDecoder.decode(value);
					
					//将jsonStr转成JOSON数组对象
					JSONArray ja = JSONArray.fromObject(value);
					//json配置对象
					JsonConfig jc = new JsonConfig();
					jc.setRootClass(EbCart.class);
					jc.setExcludes(new String[]{"sku"});
					//转成javaList
					cartList = (List<EbCart>) JSONSerializer.toJava(ja,jc);
					for (EbCart ebCart : cartList) {
						EbSku sku = skuDao.getSkuDetailById(ebCart.getSkuId());
						ebCart.setSku(sku);
					}
				}
			}
		}
		
		return cartList;
	}

	public void addNum(HttpServletRequest request,
			HttpServletResponse response, Long skuId) {
		
		//存car中的商品
		List<EbCart> cartList = new ArrayList<EbCart>();
		//json配置对象
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[]{"sku"});
		
		//获取当前网站的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length >0) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				String key = ECPSUtils.readProp("cart_key");
				if(StringUtils.equals(name, key)) {
					//获取cookie值
					String value = cookie.getValue();
					
					//[{"skuId":1002, "quantity":2},{"skuId":1002, "quantity":2}]
					value = URLDecoder.decode(value);
					
					//将jsonStr转成JOSON数组对象
					JSONArray ja = JSONArray.fromObject(value);
					
					//转成javaList
					cartList = (List<EbCart>) JSONSerializer.toJava(ja,jc);
					
					//在cookie中存在时，数量更新
					for (EbCart ebCart : cartList) {
						if(ebCart.getSkuId().longValue() == skuId.longValue()) {
							ebCart.setQuantity(ebCart.getQuantity() + 1);
						}
					}
				}
			}
		}
		
		//list转json，存入cookie
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		
		Cookie cookie = new Cookie("cart_key", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	public void deleteCart(HttpServletRequest request,
			HttpServletResponse response, Long skuId) {
		
		//存car中的商品
		List<EbCart> cartList = new ArrayList<EbCart>();
		//json配置对象
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[]{"sku"});
		
		//获取当前网站的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length >0) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				String key = ECPSUtils.readProp("cart_key");
				if(StringUtils.equals(name, key)) {
					//获取cookie值
					String value = cookie.getValue();
					
					//[{"skuId":1002, "quantity":2},{"skuId":1002, "quantity":2}]
					value = URLDecoder.decode(value);
					
					//将jsonStr转成JOSON数组对象
					JSONArray ja = JSONArray.fromObject(value);
					
					//转成javaList
					cartList = (List<EbCart>) JSONSerializer.toJava(ja,jc);
					
					//在cookie中存在时，数量更新
					/*for (EbCart ebCart : cartList) { //增强for循环不安全
						if(ebCart.getSkuId().longValue() == skuId.longValue()) {
							ebCart.setQuantity(ebCart.getQuantity() - 1);
						}
					}*/
					for(int i=0; i<cartList.size(); i++) {
						EbCart ebCart = cartList.get(i);
						if(ebCart.getSkuId().longValue() == skuId.longValue()) {
							cartList.remove(ebCart);
						}
					}
				}
			}
		}
		
		//list转json，存入cookie
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		
		Cookie cookie = new Cookie("cart_key", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	public void clearCart(HttpServletRequest request,
			HttpServletResponse response) {
		//存car中的商品
		List<EbCart> cartList = new ArrayList<EbCart>();
		//json配置对象
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[]{"sku"});
		
		//获取当前网站的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length >0) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				String key = ECPSUtils.readProp("cart_key");
				if(StringUtils.equals(name, key)) {
					//获取cookie值
					String value = cookie.getValue();
					
					//[{"skuId":1002, "quantity":2},{"skuId":1002, "quantity":2}]
					value = URLDecoder.decode(value);
					
					//将jsonStr转成JOSON数组对象
					JSONArray ja = JSONArray.fromObject(value);
					
					//转成javaList
					cartList = (List<EbCart>) JSONSerializer.toJava(ja,jc);
					cartList.clear();
				}
			}
		}
		
		//list转json，存入cookie
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		
		Cookie cookie = new Cookie("cart_key", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);

	}

	public String validCookie(HttpServletRequest request,
			HttpServletResponse response) {
		String result = "no";
		
		Cookie cookie = new Cookie("test", "test");
		cookie.setPath("/");
		response.addCookie(cookie);
		
		Cookie[] cookies = request.getCookies();
		for(Cookie c: cookies) {
			String name = c.getName();
			String value = c.getValue();
			if("test".equals(name) && "test".equals(value)) {
				result = "yes";
			}
		}
		return result;
	}

	public void reduceNum(HttpServletRequest request,
			HttpServletResponse response, Long skuId) {
		//存car中的商品
		List<EbCart> cartList = new ArrayList<EbCart>();
		//json配置对象
		JsonConfig jc = new JsonConfig();
		jc.setRootClass(EbCart.class);
		jc.setExcludes(new String[]{"sku"});
		
		//获取当前网站的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length >0) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				String key = ECPSUtils.readProp("cart_key");
				if(StringUtils.equals(name, key)) {
					//获取cookie值
					String value = cookie.getValue();
					
					//[{"skuId":1002, "quantity":2},{"skuId":1002, "quantity":2}]
					value = URLDecoder.decode(value);
					
					//将jsonStr转成JOSON数组对象
					JSONArray ja = JSONArray.fromObject(value);
					
					//转成javaList
					cartList = (List<EbCart>) JSONSerializer.toJava(ja,jc);
					
					//在cookie中存在时，数量更新
					for (EbCart ebCart : cartList) {
						if(ebCart.getSkuId().longValue() == skuId.longValue()) {
							ebCart.setQuantity(ebCart.getQuantity() - 1);
						}
					}
				}
			}
		}
		
		//list转json，存入cookie
		JSONArray ja = JSONArray.fromObject(cartList, jc);
		String result = ja.toString();
		result = URLEncoder.encode(result);
		
		Cookie cookie = new Cookie("cart_key", result);
		cookie.setMaxAge(Integer.MAX_VALUE);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	public String validCart(HttpServletRequest request, HttpServletResponse response) {
		String result = "success";
		
		List<EbCart> cartList = new ArrayList<EbCart>();
		
		//获取当前网站的cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length >0) {
			for(Cookie cookie:cookies) {
				String name = cookie.getName();
				String key = ECPSUtils.readProp("cart_key");
				if(StringUtils.equals(name, key)) {
					//获取cookie值
					String value = cookie.getValue();
					
					//[{"skuId":1002, "quantity":2},{"skuId":1002, "quantity":2}]
					value = URLDecoder.decode(value);
					
					//将jsonStr转成JOSON数组对象
					JSONArray ja = JSONArray.fromObject(value);
					//json配置对象
					JsonConfig jc = new JsonConfig();
					jc.setRootClass(EbCart.class);
					jc.setExcludes(new String[]{"sku"});
					//转成javaList
					cartList = (List<EbCart>) JSONSerializer.toJava(ja,jc);
					for (EbCart ebCart : cartList) {
						EbSku sku = skuDao.getSkuDetailById(ebCart.getSkuId());
						if(sku.getStockInventory().intValue() < ebCart.getQuantity().intValue()) {
							result = sku.getItem().getItemName();
							for(EbSpecValue specVal:sku.getSpecValueList()) {
								result = result + specVal.getSpecValue();
							}
							result = result + "库存不足" + ebCart.getQuantity() + ", 仅有" + sku.getStockInventory() + "个";
							break;
						}
					}
				}
			}
		}
		return result;
	}

}
