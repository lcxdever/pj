package com.blackbread.service.imp;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackbread.dao.SuggestionMapper;
import com.blackbread.model.Suggestion;
import com.blackbread.service.SuggestionService;
import com.blackbread.utils.Pagination;

@Service
public class SuggestionServiceImp implements SuggestionService {
	@Autowired
	SuggestionMapper suggestionMapper;

	public void insert(Suggestion suggestion) {
		suggestion.setCreateTime(new Date());
		suggestion.setId(UUID.randomUUID().toString());
		suggestionMapper.insert(suggestion);
	}

	public Pagination query(Pagination pagination, Suggestion suggestion) {
		if (pagination == null)
			pagination = new Pagination(1, 10000);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pagination.getStart());
		map.put("end", pagination.getEnd());
		long totolCount = suggestionMapper.count(map);
		pagination.setTotalCount(totolCount);
		List<Suggestion> list = suggestionMapper.query(map);
		pagination.setValuesList(list);
		return pagination;
	}

	@Override
	public void modify(Suggestion suggestion) {
	}

	@Override
	public void delete(Suggestion suggestion) {
		suggestionMapper.delete(suggestion);
	}

	@Override
	public Suggestion queryByID(Suggestion suggestion) {
		return suggestionMapper.queryByID(suggestion);
	}
}
