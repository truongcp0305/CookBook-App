class Query {
  String createTable0 = """
  create table recipes(
  id integer primary key,
  name nvarchar,
  ingredians nvarchar,
  directions nvarchar,
  iconsInfor nvarchar,
  category nvarchar
  )
  """;

  String insertData1 ="""
insert into recipes values
(0,'Miến Xào',
'Miến 100g;Tôm tươi 10 con;Dầu ăn 2 muỗng;Trứng gà 2 quả;Cà rốt 1 củ;Giá đỗ 20g;Hành lá 2 cây',
'Bước 1: Ngâm miến gạo với nước lạnh khoảng 20-30 phút cho đến khi mềm, vớt ráo. Đun sôi khoảng 1 muỗng canh dầu trong chảo cho trứng vào tráng mỏng rồi lấy ra khỏi chảo. 
Để nguội bớt thì cắt nhỏ. Đun thêm 1 muỗng canh dầu ăn, cho tôm vào đảo săn rồi trút ra đĩa.
Bước 2: Cà rốt, hành tím, hành lá, giá đỗ làm sạch. Cà rốt thái sợi. Hành lá thái khúc. Hành tím băm nhỏ. thêm hành tím, cà rốt vào đảo đều cho mềm. Sau đó cho tôm, trứng chiên lúc nãy. Thêm miến, giá, hành lá vào trộn đều tay.
Bước 3: Nước sốt: Cho 1 muỗng canh nước tương, 1/2 muỗng cà phê đường, 1 muỗng cà phê dầu mè vào chén khuấy đều, cho chén nước sốt vào chảo, đảo đều, làm tơi miến ra, nêm nếm vừa ăn. Tắt bếp, cho muối và hạt tiêu vào chảo và trộn đều.
Bước 4: Miến xào có màu sắc rất bắt mắt, miến dai giòn, phần thịt tôm săn chắc và ngọt.',
'1700;20 phút;G7nDBoC2zp4','việt'),
(1,'Gỏi Gà Bắp Cải',
'Đùi gà 2 cái;Bắp cải 250g;Cà rốt 1 củ;Hành tây 1 củ;Chanh 1 trái;Nước mắm 2 muỗng;Đường trắng 3 muỗng;Ớt 1 trái',
'Bước 1: Luộc thịt gà với gừng đập dập. Đợi nước sôi thì hạ nhỏ lửa, luộc đến khi gà vừa chín tái thì bắc xuống. Để thịt gà ra đĩa cho nguội rồi xé miếng vừa ăn. Ướp thịt gà với 1/4 muỗng cà phê muối, 1/4 muỗng cà phê tiêu.
Bước 2: Để gỏi gà bắp cải được ngon thì cần sơ chế để làm dịu sợi bắp cải và giảm độ hăng của hành tây nhé. Bổ đôi hành tây rồi cắt múi cau mỏng. Trộn hành tây với 2 muỗng canh đường và 1 muỗng canh giấm. Để khoảng 15-20 phút cho hành tây bớt hăng. Thái sợi bắp cải, rửa sạch, giũ ráo nước, bóp bắp cải với 1 muỗng cà phê muối. Rửa sạch rau răm, thái nhỏ. Bỏ hột ớt, thái khoanh mỏng.
Bước 3: Cách pha nước trộn gỏi gà bắp cải: 2 muỗng canh nước mắm, 1 muỗng canh đường, 1-2 lát chanh vắt lấy nước cốt, ớt cắt nhỏ, khuấy đều cho tan gia vị.
Bước 4: Cách trộn gỏi gà bắp cải: Cho thịt gà, bắp cải, cà rốt, hành tây, vào tô trộn. Trộn đều với nước trộn gỏi gà vừa pha. cho rau thơm các loại đã thái nhỏ vào và trộn đều lên.
Bước 5: Bày gỏi gà bắp cải ra đĩa, trang trí thêm trước khi thưởng thức.',
'2080;35 phút;CM9fmbuZIMY','gà'),
(2,'Rong Biển Cuộn Rau Củ',
'Ức gà 200g;Cà rốt 1/2 củ;Đậu que 2 cây;Xà lách 2 cây;Rong biển 8 miếng;Dưa leo 1 trái;Hành tím 1 củ;Sốt Mayonnaise 1 muỗng',
'Bước 1: Xà lách lặt lấy từng là lớn không cắt nhỏ, rửa sạch và để ráo (Ngâm nước muối khoảng 15 phút trước khi rửa cho đảm bảo sạch). Đậu que tước gân hai đầu và hai bên lưng. Cà rốt thái thành sợi vừa dài không quá nhỏ. Dưa leo cũng cắt thành những que dài.
Bước 2: Thịt gà rửa sạch để ráo và cắt thành khúc dài. Sau đó ướp với tiêu, hạt nêm, xì dầu và hành tỏi băm. Trộn đều và ướp trong vòng 15 phút cho thịt thấm và mềm.
Bước 3: Bắc nồi nồi nước lên bếp, khi nước bắt đầu sôi lăn tăn thì cho 1/2 muỗng cà phê muối vào khoáy đều, tiếp theo cho cà rốt và đậu que vào luộc vừa chín. Không nên luộc chín quá vì như vậy sẽ làm rau bị mềm, không còn giòn và ngọt nữa. Vớt ra và để ráo nước.
Bước 4: Bắc chảo nhỏ lên bếp, cho vào một xíu dầu và xào phần thịt gà cho chín, để lửa nhỏ cho thịt gà chín đều và thấm đều gia vị. Có thể thay xào bằng việc áp chảo nhưng phải để nguyên miếng gà áp chảo nhé.
Bước 5:Khi tất cả nguyên liệu đã sẵn sàng thì bắt đầu cuốn. Trải miếng rong biển ra, mặt trơn để ở ngoài và mặt nhám ở phía bên trong. Xếp lần lượt xà lách, dưa leo, cà rốt, đậu que, thịt gà và thêm một ít sốt Mayonnaise cho đậm vị (nếu bạn nào thích ăn béo).
Bước 6:Cắt cuốn ra và thưởng thức, có thể chấm cũng tương ớt và sốt Mayonnaise sẽ rất ngon và béo. Còn không có thể không cần nước sốt vì trong thịt gà đã có gia vị ướp rất vừa miệng rồi nhé.',
'700;1 giờ;Qc8biq0EmFQ','helthy')

  """;

  String insertData2 ="""
  insert into recipes values
(3,'Bánh Cuốn Nóng Bằng Chảo',
'Bột gạo 400g;Thịt xay 200g;Nấm mèo 50g;Hạt nêm 1 thìa;Hành tím băm 3 củ;Nước 1 lít;Dầu ăn 5 thìa',
'Bước 1: Hành tím băm nhỏ. Nấm mèo ngâm nở, sau đó băm thật nhỏ ra nhé. Bột bánh cuốn ta hòa chung với 1 lít nước, đánh đều cho bột tan hêt vào nước, cho vào 1 muỗng cà phê dầu ăn, trộn đều lại.
Bước 2: Cho 3 muỗng cà phê dầu ăn vào chảo, phi thơm hành tím băm, cho thịt vào xào cho săn lại rồi cho nấm mèo vào.
Bước 3: Chuẩn bị 1 cái chảo không dính để đổ bánh. Ta cho 1 ít dầu còn lại vào chảo xong dùng khăn giấy lau khô. cho 1 vá bột vào nhanh tay tráng cho đều hết mặt chảo (thao tác nhanh kẻo bánh dính lại 1 cục không được đều), đậy nắp lại, chờ khoảng 10-15 giây là bánh chính, úp ngược cái chảo vào cái mâm là bánh sẽ ra.
Bước 4: Sau khi có bánh rồi mình sẽ cho nhân vào và cuộn lại như bánh cuốn ngoài tiệm. Vậy là xong rồi nhé, quá dễ phải không các bạn. Mình chuẩn bị nước mắm, rau, chả ăn kèm với bánh cuốn nhé. '
,'660;1 giờ;TbRt6yUZV30','việt'),
(4,'Xôi Ngũ Sắc',
'Gạo nếp 500g;Nước cốt hoa đậu biếc 300ml;Nước lá dứa 300ml;Nước cốt nghệ tươi 300ml;Nước cốt lá nếp cẩm 300ml;Nước dừa 500ml;Mít 300g',
'Bước 1: Chuẩn bị làm xôi ngũ sắc: Vo sạch gạo nếp dẻo với nhiều nước cho trong. Sau đó chia gạo nếp làm 5 phần đều nhau (mỗi phần 100g).
Bước 2: Ngâm riêng mỗi phần gạo nếp với các loại nước tạo màu tự nhiên đã chuẩn bị. Ngâm gạo nếp trong khoảng 6-7 giờ cho gạo ngấm màu đẹp. Sau đó, vớt gạo nếp ra, để ráo nước rồi trộn đều 5 loại gạo nếp lại với nhau.
Bước 3:  Đổ xôi vào xửng hấp inox, dàn đều. Thay vì trộn gạo nếp với nước cốt dừa thì mình hấp xôi với nước dừa tươi nhé. Xôi hấp chín sẽ dẻo thơm thoảng mùi dừa mà không bị nhão.
Bước 4: Xôi ngũ sắc ăn với muối mè đường hoặc muối đậu phộng rất là tuyệt vời đấy.',
'1100;2 giờ;O_bEJNmMMjM','việt'),
(5,'Hủ Tiếu Nấm',
'Cà rốt 1 củ;cải trắng 1 củ;Hủ tiếu 500g;Nấm rơm 100g;Nấm đông cô 50g;Nấm bào ngư 100g;Nấm Linh Chi 50g;Đậu hũ chiên 50g;Xà lách 50g',
'Bước 1: Đầu tiên chúng ta sẽ rửa sạch các củ quả. Cho toàn bộ nguyên liệu vào nồi cùng 1 lít nước rồi hầm trong 15 phút, sau đó vớt bỏ xác để được nước dùng rau củ.
Bước 2:Châm thêm nước cho đủ 1 lít nước dùng rồi nấu sôi trở lại. Khi nước sôi, cho tất cả nấm đã sơ chế vào nấu nhỏ lửa trong 5 phút để nấm chín. Khi nấm chín thì nêm nếm gia vị cho vừa ăn rồi tắt bếp.
Bước 3: Nấu 1 nồi nước sôi, cho hủ tiếu vào trụng đến khi hủ tiếu mềm thì vớt ra, sau đó cho ra tô.
Bước 4: Thêm các loại nấm, xà lách, ớt sừng, và đậu hũ chiên, hành phi hành ngò cắt nhỏ rồi chang thêm nước lèo đậm đà, thơm ngon tự nhiên nữa là hoàn thành món ăn.',
'500;35 phút;qODDU8jHkik','việt')
  """;

  String insertData3 ="""
insert into recipes values
(6,'Đậu Hũ Xốt Thái',
'Đậu hũ non 1 Miếng;Xốt gia vị 15g;Đường 10g;Chanh 1/4 Trái;Tương ớt 10g;Lá chanh 4 Lá;Hạt nêm knorr nấm hương chay 5g',
'Bước 1: Cắt đậu hũ thành khối vuông vừa ăn rồi chiên giòn. Vớt đậu vàng giòn để ráo dầu.
Bước 2: Cho vào chảo gia vị gồm: đường, hạt nêm chay Knorr, xốt thái, tương ớt, nước cốt chanh, lá chanh thái sợi và nấu sôi. Thêm tiếp đậu hũ vào xốt Thái, rim nhỏ lừa cho thấm vị thì tắt bếp
Bước 3: Cho đậu hũ xốt Thái ra dĩa và ăn cùng cơm nóng các bạn nhé. Đã có giải pháp cho những ngày chay mà thèm món Thái rồi đó. Chúc các bạn ngon miệng.',
'500;20 phút;iM_i9Ofyjaw','chay'),
(7,'Ức Gà Sốt Cam Cay Nướng',
'Ức gà 100g;Bột ớt paprika 2 Muỗng cà phê;Dầu hào 2 Muỗng cà phê;Tiêu xay 1 Muỗng cà phê;Mật ong 2 Muỗng cà phê;Dầu oliu 1 Muỗng cà phê',
'Bước 1: 100gr ức gà làm sạch để ráo, cho vào tô trộn đều cùng 1 muỗng cà phê muối, 2 muỗng cà phê mật ong, 1 muỗng cà phê tiêu xay và 2 muỗng cà phê bột ớt Paprika. Ướp trong 5 phút để gia vị thấm đều.
Bước 2: Để làm sốt cam, bạn cần 1/2 quả cam vắt lấy nước cốt, thêm 1 muỗng cà phê dầu hào và 1 muỗng cà phê dầu oliu, khuấy đều.
Bước 3: Sau khi gia vị thấm đều ức gà bạn đặt lên khay nướng, rồi phết sốt cam lên trên mặt. Nướng ở nhiệt độ vừa trong 10 phút, bào nhỏ 50gr phô mai Mozzarella và nướng thêm 5 phút',
'360;35 phút;8FhgH7W61VI','gà'),
(8,'Salad Trái Cây Trộn Chua Ngọt',
'Nước cốt cam 50ml;Nước cốt chanh 20ml;Vani 1/3 trái;Dứa 1/3 trái;Dâu tây 5 trái;Kiwi 2 trái;Chuối 2 trái;Cam 2 trái;Nho 100g',
'Bước 1: Đầu tiên, cho 50ml nước cốt cam, 20ml nước cốt chanh, 1 muỗng cà phê đường nâu, 5gr vỏ chanh, 5gr vỏ cam, 1 muỗng cà phê vani vào nồi, bắc lên bếp, khuấy đều khoảng 1 phút.
Bước 2: Thơm, dâu tây, kiwi rửa sạch, cắt hạt lựu.
Bước 3: Chuối bóc vỏ, cắt khoanh tròn khoảng 1cm. Cam bóc vỏ, tách lấy múi còn nho rửa sạch, để nguyên trái.
Bước 4: Cho tất cả trái cây ra tô, rưới đều hỗn hợp nước cốt cam vào, trộn đều. Trang trí thêm lá bạc hà nếu thích và thưởng thức ngay nhé!',
'300;15 phut;a0VpidU49aQ','helthy')
  """;


  String createTableShoppingList = """
  create table shoppinglist(
  id integer primary key,
  name nvarchar,
  ingredians nvarchar,
  directions nvarchar,
  iconsInfor nvarchar,
  category nvarchar
  )
  """;

  String createTableFavoriteList = """
  create table favoritelist(
  id integer primary key,
  name nvarchar,
  ingredians nvarchar,
  directions nvarchar,
  iconsInfor nvarchar,
  category nvarchar
  )
  """;

}