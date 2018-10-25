package i18n;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;

public class MessageSourceEx implements MessageSourceAware{

	MessageSource msg;
	@Override
	public void setMessageSource(MessageSource arg0) {
		this.msg = arg0;
	}

	public void getMenu(String menu, Locale locale) {
		String[] args = new String[] {menu};
		String rs = msg.getMessage(menu, args, locale);
		System.out.println(rs);
	}
	
}
