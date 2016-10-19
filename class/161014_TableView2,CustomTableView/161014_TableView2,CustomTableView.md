# TableView2, CustomTableView

</br>

### UITableView 2
  
#### reuse
  - 공통적인 레이아웃을 사용하여 여러번 화면을 보여줄 필요가 있는 경우 뷰를 재사용
  - alloc되있는 셀을 identifier를 확인해 dequeue방식으로 재사용 하므로 같은 identifier를 사용하지만 그 셀의 property값이 section이나 row값에 따라 다를경우 의도치 않은 결과를 가져올수 있으므로 유의 해야 한다.
  각 필요에 따른 identifier를 사용하는것도 그 방법중에 하나이다.