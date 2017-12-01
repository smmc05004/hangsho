package kr.co.hangsho.web.editor;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateEditor extends PropertyEditorSupport {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		try {
			setValue(sdf.parse(text));
		} catch (ParseException e) {
			setValue(null);
		}
	}
	
	@Override
	public String getAsText() {
		String text = "";
		if(getValue() != null) {
			text = sdf.format(getValue());
		}
		return text;
	}

}
