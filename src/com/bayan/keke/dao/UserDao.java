package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeUser;

@Scope("prototype")
@Repository
public class UserDao extends BaseDao {
	/**
	 * 用户信息添加
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer add(KeUser keUser) throws Exception {
		Integer res = this.getSqlSession().insert("user.insert", keUser);
		return  keUser.getId();
	}

	/**
	 * 验证码添加
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer addCode(KeUser keUser) throws Exception {
		Integer res = this.getSqlSession().insert("user.insertCode", keUser);
		return keUser.getId();
	}

	/**
	 * 判断是否已有设备号
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public String selectDevice(KeUser keUser) throws Exception {
		return this.getSqlSession().selectOne("user.getDevices", keUser);
	}

	/**
	 * 设备添加
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer addDevice(KeUser keUser) throws Exception {
		Integer res = this.getSqlSession().insert("user.insertDevice", keUser);
		res = keUser.getId();
		return res;
	}

	/**
	 * 更新设备ID
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer updateDevice(KeUser keUser) throws Exception {
		return this.getSqlSession().update("user.updateDevice", keUser);
	}

	/**
	 * 判断是否已注册
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public KeUser regist(KeUser keUser) throws Exception {
		return this.getSqlSession().selectOne("user.register", keUser);
	}

	/**
	 * 根据手机号查找用户
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selUserWithPhoneNum(KeUser keUser) throws Exception {
		return this.getSqlSession().selectList("user.selUserWithPhoneNum", keUser);
	}

	/**
	 * 学生端登陆
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> login(KeUser keUser) throws Exception {
		return this.getSqlSession().selectOne("user.loginStu", keUser);
	}

	/**
	 * 判断第三方是否已注册
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> QQWeChatRegist(KeUser keUser) throws Exception {
		return this.getSqlSession().selectOne("user.qqWechatRegister", keUser);
	}

	/**
	 * 学生端第三方注册
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer QQWeChatAdd(KeUser keUser) throws Exception {
		Integer res = this.getSqlSession().insert("user.insertQQWechat", keUser);
		res = keUser.getId();
		return res;
	}

	/**
	 * 学生端第三方登陆
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> QQWeChatLogin(KeUser keUser) throws Exception {
		return this.getSqlSession().selectOne("user.qqWeChatLogin", keUser);
	}

	/**
	 * 重置密码
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer reSetPW(KeUser keUser) throws Exception {
		return this.getSqlSession().update("user.pwReset", keUser);
	}

	/**
	 * 修改昵称
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer updateName(KeUser keUser) throws Exception {
		return this.getSqlSession().update("user.updateName", keUser);
	}

	/**
	 * 用户头像修改
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer headUrlUpdate(KeUser keUser) throws Exception {
		return this.getSqlSession().update("user.headUpdate", keUser);
	}

	/**
	 * 用户年级修改
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer udpateGrade(KeUser keUser) throws Exception {
		return this.getSqlSession().update("user.updateGrade", keUser);
	}

	/**
	 * 修改所在地
	 *
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer updateCity(KeUser keUser) throws Exception {
		return this.getSqlSession().update("user.updateCity", keUser);
	}
}
