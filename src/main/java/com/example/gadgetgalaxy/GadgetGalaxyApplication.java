package com.example.gadgetgalaxy;

import com.example.gadgetgalaxy.entities.Role;
import com.example.gadgetgalaxy.repositories.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Arrays;
import java.util.UUID;

@SpringBootApplication
public class GadgetGalaxyApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(GadgetGalaxyApplication.class, args);
	}

	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	RoleRepository roleRepository;

	@Value("${admin.role.id}")
	public String role_admin_id;

	@Value("${normal.role.id}")
	public String role_normal_id;

	@Override
	public void run(String... args) throws Exception {
		System.out.println(passwordEncoder.encode("1234"));

		try {
			Role admin = Role.builder().roleId(role_admin_id).roleName("ADMIN").build();
			Role normal = Role.builder().roleId(role_normal_id).roleName("NORMAL").build();
			roleRepository.saveAll(Arrays.asList(admin,normal));
		}catch (Exception e){
			e.printStackTrace();
		}
		}
}
