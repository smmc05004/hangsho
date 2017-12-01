package kr.co.hangsho.stock.service;

import java.util.List;

import kr.co.hangsho.stock.vo.Stock;

public interface StockService {

	void accumulateStockQuantity(Stock stock);
	List<Stock> getStocksByItemId(int stockId);
}
