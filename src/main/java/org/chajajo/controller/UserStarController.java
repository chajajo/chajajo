package org.chajajo.controller;

import org.chajajo.domain.StarVO;
import org.chajajo.mapper.ServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api/service/star")
public class UserStarController {
	@Autowired
	ServiceMapper mapper;
	
	@PostMapping("/add")
	public StarVO addStar(@RequestBody StarVO star) {
		mapper.addStar(star);
		return star;
	}
	
	@DeleteMapping("/delete")
	public String deleteStar(StarVO star) {
		mapper.deleteStar(star);
		return "OK";
	}

}