# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

setting = Setting.create(
    headline1: "SK텔레콤 PS&M 직영매장",
    headline2: "EVENT",
    description: "PS&Marketing은 SK텔레콤의 유통자회사로 <br> 유일한 SK텔레콤 직영스토어 브랜드입니다.",
)

event1 = Event.create(
    description: "SK텔레콤 직영매장 전용",
    title: "네이버 예약 리뷰 이벤트",
    color: "#B889DB",

    start_date: DateTime.strptime("01/22/2021 09:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("02/28/2021 23:59", "%m/%d/%Y %H:%M"),

    link: "/events/1",
    visible: true,
    inputs: "이름, 휴대폰번호, 네이버 ID"
)

event2 = Event.create(
    description: "SK텔레콤 직영매장 전용",
    title: "Galaxy S21 구매고객 초특급 경품 이벤트",
    color: "#002060",

    start_date: DateTime.strptime("01/22/2021 09:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("02/28/2021 23:59", "%m/%d/%Y %H:%M"),

    link: "/events/2",
    visible: true,
    inputs: "이름, 휴대폰번호"
)


event3 = Event.create(
    description: "SK텔레콤 브랜드 이벤트",
    title: "Galaxy S21 개통고객 구독♡구독 경품 이벤트",
    color: "#002060",

    start_date: DateTime.strptime("02/22/2020 09:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("02/28/2020 23:59", "%m/%d/%Y %H:%M"),

    link: "/events/3",
    visible: true,
    inputs: "이름, 휴대폰번호"
)

event4 = Event.create(
    description: "종료된 이벤트 예시",
    title: "종료된 이벤트 예시",
    color: "red",

    start_date: DateTime.strptime("05/22/2020 09:00", "%m/%d/%Y %H:%M"),
    end_date: DateTime.strptime("06/28/2020 23:59", "%m/%d/%Y %H:%M"),

    link: "/events/4",
    visible: false,
    inputs: "이름, 휴대폰번호"
)