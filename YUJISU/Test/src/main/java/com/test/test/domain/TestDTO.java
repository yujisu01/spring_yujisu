package com.test.test.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestDTO {

	private String id;
	private String pwd;
	private String phone;
	private String email;
	private String name;
	
	
}
