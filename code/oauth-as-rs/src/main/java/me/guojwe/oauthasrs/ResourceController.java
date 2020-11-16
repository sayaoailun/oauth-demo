package me.guojwe.oauthasrs;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest")
public class ResourceController {
	
	@GetMapping("/whoami")
	public String whoami(@AuthenticationPrincipal(expression="username") String name) {
		return name;
    }

}
