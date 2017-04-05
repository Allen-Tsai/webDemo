package org.caihaolun.dao;

import org.caihaolun.model.Blog;
import org.hibernate.HibernateException;
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
 * BlogDAO
 */
@Repository
@Transactional
public class BlogDAO extends HibernateDaoSupport {
    @Resource
    public void setHibernateTemplate(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    public void save(Blog value) {
        this.getHibernateTemplate().saveOrUpdate(value);
    }

    public void delete(Blog value) {
        this.getHibernateTemplate().delete(value);
    }

    public Blog findByID(Integer key) {
        return this.getHibernateTemplate().get(Blog.class, key);
    }

    public List<Blog> findAll() {
        return this.getHibernateTemplate().loadAll(Blog.class);
    }

    /**
     * 根据用户id查询文章列表
     * @param uid 用户id
     * @return List<Blog> 返回Blog列表
     */
    public List<Blog> findByUid(int uid) {
        return this.getHibernateTemplate().execute(new HibernateCallback<List<Blog>>() {
            @Transactional
            public List<Blog> doInHibernate(Session session) {
                Query query = session.createQuery("from Blog where userid=" + uid);
                return query.list();
            }
        });
    }

    /**
     * 批量删除
     *
     * @param flag 删除的标号
     */
    public void deleteBatch(Integer[] flag) {
        String hql = "delete Blog where id in (:bid) ";
        this.getHibernateTemplate().execute(new HibernateCallback<Object>() {
            @Transactional
            public Object doInHibernate(Session session) {
                Query query = session.createQuery(hql);
                query.setParameterList("bid", flag);
                return query.executeUpdate();
            }
        });
    }

    /**
     * 分页
     * @param limit       每页分几个条目
     * @param currentPage 当前第几页
     * @return 返回分页后的n个Blog对象
     */
    public List<Blog> paging(int limit, int currentPage) {
        return this.getHibernateTemplate().execute(new HibernateCallback<List<Blog>>() {
            @Transactional
            public List<Blog> doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from Blog");
                query.setFirstResult((limit) * (currentPage - 1));
                query.setMaxResults(limit);
                return query.list();
            }
        });
    }
}
