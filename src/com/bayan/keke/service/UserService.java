package com.bayan.keke.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.bayan.keke.dao.UserDao;
import com.bayan.keke.vo.KeUser;

@Scope("prototype")
@Service
public class UserService {
	/* */
	@Resource
	private UserDao userDao;

	/**
	 * 判断是否已注册
	 * 
	 * @param keuser
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> regist(KeUser keuser) throws Exception {
		return userDao.regist(keuser);
	}
	
	/**
	 * 根据手机号查找用户
	 * 
	 * @param KeUser
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selUserWithPhoneNum(KeUser keUser) throws Exception {
		return userDao.selUserWithPhoneNum(keUser);
	}
	
	/**
	 * 登陆
	 * 
	 * @param keuser
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> login(KeUser keuser) throws Exception {
		return userDao.login(keuser);
	}	
	
	/**
	 * 判断第三方是否已注册
	 * 
	 * @param keuser
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> QQWeChatRegist(KeUser keUser) throws Exception {
		return userDao.QQWeChatRegist(keUser);
	}
	
	/**
	 * 学生端第三方注册
	 * 
	 * @param keuser
	 * @return
	 * @throws Exception
	 */
	public Integer QQWeChatAdd(KeUser keUser) throws Exception {
		userDao.QQWeChatAdd(keUser);
		return keUser.getId();
	}
	
	/**
	 * 学生端第三方登陆
	 * 
	 * @param keuser
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> QQWeChatLogin(KeUser keuser) throws Exception {
		return userDao.QQWeChatLogin(keuser);
	}

	/**
	 * 添加信息
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer add(KeUser keUser) throws Exception {
		userDao.add(keUser);
		return keUser.getId();
	}

	/**
	 * 修改头像
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer headUrlUpdate(KeUser keUser) throws Exception {
		return userDao.headUrlUpdate(keUser);
	}
	
	/**
	 * 重置密码
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer reSetPW(KeUser keUser) throws Exception {
		return userDao.reSetPW(keUser);
	}
	
	/**
	 * 修改昵称
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer udpateName(KeUser keUser) throws Exception {
		return userDao.updateName(keUser);
	}
	
	/**
	 * 修改年级
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer udpateGrade(KeUser keUser) throws Exception {
		return userDao.udpateGrade(keUser);
	}

	/**
	 * 修改所在地
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer updateCity(KeUser keUser) throws Exception {
		return userDao.updateCity(keUser);
	}
	
	/**
	 * 验证码添加
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer addCode(KeUser keUser) throws Exception {
		return userDao.addCode(keUser);
	}

	/**
	 * 判断是否已有设备号
	 * 
	 * @param keuser
	 * @return
	 * @throws Exception
	 */
	public String selectDevice(KeUser keuser) throws Exception {
		return userDao.selectDevice(keuser);
	}
	
	/**
	 * 添加设备
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer addDevice(KeUser keUser) throws Exception {
		return userDao.addDevice(keUser);
	}
	
	/**
	 * 更新设备ID
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer updateDevice(KeUser keUser) throws Exception {
		return userDao.updateDevice(keUser);
	}
}
