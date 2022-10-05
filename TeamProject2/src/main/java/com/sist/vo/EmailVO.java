package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmailVO {
	private String senderName, senderMail, receiveMail, subject, message;
}
