package org.zerock.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class SearchResult {

	String title;
	String link;
	String pubDate;
	String director;
	String userRating;
	String uniqueCode;
}
