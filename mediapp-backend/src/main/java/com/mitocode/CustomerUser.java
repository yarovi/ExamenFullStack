package com.mitocode;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mitocode.model.Rol;
public class CustomerUser extends User implements Serializable{

	List<Rol> detalle;
	public CustomerUser(String username, 
			String password,
			boolean enabled, 
			boolean accountNonExpired,
			boolean credentialsNonExpired, 
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities,
			List<Rol> det) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		// TODO Auto-generated constructor stub
		this.detalle=det;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public List<Rol> getDetalle() {
		return detalle;
	}

	public void setDetalle(List<Rol> detalle) {
		this.detalle = detalle;
	}
	

}
