# KBOMarket 클론코딩

## 소개
KBOMarket UI/UX를 본떠서 클론코딩을 진행했습니다. 이 프로젝트는 관리자가 상품을 등록하면 사용자가 상품을 구경하고 구매할 수 있도록 만들었습니다.

## 주요 기능
- **메인 페이지**
  - 로그인 전 사용자에게 제공되는 메인 페이지
- **관리자 페이지**
  - 관리자 로그인 후 상품을 등록하고 상품 리스트에서 수정, 삭제 기능
  - 가입된 회원목록 조회 기능
- **사용자 페이지**
  - 구단 로고 선택 후 구단별 상품을 리스트를 확인하고 구매 기능
- **마이 페이지**
  - 사용자가 선택한 상품의 장바구니 및 구매 목록을 확인할 수 있으며 회원정보 수정, 삭제 기능
- **회원가입 & 로그인 페이지**
  - 사용자가 회원가입과 로그인을 진행할 수 있는 기능

## 역할 분담
- **김세현**
  - MySql DB 테이블 구성
  - GitHub 초기 프로젝트 세팅
  - 상품 구매하기, 구매목록 기능 구현
  - 상품 장바구니, 장바구니 목록 구현


- **신재영**
  - 회원가입 기능(이메일 인증) 구현 
  - 회원정보수정 기능 구현
  - 회원탈퇴 기능 구현
  - 마이 페이지 구현

- **정진범**
  - 메인페이지 구현
  - 상품 등록, 수정, 삭제 기능 구현
  - 회원정보 리스트 구현
  - CI/CD (ncp, docker, jenkins 이용)

## ERD
![KBOMarket](https://github.com/user-attachments/assets/7ac6bfaf-c3c6-44ca-af9a-3cb6096e152d)
- 한 사용자는 여러 개의 상품을 구매할 수 있다. ( 1: N )
- 한 사용자는 여러 개의 장바구니를 담을 수 있다. ( 1: N )
- 관리자는 여러 개의 상품을 추가할 수 있다. ( 1: N )
- 상품은 여러개의 장바구니에 추가될 수 있다. ( 1: N )
- 상품은 여러개의 구단명을 가질 수 있다. ( 1: N )
- 상품은 여러개를 구매할 수 있다. ( 1: N )

## 기술 스택
- **프론트엔드**: HTML, CSS, JavaScript (jQuery)
- **백엔드**: Spring, Java, MyBatis 
- **DB**: MySql
- **CI/CD** : NCP(MySQL, Object Storage), Docker, Jenkins
- **기타**: Git, JSP
- 

## 기능 구현
![1](https://github.com/user-attachments/assets/e12e2f6c-579c-4d84-a357-ed1ee91e999f)
![2](https://github.com/user-attachments/assets/431e0144-074d-44ff-8e00-5bc80145b5eb)
![3](https://github.com/user-attachments/assets/aa0a5134-63a3-4a08-94bb-791474876cf3)
![4](https://github.com/user-attachments/assets/d77aa150-cc94-44bd-b679-1a96f5c0a8e5)
![5](https://github.com/user-attachments/assets/71043875-3c21-41c8-865f-af9afacdad0c)
![6](https://github.com/user-attachments/assets/fe341562-d41e-46ef-9332-dd19e3d3411a)
![7](https://github.com/user-attachments/assets/d1e0dc39-119c-44fc-beaa-79e2d4d886c5)
![8](https://github.com/user-attachments/assets/a91718a0-8ba3-4ce4-8ab9-a909bdde5c89)
![9](https://github.com/user-attachments/assets/af11d672-c730-482c-9bce-cb889b88f9a5)
![10](https://github.com/user-attachments/assets/bfa9449d-ccba-4930-a7a3-5654971a7ac4)
![11](https://github.com/user-attachments/assets/fc2b4388-dd1d-4989-8546-3d651186ef87)
![12](https://github.com/user-attachments/assets/d5eef872-de90-41db-ade4-0d9f495e85d9)
![13](https://github.com/user-attachments/assets/9b5a3319-a418-4dcc-9dea-61f7119b8ea8)
![14](https://github.com/user-attachments/assets/0be4f9bc-6e21-45aa-9be2-63134b0613b7)



