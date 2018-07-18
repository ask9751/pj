package org.zerock.utils;

import java.util.ArrayList;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.model.JDBCDataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class RecommendSystem {

	private static final String SERVER_NAME = "10.10.10.33";
	private static final String USER_NAME = "study";
	private static final String PASSWORD = "123456789";
	private static final String DATABASE = "pj01";

	public void startRecommend() throws TasteException {
		
		MysqlDataSource dataSource = new MysqlDataSource();

		dataSource.setServerName(SERVER_NAME);
		dataSource.setUser(USER_NAME);
		dataSource.setPassword(PASSWORD);
		dataSource.setDatabaseName(DATABASE);

		dataSource.setCachePreparedStatements(true);
		dataSource.setAlwaysSendSetIsolation(false);
		dataSource.setElideSetAutoCommits(true);
		dataSource.setCachePrepStmts(true);
		dataSource.setCacheResultSetMetadata(true);
		dataSource.setUseSSL(false);

		JDBCDataModel model = new MySQLJDBCDataModel(dataSource, "t_review", "mno", "code", "rating", null);

		ItemSimilarity similarity = new LogLikelihoodSimilarity(model);

		GenericItemBasedRecommender recommender = new GenericItemBasedRecommender(model, similarity);

		LongPrimitiveIterator iter = model.getItemIDs();

		// Item IDs
		List<Long> arr = new ArrayList<>();

		while (iter.hasNext()) {
			arr.add(iter.next());
		}
		System.out.println(arr);
//		for (int i = 0; i < arr.size(); i++) {
//			System.out.println(arr.get(i));
			List<RecommendedItem> recommendations = recommender.mostSimilarItems(177619, 1);

			if (recommendations.size() > 0) {
				for (RecommendedItem recommendation : recommendations) {
					System.out.println(recommendation);
				}
			} else {
				System.out.println("연관성이 없습니다..!");
			}
//		}
	}
	
	public static void main(String[] args)throws Exception {
		
		RecommendSystem rs = new RecommendSystem();
		
		rs.startRecommend();
	}

}
