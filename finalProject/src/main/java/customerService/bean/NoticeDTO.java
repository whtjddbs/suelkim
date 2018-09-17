package customerService.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class NoticeDTO {
	private int seq;
	private String title;
	private String content;
	private Date logtime;
}
