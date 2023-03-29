# BookMark

![북마크](https://user-images.githubusercontent.com/87077859/212674077-9db7b8f9-c557-4f63-ad3c-f4fba88e643b.png)

# 목차
- [🗣️ 프로젝트 소개](#프로젝트-소개)  
- [🛠️ 기술 스택](#기술-스택) 
- [📚 구현 기능](#구현-기능) 
- [🗂️ 디렉토리 구조](#디렉토리-구조)
- [📚 구현 기능](#구현-기능) 
- [🎯 문제 해결 사례](#문제-해결-사례)
- [💡 배운 점](#배운-점) 
- [💧 아쉬운 점 및 보완할 점](#아쉬운-점-및-보완할-점)  

---

# 프로젝트 소개
  
- **제작 기간**  
2023.01 ~ 진행중

- **참여 인원**  
개인 프로젝트  

- **프로젝트 소개**  
키워드 검색을 통해 내가 읽은 도서를 찾아볼 수 있고 리스트에 추가함으로써 내가 읽은 책들을 한 눈에 파악하기 쉬운 **'BookMark 북마크'** 입니다 :)

- **프로젝트 동기**  
2023 버킷리스트 中 '1년간 100권의 책 읽기'  +  내가 사용할 수 있는 iOS 기술은 뭘까?  =>  **북마크 프로젝트**
    
23년 버킷리스트를 달성하기 위해 독서하는 습관을 기르던 중, 종이책도 읽고 전자책도 읽다보니 내가 읽은 **<U>도서 리스트를 한 번에 파악하기 어려웠다.</U>**  
내가 사용할 수 있는 기술들을 다시 짚어보고 또 새로운 기술을 배워보고자, 고민되던 부분으로 개인 프로젝트를 시작했다.
   




---
# 기술 스택

|Language|Framework|그 외|
|:--:|:--:|:--:|
|<img src="https://img.shields.io/badge/Swift-F05138?style=flat-square&logo=Swift&logoColor=white"/>|**SwiftUI**, **CoreData**|REST API|
  
  
---
# 디렉토리 구조
```
BookMark
  |
  └── BookMark
          |── 🗂 Main
          │   └── 📁 Views
          │
          |── 🗂 BookSearch
          │   │── 📁 Models
          │   │── 📁 ViewModels
          │   └── 📁 Views
          │       └── 📁 Rows
          │
          |── 🗂 MyBookList 
          │   └── 📁 Views
          │
          |── 🗂 Util
          |   |── 📁 Haptic
          |   |── 📁 Extension
          |   |── 📁 HTTP
          │   |── 📁 Localizable
          |   |── 🖼 Assets.xcassets
          │   └── 📄 Storage
          |
          └── 🗂 Coredata
              
```
---
# 구현 기능

## 1. 도서 **검색** 기능
<img src="https://user-images.githubusercontent.com/87077859/212681741-e64e2ebc-b8cc-4c76-b0c0-e654bcb4a911.png" width="65%">



## 2. 도서 **기록** 기능
<img src="https://user-images.githubusercontent.com/87077859/212720042-efb6314c-3ae9-4ca1-8b0e-9bc9180239e9.png" width="65%">

---
# 문제 해결 사례

## 1. 네비게이션 중첩

### 문제 상황
> 네비게이션 구조상 3번째 페이지에서 네비게이션바 2개가 중첩되어 나타남.
<img src="https://user-images.githubusercontent.com/87077859/228523535-7eb5ca0e-e76b-41ee-84d6-561f2b5a9190.png" width="50%">


### 해결 방법
> NavigationView는 제일 처음 View에서 한 번만 사용해야 하는데, 이어지는 View에 모두 NavigationView를 사용함.  
따라서 중첩된 네비게이션바가 나타났던 것.  
제일 처음에 있는 NavigationView만 살려두고 그 이후로 있는 부분을 다 제거했더니, 네비게이션 바가 중첩되어 나타나는 현상을 해결할 수 있었다.  
<img width="60%" alt="image" src="https://user-images.githubusercontent.com/87077859/228504587-fe4c820f-d2db-4750-a6ec-b5a716f5b45c.png">

---

