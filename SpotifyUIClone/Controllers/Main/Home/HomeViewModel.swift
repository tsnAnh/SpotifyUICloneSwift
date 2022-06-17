//
//  HomeViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 26/05/2022.
//

import RxSwift

struct HomeViewModel {

    let items = BehaviorSubject<[HomeSection]>(
            value: [
                .HeaderSection(items: [
                    .Header,
                    .RecentlyListenList(items: [
                        .init(imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg", title: "Moon Knight"),
                        .init(imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg", title: "Moon Knight"),
                        .init(imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg", title: "Moon Knight"),
                        .init(imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg", title: "Moon Knight"),
                        .init(imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg", title: "Moon Knight"),
                        .init(imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg", title: "Moon Knight"),
                    ])
                ]),
                .HomeSublistSection(items: [
                    .HomeSubListItem(header: "Nghe lại", items: [
                        .init(title: "Tăng Phúc", imageUrl: "https://image.thanhnien.vn/1200x630/Uploaded/2022/drkxrvyxqx/2020_07_26/liveconcert-tp3_hxes.jpg", itemType: .Artist),
                        .init(title: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg", itemType: .Artist),
                        .init(title: "Avicii", imageUrl: "https://avatar-ex-swe.nixcdn.com/singer/avatar/2017/11/18/7/a/1/0/1510943948217_600.jpg", itemType: .Artist),
                        .init(subtitle: "Đen, Sơn Tùng MTP, Vu Trung Quan và nhiều hơn nữa", imageUrl: "https://image.thanhnien.vn/1200x630/Uploaded/2022/uqvpvowk/2018_05_11/den1_iplm.jpg", itemType: .Playlist),
                        .init(title: "Vũ.", imageUrl: "https://www.elleman.vn/wp-content/uploads/2020/10/12/186795/ca-si-thai-vu-elle-man-1.jpg", itemType: .Artist),
                        .init(title: "Sơn Tùng MTP", imageUrl: "https://cdn-www.vinid.net/d7df0a77-bo-phim-son-tung-mtp-tham-gia.jpg", itemType: .Artist),
                        .init(title: "Đi trong mùa hè", subtitle: "Đĩa đơn • Đen", imageUrl: "https://vcdn-giaitri.vnecdn.net/2022/05/11/den-vau-1-jpeg-9485-1652267499.jpg", itemType: .Playlist),
                        .init(title: "2AM", subtitle: "Đĩa đơn • JustaTee, BigDaddy", imageUrl: "https://i.scdn.co/image/ab67616d0000b27358c621ac04d82fd9338ac35c", itemType: .Playlist),
                        .init(title: "Imagine Dragons", imageUrl: "https://i.ytimg.com/vi/fKopy74weus/maxresdefault.jpg", itemType: .Artist),
                        .init(title: "This is Imagine Dragons", subtitle: "This is Imagine Dragons. Các bản nhạc bạn nên nghe về Imagine Dragons", imageUrl: "https://i.scdn.co/image/ab67706f000000035324fd190d03c6f3160c9bc8", itemType: .Playlist),
                    ]),
                    .HomeSubListItem(header: "Nghệ sĩ yêu thích của bạn", items: [
                        .init(title: "Tăng Phúc", imageUrl: "https://image.thanhnien.vn/1200x630/Uploaded/2022/drkxrvyxqx/2020_07_26/liveconcert-tp3_hxes.jpg", itemType: .Artist),
                        .init(title: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg", itemType: .Artist),
                        .init(title: "Avicii", imageUrl: "https://avatar-ex-swe.nixcdn.com/singer/avatar/2017/11/18/7/a/1/0/1510943948217_600.jpg", itemType: .Artist),
                        .init(title: "Vũ.", imageUrl: "https://www.elleman.vn/wp-content/uploads/2020/10/12/186795/ca-si-thai-vu-elle-man-1.jpg", itemType: .Artist),
                        .init(title: "Sơn Tùng MTP", imageUrl: "https://cdn-www.vinid.net/d7df0a77-bo-phim-son-tung-mtp-tham-gia.jpg", itemType: .Artist),
                        .init(title: "Imagine Dragons", imageUrl: "https://i.ytimg.com/vi/fKopy74weus/maxresdefault.jpg", itemType: .Artist),
                    ]),
                    .HomeSubListItem(header: "Nghệ sĩ phổ biến", items: [
                        .init(title: "Tăng Phúc", imageUrl: "https://image.thanhnien.vn/1200x630/Uploaded/2022/drkxrvyxqx/2020_07_26/liveconcert-tp3_hxes.jpg", itemType: .Artist),
                        .init(title: "Moon Knight", imageUrl: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg", itemType: .Artist),
                        .init(title: "Avicii", imageUrl: "https://avatar-ex-swe.nixcdn.com/singer/avatar/2017/11/18/7/a/1/0/1510943948217_600.jpg", itemType: .Artist),
                        .init(title: "Vũ.", imageUrl: "https://www.elleman.vn/wp-content/uploads/2020/10/12/186795/ca-si-thai-vu-elle-man-1.jpg", itemType: .Artist),
                        .init(title: "Sơn Tùng MTP", imageUrl: "https://cdn-www.vinid.net/d7df0a77-bo-phim-son-tung-mtp-tham-gia.jpg", itemType: .Artist),
                        .init(title: "Imagine Dragons", imageUrl: "https://i.ytimg.com/vi/fKopy74weus/maxresdefault.jpg", itemType: .Artist),
                    ]),
                ])
            ]
    )

    let dataSource = HomeDataSource.homeDataSource()
}
