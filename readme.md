member 폴더는 참고용


1) bankbook\src\main\webapp\resources\css
 - bootstrap.min.css	(bootswatch.com에서 Morph 테마를 편집해서 사용)

2) bankbook\src\main\webapp\resources\sql
 - member.sql		(member 테이블 생성)
 - money.sql		(money 테이블 생성)

3) bankbook\src\main\webapp
 - index.jsp		(메인 페이지)
 - header.jsp		(상단 네비게이션 메뉴 페이지)
 - footer.jsp		(하단 footer 페이지)
 - dbconn.jsp		(데이터베이스 연결 페이지)

 수입지출기록 기능
 - writenote.html		
 - writenoteproc.jsp

 기록조회 기능
 - shownote.jsp
 - search.jsp

 기록확정 기능
 - confirmnote.jsp
 - confirmnoteproc.jsp

 기록변경 기능
 - modnote.jsp
 - modnoteform.jsp
 - modnoteproc.jsp

 기록삭제 기능
 - delnote.jsp
 - delnoteproc.jsp

 회원관리(회원가입, 로그인, 로그아웃, 회원정보수정, 회원탈퇴) 기능  - 기존에 있는 코드를 수정하여 사용
 - addMember.jsp
 - deleteMember.jsp
 - loginMember.jsp
 - logoutMember.jsp
 - processAddMember.jsp
 - processLoginMember.jsp
 - processUpdateMember.jsp
 - resultMember.jsp
 - updateMember.jsp