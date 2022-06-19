//
//  SearchViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 18/06/2022.
//

import RxSwift
import RxRelay

final class SearchViewModel: BaseViewModel {
    let categories = BehaviorRelay<[SearchSection]>(value: [
        .CategoriesSection(items: [
            .Categories(header: "Thể loại bạn nghe nhiều nhất", categories: [
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
            ]),
            .Categories(header: "Duyệt tìm tất cả", categories: [
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
                .init(categoryName: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"),
            ]),
        ])
    ])
    
    let dataSource = SearchDataSource.searchDataSource()
}
