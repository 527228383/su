package com.zl.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ProcessDefinitionDto {
	
	private String id;
	
	private String name;
	
	private String key;
	
	private Date time;
	
	private Integer version;
}
