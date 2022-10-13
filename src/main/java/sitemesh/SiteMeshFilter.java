package sitemesh;

import javax.servlet.annotation.WebFilter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
/*
 * sitemesh : 화면의 공통부분을 코딩한 jsp 페이지를 설정
 * 1. sitemesh-3.0.1.jar 파일을 /WEB-INF/lib 폴더에 복사
 * 2. SiteMeshFilter 클래스 파일 코딩
 * 	  - ConfigurableSiteMeshFilter 상속받음 : sitemedh 설정을 위한 클래스
 * 	  - addDecoratorPath : 화면의 공통부분을 코딩한 jsp 파일 설정
 * 			/* : 모든 url 요청. jsp/model1/member/loginForm.jsp
 *    - addExcludedPath("/member/memberimg*") :
 *         url이 /member/memberimg로 시작하는 경우 layout.jsp 페이지
 *         적용 안함.
 * 3. layout.jsp 코딩
 */
@WebFilter("/*")
public class SiteMeshFilter extends ConfigurableSiteMeshFilter{
	@Override
	protected void applyCustomConfiguration
					(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/*", "/layout/layout.jsp")
		.addExcludedPath("/member/memberimg*")
		.addExcludedPath("/member/id*")
		.addExcludedPath("/member/pw*")
		.addExcludedPath("/member/password*");

       builder.addDecoratorPath
       ("/board/*", "/layout/kiclayout.jsp");
	}
}
