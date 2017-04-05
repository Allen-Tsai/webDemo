package org.caihaolun.controller;

import org.caihaolun.dao.BlogDAO;
import org.caihaolun.model.Blog;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/3.
 * 控制层
 */
@Controller
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class BlogController {
    private BlogDAO blogDAO;

    @Resource
    public void setBlogDAO(BlogDAO blogDAO) {
        this.blogDAO = blogDAO;
    }

    private static String textParser(String source) {
        if (source == null) {
            return "";
        }
        StringBuilder buffer = new StringBuilder();
        for (int i = 0; i < source.length(); i++) {
            char c = source.charAt(i);
            switch (c) {
                case '<':
                    buffer.append("&lt;");
                    break;
                case '>':
                    buffer.append("&gt;");
                    break;
                case '&':
                    buffer.append("&amp;");
                    break;
                case '"':
                    buffer.append("&quot;");
                    break;
                case '\n':
                    buffer.append("<br/>");
                    break;
                default:
                    buffer.append(c);
            }
        }
        return buffer.toString();
    }

    @RequestMapping(value = "/addArticle")
    @ResponseBody
    public Map<String, String> add(String title, String content, Integer uid) throws Exception {
        Map<String, String> res = new HashMap<>();
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(textParser(content));
        blog.setUserid(uid);
        blogDAO.save(blog);
        res.put("result", "SUCCESS");
        return res;
    }

    @RequestMapping(value = "/articleList/{uid}")
    public String getAllBlog(@PathVariable("uid") Integer uid, ModelMap modelMap) throws Exception {
        // 查询表中所有记录
        // 将所有记录传递给要返回的jsp页面，放在blogList当中
        if (blogDAO.findByUid(uid) == null) {
            return "redirect:/";
        } else {
            modelMap.addAttribute("blogList", blogDAO.findByUid(uid));
            // 返回原本jsp页面
            return "articleList";
        }
    }

    @RequestMapping(value = "/show/{bid}")
    public String get(@PathVariable("bid") Integer bid, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("blog", blogDAO.findByID(bid));
        return "article";
    }

    /**
     * 转到update的目录
     *
     * @param bid 根据bid返回
     * @return 页面
     * @throws Exception
     */
    @RequestMapping(value = "/update/{bid}")
    public String toUpdatePage(@PathVariable("bid") Integer bid, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("blog", blogDAO.findByID(bid));
        return "articleUpdate";
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public Map<String, String> update(@RequestBody Blog blog) throws Exception {
        Map<String, String> res = new HashMap<>();
        blogDAO.save(blog);
        res.put("result", "SUCCESS");
        return res;
    }

    @RequestMapping(value = "/delete/{bid}")
    public String delete(@PathVariable("bid") Integer bid) throws Exception {
        blogDAO.delete(blogDAO.findByID(bid));
        return "index";
    }

}
