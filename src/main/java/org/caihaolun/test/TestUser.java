package org.caihaolun.test;

import org.caihaolun.dao.UserDAO;
import org.caihaolun.model.Blog;
import org.caihaolun.model.User;
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
public class TestUser {
    private UserDAO userDAO;

    @Resource
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Test
    //测试save
    public void testSave() throws Exception {
        User user = new User();

        user.setUsername("23");
        user.setPassword("123");

        userDAO.save(user);
    }

    @Test
    public void testFind()throws Exception{
        List<User> users = userDAO.findByUsername("23");
        for (User user : users) {
            System.out.println(user.getUid() + " " + user.getUsername() + " " + user.getPassword());
        }
    }
}
