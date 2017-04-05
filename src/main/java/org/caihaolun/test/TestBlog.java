package org.caihaolun.test;

import org.caihaolun.dao.BlogDAO;
import org.caihaolun.model.Blog;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/4/2.
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestBlog {
    private BlogDAO blogDAO;

    @Resource
    public void setBlogDAO(BlogDAO blogDAO) {
        this.blogDAO = blogDAO;
    }

    @Test
    //测试save
    public void testSave() throws Exception {
        Blog blog = new Blog();
        blog.setTitle("123");
        blog.setContent("123");

        blogDAO.save(blog);
    }

    @Test
    public void testDeleteBatch() throws Exception {
        //删除编号为1 2 3 4的博文
        blogDAO.deleteBatch(new Integer[]{1, 2, 3, 4});
        List<Blog> blogs = blogDAO.findAll();
        for (Blog blog : blogs) {
            System.out.println(blog.getBid() + " " + blog.getTitle() + " " + blog.getContent());
        }
        System.out.println();
    }

    @Test
    public void testPaging() throws Exception {
        List<Blog> blogs = blogDAO.paging(3, 4);
        for (Blog blog : blogs) {
            System.out.println(blog.getBid() + " " + blog.getTitle() + " " + blog.getContent());
        }
        System.out.println();
    }

    @Test
    public void testFind()throws Exception{
        List<Blog> blogs = blogDAO.findByUid(2);
        for (Blog blog : blogs) {
            System.out.println(blog.getBid() + " " + blog.getTitle() + " " + blog.getContent());
        }
    }
}
