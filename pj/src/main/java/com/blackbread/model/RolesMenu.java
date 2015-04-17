package com.blackbread.model;
public class RolesMenu implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private String roleId;
	private String menuId;

	// Constructors

	/** default constructor */
	public RolesMenu() {
	}

	/** full constructor */
	public RolesMenu(String roleId, String menuId) {
		this.roleId = roleId;
		this.menuId = menuId;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMenuId() {
		return this.menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

}