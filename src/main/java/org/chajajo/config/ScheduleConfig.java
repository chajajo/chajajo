package org.chajajo.config;

import org.chajajo.service.OpenApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling
public class ScheduleConfig {

	@Autowired 
	OpenApiService OpenApiService;
	
	//DB table 내용 초기화
	//매 주 수요일 00:00:00
	//@Scheduled(cron = "0 0 0 * * 3")
	public void autoCleanDB() {
		OpenApiService.cleanDB();
	}
	
	//insert serviceList table
	//매 주 수요일 00:01:00
	//@Scheduled(cron = "0 1 0 * * 3")
	public void autoListInsert() {
		
		//전체 보조금 개수
		int totalCount = 0;
		totalCount = OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToListDB(totalCount, "insert");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//insert serviceDetail table
	//매 주 수요일 00:06:00
	//@Scheduled(cron = "0 5 0 * * 3")
	public void autoDetailInsert() {
		int totalCount = 0;
		
		totalCount = OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToDetailDB(totalCount, "insert");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//insert supportCondtions table
	//매 주 수요일 00:06:00
	//@Scheduled(cron = "0 9 0 * * 3")
	public void autoConditonsInsert() {
		int totalCount = 0;
		totalCount = OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToConditionsDB(totalCount, "insert");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//update supportCondtions
	//매일 00:00:00 (수요일 제외)
	//@Scheduled(cron = "0 0 0 * * 0,1,2,4,5,6")
	public void autoConditonsUpdate() {
		int totalCount = 0;
		
		totalCount = OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToConditionsDB(totalCount, "update");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//update serviceDetail
	//매일 00:05:00 (수요일 제외)
	//@Scheduled(cron = "0 5 0 * * 0,1,2,4,5,6")
	public void autoDetailUpdate() {
		int totalCount = 0;
		
		totalCount = OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToDetailDB(totalCount, "update");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//update serviceList
	//매일 00:10:00 (수요일 제외)
	//@Scheduled(cron = "0 10 0 * * 0,1,2,4,5,6")
	public void autoListUpdate() {
		int totalCount = 0;
		
		totalCount = OpenApiService.totalCount();
		
		try {
			OpenApiService.openApiToListDB(totalCount, "update");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
