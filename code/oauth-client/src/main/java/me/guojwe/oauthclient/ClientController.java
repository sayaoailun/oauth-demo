package me.guojwe.oauthclient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class ClientController {
	
	@Autowired
	@Qualifier("oAuth2RestTemplate")
	private RestTemplate rest;
	@Value("${resource.url}")
	private String resourceUrl;
	
	@GetMapping("/app")
	public String app() {
		return rest.getForObject(resourceUrl, String.class);
    }

}
