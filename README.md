# JSP/Servlet - daangn_project_ver2
 : 당근 프로젝트는 1차 개발(JSP+Servlet으로 개발)로 진행 후 추가적으로 기능을 개선하여 2차 개발(Spring Framework로 개발)이 이루어지는 프로젝트입니다.
현재 프로젝트는 Spring으로 개발한 2차 개발 중고거래 게시판 사이트입니다.

## :computer:프로젝트 소개
'당근 마켓'을 참고하여 만든 중고거래 게시판 사이트입니다.

## 🕰️ 개발 기간
* 23.09.13 ~ 현재 진행 중

## 📌 2차 개발시 개선할 점
#### !! Sping Framework로 구현 예정 !!
#### 로그인 기능 추가
- 카카오, 네이버 등 오픈 API를 활용한 로그인 기능 추가 예정
#### 아이디 및 비밀번호 찾기 기능 추가
- javax-mail API를 사용하여 이메일로 인증번호를 보낸 후 아이디 및 비밀번호 찾기 기능 추가 예정
#### 회원가입시 유효성 검사 보완
- 좀 더 정밀한 유효성 검사, 사용자 편의를 위해 페이지 새로고침 없이 에이젝스로 경고 문구 띄워줄 예정
#### 게시글 기능 추가
- 찜하기 기능과 대댓글 기능 추가 예정

## :mag_right: 현재 진행 상황
#### 2023.09.13 => 프로젝트 재기획 및 DB 재설계, Spring 프로젝트 생성 및 설정, header.jsp 제작, footer.jsp 제작
- header상단에 회원 프로필 및 닉네임 추가
- 프로필 클릭시 마이페이지로 이동 예정
#### 2023.09.14 => Mybatis DB 연동, 회원가입 페이지 jsp 제작, 다음 주소 API 연동, 로그인 및 로그아웃 기능 구현, 회원가입 기능 구현
- 회원가입시 스프링 시큐리티 모듈을 사용한 비밀번호 암호화 진행
- 회원가입시 JS의 키업 함수를 사용하여 실시간 유효성 검사 진행
- 회원가입시 에이젝스를 사용하여 실시간 아이디 및 닉네임 중복검사 진행
- 세션을 사용한 아이디 저장기능 구현
#### 2023.09.15 => 아이디 및 비밀번호 찾기 jsp 제작, 메일 API 연동
- javax mail API를 사용하여 메일 보내기 기능 구현
- 메일 인증을 통한 아이디 찾기 및 비밀번호 재설정 기능 구현
#### 2023.09.16 => 중고거래 리스트 및 상세페이지 jsp 제작, 게시글 작성 기능 구현, 다중파일 처리, 파일 리네이밍
- 게시글 등록시 다중 파일 업로드 처리
- 게시글 등록시 보드와 어태치먼트 둘 다 등록이 되어야됨
  =>Transactional 어노테이션을 사용한 트랜잭션 처리
#### 2023.09.17 => 조회수 올려주기 기능 구현, 게시글 검색 기능 구현
- Mybatis의 동적 SQL을 사용하여 조건에 따라 다른 쿼리문 사용 가능
#### 2023.09.18~19 => 게시글 수정 및 삭제 기능 구현
- 게시글 수정시 원본 텍스트 불러오기
#### 2023.09.20 => 동네가게 리스트 jsp 제작 및 카테고리로 검색 기능 구현
- 특이사항 없음
