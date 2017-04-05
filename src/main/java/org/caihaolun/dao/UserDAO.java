package org.caihaolun.dao;

import org.caihaolun.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Administrator on 2017/4/2.
 * UserDAO
 */
@Repository
@Transactional
public class UserDAO extends HibernateDaoSupport {
    @Resource
    public void setHibernateTemplate(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    /**
     * 根据用户名查询用户
     * @param username 用户名
     * @return List<Blog> 返回Blog列表
     */
    public List<User> findByUsername(String username) {
        return this.getHibernateTemplate().execute(new HibernateCallback<List<User>>() {
            @Transactional
            public List<User> doInHibernate(Session session) {
                Query query = session.createQuery("from User where username=" + username);
                return query.list();
            }
        });
    }

    public void save(User value) {
        this.getHibernateTemplate().saveOrUpdate(value);
    }

    public void delete(User value) {
        this.getHibernateTemplate().delete(value);
    }

    public User findByID(Integer key) {
        return this.getHibernateTemplate().get(User.class, key);
    }

    public List<User> findAll() {
        return this.getHibernateTemplate().loadAll(User.class);
    }

}
