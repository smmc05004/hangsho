package kr.co.hangsho.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.hangsho.item.mappers.ItemMapper;
import kr.co.hangsho.item.vo.Item;
import kr.co.hangsho.stock.mappers.StockMapper;
import kr.co.hangsho.stock.vo.Stock;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	private StockMapper stockMapper;
	
	@Autowired
	private ItemMapper itemMapper;
	
	@Override
	public void accumulateStockQuantity(Stock stock) {
		
		stockMapper.accumulateStock(stock);

		int itemId = stock.getItem().getId();
		Item item = itemMapper.getItemById(itemId);
		int stocks = stock.getQuantity();
		item.setInitialQuantity(item.getInitialQuantity() + stocks);
		itemMapper.updateItem(item);
	}

	@Override
	public List<Stock> getStocksByItemId(int itemId) {
		return stockMapper.getStocksById(itemId);
	}
}
