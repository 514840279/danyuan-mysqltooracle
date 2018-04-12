package tk.ainiyue.admin.sysmenu.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tk.ainiyue.admin.sysmenu.po.SysMenuInfo;
import tk.ainiyue.admin.sysmenu.service.SysMenuService;

/**
 * 文件名 ： SysmenuController.java
 * 包 名 ： tk.ainiyue.admin.sysmenu.controller
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： Tenghui.Wang
 * 时 间 ： 2016年7月17日 下午7:58:20
 * 版 本 ： V1.0
 */
@RestController
@RequestMapping("/sysMenu")
public class SysMenuController {
    
    //
    private static final Logger logger = LoggerFactory.getLogger(SysMenuController.class);
    
    //
    @Autowired
    private SysMenuService      sysMenuService;
    
    /**
     * 方法名： findAll
     * 功 能： TODO(这里用一句话描述这个方法的作用)
     * 参 数： @return
     * 返 回： List<SysMenuInfo>
     * 作 者 ： Tenghui.Wang
     * @throws
     */
    @RequestMapping("/sysMenuList")
    public List<SysMenuInfo> findAll() {
        logger.info("sysMenuList", SysMenuController.class);
        return sysMenuService.findAll();
    }
    
}
