package org.caihaolun.controller;

import org.caihaolun.dao.UserDAO;
import org.caihaolun.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/3.
 * 控制层
 */
@Controller
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class UserController {
    private UserDAO userDAO;

    @Resource
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    private static void addCookie(String name, String value, int maxAge, HttpServletResponse response) throws Exception {
        //添加cookie操作
        Cookie cookie = new Cookie(name, URLEncoder.encode(value.trim(), "UTF-8"));
        cookie.setMaxAge(maxAge);// 设置为10天
        cookie.setPath("/");
        System.out.println("已添加" + name);
        response.addCookie(cookie);
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "login";
    }

    @RequestMapping(value = "/validate", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> validate(@RequestBody User user, HttpServletResponse response) throws Exception {
        Map<String, String> map = new HashMap<>();
        User user1 = userDAO.findByID(user.getUid());
        //登录成功返回user，失败返回null
        if (user1 == null || !user1.getUsername().equals(user.getUsername())) {
            map.put("result", "用户名不正确！");
            return map;
        } else if (!user1.getPassword().equals(user.getPassword())) {
            map.put("result", "密码不正确！");
            return map;
        } else {
            map.put("result", "SUCCESS");
            addCookie("uid", user1.getUid().toString(), 10 * 24 * 60 * 60, response);
            addCookie("username", user1.getUsername(), 10 * 24 * 60 * 60, response);
            return map;
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> register(@RequestBody User user, HttpServletResponse response) throws Exception {
        Map<String, String> result = new HashMap<>();
        userDAO.save(user);
        addCookie("uid", user.getUid().toString(), 10 * 24 * 60 * 60, response);
        addCookie("username", user.getUsername(), 10 * 24 * 60 * 60, response);
        result.put("result", "SUCCESS");
        return result;
    }

    @RequestMapping(value = "/account/{uid}")
    public String account(@PathVariable("uid") Integer uid, ModelMap modelMap) {
        User user = userDAO.findByID(uid);
        modelMap.addAttribute("user", user);
        return "account";
    }

    @RequestMapping(value = "/changePasswd/{uid}", method = RequestMethod.POST)
    public String changePasswd(@PathVariable("uid") Integer uid, String newPassword) {
        User user = userDAO.findByID(uid);
        user.setPassword(newPassword);
        userDAO.save(user);
        return "homePage";
    }

    @RequestMapping(value = "/logout/{uid}")
    public String logout(@PathVariable("uid") Integer uid, HttpServletResponse response) throws Exception {
        User user = userDAO.findByID(uid);
        addCookie("uid", user.getUid().toString(), 0, response);
        addCookie("username", user.getUsername(), 0, response);
        return "redirect:/";
    }
}