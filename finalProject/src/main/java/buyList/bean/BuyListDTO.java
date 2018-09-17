package buyList.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BuyListDTO {
	private String serial;
	private String id;
	private String status;
	private Date logtime;
}
