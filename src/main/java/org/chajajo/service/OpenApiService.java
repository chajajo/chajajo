package org.chajajo.service;



public interface OpenApiService {

	public void openApiToListDB(int totalCount, String Case) throws Exception;
	public void openApiToDetailDB(int totalCount, String Case) throws Exception;
	public void openApiToConditionsDB(int totalCount, String Case) throws Exception;
	
	public int totalCount();
	
	public void cleanDB();
}
