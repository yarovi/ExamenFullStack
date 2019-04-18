package com.mitocode;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;

import com.mitocode.dao.IUsuarioDAO;
import com.mitocode.model.Rol;

public class CustomerTokenEnhancer implements TokenEnhancer {

	private static final Log LOG = LogFactory.getLog(CustomerTokenEnhancer.class);
	@Autowired
	private IUsuarioDAO userDAO2;
	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
		// TODO Auto-generated method stub
		LOG.info("Aqui hay ... "+ authentication.getPrincipal());
		CustomerUser user = (CustomerUser) authentication.getPrincipal();

		LOG.info("Aqui hay detallito ... "+ user.getDetalle().stream().map(Rol::getDescripcion).collect(Collectors.toList()));
		
		// Se tuvo que serializar la clase Usuario y Rol del modelo
		final Map<String, Object> additionalInfo = new HashMap<>();
		additionalInfo.put("roles",user.getDetalle().stream().map(Rol::getDescripcion).collect(Collectors.toList()));
		((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
        return accessToken;
	}

}
