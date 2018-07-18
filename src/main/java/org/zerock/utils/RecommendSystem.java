package org.zerock.utils;

import java.util.ArrayList;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;
import org.apache.mahout.cf.taste.model.JDBCDataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.IRecomVO;

import com.zaxxer.hikari.HikariDataSource;

import lombok.Data;

@Service
@Data
public class RecommendSystem {

//	private static final String SERVER_NAME = "10.10.10.33";
//	private static final String USER_NAME = "study";
//	private static final String PASSWORD = "123456789";
//	private static final String DATABASE = "pj01";

	
	
	public static List<IRecomVO> startRecommend(HikariDataSource hd) throws TasteException {
		
		List<IRecomVO> recomList = new ArrayList<>();
//		MysqlDataSource dataSource = new MysqlDataSource();
//
//		dataSource.setServerName(SERVER_NAME);
//		dataSource.setUser(USER_NAME);
//		dataSource.setPassword(PASSWORD);
//		dataSource.setDatabaseName(DATABASE);
//
//		dataSource.setCachePreparedStatements(true);
//		dataSource.setAlwaysSendSetIsolation(false);
//		dataSource.setElideSetAutoCommits(true);
//		dataSource.setCachePrepStmts(true);
//		dataSource.setCacheResultSetMetadata(true);
//		dataSource.setUseSSL(false);
		

		JDBCDataModel model = new MySQLJDBCDataModel(hd, "t_review", "mno", "code", "rating", null);

		ItemSimilarity similarity = new TanimotoCoefficientSimilarity(model);

		GenericItemBasedRecommender recommender = new GenericItemBasedRecommender(model, similarity);

		LongPrimitiveIterator iter = model.getItemIDs();

		// Item IDs
		List<Long> arr = new ArrayList<>();

		while (iter.hasNext()) {
			arr.add(iter.next());
		}

		for (int i = 0; i < arr.size(); i++) {

			List<RecommendedItem> recommendations = recommender.mostSimilarItems(arr.get(i), 5);

			if (recommendations.size() > 0) {
				for (RecommendedItem recommendation : recommendations) {
					IRecomVO vo = new IRecomVO();
					vo.setTitle(arr.get(i));
					vo.setRTitle(recommendation.getItemID());
					vo.setValue(recommendation.getValue());
//					System.out.println("들어왔습니다........................................");
//					System.out.println(arr.get(i));
//					System.out.println(recommendation.getItemID());
//					System.out.println(recommendation.getValue());
					recomList.add(vo);
					
				}
			} else {
				System.out.println("연관성이 없습니다..!");
			}
		}
		return recomList;
	}



}
