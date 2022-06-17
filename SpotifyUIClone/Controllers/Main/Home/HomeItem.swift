//
// Created by Anh Trần Sĩ Nguyên on 28/05/2022.
//

enum HomeItem {
    case Header
    case RecentlyListenList(items: [HomeItemUiModel])
    case HomeSubListItem(header: String, items: [HomeItemUiModel])
}
