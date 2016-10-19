# UITableView

</br>

### UITableView
  - 리스트의 형태로 정보를 보여주는 View

#### UITableView의 스타일 1: UITableViewStylePlain
  - 기본적인 TableView
  - 여러개의 Section을 가질 수 있다.
  - 한개의 Section에는 여러개의 Row를 포함 한다.
  - 각각의 Section에는 Section의 정보를 나타내는 Header와 Footer가 있다.
  - 빠른 검색을 도와주는 index list가 있다.
  - 예: 연락처팅

#### UITableView의 스타일 2: UITableViewStyleGrouped
  - 각 Section을 Group형태로 나타내는 테이블 뷰
  - 데이터의 디테일한 정보를 표현할때 사용
  - 예: 세팅

#### DataSource
  - TableView에서 데이터를 관리할 역할
  - 예: Section, Row, Cell, Header, Footer 등등

#### Delegate
  - 프로토콜을 사용한 TableView의 대리자 역할
  - 높이, 헤더와 풋터의 뷰를 제공
  - 셀을 선택했을때 수행할 동작
  - 셀의 삭제 될 때의 동작 관리 등등

#### NSIndexPath
  - 셀의 위치를 나타낼 Data Type으로 Section정보와 Row 정보를 가지고 있다.
  - 셀을 생성할 때  Section x Row 의 수만큼 반복한다.

#### UITableViewCell
  - contentView(textLabel, detailTextLabel, imageView) + accesooryView

#### Cell Style
  - default, subtitle, value1, value2가 있다. 