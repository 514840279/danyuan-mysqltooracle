package tk.ainiyue.danyuan.application.authority.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
	
import tk.ainiyue.danyuan.application.authority.po.SysMenuInfo;
import tk.ainiyue.danyuan.application.authority.service.SysMenuService;
import tk.ainiyue.danyuan.application.authority.vo.AuthorityzTreeVO;

/**
 * 文件名 ： SysMenuController.java
 * 包 名 ： tk.ainiyue.admin.department.controller
 * 描 述 ： 权限控制器
 * 机能名称：
 * 技能ID ：
 * 作 者 ： Tenghui.Wang
 * 时 间 ： 2016年7月17日 下午3:45:28
 * 版 本 ： V1.0
 */
@RestController
@RequestMapping("/sysMenuInfo")
public class SysMenuController {
	//
	private static final Logger	logger = LoggerFactory.getLogger(SysMenuController.class);
	
	//
	@Autowired
	private SysMenuService	sysMenuService;
	
	/**
	 * 方法名： addbatch
	 * 功 能： 批量添加
	 * 参 数： @param authorityList
	 * 参 数： @return
	 * 返 回： String
	 * 作 者 ： Tenghui.Wang
	 * @throws
	 */
	@RequestMapping("/addbatch")
	public void addbatch(@RequestBody List<SysMenuInfo> sysMenuInfoList) {
		for (SysMenuInfo authority : sysMenuInfoList) {
			sysMenuService.save(authority);
		}
	}
	
	
	/**
	 * 方法名： findzTree
	 * 功 能： 取得ztree信息
	 * 参 数： @return
	 * 返 回： List<AuthorityVO>
	 * 作 者 ： wang
	 * @throws
	 */
	@RequestMapping("/findzTree")
	public List<AuthorityzTreeVO> findzTree() {
		return sysMenuService.findzTreeByF_ParentId("0");
	}
	
	/**
	 * 方法名： addzTree
	 * 功 能： 增加节点
	 * 参 数： @return
	 * 返 回： List<AuthorityVO>
	 * 作 者 ： wang
	 * @throws
	 */
	@RequestMapping("/addSysMenuInfo")
	public AuthorityzTreeVO addzTree(@RequestBody SysMenuInfo sysMenuInfo) {
		System.err.println(sysMenuInfo.toString());
		return sysMenuService.save(sysMenuInfo);
	}
	
	/**
	 * 方法名： findAuthorityByUuid
	 * 功 能： 增加节点
	 * 参 数： @return
	 * 返 回： List<AuthorityVO>
	 * 作 者 ： wang
	 * @throws
	 */
	@RequestMapping("/findSysMenuInfoByUuid")
	public SysMenuInfo findAuthorityByUuid(@RequestBody SysMenuInfo sysMenuInfo) {
		return sysMenuService.findAuthorityByUuid(sysMenuInfo);
	}
	
	/**
	 * 方法名： deleteAuthority
	 * 功 能： 删除
	 * 参 数： @param authority
	 * 返 回： void
	 * 作 者 ： wang
	 * @throws
	 */
	@RequestMapping("/deleteSysMenuInfo")
	public Map<String, String> deleteAuthority(@RequestBody SysMenuInfo sysMenuInfo) {
		sysMenuService.deleteAuthority(sysMenuInfo);
		Map<String, String> map = new HashMap<String, String>();
		map.put("code", "0");
		return map;
	}
	
	/**
	 * 方法名： updateAuthorityName
	 * 功 能： 更新名称
	 * 参 数： @param authority
	 * 参 数： @return
	 * 返 回： AuthorityzTreeVO
	 * 作 者 ： wang
	 * @throws
	 */
	@RequestMapping("/updateSysMenuInfoName")
	public AuthorityzTreeVO updateAuthorityName(@RequestBody SysMenuInfo sysMenuInfo) {
		return sysMenuService.updateAuthorityName(sysMenuInfo);
	}
	
	/**
	 * 方法名： onDropAuthority
	 * 功 能： 拖拽排序
	 * 参 数： @param authorityzTreeVO
	 * 参 数： @return
	 * 返 回： AuthorityzTreeVO
	 * 作 者 ： wang
	 * @throws
	 */
	@RequestMapping("/onDropSysMenuInfo")
	public AuthorityzTreeVO onDropAuthority(@RequestBody SysMenuInfo sysMenuInfo) {
		return sysMenuService.onDropAuthority(sysMenuInfo);
	}
	
}
