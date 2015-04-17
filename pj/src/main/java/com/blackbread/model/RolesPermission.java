package com.blackbread.model;
public class RolesPermission implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private String roleId;
	private String permissionId;

	// Constructors

	/** default constructor */
	public RolesPermission() {
	}

	/** full constructor */
	public RolesPermission(String roleId, String permissionId) {
		this.roleId = roleId;
		this.permissionId = permissionId;
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

	public String getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(String permissionId) {
		this.permissionId = permissionId;
	}


}