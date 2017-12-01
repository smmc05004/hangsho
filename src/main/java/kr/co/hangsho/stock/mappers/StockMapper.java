package kr.co.hangsho.stock.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.co.hangsho.stock.vo.Stock;

@Mapper
public interface StockMapper {

	void accumulateStock(Stock stock);
	List<Stock> getStocksById(int id);
}
