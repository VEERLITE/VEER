local function GET_TEXT(msg)
if chat_type == 'super' then 
if not MOHMADdevVEER:get(DEVSTOR..'lock:reoly:bot'..msg.chat_id_) then
if text == "شلونك" or text == "شلونكم"then 
local mohmad = {'😹اني بلنسبه الي دايح 👻 شوف بقية الاعضاء😴','😕الحمد •للّـ🙏ّـرب وانته/ي 🤔','😡كل شويه واحد يكلي شلونك😪 وشلونكم عمي كلنه بخير كمل🤐','زين واسيا واثير 😹 ادري قديمه انجب 😷'}
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad[math.random(#mohmad)], 1, 'html')  
end 
if text == "تحبني" then 
local mohmad1 = {'😱شلون ما احبك/ج💔 كفشة روحي 😠','احّ ـّـٌٍ❣ـٍّبّكَ و تحبني واثنينه مغلسين 😔',' 😕ما احبك 😹 طن بلكصة 😅','✋🏽عذرا مكبل💔 لتزحف/ين'} 
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad1[math.random(#mohmad1)], 1, 'html')  
end 
if text == "شيعي" or text == "سني" then 
local mohmad2 = {'😡لا تصير طائفي زمال🌚📿','🙄بدت رحمه •اللّـہ كلنه عراققين 🇮🇶 انجب✋🏽'} 
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad2[math.random(#mohmad2)], 1, 'html')  
end 
if text == "شكو ماكو" then 
local mohmad3 = {'غيرك بل كلب❤️ ماكو','😓صافية دافية','☹️كلشي ماكو ع حطت ايد👌🏾 ',' لعراق سوة صاروخ نووي🎃'} 
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad3[math.random(#mohmad3)], 1, 'html')  
end 
if text == "شنو اسمك" or text == "شسمك" then 
local mohmad4 = {'🆔اسمي مكتووب يا خرة💩','🐸لتزحف عزيزي✋🏽','🐸عوف اسمي وانطيني رقمك بلخاص ههه🙊'} 
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad4[math.random(#mohmad4)], 1, 'html')  
end 
if text == "روعة" or text == "روعه" then
local mohmad5 = {'😍مروك الاروع👌😌',' ✋🏽انَـَY̷̳̜̩̐̌̋O̷̳̜̩̐̌̋U̷̳̜̩̐̌̋ـَتَه الاروع حبي😚'}
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad5[math.random(#mohmad5)], 1, 'html') 
end
if text == "غني" or text == "غنيلي" then 
local mohmad6 = {'☺️حلو حلو شكد حلو هواي حلو رقمي😻 ******07727 تعال خاص اكملك 😹🙌','😿هذا حبيبي احبك كولش🤕 كولش احبة🤐 واتحدة واحد بلبشر مثلي يحبة😒','😜حغنيلكم ام الاحمر 💄 *وا يلا مع سلامة بيباي يا غرمة محافضها 😓🤒' }
end
if text == "اقرالي دعاء" then
local mohmad8 = {'اللهم عذب المدرسين 😢 منهم الاحياء والاموات 😭🔥 اللهم عذب ام الانكليزي 😭💔 وكهربها بلتيار الرئيسي 😇 اللهم عذب ام الرياضيات وحولها الى غساله بطانيات 🙊 اللهم عذب ام الاسلاميه واجعلها بائعة الشاميه 😭🍃 اللهم عذب ام العربي وحولها الى بائعه البلبي 😿 اللهم عذب ام الجغرافيه واجعلها كلدجاجه الحافية🙌 اللهم عذب ام التاريخ وزحلقها بقشره من البطيخ وارسلها الى المريخ🌚 اللهم عذب ام الاحياء واجعلها كل مومياء🕸🎃 اللهم عذب المعاون اقتله بلمدرسه بهاون 😂😂😂','🙏اللهم يعقلك ويكبرك شويونه ع الاقل👌🏾🐸'}
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad8[math.random(#mohmad8)], 1, 'html') 
end
if text == "هه" or text == "ههه" or text == "هههه" or text == "ههههه" or text == "😂" or text == "😹" or text == "ههههاي" or text == "😅" then
local mohmad9 = {'🙂{دِْۈۈۈۈ/يّارٌبْ_مـْو_يـّوّمٌ/ۈۈۈۈمْ}😇','دوم حبي ❤️🍃','ربي يدمها هلضحكة 🙊💫'}
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad9[math.random(#mohmad9)], 1, 'html') 
end
if text == "فدوة" or text == "فديتك" or text == "فديتج" then
local mohmad10 = {'😘فدِآكـ آلكؤن🙈ؤمَآي آَلَعيـونْ😚ؤقوآطيْ المَعجَون❤️🙊😋','😢واني محد يكلي فديتك 😭😭','😒لتضل تفدي هذا وذاك😕 انجب واسكت 👌😌'}
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad10[math.random(#mohmad10)], 1, 'html') 
end
if text == 'باي' or text == 'باي باي' or text == 'مع السلامه' or text == 'مع سلامه'  or text == 'مع السلامة' or text == 'مع سلامة' or text == 'بااي'  or text == 'باااي' or text == 'بايي'  or text == 'جاو' then 
local mohmad = {'تعال خل نكمل سالفتنه وين رايح 😧', 
'جاي اشاقه تعال لضوج ', 
'دفعه مردي وعصى كردي 😌', 
'منو زعلك حته تروح 😥', 
'شبيك ضايج تعال 😨', 
'الله وياك دروح مختنكه ونته موجود ☹️', 
'هاك الف شتري بيها لفتين فلافل 🌝💋', 
'سلملي ع ئمك 🤷‍♀️', 
'بعد وكت وين ',"لله وياكـ💙✨ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘",'تعال وين رايح عندي شغله وياك ', 
'تعال لضل هيج ترا مكلنه شي بسرعه دكول باي 😐', 
'الله وياك والتكسي ع حساب المدير 😂 ماعليه اني '
 } 
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md')
end 
if text == 'احم' or text == 'ئحم' or text == 'حم' or text == 'أحم' or text == 'أحم' or text == 'احم احم' then 
local mohmad = {'جيبوله مي 😅', 
'شبيك تتحمحم نطو مي خطيه غص بلكمته ', 
'خير 🙊', 
'تفضل ☹️', 
'والله اشكال 🏼‍♀️', 
'احمات 😏', 
'طبوله ع ضهره 🙃', 
'ها خير شبيك ' } 
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md') 
end
if text == 'تعالي خاص' or text == 'تعال خاص' or text == 'تعي خاص' or text == 'نع خاص' or text == 'خاص'  or text == 'خاصج'  or text == 'خاصك'  or text == 'شوف الخاص'  or text == 'شوف خاصك'  or text == 'شوفي خاصج' or text == 'تعاي خاص😂'  then 
local mohmad = {'عيب ', 
'خالتك الشكره  احسن ترضها اخويا يزحف ع اختك 😐🤷‍♀️', 
'عب نجب و ولي منا 🙊‍♀️', 
'محضوره دز رساله وتع خاص 🤷🏼‍♀️', 
'شبيك مشايف بنات ؟ 🤤', 
'ولي 🙄', 
'ما 😌', 
'ولي لك 😒', 
'وعود صاك ئنته ؟', 
'ئذا الموضوع حساس اجيك 🌝', 
'تعال حتطفي الكهرباء 😶' } 
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md') 
end
if text == "شلونك" or text== "شلونج" or text== "شونكم" or text== "شونك" or text== "شونجج"  then 
local mohmad = {'  اۢنٰـۛتهہ شعليك بيهة', 
'  مــﮫـمـ❥ـوﯢمـ۾☹ ', 
'تٌمآم حٍـيَآتٌيَ ۆآنْتٌ 😊 ', 
'ۆآلُلُہ مۆ ڒٍيَنْ😢 ', 
'   بْخـيَر ۆصٍحٍـہةّ ۆعآفَيَہ😌', 
'  آلُلُةّ ڒٍيَنْ لُۆ مگبْلُ😌 ',"آلـْ ح ـمـِْدِّ اللّـٰھ وانٓــتــٰـہ/ي ࿐❥ 🌎🌸" ,'  مۆ گنْآلُہةّ لُحٍـمدِ لُلُہةّ ', 
'  آةّۆۆۆۆ شُگدِ تٌلُحٍ آنْتٌ ', 
'  بْلُ عبْآس آبْۆ آلُفَآضٍلُ آنْيَ لُحٍـمدِلُلُہةّ  ', 
'تمام وانت/ي شلونك/ج🎈', 
'تمام وانت/ي شلونك/ج🎈'} 
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md') 
end
if text == "بوت" then  
local mohmad = {
' نْجٍبْ لُگ نعنْدِيَ آسم ۆصٍيَحٍـنْيَ بْيَة 😟😤ّ', 
'  غَيَر يَگعدِ رآحٍـةّ آلُڒٍآحٍـفَ 😝😂 ', 
'  لۧاٲ   مو بوت اقرا اسمي✨ ', 
'   شبي معاجبك ', 
'ها احجي شتريد 😏 صيحلي باسمي بعد لدكول بوت😢   ', 
'   نجب لك صارت قديمه صيحلي باسمي 😒👬💛'
}
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md') 
end
if text ==  ""..(NAMEBOT or 'ستورم').."" then  
local mohmad = {
'  آنْجٍبْ لُگ آلُبْآرحٍـةّ تٌغَلُطً علُيَةّ 😭😒 ',
'  ۆعمةّ آنْشُآلُلُہةّ شُبْيَگ يَلُآ گۆلُ 😒 ', 
'   بْعدِ رۆحٍـيَ آمرنْيَ آنْتٌ 😍😘', 
'  ۆلُگ شُبْيَگ خـبْصٍتٌنْيَ بْس صٍيَحٍ مۆ دِآ آنْسقَ ۆيَةّ بْنْتٌ 😒😤 ', 
'  آيَ آيَ آجٍتٌيَ آلُمصٍآلُحٍ يَلُآ آحٍـجٍيَ شُعنْدِگ😓 ', 
'   غَيَر يَبْطًلُ ۆبْعدِ مآ يَلُحٍ ۆيَخـلُيَنْيَ آرتٌآحٍ 😰', 
' تاج راسي كول حبيبي 😻🙊😚  ', 
'  ها حياتي اامرني كلبي 😇 ', 
' حياتي انت كول بعد روحي 🙊  ', 
' فضها كول شرايد تعبتوني😢😞  ', 
'   تفصل يروحتي 😻'
}
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md') 
end
if text == "هلو" or text== "هلا" or text== "هاي"  then 
local mohmad = {' هـُ‘ـُلُٱ بُـ‘ـُيُـ‘ـُكُ شُـ‘ـُوٌنُـ‘ـكُ 😇  ', 
'   هّـلَأّوٌتٌ عٌلَ نِبًيِّ صّـمًوٌنِ حًأّر وٌلَبًلَبًيِّ 😻', 
'   يِّهّـلَأّ وٌأّلَلَهّ نِوٌرتٌـنِأّ حًمًبًقُلَبًيِّ ', 
'  کْوٌلَ سِـلَأّمً عٌلَيِّکْمً لَتٌـصّـيِّر مًأّيِّعٌ  ', 
'   هّـلَأّ حًيِّأّتٌـيِّ مًنِوٌر أّنِتٌ بًسِـ بًدٍوٌنِ ﺰحًفُـ رجّـأّئأّأّ 😂😂', 
'لَأّ هّـلَهّ وٌلَأّ مًرحًبًأّ  ', 
'  أّهّـوٌوٌوٌ أّجّـهّ أّلَﺰأّحًفُ 😤  ', 
'   کْلَ أّلَهّـلَأّ بًيِّکْ وٌبًجهّـأّتٌـکْ خِـصّـمً أّلَحًجّـيِّ ضًـيِّفُ جّـهّـأّتٌـکْ 😉😂', 
'   يِّعٌمًيِّ هّـلَأّ بًيِّکْ مًنِيِّنِ مًأّ جّـيِّتٌ 😒😣', 
'هلوات عيونـي نورت🌷', 
'هلُۆآتٌ حٍـيَـ{ლ}ـآتٌيَ┆✨😽💞', 
'هـايـات يـروحـي┋🌸', 
'يههلا بيك حياتي 💛🌿'}      veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md')   
end
if text == "سلام عليكم" or text== "سلام"  then  
local mohmad = {'  وٌعٌلَيِّکْمً أّلَسِـلَأّمً وٌرحًمًةّ أّلَلَهّ وٌبًرکْأّتٌـهّ ', 
'   وٌعٌلَيِّکْمً سِـلَأّمً شُـوٌنِکْ حًيِّأّتٌـيِّ شُـخِـّـبًأّرکْ 😋😇', 
'کْلَ أّلَهّـلَأّ بًيِّکْ حًمًبًيِّ 😆 ', 
'   أّيِّ عٌوٌدٍ ثًـکْيِّلَ يِّسِـلَمً يِّلَأّ عٌيِّنِيِّ کْمًلَ أّلَسِـلَأّمً مًأّلَتٌـکْ وٌبًلَشُ أّﺰحًفُ 😂', 
'   يِّهّـلَأّ وٌأّلَلَهّ أّشُـلَوٌنِکْمً شُـخِــبًأّرکْمً أّبوٌکْ شُـوٌنِهّ ', 
'وعليـكم السلام ورحمـة الله وبركاتهُ', 
'وعليكم السلام والرحمه🏌🏿‍♀️', 
'ﯛ୭ﯠ۶ـہٰٰٰٖٖٖلہٰٰٰٖٖٖيکگہٰٰٰٖٖٖمہٰٰٰٖٖٖہ ٵٴلہٰٰٰٖٖٖسہلہٰٰٰٖٖٖاٴمہٰٰٰٖٖٖہ ┆ ➰✌️🏿'}  veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md') 
end 
if text == "منور" or text== "منورين" or text== "منوره"  then 
local mohmad = {'   أّکْيِّدٍ مًنِوٌر بًوٌجّـوٌدٍيِّ أّنِيِّ ☺', 
' أّيِّ عٌمًيِّ کْلَهّـأّ وٌأّسِـطِأّتٌ مًوٌ صّـوٌجّـکْمً وٌأّلَلَهّـيِّ 😣😢  ', 
' لَأّ مًوٌ مًنِوٌر وٌأّذِأّ تٌـعٌأّنِدٍ أّدٍفُـرکْ 😒😂 ', 
'   أّفُـتٌـهّـمًنِأّ عٌمًيِّ مًنِوٌ أّنِتٌـ وٌهّـوٌ ', 
'   هّـأّ لَأّﺰمً خِـيِّلَتٌ عٌلَيِّةّ 😂😂', 
' أّيِّ وٌأّلَلَةّ فُـعٌلَأّ مًنِوٌر هّـلَ صّـأّکْ 😂😓'}   
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md') 
end 
if text == "مح" or text== "محح" or text== "محح"  then 
local mohmad = {
' ﺎخٰٰ̲خྀـٓربٰ ﯛ୭ات̲كھٰربْ ♥',
' ﻋِﻋٰافيٰۛـۢھٰهۃ ؛ֆ   ',
'ﺄموﯟعنَ ،😞💓.   ',
'  أّوٌفُـ أّلَلَلَهّ 😍 شُـهّـلَ بًوٌسِـهّ  ',
'  دٍيِّيِّيِّ لَکْ ﺰأّحًفُـ لَضًـلَ تٌـبًوٌسِ 😒 ',
'  أّهّـوٌووٌوٌ لَيِّشُـوٌفُـهّ يِّکْوٌلَ هّـوٌ مًهّـنِدٍ وٌيِّبًوٌسِ بًلَ عٌأّلَمً 😩  ',
'   دٍنِجّـبً لَکْ ﺰأّحًفُ 😝😂'
}
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md')  
end
if text == "ضايج" or text== "ضوجه" or text== "ضايجه" or text== "حيل ضوجه" then 
local mohmad = {
'   كٰ̲ۛكۛلٰشۢ ،🍿ֆۦ ',
'  ضايج لئن كلبه مكسور 🙀😿 ',
'  حـٍبيبي ءّ🙍‍♂️💜 اركـ🕺🏻ـصلج🌚 ',
'   أّيِّ وٌأّلَلةّ ضًـوٌجّـهّـ وٌنِسِـوٌأّنِ مًأّکْوٌ وٌشُـغُلَ مًأّکْوٌ 😣😢',
'  أّيِّ أّلَيِّوٌمً کْآبًهّ حًيِّلَ 😞 ',
'  حًيِِّـأّتٌـيِّ تٌـعٌ نِلَعٌبً لَعٌبًةّ لَبًوٌسِـأّتٌ بًوٌسِـنِيِّ وٌأّبًوٌسِـکْ 😂😢 ',
'  هّـهّـهّـهّـهّـهّـهّ دٍنِجّـبً وٌيِّنِ أّکْوٌ ضًـوٌجّـهّ 😝 ',
' أّلَلَلَلَلَهّـمً لَأّ شُـمًأّتٌـهّ 😂',"حـٍبيبي ءّ🙍‍♂️💜 اركـ🏻ـصلج🌚"
}
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md')  
end
if text == "صباحو" or text== "صباح الخير"  then 
local mohmad = {
'  صباحو النور اشرقت وانورت🎈 ',
'صۢبٰاζ النور 😍   ',
'  صۢبٰاζـۢوٰﯟ ،☀️ عسل 😋😎 ',
'  صباحو النور يا نور 😻😹 '
}
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md')   
end
if text == "زاحف" or text== "زواحف"  then 
local mohmad = {
'  اهوو هم زحف 😢😂 ',
'  على خالتك¤_¤ 😒 ',
' شكو تزحف ولك 😝 خلوني بس اني ازحف   '
}
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md') 
end
if text == "احبك" or text== "احبج" then 
local mohmad = {
'  اشتم ريحـة🙄 زحف يمعودين🎈 ',
'  مي تو واني اموت بيك/ج♥️🌝 ',
'  بعد روحي واني احبكم هم بس لتزحفلي رجاا 😸💋 ',
'  ولك ما تبطل زحفك 😹 صارت قديمه ترا 😂 ',
'   أّوٌفُ أّلَلَهّـهّـهّـ أّنِيِّ أّمًوٌتٌـنِ بًيِّکْ وٌلَعٌبًأّسِ 😢',
'متستحي ',
'ئوف فديتك ربك ',
'ماحترمك شلون احبك 🌝',
'حبيبي المطور بس ',
'ماحبك 🤤',
'كلبي انته 😶❤️',
'اموتن بيك ❤️',
'اموعن اذوبن 💔',
'ئنته ئلنفس مال اني ❤️😋',
'شبيك مشايف بنات هيج جفاف ',
'ئنته ئلعشق ',
'طيني بوسه وحبك 🤗',
'لزكت 😕',
'اني وانت كلب واحد بالنفس صاعد ونازل 🙊😻',
'تفووو عليك ماريد حبك 😂🙊',
'اموت عليك يروحي 😻💋'
}
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md')   
end
if text == "هه" or text== "ههه" or text== "هههه" or text== "ههههه" or text== "هههههه" or text== "ههههههه" or text== "ههههههههه" or text== "هههههههههههه" or text== "هههههههههههههههههه" then 
local mohmad = {
'دووم الضحُــكه  يرويحتي🍃   ',
' انت شبيك تخبلت 😨😹😹  ',
' دووم الضحكـه 😽  ',
'   كافي تضخك 😒 انت مو زغير 😎😻😹',
'انت شبيك تخبلت 😒😨😹😹   ',
'  وٌأّلَلَهّ مًأّکْوٌ فُـأّيِّدٍهّ وٌيِّأّکْ ',
'انت شبيك تخبلت 😒😨😹',
'ضحكتك 🚶 مال فروخ  بطلها 😹😹'
}
veer_sendMsg(msg.chat_id_, msg.id_, 1, ''..mohmad[math.random(#mohmad)]..'', 1, 'md')  
end
if text =="🌚" then 
mohmad =   "• فـﮧديت صخـﮧامك🙊👄" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text == "🌚🌚" then 
mohmad =   "• فـﮧديت صخـﮧامك🙊👄" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text == "🌚🌚🌚" then 
mohmad =   "• فـﮧديت صخـﮧامك🙊👄" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text == "🌚🌚🌚🌚" then 
mohmad =   "• فـﮧديت صخـﮧامك🙊👄" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🏻" then 
mohmad =   "شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶ الماشي✨🚶🏻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🏻🚶🏻" then 
mohmad =   "شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶ الماشي✨🚶" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🏻🚶🏻🚶🏻🚶🏻" then 
mohmad =   "شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶ الماشي✨🚶🏻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🏻🚶🏻🚶🏻" then 
mohmad =   "شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶ الماشي✨🚶" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙈" then 
mohmad =   "» ﺷــ๋͜ـﮭڸ خــ๋͜ـجل ﮪ 💗😻̯͡" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙈🙈" then 
mohmad =   "» ﺷــ๋͜ـﮭڸ خــ๋͜ـجل ﮪ 💗😻̯͡" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙈🙈🙈" then 
mohmad =   "» ﺷــ๋͜ـﮭڸ خــ๋͜ـجل ﮪ 💗😻̯͡" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙈🙈🙈🙈" then 
mohmad =   "» ﺷــ๋͜ـﮭڸ خــ๋͜ـجل ﮪ 💗😻̯͡" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙊🙊🙊🙊" then 
mohmad =   "فديت الخجل يبن القرده 😹😢" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙊🙊🙊" then 
mohmad =   "فديت الخجل يبن القرده 😹😹😢"   
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙊🙊" then 
mohmad =   "فديت الخجل يبن القرده 😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙊" then 
mohmad =   "فديت الخجل يبن القرده 😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😍😍😍😍" then 
mohmad =   "صعد الحب🙄 الله يستر😹💔 من الزحف " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😍😍😍" then 
mohmad =   "صعد الحب🙄 الله يستر😹💔 من الزحف 😂😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😍😍" then 
mohmad =   "صعد الحب🙄 الله يستر😹💔 من الزحف 😂😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😍" then 
mohmad =   "صعد الحب🙄 الله يستر😹💔 من الزحف 😂😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😂😂😂😂" then 
mohmad =   "دوم الضحـكه😽🎈 " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😂😂😂" then 
mohmad =   "دوم الضحـكه😽🎈 " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😂😂" then 
mohmad =   "دوم الضحـكه😽🎈 " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😂" then 
mohmad =   "دوم الضحـكه😽🎈 " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😉😉😉😉" then 
mohmad =   "باع الغمزه 🙀 تموت 🙈🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😉😉😉" then 
mohmad =   "باع الغمزه 🙀 تموت 🙈🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😉😉" then 
mohmad =   "باع الغمزه 🙀 تموت 🙈🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😉" then 
mohmad =   "باع الغمزه 🙀 تموت 🙈🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😳😳😳😳" then 
mohmad =   "شبيك 🙀 مصدوم شنو 🙄 جديده عليك حتى تنصدم ♥️🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😳😳😳" then 
mohmad =   "شبيك 🙀 مصدوم شنو 🙄 جديده عليك حتى تنصدم ♥️🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😳😳" then 
mohmad =   "شبيك 🙀 مصدوم شنو 🙄 جديده عليك حتى تنصدم ♥️🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😳" then 
mohmad =   "شبيك 🙀 مصدوم شنو 🙄 جديده عليك حتى تنصدم ♥️🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😠😠😠😠" then 
mohmad =   "حمه الصيني طفوه 😍😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😠😠😠" then 
mohmad =   "حمه الصيني طفوه 😍😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😠😠" then 
mohmad =   "حمه الصيني طفوه 😍😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😠" then 
mohmad =   "حمه الصيني طفوه 😍😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😡😡😡😡" then 
mohmad =   "حمه الصيني طفوه 😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😡😡😡" then 
mohmad =   "حمه الصيني طفوه 😍😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😡😡" then 
mohmad =   "حمه الصيني طفوه 😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😡" then 
mohmad =   "حمه الصيني طفوه 😍😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😭😭😭😭" then 
mohmad =   "لا تبجي يروحي محد يسوه تبجيله ☺😘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end 
if text =="😭😭😭" then 
mohmad =   "لا تبجي يروحي محد يسوه تبجيله ☺😘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😭" then 
mohmad =   "لا تبجي يروحي محد يسوه تبجيله ☺😘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😭" then 
mohmad =   "لا تبجي يروحي محد يسوه تبجيله ☺😘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😌😌😌😌" then 
mohmad =   "فديت  الرقه مالتك 😉😇🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😌😌😌" then 
mohmad =   "فديت 🙊😻 الرقه مالتك 😉😇🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😌😌" then 
mohmad =   "فديت 😻 الرقه مالتك 😉😇🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😌" then 
mohmad =   "فديت  الرقه مالتك 😉😇" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💃💃💃💃" then 
mohmad =   "شددها ابو سميره 😂 خوش تهز " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💃💃💃" then 
mohmad =   "شددها ابو سميره 😂 خوش تهز 😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💃💃" then 
mohmad =   "شددها ابو سميره 😂 خوش تهز 😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💃" then 
mohmad =   "شددها ابو سميره 😂 خوش تهز 😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="👀" then 
mohmad =   "هاي وين دا تباوع ولك😹😹🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="👀👀" then 
mohmad =   "هاي وين دا تباوع ولك😹😹🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😱😱😱😱" then 
mohmad =   "عزا العزاك هاي شفت ولك 😂😂😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😱😱😱" then 
mohmad =   "عزا العزاك هاي شفت ولك 😂😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😱😱" then 
mohmad =   "عزا العزاك هاي شفت ولك 😂😂😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😱" then 
mohmad =   "عزا العزاك هاي شفت ولك 😂😂😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😊😊😊😊" then 
mohmad =   "فديت الخجل كله 😎😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😊" then 
mohmad =   "فديت الخجل كله 😎😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😊😊" then 
mohmad =   "فديت الخجل كله 😎😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😊" then 
mohmad =   "فديت الخجل كله 😎😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😘😘😘😘" then 
mohmad =   "• ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽̯⁾ֆ‘ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😘😘😘" then 
mohmad =   "• ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😘😘" then 
mohmad =   "• ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😘" then 
mohmad =   "• ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="☺☺☺☺" then 
mohmad =   "ابتسامه مال واحد شايل اهموم الدنيا كوله بگلبه 💔😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="☺☺☺" then 
mohmad =   "ابتسامه مال واحد شايل اهموم الدنيا كوله بگلبه 💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="☺☺" then 
mohmad =   "ابتسامه مال واحد شايل اهموم الدنيا كوله بگلبه 💔😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="☺" then 
mohmad =   "ابتسامه مال واحد شايل اهموم الدنيا كوله بگلبه 💔😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😞😞😞😞" then 
mohmad =   "منو مضوجك🙀 دليني عليه😾💪🏼" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😞😞😞" then 
mohmad =   "منو مضوجك دليني عليه😾💪🏼" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😞😞" then 
mohmad =   "منو مضوجك🙀 دليني عليه😾💪🏼" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😞" then 
mohmad =   "منو مضوجك🙀 دليني عليه😾💪🏼" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😻😻😻😻" then 
mohmad =   "باع الحب صاعد عده فول 😹😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😻😻😻" then 
mohmad =   "باع الحب صاعد عده فول 😹😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😻😻" then 
mohmad =   "باع الحب صاعد عده فول 😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😻" then 
mohmad =   "باع الحب صاعد عده فول 😹😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😇" then 
mohmad =   "مسويلك مصيبه ودا تبتسم 😻😹😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😇😇" then 
mohmad =   "مسويلك مصيبه ودا تبتسم 😻😹😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶" then 
mohmad =   "منور يبعد الكلب 🌺😇" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🚶" then 
mohmad =   "منور يبعد الكلب 🌺😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🚶🚶" then 
mohmad =   "منور يبعد الكلب 🌺😻😇" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🚶🚶🚶" then 
mohmad =   "منور يبعد الكلب 🌺😇" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😢😢😢😢" then 
mohmad =   "عيــونك/ج✨ حرام ينزل دمعهن🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😢😢😢" then 
mohmad =   "عيـ😻ـونك/ج✨ حرام ينزل😴 دمعهن🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😢😢" then 
mohmad =   "عيـ😻ـونك/ج✨ حرام ينزل😴 دمعهن🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😢" then 
mohmad =   "عيـ😻ـونك/ج✨ حرام ينزل😴 دمعهن🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😹😹😹😹" then 
mohmad =   "دوم الضحكه يالغالي 😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😹😹😹" then 
mohmad =   "دوم الضحكه يالغالي 😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😹😹" then 
mohmad =   "دوم الضحكه يالغالي 😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😹" then 
mohmad =   "دوم الضحكه يالغالي 😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😿😿😿😿" then 
mohmad =   "منو وياك يرويحتي 😓😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😿😿😿" then 
mohmad =   "منو وياك يرويحتي 😓😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😿😿" then 
mohmad =   "منو وياك يرويحتي 😓😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😿" then 
mohmad =   "منو وياك يرويحتي 😓😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😏😏😏😏" then 
mohmad =   "عود شوفوني اني شخصـية 😣وهو وجـهه وجه الطلي 🙊😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😏😏😏" then 
mohmad =   "عود شوفوني اني شخصـية 😣وهو وجـهه وجه الطلي 🙊😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😏😏" then 
mohmad =   "عود شوفوني اني شخصـية 😣وهو وجـهه وجه الطلي 🙊😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😏" then 
mohmad =   "عود شوفوني اني شخصـية 😣وهو وجـهه وجه الطلي ??😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😒😒😒😒" then 
mohmad =   "شبي🙃 ‎‏💛🙈  ggɺᓗɺÎ  ضايج" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😒😒😒" then 
mohmad =   "شبي🙃 ‎‏💛  ggɺᓗɺÎ  ضايج💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😒😒" then 
mohmad =   "شبي🙃 ‎‏💛🙈  ggɺᓗɺÎ  ضايج" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😒" then 
mohmad =   "شبي ‎‏💛🙈  ggɺᓗɺÎ  ضايج" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😝😝😝😝" then 
mohmad =   "لو جوعان 🤔لو مريض نفسي💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😝😝😝" then 
mohmad =   "لو جوعان لو مريض نفسي💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😝😝" then 
mohmad =   "لو جوعان 🤔لو مريض نفسي😹💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😝" then 
mohmad =   "لو جوعان 🤔لو مريض نفسي😹💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😕😕😕" then 
mohmad =   "شكو عاوج حلكك😒😻😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😕😕" then 
mohmad =   "شكو عاوج حلكك😒😻😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😕" then 
mohmad =   "شكو عاوج حلكك😒😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️" then 
mohmad =   "- الجمال البـيـج فـاتح للـغغزل چم بـاب💅🏻💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶‍♀️🚶‍♀️🚶‍♀️" then 
mohmad =   "- الجمال البـيـج فـاتح للـغغزل چم بـاب💅🏻💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶‍♀️🚶‍♀️" then 
mohmad =   "- الجمال البـيـج فـاتح للـغغزل چم بـاب💅🏻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶‍♀️" then 
mohmad =   "- الجمال البـيـج فـاتح للـغغزل چم بـاب💅🏻💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🏻🚶🏻🚶🏻🚶🏻" then 
mohmad =   "- الجمال البـيـك فـاتح للـغغزل چم بـاب💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🏻🚶🏻🚶🏻" then 
mohmad =   "- الجمال البـيـك فـاتح للـغغزل چم بـاب💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🏻🚶🏻" then 
mohmad =   "- الجمال البـيـك فـاتح للـغغزل چم بـاب💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🚶🏻" then 
mohmad =   "- الجمال البـيـك فـاتح للـغغزل چم بـاب💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end 
if text =="😔😔😔😔" then 
mohmad =   "ليش زعلان يعمري 😔 تعال احجيلي اهمومك💔🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end 
if text =="😔😔😔" then 
mohmad =   "ليش زعلان يعمري 😔 تعال احجيلي اهمومك🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😔😔" then 
mohmad =   "ليش زعلان يعمري 😔 تعال احجيلي اهمومك💔🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😔" then 
mohmad =   "ليش زعلان يعمري 😔 تعال احجيلي اهمومك💔🍃" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😑😑😑😑" then 
mohmad =   "منو مضوجك☹️ פـٍـٍبيبي ءّ‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😑😑😑" then 
mohmad =   "منو مضوجك☹️ פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😑😑" then 
mohmad =   "منو مضوجك☹️ פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😑" then 
mohmad =   "منو مضوجك☹️ פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😐😐😐😐" then 
mohmad =   "شبيك ضايج يروحي 😓😭" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😐😐😐" then 
mohmad =   "شبيك ضايج يروحي 😭" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😐😐" then 
mohmad =   "شبيك ضايج يروحي 😓😭" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😐" then 
mohmad =   "شبيك ضايج يروحي 😓😭" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😋😋😋😋" then 
mohmad =   "لو جوعان 🤔لو مريض نفسي😹💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😋😋😋" then 
mohmad =   "لو جوعان لو مريض نفسي😹💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😋😋" then 
mohmad =   "لو جوعان 🤔لو مريض نفسي😹💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😋" then 
mohmad =   "لو جوعان 🤔لو مريض نفسي😹💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😎😎😎😎" then 
mohmad =   "مسوي عمليه لعيونك  لو انت خبل🙌" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😎😎😎" then 
mohmad =   "مسوي عمليه لعيونك 😔 لو انت خبل🙌😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😎😎" then 
mohmad =   "مسوي عمليه لعيونك 😔 لو انت خبل🙌😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😎" then 
mohmad =   "مسوي عمليه لعيونك 😔 لو انت خبل🙌😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😴😴😴😴" then 
mohmad =   "رأح, دكـّــوم تـّــمس๋͜‏ـلّـ๋͜‏ـت ولي نأم 😹☹️😻  " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😴😴😴"  then 
mohmad =   "رأح, دكـّــوم تـّــمس๋͜‏ـلّـ๋͜‏ـت ولي نأم 😹☹️😻  " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😴😴" then 
mohmad =   "رأح, دكـّــوم تـّــمس๋͜‏ـلّـ๋͜‏ـت ولي نأم 😹☹️😻  " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😴" then 
mohmad =   "رأح, دكـّــوم تـّــمس๋͜‏ـلّـ๋͜‏ـت ولي نأم 😹☹️😻  " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😽😽😽😽" then 
mohmad =   " ﭑإ́وُف فديـٍَــت ﭑإ́لـپـــٰٰـوُﮨﮨﮨــهٰ⇣̉ـ  😻🙈🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😽😽😽" then 
mohmad =   " ﭑإ́وُف فديـٍَــت ﭑإ́لـپـــٰٰـوُﮨﮨﮨــهٰ⇣̉ـ  😻🙈🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😽😽" then 
mohmad =   " ﭑإ́وُف فديـٍَــت ﭑإ́لـپـــٰٰـوُﮨﮨﮨــهٰ⇣̉ـ  😻🙈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💋💋💋💋💋💋💋💋💋💋💋💋" then 
mohmad =   " ﭑإ́وُف فديـٍَــت ﭑإ́لـپـــٰٰـوُﮨﮨﮨــهٰ⇣̉ـ  😻🙈🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😾😹" then 
mohmad =   "خاب ديلك😐😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😾" then 
mohmad =   "خاب ديلك😐" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💔" then 
mohmad =   "ﭑإ́وُف ﭑإ́لـلــهٰ⇣̉ يـٍَﮩﮨﮨﮨـﭑإ́عـِِِِد قلـپـــٰٰـك 😢😞💋 " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💔💔" then 
mohmad =   "ﭑإ́وُف ﭑإ́لـلــهٰ⇣̉ يـٍَﮩﮨﮨﮨـﭑإ́عـِِِِد قلـپـــٰٰـك 😢😞💋 " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💔💔💔" then 
mohmad =   "ﭑإ́وُف ﭑإ́لـلــهٰ⇣̉ يـٍَﮩﮨﮨﮨـﭑإ́عـِِِِد قلـپـــٰٰـك 😢😞💋 " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💔💔💔💔" then 
mohmad =   "ﭑإ́وُف ﭑإ́لـلــهٰ⇣̉ يـٍَﮩﮨﮨﮨـﭑإ́عـِِِِد قلـپـــٰٰـك 😢😞💋 " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="👄" then 
mohmad =   "قلبوشتي😻💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💙" then 
mohmad =   "عافيتي💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💜" then 
mohmad =   "يروحي😻💋انت" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="❤" then 
mohmad =   "يعمري😻 انت " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💚" then 
mohmad =   "منور ابو كلب الاخضر😐😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💋💋💋💋" then 
mohmad =   "اوووف شنو هذا الحلك😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💋💋💋" then 
mohmad =   "اوووف شنو هذا الحلك😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💋💋" then 
mohmad =   "اوووف شنو هذا الحلك😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💋" then 
mohmad =   "اوووف شنو هذا الحلك😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙋" then 
mohmad =   "هلا حبعمري🙂❤️" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙋🙋" then 
mohmad =   "هلا حبعمري❤️" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙋🙋🙋" then 
mohmad =   "هلا حبعمري❤️" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐕" then 
mohmad =   "ها عمو شبيك🌝" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐆" then 
mohmad =   "ولا يكعد راحه ابو صابر🌝😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐈" then 
mohmad =   "بشت بشت😐😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😘🌹" then 
mohmad =   "هلا حياتي عطرها🙂💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💚" then 
mohmad =   "هلا حياتي عطرها🙂💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🌝🌝🌝🌝" then 
mohmad =   "شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ  ۶" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🌝🌝🌝" then 
mohmad =   "شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 💙 ۶" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🌝🌝" then 
mohmad =   "شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝 ۶" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🌝" then 
mohmad =   "شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐍" then 
mohmad =   "ماكو غيرك زاحف🙊🗯" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐍🐍" then 
mohmad =   "ماكو غيرك زاحف🙊🗯" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐍🐍🐍" then 
mohmad =   "ماكو غيرك زاحف🙊🗯" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐍🐍🐍🐍" then 
mohmad =   "ماكو غيرك زاحف🙊🗯" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐅" then 
mohmad =   "منور النجر🌝😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐅🐅" then 
mohmad =   "منور النجر🌝😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🐅🐅🐅" then 
mohmad =   " منورالنجر " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🌺" then 
mohmad =   "عطرها حبي🌝💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🍁" then 
mohmad =   "عطرها حبي🌝💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💐" then 
mohmad =   "عطرها حبي🌝💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙄🙄🙄🙄" then 
mohmad =   "شلگيت فوگ وتباوع🤔لو انت احول🙄💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙄🙄🙄" then 
mohmad =   "شلگيت فوگ وتباوع🤔لو انت احول🙄" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙄🙄" then 
mohmad =   "شلگيت فوگ وتباوع🤔لو انت احول🙄💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙄" then 
mohmad =   "شلگيت فوگ وتباوع🤔لو انت احول💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="نرتبط" then 
mohmad =   "ولك ما تبطل زحفك 😡😹 صارت قديمه ترا 😂🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="نكبل" then 
mohmad =   "ولك ما تبطل زحفك 😡😹 صارت قديمه ترا 😂🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="عرفينا" then 
mohmad =   "ولك ما تبطل زحفك 😡😹 صارت قديمه ترا 🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="نتعرف" then 
mohmad =   "ولك ما تبطل زحفك 😡😹 صارت قديمه ترا 🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="نت منين" then 
mohmad =   "شكو تزحف ولك 😹 خلوني بس اني ازحف 🙊😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="خلي نتعرف" then 
mohmad =   "شكو تزحف ولك 😹😹 خلوني بس اني ازحف 🙊😹😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="شسمك" then 
mohmad =   "شكو تزحف ولك 😹😹 خلوني بس اني ازحف 😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="عرفنا" then 
mohmad =   "شكو تزحف ولك 😹😹 خلوني بس اني ازحف 🙊😹😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="هاذا شنو" then 
mohmad =   "لۧاٲ   مو بوت اقرا🙃 اسمي✨" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="يمكن بوت" then 
mohmad =   "لۧاٲ   مو بوت اقرا🙃 اسمي✨" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اي بوت" then 
mohmad =   "لۧاٲ   مو بوت😒 اقرا🙃 اسمي✨" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="هاذا بوت" then 
mohmad =   "لۧاٲ   مو بوت😒 اقرا🙃 اسمي✨" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="وين البوت" then 
mohmad =   "لۧاٲ   مو بوت😒 اقرا🙃 اسمي✨" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="تعال نلعب" then 
mohmad =   "تعالو لعبو بمالي 😸😸" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="تعاي نلعب" then 
mohmad =   "تعالو لعبو بمالي 😸😸" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="نلعب" then 
mohmad =   "تعالو لعبو بمالي 😸😸" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="تلعبون" then 
mohmad =   "تعالو لعبو بمالي 😸😸" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🤔🤔🤔🤔" then 
mohmad =   "ولا يكعد راحه اينشتاين الصغير 😂😂" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🤔🤔🤔" then 
mohmad =   "ولا يكعد راحه اينشتاين الصغير 😂" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🤔🤔" then 
mohmad =   "ولا يكعد راحه اينشتاين الصغير 😂😂" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🤔" then 
mohmad =   "ولا يكعد راحه اينشتاين الصغير 😂" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🖕🖕🖕🖕" then 
mohmad =   "بحي هاذا لوفه وحطه فتيزك 😹😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🖕🖕🖕" then 
mohmad =   "بحي هاذا لوفه وحطه فتيزك 😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🖕🖕" then 
mohmad =   "بحي هاذا لوفه وحطه فتيزك 😹😹😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🖕" then 
mohmad =   "بحي هاذا لوفه وحطه فتيزك 😹😹😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💋💋💋💋" then 
mohmad =   "فديتك حلكك بحي ☹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💋💋💋" then 
mohmad =   "فديتك حلكك بحي ☹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💋💋" then 
mohmad =   "فديتك حلكك بحي ☹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="💋" then 
mohmad =   "فديتك حلكك بحي ☹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="راح انام" then 
mohmad =   "روح نام 😍 حياتي  تصبح عله خير 💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="نعسان" then 
mohmad =   "روح نام 😍😉 حياتي 😌 تصبح عله خير 💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ت ع خ" then 
mohmad =   "روح نام 😍😉 حياتي  تصبح عله خير " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="دوووم" then 
mohmad =   "لله يديم انفاسك/ج " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="دووووم" then 
mohmad =   "لله يديم انفاسك/ج 😇😚" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="دوم" then 
mohmad =   "لله يديم انفاسك/ج 😇😚" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ددوم" then 
mohmad =   "لله يديم انفاسك/ج 😇" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="دومك" then 
mohmad =   "لله يديم انفاسك/ج 😇😚" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="دومج" then 
mohmad =   "لله يديم انفاسك/ج 😇😚" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ادوم" then 
mohmad =   "لله يديم انفاسك/ج 😇😚" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ضايجه" then 
mohmad =   "حـٍبيبي ءّ🙍‍♂️💜 اركـ🕺🏻ـصلج🌚" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ضايجهه" then 
mohmad =   "حـٍبيبي ءّ🙍‍♂️💜 اركـ🕺🏻ـصلج" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="حيل ضايجه" then 
mohmad =   "حـٍبيبي ءّ🙍‍♂️💜 اركـ🕺🏻ـصلج🌚" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ضووجهه" then 
mohmad =   "حـٍبيبي ءّ🙍‍♂️💜 اركـ🕺🏻ـصلج" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ضوججه" then 
mohmad =   "حـٍبيبي ءّ‍♂️💜 اركـ💃ـصلك" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ضوجهه" then 
mohmad =   "حـٍبيبي ءّ🙍‍♂️💜 اركـ💃🏻ـصلك" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اروح" then 
mohmad =   "مٰٝـٍْ✋ۡـٍٰآ ترٰوۢۛඋ ،💛  احد لازمك🤦🏻‍♂️" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اروحح" then 
mohmad =   "مٰٝـٍْ✋ۡـٍٰآ ترٰوۢۛඋ ،  احد لازمك🤦🏻‍♂️" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="راح اروح" then 
mohmad =   "مٰٝـٍْ✋ۡـٍٰآ ترٰوۢۛඋ ،💛  احد لازمك🏻‍♂️" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="رايح" then 
mohmad =   "مٰٝـٍْ✋ۡـٍٰآ ترٰوۢۛඋ ،💛  احد لازمك🤦🏻‍♂️" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اجيييي" then 
mohmad =   "ﮪﮪﮧעّ ⁞⁞ُ͡‏   💗 بيك🚶🏻 حمبي 👻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اجي" then 
mohmad =   "ﮪﮪﮧעّ ⁞⁞ُ͡‏    بيك🚶🏻 حمبي " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اجييي" then 
mohmad =   "ﮪﮪﮧעّ ⁞⁞ُ͡‏   💗 بيك🚶🏻 حمبي 👻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ممكنن" then 
mohmad =   "أإآيٰٰ    تـٴِﮧ﴿🚶🏻﴾ۣـعالۂ͡†♩❥" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ممكن" then 
mohmad =   "أإآيٰٰ    تـٴِﮧ﴿🚶🏻﴾ۣـعالۂ͡†♩❥" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ببكن" then 
mohmad =   "أإآيٰٰ    تـٴِﮧ﴿🚶🏻﴾ۣـعالۂ͡†♩❥" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="مممكن" then 
mohmad =   "أإآيٰٰ    تـٴِﮧ﴿🚶🏻﴾ۣـعالۂ͡†♩❥" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ديييي" then 
mohmad =   "يمشوك🐕 بيها🙊😹 حمبي" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="دييي" then 
mohmad =   "يمشوك🐕 بيها🙊😹 حمبي" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ديي" then 
mohmad =   "يمشوك🐕 بيها🙊😹 حمبي" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="دي" then 
mohmad =   "يمشوك🐕 بيها🙊😹 حمبي" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="وليييي" then 
mohmad =   "۽ﺈنجٰٓجٰٓہ͡‌ـبۂ 🌝 ٰٓ₎ פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ولييي" then 
mohmad =   "۽ﺈنجٰٓجٰٓہ͡‌ـبۂ 🌝 ٰٓ₎ פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="وليي" then 
mohmad =   "۽ﺈنجٰٓجٰٓہ͡‌ـبۂ 🌝 ٰٓ₎ פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ولي" then 
mohmad =   "۽ﺈنجٰٓجٰٓہ͡‌ـبۂ 🌝 ٰٓ₎ פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="احبكك" then 
mohmad =   "بعد روحي واني احبكم هم بس لتزحفلي رجاا 😸😸" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ااحبك" then 
mohmad =   "بعد روحي واني احبكم هم بس لتزحفلي رجاا 😸😸💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="احبككك" then 
mohmad =   "بعد روحي واني احبكم هم بس لتزحفلي رجاا 😸😸💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="احبكم" then 
mohmad =   "بعد روحي واني احبكم هم بس لتزحفلي رجاا 😸😸💋" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اييييي" then 
mohmad =   "يب قابل اغشكم 🙈🎈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اييي" then 
mohmad =   "يب قابل اغشكم 🙈🎈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ايي" then 
mohmad =   "يب قابل اغشكم 🎈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اي" then 
mohmad =   "يب قابل اغشكم 🙈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="تعالو" then 
mohmad =   " ما اروح المطورين مالتي ميقبلون " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="تعالوو" then 
mohmad =   "لا ما اروح المطورين مالتي ميقبلون🎈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="تعالووو" then 
mohmad =   "لا ما اروح المطورين مالتي ميقبلون😐🎈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="تعالوووو" then 
mohmad =   "لا ما اروح المطورين مالتي ميقبلون😐🎈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="شبيك" then 
mohmad =   "مبينه شي سلامتك/ ج🎈😌" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="شبيكم" then 
mohmad =   "مبينه شي سلامتك/ ج🎈😌"   veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="شبيكك" then 
mohmad =   "مبينه شي سلامتك/ ج🎈😌" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="شبيكمم" then 
mohmad =  "مبينه شي سلامتك/ ج🎈😌" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="جب" then 
mohmad =   "جب بخشـ👃🏻ـمك פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="انجب" then 
mohmad =   "جب بخشـ🏻ـمك פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="نجب" then 
mohmad =   "جب بخشـ👃🏻ـمك פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اانجب" then 
mohmad =   "جب بخشـ👃🏻ـمك פـٍـٍبيبي ءّ🙍‍♂️💜" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="وين" then 
mohmad =   "• بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ😽💜ֆ" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="وينن" then 
mohmad =   "• بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ😽💜ֆ" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="وين تريد" then 
mohmad =   "• بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ😽💜ֆ" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ووين" then 
mohmad =   "• بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ😽💜ֆ" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="باييي" then 
mohmad =   "لله وياكـ💙✨ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="☹️☹️☹️☹️" then 
mohmad =  "شبيك متعصب حبي 😱😿 منو وياك 😿😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="☹️☹️☹️" then 
mohmad =  "شبيك متعصب حبي 😱😿 منو وياك 😿😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="☹️☹️" then 
mohmad =  "شبيك متعصب حبي 😱😿 منو وياك 😿😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="☹️" then 
mohmad =  "شبيك متعصب حبي 😱😿 منو وياك 😿😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙂🙂🙂🙂" then 
mohmad =  "اوف شهل الابتسامه احله من الكمر 😎😻😻😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙂😕😕😕" then 
mohmad =  "شكو عاوج حلكك😒😻😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙄🤞🏿" then 
mohmad =  "شبيك صافن على ايدك 😹😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙁💔" then 
mohmad =  "ضايج لئن كلبه مكسور 🙀😿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙂✌️" then 
mohmad =  "مبتسم على وجهي 😌😹😹😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😹😹😹😹😹😹😹" then 
mohmad =  "انت شبيك تخبلت 😒😨😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😹😹😹😹😹😹😹😹😹" then 
mohmad =  "انت شبيك تخبلت 😒😨😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="بربك" then 
mohmad =  "ي وعلي ابو الحسن 😐" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="كلكم" then 
mohmad =  "ليش تجمع بحي اني بوت 😞💔" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="والرب" then 
mohmad =  "استغفر الله جنان كم مره كتلك لتحلف جذب😑🎈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="حقك" then 
mohmad =  "ي حقك حمبي اني وياك ضدهم😐🎈" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اكلك يول" then 
mohmad =   "كول حبي بس لا تبول علينا 💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اكول" then 
mohmad =   "كول وفتح حلكك خل ابول 😸😸🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="تعال" then 
mohmad =   "ولي لك ليريدني هو يجيني 😸🌞" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="صوفي" then 
mohmad =   "فديته هاذا اخوي ابو الوكفات فديت ابنمي😍😍" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end 
if text =="شغال" then 
mohmad =   "❞ ءيہـ͜ާي ۶ـٰٰٰོۂٰٰٰٰٰزيہزيۂٰٰٰٰٰـﮯ بـہٰٖآﻗقــ͡ي ﯙأتۂـ͜مــٰཻدد 💕" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="فرخ" then 
mohmad =   "• ؤخـٰٰ͒ہر آﻧﮧـ͜ާۂٰٰٰٰٰي ڵہٰٰٖٖكي᪼᪳ـۂتہٰٖـﮫﮧٰٰٖٖ ۶ֆ كبلك" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="نصعد" then 
mohmad =  "مكالمهةة لو زرور 🐸🤘🏿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="وف" then 
mohmad =  "مو كتلج اريحج لتخافين 🌝💦" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اوي" then 
mohmad =  "هاي تفله بعد ميعور حمبي 💦" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="كحبه" then 
mohmad =  "يب ادري بيها حته ناجها سويجد 😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="يوجع" then 
mohmad =  "حته ترتاحين يا عيني 😺" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ولو منا" then 
mohmad =  "ماولي اذا ما انيجكم 😼🤘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="الله" then 
mohmad =  "شبي خوما ضوجك خوما كللهم مايكل ناج هذا 🙀🙌🏻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="نيجه" then 
mohmad =  "تعال بعد عمك افتر وما تحس وي التفال 🐸💚" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="كول انجب" then 
mohmad =  "خايب ولي لاتفل بطيزك ينطيني اوامر الفرخ 🤘🏿🤡🤘🏿" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="انكليزي" then 
mohmad =  "فاج يو ماين 😎" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="مرحبا" then 
mohmad =   " مہٰ۪۫ږآحہٰ۪۫بہٰ۪۫ هلا بيك 💑" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="هلاوووووو" then 
mohmad =   "يههلا بيك نورتنا 💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="خرب" then 
mohmad =   "خرب وجهك حمتر لتكفر 🌞🌿 " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="سلام" then 
mohmad =   "يهلا حمبي نورت 💛😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="انت انجب" then 
mohmad =   "اي حمبي 😸 تعال فتح حلكك 😸💙" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="وين ولك" then 
mohmad =   "يم خالتك الشكره بن  الصاكه" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اكرهك" then 
mohmad =   "شعور متبادل حبي" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="تكرهني" then 
mohmad =   "شي اكيد احبك حياتي 😸💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="اعشقك" then 
mohmad =   "فيدوه اني هم عشقك😊😹🙊" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="شباب" then 
mohmad =   "كباب وتكه وسمج 😸💛" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="ماريا" then 
mohmad =   "ولك هاي الصاكه العشق هاي حبيبت المطور هاي 😸🙊😻😻️" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😂😂😂😂😂😂" then 
mohmad =   "يضحك الفطير 😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😇" then 
mohmad =   "استريح بحي رايد شي 😹😹😻" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😖" then 
mohmad =   "دي وجهك معقد 😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😄" then 
mohmad =   "حيل فتح حلكك نوب 😹😹😘" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😌🙂😌😌😌" then 
mohmad =   "فديت الغرور كله بحي" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😭😭😭😭😭" then 
mohmad =   "منو ويك حياتي بس كلي اله اهينه كدامك 😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😫" then 
mohmad =   "ها بحي منو مضوجك " 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="☻" then 
mohmad =   "عساس ثكيل العينتين تاليتك تزحفبل خاص 😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😠" then 
mohmad =   "طفه طفه 💦💦 تره حمه حيل" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😳🙂😳😳😳" then 
mohmad =   "ها شفت/ي ابوك/ج مصلخ ونصدمت 😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="😹😹😹😹😹😹😹😹😹😹😹😹😹" then 
mohmad =   "اضحك شكو عله كلبك ☹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙊🙊🙊🙊🙊" then 
mohmad =   "ها قردي شبيك مستحي 😂😂" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end
if text =="🙈🙈🙈🙈🙈" then 
mohmad =   "صار/ت قرد يعني خجلان ?😹😹😹" 
veer_sendMsg(msg.chat_id_, msg.id_, 1, mohmad, 1, "html") 
end 

end


end
end
local function help_rep(msg, MSG_TEXT)
if chat_type == 'super' then 
if MSG_TEXT[1] == 'تفعيل ردود البوت' and is_monsh(msg) then   
if MOHMADdevVEER:get(DEVSTOR..'lock:reoly:bot'..msg.chat_id_) then
mohmad = '*📮¦ تم تفعيل ردود البوت *\n✓' 
veer_sendMsg( msg.chat_id_, msg.id_, 1, mohmad, 1, "md") 
MOHMADdevVEER:del(DEVSTOR..'lock:reoly:bot'..msg.chat_id_) 
else
mohmad = '*📮¦ بالتاكيد تم تفعيل ردود البوت *\n✓' 
veer_sendMsg( msg.chat_id_, msg.id_, 1, mohmad, 1, "md") 
end
end
if MSG_TEXT[1] == 'تعطيل ردود البوت' and is_monsh(msg) then   
if not MOHMADdevVEER:get(DEVSTOR..'lock:reoly:bot'..msg.chat_id_) then
mohmad = '*📮¦ تم تعطيل ردود البوت *\n✓' 
veer_sendMsg( msg.chat_id_, msg.id_, 1, mohmad, 1, "md") 
MOHMADdevVEER:set(DEVSTOR..'lock:reoly:bot'..msg.chat_id_,true) 
else
mohmad = '*📮¦ بالتاكيد تم تعطيل ردود البوت *\n✓' 
veer_sendMsg( msg.chat_id_, msg.id_, 1, mohmad, 1, "md") 
end
end
if MSG_TEXT[1] == 'رابط الحذف' or MSG_TEXT[1] == 'رابط حذف' or MSG_TEXT[1] == 'راح احذف' or MSG_TEXT[1] == 'اريد احذف' then
local delac = [[*
♨️¦ رابط حذف حـساب التلجرام
♻️¦ احذف ورتاح ولا تتندم ...
🗞¦ بالتـوفيـق عزيزي ...*
📜¦ [اضغط هنا لحذف حسابك](https://telegram.org/deactivate)
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,delac, 1, 'md')
 end

if MSG_TEXT[1] == 'الاوامر' then
if not is_mod(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن الادمنيه 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*📮¦ اهلآ بك، في اوامر الپوت
 ٴ━━━━━━━━━━
💥¦ مہ1 » لعَرض قائمهۃ الـحمـايهۃ 
💥¦ مہ2 » لعَرض اوامر الاعضاء
💥¦ مہ3» لعَرض قائمهۃ الحظَر والخہ...
💥¦ مہ4 » لعَرض قائمهۃ الادمنيهۃ
 ٴ━━━━━━━━━━
💥¦ مہ5 » لعَرض اوامر المدراء
💥¦ مہ6 » لعَرض اوامر المنشئين
💥¦ مہ7 » لعَرض اوامر اﻟ̣مطور
💥¦ مہ8 » لعَرض اوامر اﻟ̣مطور الاساسي 
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end
if MSG_TEXT[1] == 'م1' then
if not is_mod(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن الادمنيه 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*📮 ¦ اهلا بك في اوامر القفل
🔐 ¦ ڨفلٰ ‹› ڤتح » الامر
ٴ━━━━━━━━━━
⚡️¦ الروابط «» الكلايش
⚡️¦ المعرفات «» اللستات
⚡️¦ التاك «» الصوت 
⚡️¦ البوتات «» المتحركه
⚡️¦ التوجيه «» الدردشه
⚡️¦ التثبيت «» الملفات
⚡️¦ الاشعارات «» الفيديو
⚡️¦ الماركدون «» الاغاني
⚡️¦ التعديل «» الالعاب
⚡️¦ تعديل الميديا «» الصور
⚡️¦ الملصقات «» السيلفي
⚡️¦ الجهات «» الدخول «» الاضافه
 ٴ━━━━━━━━━━
📚¦ للمزيد من الاوامر ارسل ↓
🔕¦ اوامر الكتم » لعرض اوامر الكتم
🚯¦ اوامر التقيد » لعرض اوامر التقيد
💢¦ اوامر الطرد » لعرض اوامر الطرد
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end
if MSG_TEXT[1] == 'م2' then
mohmad = [[
*🙋🏻‍♂¦ مرحبا بك عزيزي، 🍃
📮¦ في اوامــر الآعضاء
ٴ━━━━━━━━━━
🔘¦ عرض معلوماتك ↑↓
 ٴ━━━━━━━━━━
📬¦ معرفي – اسمي – معلوماتي
📬¦ رسايلي – مسح رسايلي 
📬¦ رتبتي – صورتي + رقم الصوره
📬¦ جلب صوره — ثم ارسل رقم الصوره
ٴ━━━━━━━━━━
🔘¦ اوآمر المجموعه ↑↓
 ٴ━━━━━━━━━━
⚜¦ الرابط – القوانين – الترحيب
⚜¦ نزلني – اطردني 
⚜¦ عدد الاضافه – المطور  
 ٴ━━━━━━━━━━
🔘¦ اسم البوت + الامر ↑↓
 ٴ━━━━━━━━━━
🚜¦  بوسه بالرد 
🚜¦ شنو رئيك بهاذا بالرد
🚜¦ شنو رئيك بهاي بالرد
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end

if MSG_TEXT[1] == 'م3' then
if not is_mod(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن الادمنيه 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*🙋🏻‍♂¦ اهلا بك عزيزي 🍃
📮¦ ڤي اوآمر الكتم والحظَر الخہ...
 ٴ━━━━━━━━━━
♦️¦ كتم » { ايدي › معرف › رد }
♦️¦ الغاء الكتم » { ايدي › معرف › رد }
♦️¦ تقيد » { ايدي › معرف › رد }
♦️¦ الغاء تقيد » { ايدي › معرف › رد }
♦️¦ حظر » { ايدي › معرف › رد }
♦️¦ الغاء الحظر » { ايدي › معرف › رد }
♦️¦ طرد » { ايدي › معرف › رد }
♦️¦ رفع القيود » { ايدي › معرف › رد }
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end

if MSG_TEXT[1] == 'م4' then
if not is_mod(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن الادمنيه 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*🙋🏻‍♂¦ اهلا بك عزيزي 🍃
📮¦ ڤي اوآمر الادمنيهۃ..
 ٴ━━━━━━━━━━
🗳¦ رفع مٰميز !
🗳¦ تنزيل مٰميز !
🗳¦ تثبيت !
 ٴ━━━━━━━━━━
📯¦ اوامر التفعيل و التعطيٰل ★
 ٴ━━━━━━━━━━
📌¦ تڤعيل – تعطيل – اطردني !
📌¦ تڤعيل – تعطيل – الترحيب !
📌¦ تڤعيل – تعطيل – جلب الصور !
📌¦ تڤعيل – تعطيل–  الترحيب !
 ٴ━━━━━━━━━━
🔘¦ اوآمر الوضَع ↑↓
 ٴ━━━━━━━━━━
💬¦ ضع رابط » ثم ارسل الرابط
💬¦ ضع صورهۃ » ثم ارسل الصوره
💬¦ ضع قوانين » ثم ارسل النص
💬¦ ضع ترحيب » ثم ارسل النص
💬¦ ضع وصف » ثم ارسل النص
 ٴ━━━━━━━━━━
📯¦ مسح + الامر ادناه ↑↓
 ٴ━━━━━━━━━━
📤¦ مسح المحظٓورين ٭
📤¦ مسح المكتومين ٭
📤¦ مسح المَميزين ٭
📤¦ مسح المڨيدين ٭
📤¦ مسح قائمهۃ المنع ٭
📤¦ مسح الڨوانين ٭
📤¦ مسح التَرحيب ٭
📤¦ مسح الرابط ٭
 ٴ━━━━━━━━━━
⚔¦ لعرضَ القوائمہَ ↑↓
 ٴ━━━━━━━━━━
📨¦ قائمهۃ المنعَ «
📨¦ الڨوانين «
📨¦ الرابطہَ «
📨¦ المميزين «
📨¦ المڨيدين «
📨¦ المحظورين «
📨¦ المگتومين «
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end

if MSG_TEXT[1] == 'م5' then
if not is_monsh(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن المدراء 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*🙋🏻‍♂¦ مرحبا بك عزيزي، 🍃
📮¦ في اوامــر المدراء 
 ٴ━━━━━━━━━━
📚¦ الآدمنيهۃ
📚¦ رفع الادمنيۃ
📚¦ مسح الادمنيۃ
📚¦ مسح + العدد 
📚¦ مسح البوتات 
📚¦ الاعدادات 
📚¦ اعدادات الكتمہ
📚¦ اعدادات التقيد 
📚¦ اعدادات الطرد 
 ٴ━━━━━━━━━━
🔘¦ اوآمر الردود ↑↓
 ٴ━━━━━━━━━━
📨¦ اضف رد 
📨¦ حذف رد 
📨¦ قائمه الردود 
📨¦ مسح الردود 
ٴ━━━━━━━━━━
🔘¦ اوآمر الردود بالرد ↑↓
 ٴ━━━━━━━━━━
🔖¦ اضف رد بالرد 
🔖¦ حذف رد بالرد
🔖¦ قائمه ردود بالرد 
🔖¦ مسح ردود بالرد  
 ٴ━━━━━━━━━━
🔘¦ اوآمر تفعيل و التعطيل ↑↓
 ٴ━━━━━━━━━━
📬¦ تفعيل ‹› تعطيل » نزلني 
📬¦ تفعيل ‹› تعطيل » الايدي 
📬¦ تفعيل ‹› تعطيل » الزخرفه 
📬¦ تفعيل ‹› تعطيل » ردود البوت  
📬¦ تفعيل ‹› تعطيل » الردود  
📬¦ تفعيل ‹› تعطيل » الردود بالرد 
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end

if MSG_TEXT[1] == 'م6' then
if not is_owner(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن المنشئين 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*🙋🏻‍♂¦ مرحبا بك عزيزي، 🍃
📮¦ في اوامــر المنڜئين'
 ٴ━━━━━━━━━━
📬¦ غادر !
📬¦ رفع مدير – تنزيل مدير !
📬¦ المدراء – المنشئين !
📬¦ مسح المدراء !
 ٴ━━━━━━━━━━
📓¦ تفعيل الاضافهۃ ‹› تعطيل الاضافهۃ
📓¦ ضع عدد الاضافهۃ + العدد
📓¦ ضع اسمہ + الاسم التريدهۂ
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end

if MSG_TEXT[1] == 'م7' then
if not is_sudo(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن المطورين 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*🙋🏻‍♂¦ مرحبا بك عزيزي، 🍃
📮¦ في اوامــر المطوريَن .
ٴ━━━━━━━━━━
🏵¦ تفعيل – تعطيل ! 
🏵¦ الكروبات – المڜتركين !
🏵¦ رفع منشئ – تنزيل منشئ !
🏵¦ مسح المنشئين – المنشئين !
ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end

if MSG_TEXT[1] == 'م8' then
if not is_devmohmad(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست المطور الاساسي 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*🙋🏻‍♂¦ مرحبا بك عزيزي، 🍃
📮¦ في اوامــر المطور الآسٰاسي .
ٴ━━━━━━━━━━
⚜¦ ارسل الاوامَر فيہَ الخاص
⚜¦ حظر + ايدي الكروب
⚜¦ الغاء الحظر + ايدي الكروب
ٴ━━━━━━━━━━
📨¦ رفع مطور – تنزيل مطور   
📨¦ المطَورين – مسح المطورين
📨¦ رفع مميز عامہ – تنزيل مميز عامہ
📨¦ المميزين عامہ – مسح المميزين عام
📨¦ حظر عامہ – الغاء العامہ 
📨¦ قائمهہَ العامہ – مسح قائمه العام
ٴ━━━━━━━━━━
📌¦ ردود المطور - مسح ردود المطور
📌¦ تفعيل ردود المطور
📌¦ تعطيل ردود المطور 
📌¦ اضف رد عام - مسح رد عام 
📌¦ ردود المطور بالرد 
📌¦ مسح ردود المطور بالرد
📌¦ تفعيل ردود المطور بالرد
📌¦ تعطيل ردود المطور بالرد
📌¦ اضف رد عام بالرد 
📌¦ حذف رد عام بالرد 
ٴ━━━━━━━━━━
📯¦ وضع اسم للبوت 
📯¦ اذاعه + ايدي لكروب 
📯¦ اذاعهہَ!
📯¦ اذاعهہَ خاص!
📯¦ اذاعهہَ عام!
📯¦ اذاعهہَ بالتوجيه!
📯¦ اذاعهہَ خاص بالتوجيهہَ!
📯¦ اذاعهہَ عام بالتوجيهہَ!
ٴ━━━━━━━━━━
📬¦ تغير الايدي — مسح تغير الايدي
📬¦ ضع كليشه المطور 
📬¦ حذف كليشه المطور
📬¦ ضع كليشه ستارت 
📬¦ حذف كليشه ستارت 
📬¦ ضع رد تواصل
📬¦ حذف رد التواصل
📬¦ ضع عدد التفعيل   
📬¦ جلب كليشه ستارت
📬¦ جلب رد التواصل
ٴ━━━━━━━━━━
📚¦ تحديث السورس 
📚¦ مسح المجموعات 
📚¦ مسح المشتركين 
📚¦ غادر + الايدي
📚¦ تنظيف المجموعات 
📚¦ تنظيف المشتركين
ٴ━━━━━━━━━━
💬¦ وضع اسم البوت
💬¦ تفعيل التواصل
💬¦ تعطيل التواصل
💬¦ تفعيل البوت الخدمي
💬¦ تعطيل البوت الخدمي
💬¦تغير كليشه الترحيب
ٴ━━━━━━━━━━
🗳¦ المشتركين – المجموعات 
🗳¦ الاحصائيات – الكروبات
🗳¦ معلومات ‹+› ايدي الكروب
🗳¦ جلب الرابط ‹+› ايدي الكروب
🗳¦ تغير الاشتراك 
🗳¦ تغير رساله الاشتراك
🗳¦ حذف رساله الاشتراك
🗳¦ تفعيل الاشتراك الاجباري
🗳¦ تعطيل الاشتراك الاجباري
🗳¦ الاشتراك الاجباري
ٴ━━━━━━━━━━
📂¦ الملفات — المتجر
📂¦ تفعيل ملف + اسم الملف
📂¦ تعطيل ملف + اسم الملف
ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end
if MSG_TEXT[1] == 'اوامر التقيد' then
if not is_mod(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن الادمنيه 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*📮 ¦ اهلا بك في اوامر القفل بالتڨيد
🔐 ¦ ڨفلٰ ‹› ڤتح » بالتڨيد
 ٴ━━━━━━━━━━
📬¦ الروابط ‹› ﺂلمعرفات 
📬¦ الشارحهۃ ‹› ﺂلصوت 
📬¦ الملفات ‹› المتحركهۃ
📬¦ التاك ‹› الصور ‹› الماركداون
📬¦ الملصقات ‹› الفيديو
📬¦ اللستات ‹› الكلايش
📬¦ التوجيه ‹› الاغاني
📬¦ الجهات ‹› السيلفي 
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end

if MSG_TEXT[1] == 'اوامر الطرد' then
if not is_mod(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن الادمنيه 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*📮¦ اهلا بك في اوامر القفل بالطرد
🔐¦ ڨفلٰ ‹› ڤتح » بالطرد
 ٴ━━━━━━━━━━
🌀¦ الروابط ‹› ﺂلمعرفات 
🌀¦ الشارحهۃ ‹› ﺂلصوت 
🌀¦ الملفات ‹› المتحركهۃ
🌀¦ التاك ‹› الصور ‹› الماركداون
🌀¦ الملصقات ‹› الفيديو
🌀¦ اللستات ‹› الكلايش
🌀¦ التوجيه ‹› الاغاني
🌀¦ الجهات ‹› السيلفي 
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end

if MSG_TEXT[1] == 'اوامر الكتم' then
if not is_mod(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن الادمنيه 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*📮 ¦ اهلا بك في اوامر القفل بالگتم
🔐 ¦ ڨفلٰ ‹› ڤتح » بالگتم
 ٴ━━━━━━━━━━
⚜¦ الروابط ‹› ﺂلمعرفات 
⚜¦ الشارحهۃ ‹› ﺂلصوت 
⚜¦ الملفات ‹› المتحركهۃ
⚜¦ التاك ‹› الصور ‹› الماركداون
⚜¦ الملصقات ‹› الفيديو
⚜¦ اللستات ‹› الكلايش
⚜¦ التوجيه ‹› الاغاني
⚜¦ الجهات ‹› السيلفي 
 ٴ━━━━━━━━━━
⚜️¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end
if MSG_TEXT[1] == 'اوامر الصلاحيات' then
if not is_owner(msg) then 
veer_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ انت لست ضمن المنشئين 🍃\n📌¦ يمكنك ارسال { م2 } لعرض قائمة اوامر خاصه في الاعضاء *\n💥", 1, "md")  
return false end
mohmad = [[
*📮¦ اهلا بك في اوامر الصلاحيات
🔐¦ ڨفلٰ ‹› ڤتح » الامر
📬¦ تعمل الاوامر التاليه بالرد او المعرف
 ٴ━━━━━━━━━━
📌¦ الروابط ‹› ﺂلمعرفات 
📌¦ الماركداون ‹› ﺂلصوت 
📌¦ الصور ‹› المتحركهۃ
📌¦ الفيديو ‹› الاونلاين 
📌¦ الملصقات ‹› التثبيت
📌¦ التوجيه ‹› السيلفي 
 ٴ━━━━━━━━━━
🔘¦ صلاحيات » { الحظر و الطرد }
 ٴ━━━━━━━━━━
💢¦ قفل الحظر » { رد «» معرف }
💢¦ فتح الحظر » { رد «» معرف }
💢¦ منح الحظر » { رد «» معرف }
💢¦ الغاء منح الحظر » { رد «» معرف }
💢¦ مسح صلاحيات الحظر
💢¦ صلاحيات الحظر
💢¦ تفعيل «» تعطيل » الحظر 
 ٴ━━━━━━━━━━
⚜¦ للمزيد من المعلومات راسلنا  ࿈
🗯¦ مطور البوت »* []] ..SUDOUSERNAME..[[]
]]
veer_sendMsg(msg.chat_id_, msg.id_, 1,mohmad, 1, 'md') 
end

end
end
return {
CMDS = {
"^(الاوامر)$",
"^(م1)$",
"^(م2)$",
"^(م3)$",
"^(م4)$",
"^(م5)$",
"^(م6)$",
"^(م7)$",
"^(م8)$",
"^(اوامر التقيد)$",
"^(اوامر الطرد)$",
"^(اوامر الكتم)$",
"^(تفعيل ردود البوت)$",
"^(تعطيل ردود البوت)$",
"^(اوامر الصلاحيات)$",
"^(رابط الحذف)$",
"^(رابط حذف)$",
"^(راح احذف)$",
"^(اريد احذف)$",
},
STORM = help_rep,
STORM_TEXT = GET_TEXT
}


