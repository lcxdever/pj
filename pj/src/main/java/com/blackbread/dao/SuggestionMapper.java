package com.blackbread.dao;

import java.util.List;
import java.util.Map;

import com.blackbread.model.Suggestion;
import com.blackbread.model.User;

public interface SuggestionMapper {

	public List<Suggestion> query(Map<String, Object> map);

	public long count(Map<String, Object> map);

	public void insert(Suggestion suggestion);

	public void modify(Suggestion suggestion);

	public void delete(Suggestion suggestion);

	public Suggestion queryByID(Suggestion suggestion);
}
