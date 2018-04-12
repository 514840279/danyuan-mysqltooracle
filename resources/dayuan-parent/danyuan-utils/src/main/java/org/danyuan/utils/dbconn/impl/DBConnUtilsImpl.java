package org.danyuan.utils.dbconn.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.danyuan.utils.dbconn.DBConnUtils;

/**
 * 文件名 ： DBConnUtils.java
 * 包 名 ： tk.ainiyue.wth.automatic.dbconn
 * 描 述 ： Sqlite驱动连接类
 * 作 者 ： Tenghui.Wang
 * 时 间 ： 2015年10月10日 上午9:13:36
 * 版 本 ： V1.0
 */
public class DBConnUtilsImpl implements DBConnUtils {
    
    private PreparedStatement stat = null;
    
    /**
     * 获取语句对象
     * 方法名 ： getStat
     * 功 能 ： 返回变量 stat 的值
     * 
     * @return: PreparedStatement
     */
    public PreparedStatement getStat() {
        return stat;
    }
    
    /**
     * 设置语句对象
     * 方法名 ： setStat
     * 功 能 ： 设置变量 stat 的值
     */
    public void setStat(PreparedStatement stat) {
        this.stat = stat;
    }
    
    /**
     * 方法名 ： queryAll
     * 功 能 ： 动态查询
     * 参 数 ： @param sql
     * 参 数 ： @return
     * 参 数 ： @throws SQLException
     * 参 考 ： @see
     * tk.ainiyue.wth.automatic.dbconn.DBConnUtils#queryAll(java.lang.String)
     * 时 间 ： 2015年10月13日 上午9:28:21
     * 作 者 ： Tenghui.Wang
     */
    public ResultSet queryAll(Connection conn, String sql, String... str) throws SQLException {
        stat = conn.prepareStatement(sql);
        int i = 1;
        while (str.length >= i) {
            stat.setString(i, str[i]);
            i++;
        }
        return stat.executeQuery();
    }
    
    /**
     * 方法名： queryAll
     * 功 能： 查询语句
     * 参 数： @param conn
     * 参 数： @param sql
     * 参 数： @return
     * 参 数： @throws SQLException
     * 返 回： ResultSet
     * 作 者 ： Tenghui.Wang
     * @throws
     */
    public ResultSet queryAll(Connection conn, String sql) throws SQLException {
        stat = conn.prepareStatement(sql);
        return stat.executeQuery();
    }
    
    /**
     * 方法名 ： update
     * 功 能 ： 动态更新
     * 参 数 ： @param sql
     * 参 数 ： @param str
     * 参 数 ： @return
     * 参 数 ： @throws SQLException
     * 参 考 ： @see
     * tk.ainiyue.wth.automatic.dbconn.DBConnUtils#update(java.lang.String,
     * java.lang.String[])
     * 时 间 ： 2015年10月13日 上午9:28:21
     * 作 者 ： Tenghui.Wang
     */
    public int update(Connection conn, String sql, String... str) throws SQLException {
        stat = conn.prepareStatement(sql);
        int i = 1;
        while (str.length >= i) {
            stat.setString(i, str[i]);
            i++;
        }
        return stat.executeUpdate(sql);
    }
    
    /**
     * 方法名： update
     * 功 能： 更新语句
     * 参 数： @param conn
     * 参 数： @param sql
     * 参 数： @return
     * 参 数： @throws SQLException
     * 返 回： int
     * 作 者 ： Tenghui.Wang
     * @throws
     */
    public int update(Connection conn, String sql) throws SQLException {
        stat = conn.prepareStatement(sql);
        return stat.executeUpdate(sql);
    }
    
    /**
     * 方法名： querySingle
     * 功 能： 条件查询单个结果
     * 参 数： @param conn
     * 参 数： @param sql
     * 参 数： @param str
     * 参 数： @return
     * 参 数： @throws SQLException
     * 返 回： String
     * 作 者 ： Tenghui.Wang
     * @throws
     */
    public String querySingleString(Connection conn, String sql, String... str) throws SQLException {
        stat = conn.prepareStatement(sql);
        int i = 1;
        while (str.length >= i) {
            stat.setString(i, str[i]);
            i++;
        }
        ResultSet rs = stat.executeQuery();
        String result = null;
        while (rs.next()) {
            result = rs.getString(1);
        }
        close(rs);
        close(stat);
        return result;
    }
    
    /**
     * 方法名： querySingleString
     * 功 能： 查询单个结果
     * 参 数： @param conn
     * 参 数： @param sql
     * 参 数： @return
     * 参 数： @throws SQLException
     * 返 回： String
     * 作 者 ： Tenghui.Wang
     * @throws
     */
    public String querySingleString(Connection conn, String sql) throws SQLException {
        stat = conn.prepareStatement(sql);
        ResultSet rs = stat.executeQuery();
        String result = null;
        while (rs.next()) {
            result = rs.getString(1);
        }
        close(rs);
        close(stat);
        return result;
    }
    
    /**
     * 方法名 ： close
     * 功 能 ： 连接关闭
     * 参 数 ： @param conn
     * 参 考 ： @see
     * org.danyuan.utils.dbconn.DBConnUtils#close(java.sql.Connection)
     * 作 者 ： Tenghui.Wang
     */
    public void close(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 方法名 ： close
     * 功 能 ： 语句对象关闭
     * 参 数 ： @param state
     * 参 考 ： @see org.danyuan.utils.dbconn.DBConnUtils#close(java.sql.Statement)
     * 作 者 ： Tenghui.Wang
     */
    public void close(Statement state) {
        try {
            if (state != null) {
                state.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 方法名 ： close
     * 功 能 ：结果集关闭
     * 参 数 ： @param rs
     * 参 考 ： @see org.danyuan.utils.dbconn.DBConnUtils#close(java.sql.ResultSet)
     * 作 者 ： Tenghui.Wang
     */
    public void close(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
