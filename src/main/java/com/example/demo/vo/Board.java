package com.example.demo.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // 게터 세터 Tostring 한번에 다해줌
@AllArgsConstructor //파라미터 생성자
@NoArgsConstructor //일반 생성자
@Builder //빌더패턴
public class Board {
	private Integer boradSeq;
	private Integer memberId;
	private String title;
	private String boardContent;
	private String imgUrl;
	private Timestamp createTime; //요놈 임포트할때 시큐리티꺼말고 sql로 해야합니다!
	
}
