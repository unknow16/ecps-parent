package com.fuyi.ecps.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fuyi.ecps.model.TsPtlUser;
import com.fuyi.ecps.service.EbItemService;
import com.fuyi.ecps.service.TsPtlUserService;
import com.fuyi.ecps.utils.ECPSUtils;
import com.fuyi.ecps.utils.MD5;

@Controller
@RequestMapping("/user")
public class EbUserController {
	
	@Autowired
	private TsPtlUserService userService;
	
	@RequestMapping("/toLogin.do")
	public String toLogin() {
		return "passport/login";
	}
	
	/**
	 * 如果redirect: 后面没有/在同一个controller中重定向
	 * 有是在不同Controller中重定向
	 * 
	 * session创建时机
	 * 第一次获取session时，创建 request.getSession();
	 * 如果session存在，就不创建
	 * 
	 */
	@RequestMapping("/login.do")
	public String login(String username, String password, String captcha, HttpSession session, Model model) {

		//校验验证码
		String piccode = (String) session.getAttribute("piccode");
		if(StringUtils.isNotBlank(piccode) && !StringUtils.equalsIgnoreCase(piccode, "")) {
			if(!piccode.equalsIgnoreCase(captcha)) {
				model.addAttribute("tip", "captchaError");
				return "passport/login";
			}
		}
		
		//登录查询用户
		password = MD5.GetMD5Code(password);
		TsPtlUser user = userService.selectUserByUsernameAndPassword(username, password);
		if(user == null) {
			model.addAttribute("tip", "userpasswordError");
			return "passport/login";
		}
		session.setAttribute("user", user);
		
/*		TsPtlUser user = new TsPtlUser();
		user.setUsername("付一鸣");
		session.setAttribute("user", user);*/
		
		return "redirect:/item/toIndex.do";
	}
	
	@RequestMapping("/getUser.do")
	public void getUser(HttpSession session, HttpServletResponse resp) {
		TsPtlUser user = (TsPtlUser) session.getAttribute("user");
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("user", user);
		
		ECPSUtils.printJSON(jsonObject.toString(), resp);
	}
	
	@RequestMapping("/login/toPerson.do")
	public String toPerson() {
		return "person/index";
	}
	
	@RequestMapping("/login/toDeliverAddress.do")
	public String toDeliverAddress() {
		return "person/deliverAddress";
	}
	
	@RequestMapping("/login/toMyOrders.do")
	public String toMyOrders() {
		return "person/myOrders";
	}
	
	@RequestMapping("/login/toChangePassword.do")
	public String toChanagePassword() {
		return "person/changePassword";
	}
	
	@RequestMapping("/getImage.do")
	public void getImage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		 System.out.println("#######################生成数字和字母的验证码#######################");  
	        BufferedImage img = new BufferedImage(68, 22,  
	  
	        BufferedImage.TYPE_INT_RGB);  
	  
	        // 得到该图片的绘图对象    
	  
	        Graphics g = img.getGraphics();  
	  
	        Random r = new Random();  
	  
	        Color c = new Color(200, 150, 255);  
	  
	        g.setColor(c);  
	  
	        // 填充整个图片的颜色    
	  
	        g.fillRect(0, 0, 68, 22);  
	  
	        // 向图片中输出数字和字母    
	  
	        StringBuffer sb = new StringBuffer();  
	  
	        char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();  
	  
	        int index, len = ch.length;  
	  
	        for (int i = 0; i < 4; i++) {  
	  
	            index = r.nextInt(len);  
	  
	            g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt  
	  
	            (255)));  
	  
	            g.setFont(new Font("Arial", Font.BOLD | Font.ITALIC, 22));  
	            // 输出的  字体和大小                      
	  
	            g.drawString("" + ch[index], (i * 15) + 3, 18);  
	            //写什么数字，在图片 的什么位置画    
	  
	            sb.append(ch[index]);  
	  
	        }  
	  
	        request.getSession().setAttribute("piccode", sb.toString());  
	  
	        ImageIO.write(img, "JPG", response.getOutputStream());  
	}
}
