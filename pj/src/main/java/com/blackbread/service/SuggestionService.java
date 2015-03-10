package com.blackbread.service;

import com.blackbread.model.Suggestion;
import com.blackbread.utils.Pagination;

public interface SuggestionService {
	public void insert(Suggestion suggestion);

	public Pagination query(Pagination pagination,Suggestion suggestion);

	public void modify(Suggestion suggestion);

	public void delete(Suggestion suggestion);

}
