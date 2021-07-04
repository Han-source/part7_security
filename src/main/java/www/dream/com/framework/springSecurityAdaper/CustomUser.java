package www.dream.com.framework.springSecurityAdaper;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import www.dream.com.party.model.Party;


/**
 * 본 시스템 아키텍처는 스프링의 시큐리티 모듈을 활용하여 사용자 인증 및 권한을 처리 중이다.
 * 하지만 아키텍처 선택을 바꿀 떄 변경을 최소화 하기 위하여 Party Class와 연계 클래스를 정의함.
 * @author "Wook"
 *
 */
public class CustomUser extends User {
	private Party party;
	// userName은 id를  뜻한다.
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(Party party) {
		this(party.getUserId(), party.getUserPwd(), party.getAuthorityList());
		this.party = party;
	}
	
	public Party getCurUser() {
		return party;
	}
}
