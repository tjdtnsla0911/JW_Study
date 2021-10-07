package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //getter setter ToString을 한방에해준다
@AllArgsConstructor// 모든필드값을 파라미터로 받는 생성자를 만듬
@NoArgsConstructor //파라미터가없는 기본생성자
@Builder //요즘대세인 Builder 패턴을 위해 해놓음
public class Members {
	private Integer memberId;
	private String memberName;
	private String memberAge;
	private String memberAdd;
	private String memberImg;
	private Integer memberGender; 
	private String memberAcount;
	private String memberPassword;
	
}
