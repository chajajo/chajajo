# 🖥️ Spring-project-chajajo
- 숨겨진 보조금 찾아주는 웹 사이트 제작

#### 만든 목적
- 23.11월 기준, 보조금 종류는 약 1만개가 존재 ➡️ 떨어지는 접근성
- 개인에게 맞는 보조금을 찾아주는 서비스 구현

#### 개발 기간
- 23.10.31 ~ 23.12.08

<br>

## 👥 멤버 구성
- 팀장
  - 문진영 : 보조금 전체보기 · 상세보기 · 검색 및 인기보조금 기능, 서버 배포

- 팀원
  - 김한별 : 로그인 및 회원 정보 · 문의하기 CRUD 기능
  - 박민수 : Open API 주기적 크롤링, 보조금 추천 기능
  - 이미소 : Pagination · 즐겨찾기 기능, 메인 레이아웃, Spring security

<br>

## ⚙️ 개발 환경
- `Java`  `JDK 11`  `tomcat 9.0`
- **IDE** : `STS` `IntelliJ`
- **Framework** : `Spring`
- **Database** : `DBeaver` `MySQL`
- **API** : `보조금24 API`
- **ORM** : `Mybatis`
- **Server** : `Naver Cloud Flatform` `Auto Scaling` `Load Balancer`

### 기술 스택
<img alt="Html" src ="https://img.shields.io/badge/HTML5-E34F26.svg?&style=for-the-badge&logo=HTML5&logoColor=white"/> <img alt="Css" src ="https://img.shields.io/badge/CSS3-1572B6.svg?&style=for-the-badge&logo=CSS3&logoColor=white"/> <img alt="JavaScript" src ="https://img.shields.io/badge/JavaScriipt-F7DF1E.svg?&style=for-the-badge&logo=JavaScript&logoColor=black"/> <img alt="Bootstrap" src ="https://img.shields.io/badge/Bootstrap-7952B3.svg?&style=for-the-badge&logo=Bootstrap&logoColor=white"/> <img alt="Java" src ="https://img.shields.io/badge/Java-3766AB.svg?&style=for-the-badge&logo=Java&logoColor=white"/> <img alt="Sprind" src ="https://img.shields.io/badge/Spring-6DB33F.svg?&style=for-the-badge&logo=Spring&logoColor=white"/> <img alt="MySQL" src ="https://img.shields.io/badge/MySQL-4479A1.svg?&style=for-the-badge&logo=MySQL&logoColor=white"/> 

### 협업 툴
<img alt="Slack" src ="https://img.shields.io/badge/Slack-4A154B.svg?&style=for-the-badge&logo=Slack&logoColor=white"/> <img alt="Sourcetree" src ="https://img.shields.io/badge/Sourcetree-0052CC.svg?&style=for-the-badge&logo=Sourcetree&logoColor=white"/> <img alt="GitHub" src ="https://img.shields.io/badge/GitHub-181717.svg?&style=for-the-badge&logo=GitHub&logoColor=white"/> <img alt="Notion" src ="https://img.shields.io/badge/Notion-EEEEEE.svg?&style=for-the-badge&logo=Notion&logoColor=black"/> 

<br>

## ✨ 주요 기능
**메인 페이지 [Wiki](https://github.com/chajajo/chajajo/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C-(MainPage))** 
- 인기 보조금 조회수 Top3
- 인기 보조금 분야 조회수 Top3

**전체보기/상세보기 [Wiki](https://github.com/chajajo/chajajo/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C-(List))** 
- 카테고리별 데이터 불러오기
- 상세보기 페이지를 통한 즐겨찾기 추가
- 키워드 검색

**나만의 보조금 [Wiki](https://github.com/chajajo/chajajo/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C-(MySubsidy))**
- 내 정보 불러오기를 통한 사용자 정보 불러오기
- 정보를 기반으로 한 맞춤 보조금 찾기

**로그인/회원가입 [Wiki](https://github.com/chajajo/chajajo/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C-(Login))** 
- Spring security
- 비밀번호 암호화 및 세션 Principal 사용
- ID 중복 검사
- 유효성 검사

**마이 페이지 [Wiki](https://github.com/chajajo/chajajo/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C-(MyPage))** 
- 회원정보 : 수정 및 탈퇴
- 나만의 보조금 : 내 정보 저장
- 즐겨찾기 목록 : 나의 즐겨찾기 목록
- 문의하기 : 문의글 CRUD
