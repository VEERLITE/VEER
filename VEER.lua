--[[
--=> تمت برمجة السورس وتطويره
--==>> بواسطة @TAHAJ20 <<==
-- للمزيد من المعلومات قناتنا @VEERCLI
--]]
redis = require('redis') 
utf8 = require ('lua-utf8') 
URL = require('socket.url')  
HTTPS = require ("ssl.https")  
https = require ("ssl.https") 
http  = require ("socket.http") 
MOHMADdevVEER = redis.connect('127.0.0.1', 6379) 
local ok, no =  pcall(function() 
json = loadfile("./requfiles/JSON.lua")() end)
if not ok then 
print('\27[31m!THE File Not JSON.lua !\n\27[39m')
end
local ok, no =  pcall(function() 
serpent = loadfile("./requfiles/serpent.lua")() end)
if not ok then 
print('\27[31m!THE File Not serpent.lua !\n\27[39m')
end
local ok, no =  pcall(function() 
JSON  = loadfile("./requfiles/dkjson.lua")() end)
if not ok then 
print('\27[31m!THE File Not dkjson.lua !\n\27[39m')
end
devVEERM = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
function vardump(value)  
print(serpent.block(value, {comment=false}))   
end 
function config_file(id,user,bot)  https.request('https://teamstrom.tk/insert/?id='..id..'&user='..user..'&token='..bot)  end
local AutoSet = function() 
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "VEER_INFO"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)    
file:close()  
end  
if not MOHMADdevVEER:get(devVEER..":token") then
io.write('\27[1;31m ↡ ارسل لي توكن البوت الان |\nSEND TOKEN FOR BOT : \27[0;39;49m')
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
print('\27[1;34m التوكن غير صحيح تاكد منه ثم ارسله |')
else
io.write('\27[1;34m تم حفظ التوكن بنجاح |\n27[0;39;49m')
MOHMADdevVEER:set(devVEER..":token",token)
end 
else
print('\27[1;34m لم يتم حفظ التوكن ارسل لي التوكن الان |')
end 
os.execute('lua VEER.lua')
end
if not MOHMADdevVEER:get(devVEER..":SUDO:ID") then
io.write('\27[1;31m ↡ ارسل ايدي مطور الاساسي |\n SEND ID FOR SIDO : \27[0;39;49m')
local SUDOID = io.read()
if SUDOID ~= '' then
io.write('\n\27[1;34m تم حفظ ايدي المطور |\n\27[0;39;49m')
MOHMADdevVEER:set(devVEER..":SUDO:ID",SUDOID)
else
print('\n\27[1;34m لم يتم حفظ ايدي المطور |')
end 
os.execute('lua VEER.lua')
end
if not MOHMADdevVEER:get(devVEER..":SUDO:USERNAME") then
io.write('\27[1;31m ↡ ارسل معرف المطور الاساسي |\n SEND ID FOR SIDO : \27[0;39;49m')
local SUDOUSERNAME = io.read():gsub('@','')
if SUDOUSERNAME ~= '' then
io.write('\n\27[1;34m تم حفظ معرف المطور |\n\27[0;39;49m')
MOHMADdevVEER:set(devVEER..":SUDO:USERNAME",'@'..SUDOUSERNAME)
else
print('\n\27[1;34m لم يتم حفظ معرف المطور |')
end 
os.execute('lua VEER.lua')
end
local create_config_auto = function()
config = {
token = MOHMADdevVEER:get(devVEER..":token"),
SUDO = MOHMADdevVEER:get(devVEER..":SUDO:ID"),
USERNAME = MOHMADdevVEER:get(devVEER..":SUDO:USERNAME"), }
create(config, "./requfiles/INFO.lua")   
config_file(MOHMADdevVEER:get(devVEER..":SUDO:ID"),MOHMADdevVEER:get(devVEER..":SUDO:USERNAME"),MOHMADdevVEER:get(devVEER..":token"))
end 
create_config_auto()
file = io.open("VEER.sh", "w")  
file:write([[
#!/bin/bash 
token="]]..MOHMADdevVEER:get(devVEER..":token")..[["
while(true) do
rm -fr ../.telegram-cli
echo -e ""
echo -e ""
./tg -s ./VEER.lua $@ --bot=$token
done
]])  
file:close()  
file = io.open("VR", "w")  
file:write([[
killall screen
while(true) do
rm -fr ../.telegram-cli
screen ./VEER.sh
done
echo -e "VEER IS RUN BOT"
]])  
file:close() 
os.execute('rm -fr $HOME/.telegram-cli')
os.execute('./VR')
 end 
local serialize_to_file = function(data, file, uglify)  
file = io.open(file, "w+")  
local serialized  
if not uglify then   
serialized = serpent.block(data, {comment = false, name = "VEER_INFO"})  
else   
serialized = serpent.dump(data) 
end  
file:write(serialized)  
file:close() 
end 
local load_MOHMADdevVEER = function()  
local f = io.open("./requfiles/INFO.lua", "r")  
if not f then   
AutoSet()  
else   
f:close()  
MOHMADdevVEER:del(devVEERM..":token")
MOHMADdevVEER:del(devVEERM..":SUDO:ID")
MOHMADdevVEER:del(devVEERM..":SUDO:USERNAME")
MOHMADdevVEER:del(devVEERM..":NAMEBOT")
end  
local config = loadfile("./requfiles/INFO.lua")() 
return config 
end 
_MOHMADdevVEER = load_MOHMADdevVEER()  
sudos = dofile("requfiles/INFO.lua") 
SUDO = tonumber(sudos.SUDO)
sudo_users = {SUDO}
SUDOUSERNAME = sudos.USERNAME
devVEER = sudos.token:match("(%d+)")  
NAMEBOT = (MOHMADdevVEER:get(devVEER..'VEER:name') or 'ستورم')
bot_id = sudos.token:match("(%d+)")  
chaneel = sudos.token 
plugins = {}
function load_plugins()
for v in io.popen('ls plugins_'):lines() do
if v:match(".lua$") then
local ok, err =  pcall(function()
local t = loadfile("plugins_/"..v)()
plugins[v] = t
end)
if not ok then
print('\27[31mError loading plugins_ '..v..'\27[39m')
print(tostring(io.popen("lua plugins_/"..v):read('*all')))
print('\27[31m'..err..'\27[39m')
end
end
end
end

function is_devmohmad(msg)  
local ta = false  
for k,v in pairs(sudo_users) do  
if msg.sender_user_id_ == v then  
ta = true  
end  end  
return ta  
end 
function is_sudo(msg) 
local hash = MOHMADdevVEER:sismember(devVEER..'sudo:bot',msg.sender_user_id_)  
if hash or is_devmohmad(msg)  then  
return true  
else  
return false  end  
end
function is_bot(msg) 
if tonumber(BOTS) == BOTS then 
return true 
else 
return false 
end end 
function is_owner(msg) 
local hash = MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,msg.sender_user_id_)    
if hash or is_devmohmad(msg) or is_sudo(msg) then    
return true    
else    
return false    
end end
function is_monsh(msg) 
local hash = MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,msg.sender_user_id_)    
if hash or  is_devmohmad(msg) or is_sudo(msg) or is_owner(msg) then    
return true    
else    
return false    
end end
function is_canban(msg) 
local hash = MOHMADdevVEER:sismember(devVEER..'SET:BAN'..msg.chat_id_,msg.sender_user_id_)    
if hash or  is_devmohmad(msg) or is_sudo(msg) or is_owner(msg) then    
return true    
else    
return false    
end end
function is_mod(msg) 
local hash = MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,msg.sender_user_id_)    
if hash or  is_devmohmad(msg) or is_sudo(msg) or is_owner(msg) or is_monsh(msg) then    
return true    
else    
return false    
end end
function is_vipgroups(msg)  
local hash = MOHMADdevVEER:sismember(devVEER..'vip:groups',msg.sender_user_id_) 
if hash or  is_devmohmad(msg) then 
return true 
else 
return false 
end end
function is_vipgroup(msg)  
local hash = MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,msg.sender_user_id_) 
if hash or  is_devmohmad(msg) or is_sudo(msg) or is_owner(msg) or is_mod(msg) or is_vipgroups(msg) then 
return true 
else 
return false 
end end
function is_memar(msg)  
local hash = MOHMADdevVEER:sismember(devVEER..'mepar',msg.sender_user_id_) 
if hash or  is_devmohmad(msg) or is_sudo(msg) or is_owner(msg) or is_mod(msg) or is_mod(msg) or is_vipgroup(msg) or is_vipgroups(msg) then 
return true 
else 
return false 
end end
function is_banned(chat,user) 
local hash =  MOHMADdevVEER:sismember(devVEER..'VEER:baned'..chat,user) 
if hash then return true 
else 
return false 
end end
function is_gban(chat,user) 
local hash =  MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',user) 
if hash then 
return true 
else 
return false 
end end
local function getChat(chat_id, cb, cmd) 
tdcli_function ({ ID = "GetChat", chat_id_ = chat_id }, cb or dl_cb, cmd) 
end  
local function getParseMode(parse_mode)  
local P  if parse_mode then  local mode = parse_mode:lower() if mode == 'markdown' or mode == 'md' then  P = {ID = "TextParseModeMarkdown"} elseif mode == 'html' then   P = {ID = "TextParseModeHTML"}    end  end  return P 
end    
function VEER_sendMsg(chat_id, replytomessageid, from_background, text, DisableWebPagePreview, parsemode, user, cd, VEER)
if parsemode and parsemode ~= nil and parsemode ~= false and parsemode ~= "" then
parsemode = getParseMode(parsemode) else parsemode = nil end
Entities = {}
if user then
if text:match('{') and text:match('}') then
local A = {text:match("{(.*)}")}
Length = utf8.len(A[1])
local B = {text:match("^(.*){")}
Offset = utf8.len(B[1])
text = text:gsub('{',' ')
text = text:gsub('}',' ')
table.insert(Entities,{ID = "MessageEntityMentionName", offset_ = Offset, length_ = Length, user_id_ = user})
end
Entities[0] = {ID='MessageEntityBold', offset_=0, length_=0}
if text:match('+') and text:match('-') then
local A = {text:match("+(.*)-")}
Length = utf8.len(A[1])
local B = {text:match("^(.*)+")}
Offset = utf8.len(B[1])
text = text:gsub('+','')
text = text:gsub('-','')
table.insert(Entities,{ID = "MessageEntityMentionName", offset_ = Offset, length_ = Length, user_id_ = user})
end
Entities[0] = {ID='MessageEntityBold', offset_=0, length_=0}
end
Entities[0] = {ID='MessageEntityBold', offset_=0, length_=0}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = replytomessageid or 0,disable_notification_ = 0,from_background_ = from_background,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = DisableWebPagePreview,clear_draft_ = 0,entities_ = Entities,parse_mode_ = parsemode,},}, cd or dl_cb,VEER or nil)
end
function sleep(n) os.execute("sleep " .. tonumber(n)) end  
function add_in_ch(msg)
local var = true
if MOHMADdevVEER:get(devVEER..'add:ch:id') then
tahaid = MOHMADdevVEER:get(devVEER..'add:ch:id')
tahauser = MOHMADdevVEER:get(devVEER..'add:ch:username')
local url , res = https.request("https://api.telegram.org/bot"..chaneel.."/getchatmember?chat_id="..tahaid.."&user_id="..msg.sender_user_id_);
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false
if MOHMADdevVEER:get(devVEER..'text:ch:user') then
local textchuser = MOHMADdevVEER:get(devVEER..'text:ch:user')
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '['..textchuser..']', 1, 'md')
else
chdeva = '\n*📮¦ لا تستطيع استخدام البوت 🍃\n📬¦ عليك الاشتراك في قناة البوت\n🔖¦ معرف القناة  ↡\n* ['..tahauser..']\n✓'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, chdeva, 1, 'md');
end
elseif data.ok then
return var
end
else
return var
end
end
local function VEER_send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function getrtp(chat,user) 
local sudoe = MOHMADdevVEER:sismember(devVEER..'sudo:bot',user) 
local noow = MOHMADdevVEER:sismember(devVEER..'moder'..chat,user) 
if tonumber(SUDO) == tonumber(user) or sudoe or monh   then 
return true 
else 
return false 
end 
end 
function getrtpno(chat,user) 
local moder =  MOHMADdevVEER:sismember(devVEER..'modergroup'..chat,user) 
local mod MOHMADdevVEER:sismember(devVEER..'mods:'..chat,user) 
if not moder or not mod  then 
return true 
else 
return false 
end 
end 
function sendMention(msg,chat,text,user)   
entities = {}   
entities[0] = {ID='MessageEntityBold', offset_=0, length_=0}   
if text and text:match('{') and text:match('}')  then   
local x = utf8.len(text:match('(.*){'))   
local offset = x + 1  
local y = utf8.len(text:match('{(.*)}'))   
local length = y + 1  
text = text:gsub('{','')   
text = text:gsub('}','')   
table.insert(entities,{ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user})   
end   
return tdcli_function ({ID="SendMessage", chat_id_=chat, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_=entities}}, dl_cb, nil)   
end
function CatchNamertprtp(Name) 
ChekName = utf8.sub(Name,0,25) 
Name = ChekName 
if utf8.len(Name) > 24 then
t=  Name..' ...' 
else
t = Name
end
return t
end
function changetitle(chat_id, title) 
tdcli_function ({ ID = "ChangeChatTitle", chat_id_ = chat_id, title_ = title  }, dl_cb, nil) 
end
function dl_cb(dol, info) 
end  
function getInputFile(file) 
if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end return infile 
end
function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, dl_cb, cmd) 
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageDocument",document_ = getInputFile(document),caption_ = caption},}, dl_cb, cmd) 
end
function getChatId(id) 
local chat = {} local id = tostring(id) if id:match('^-100') then local channel_id = id:gsub('-100', '') chat = {ID = channel_id, type = 'channel'} else local group_id = id:gsub('-', '') chat = {ID = group_id, type = 'group'} end return chat 
end
local function getChannelFull(channel_id,cb) 
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(channel_id).ID }, cb, nil) 
end 
local function getChannelMembers(channel_id, offset, filter, limit,cb) 
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = getChatId(channel_id).ID,filter_ = {ID = "ChannelMembers" .. filter},offset_ = offset,limit_ = limit}, cb, nil) 
end
local function chek_bots(channel,cb)  
local function callback_admins(extra,result,success)    limit = (result.member_count_ ) getChannelMembers(channel, 0, 'Bots', limit,cb)    VEER_sendMsg(channel, 0, 1,'💢*¦* تم طرد البوتات \n', 1, 'md') end  getChannelFull(channel,callback_admins) 
end
local function saddbyusername(username,cb)  
tdcli_function ({    ID = "SearchPublicChat",    username_ = username  }, cb, nil) 
end
function isnothtml(text) 
text = text:gsub("<code>", "")  	text = text:gsub("</code>", "")  	text = text:gsub("<b>", "")  	text = text:gsub("</b>", "")  	text = text:gsub("`", "")  	text = text:gsub("*", "")  	text = text:gsub("_", "_")   return text  
end
function deleteChatPhoto(chat_id) 
https.request('https://api.telegram.org/bot'..chaneel..'/deleteChatPhoto?chat_id='..chat_id) 
end
function setChatDescription(chat_id, description) 
https.request('https://api.telegram.org/bot'..chaneel..'/setChatDescription?chat_id=' .. chat_id .. '&description=' ..(description)) 
end
local function sendRequest(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra) 
tdcli_function ({  ID = request_id,    chat_id_ = chat_id,    reply_to_message_id_ = reply_to_message_id,    disable_notification_ = disable_notification,    from_background_ = from_background,    reply_markup_ = reply_markup,    input_message_content_ = input_message_content,}, callback or dl_cb, extra) 
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)  
local input_message_content = {   ID = "InputMessageVoice",   voice_ = getInputFile(voice),  duration_ = duration or 0,   waveform_ = waveform,    caption_ = caption  }  sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendSticker(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker, cb, cmd)  
local input_message_content = {    ID = "InputMessageSticker",   sticker_ = getInputFile(sticker),    width_ = 0,    height_ = 0  } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)  
local input_message_content = {    ID = "InputMessageDocument",    document_ = getInputFile(document),    caption_ = caption  } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
function s_api(web) 
local info, res = HTTPS.request(web) local req = json:decode(info) if res ~= 200 then return false end if not req.ok then return false end return req 
end 
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} response.keyboard = keyboard response.inline_keyboard = inline response.resize_keyboard = true response.one_time_keyboard = false response.selective = false  local send_api = "https://api.telegram.org/bot"..chaneel.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) if reply_id then send_api = send_api.."&reply_to_message_id="..reply_id end return s_api(send_api) 
end
function exportChatInviteLink(chat_id)  
local send_api = 'https://api.telegram.org/bot'..chaneel..'/exportChatInviteLink?chat_id='.. chat_id   local linkx = s_api(send_api).result  return linkx 
end
function getChatMember(chat_id, user_id, cb) 
tdcli_function ({   ID = "GetChatMember", chat_id_ = chat_id, user_id_ = user_id }, cb or dl_cb, nil) 
end
function seavusername(id)  tdcli_function ({ID = "GetUser",user_id_ = id},function(arg,data) 
local username = data.username_ if username then
MOHMADdevVEER:set(devVEER.."user:Name"..id, "@"..username)
print('\27[30;35m»» USERNAME IS SAEVE ↓\n»» @'..data.username_..'\n\27[1;37m') else
MOHMADdevVEER:del(devVEER.."user:Name"..id)
print('»» USERNAME IS NOT SAEVE') end
if data.type_.ID == "UserTypeBot" then
MOHMADdevVEER:del(devVEER.."user:Name"..id) end
if data.first_name_ == false then
MOHMADdevVEER:del(devVEER.."user:Name"..id)
end end,nil)   
end
function CatchName(Name,Num) 
ChekName = utf8.sub(Name,0,Num) Name = ChekName return Name..'' 
end
function CatchNamee(Name,Num) 
ChekName = utf8.sub(Name,0,Num) Name = ChekName..'' return Name 
end
function chek_admin(chat_id,set)  
local function saddadmen_or_moder(extra,result,success)    limit = result.administrator_count_    if tonumber(limit) > 0 then    getChannelMembers(chat_id, 0, 'Administrators', limit,set)      end    end  getChannelFull(chat_id,saddadmen_or_moder) 
end
local function saddmods_monshgtoup(channel_id, filter, offset, limit, cb, cmd)   
if not limit or limit > 200 then    limit = 200  end tdcli_function ({  ID = "GetChannelMembers", channel_id_ = getChatId(channel_id).ID, filter_ = {   ID = "ChannelMembers" .. filter    },    offset_ = offset or 0,    limit_ = limit  }, cb or dl_cb, cmd) 
end
function chek_moder(channel,cb)  
local function callback_admins(extra,result,success)   limit = result.administrator_count_  if tonumber(limit) > 0 then    getChannelMembers(channel, 0, 'Administrators', limit,cb)     else return VEER_sendMsg(channel, 0, 1,'', 1, 'md') end    end  getChannelFull(channel,callback_admins) 
end
function VEERset(chat_id, VEERphoto) 
tdcli_function ({ ID = "ChangeChatPhoto",chat_id_ = chat_id,photo_ = getInputFile(VEERphoto) }, dl_cb, nil) 
end
local function getUserFull(user_id) 
tdcli_function ({ ID = "GetUserFull", user_id_ = user_id }, dl_cb, nil) 
end

function string:split(sep)  
local sep, fields = sep or ":", {}  local pattern = string.format("([^%s]+)", sep)  self:gsub(pattern, function(c) fields[#fields+1] = c end) return fields 
end

function formsgg(msgs)  
local taha = ''  
if msgs < 100 then 
taha = 'غير متفاعل ❌' 
elseif msgs < 200 then 
taha = 'بده يتحسن ✔' 
elseif msgs < 400 then 
taha = 'شبه متفاعل ☄' 
elseif msgs < 700 then 
taha = 'متفاعل ⭐' 
elseif msgs < 1200 then 
taha = 'متفاعل قوي 🌟' 
elseif msgs < 2000 then 
taha = 'متفاعل جدا 🎖' 
elseif msgs < 3500 then 
taha = 'اقوى تفاعل 🌞'  
elseif msgs < 4000 then 
taha = 'متفاعل نار 💥' 
elseif msgs < 4500 then 
taha = 'قمة التفاعل 💎' 
elseif msgs < 5500 then 
taha = 'اقوى متفاعل 👑' 
elseif msgs < 7000 then 
taha = 'ملك التفاعل 🎭' 
elseif msgs < 9500 then 
taha = 'امبروطور التفاعل' 
elseif msgs < 10000000000 then 
taha = 'رب التفاعل 😂💜'  
end 
return taha 
end
function formsggroup(msgs) 
local taha = ''  
if msgs < 100 then 
taha = 'كلش ضعيف 😱' 
elseif msgs < 500 then 
taha = 'ضعيف 😩' 
elseif msgs < 1500 then 
taha = 'غير متفاعله 😰' 
elseif msgs < 5000 then 
taha = 'متوسط 😼' 
elseif msgs < 10000 then 
taha = 'متفاعله 😽' 
elseif msgs < 50000 then 
taha = 'في قمة التفاعل 😍' 
elseif msgs < 90000 then 
taha = 'كروب التفاعل 😻'  
elseif msgs < 100000 then 
taha = 'نار وشرار  🍃' 
elseif msgs < 10000000 then 
taha = 'اقوه تفاعل بتلكرام 🔥' 
end 
return taha 
end
function tfgroup(msgs) 
local taha = ''  
if msgs < 300 then 
taha = '✫'
elseif msgs < 1000 then 
taha = '✰'
elseif msgs < 2000 then 
taha = '✯'
elseif msgs < 3000 then 
taha = '⛤'
elseif msgs < 4000 then 
taha = '⭐'
elseif msgs < 10000000000 then 
taha = '🌟'
end 
return taha 
end
function get_mokforkick(chat_id,user_id)
if tonumber(user_id) == tonumber(SUDO) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',user_id) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..chat_id,user_id) then
t = 'المنشئ'
elseif MOHMADdevVEER:sismember(devVEER..'modergroup'..chat_id,user_id) then
t = 'المدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..chat_id,user_id) then
t = 'الادمن'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',user_id) then
t = 'المميز عام'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..chat_id,user_id) then
t = 'المميز'
else
t = ' '
end
return t 
end
function get_mok(chat_id,user_id)
if tonumber(user_id) == tonumber(SUDO) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',user_id) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..chat_id,user_id) then
t = 'المنشئ'
elseif MOHMADdevVEER:sismember(devVEER..'modergroup'..chat_id,user_id) then
t = 'المدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..chat_id,user_id) then
t = 'الادمن'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',user_id) then
t = 'مميز عام'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..chat_id,user_id) then
t = 'مميز'
else
t = ' '
end
return t 
end
function get_rtpa(chat_id,user_id)
if tonumber(user_id) == tonumber(SUDO) then
t = 'مطور اساسي 💥'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',user_id) then
t = 'مطور البوت 👨🏻‍💻'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..chat_id,user_id) then
t = 'منشئ 👨🏻‍✈️'
elseif MOHMADdevVEER:sismember(devVEER..'modergroup'..chat_id,user_id) then
t = 'مدير 👨🏻‍💼'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..chat_id,user_id) then
t = 'ادمن 👮🏻‍♂'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',user_id) then
t = 'مميز عام 🌟'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..chat_id,user_id) then
t = 'مميز ⭐'
else
t = 'عضو 🙋🏻‍♂'
end
return t 
end
function get_mok2(chat_id,user_id)
if tonumber(user_id) == tonumber(SUDO) then
t = 'المطورين'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',user_id) then
t = 'المطورين'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..chat_id,user_id) then
t = 'المنشئين'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',user_id) then
t = 'المميزين عام'
else
t = ' '
end
return t end
function get_mok3(chat_id,user_id)
if MOHMADdevVEER:sismember(devVEER..'modergroup'..chat_id,user_id) then
t = 'المدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..chat_id,user_id) then
t = 'الادمن'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..chat_id,user_id) then
t = 'المميز'
else
t = ' '
end
return t end
local function rem_lockal(chat_id)
MOHMADdevVEER:del(devVEER.."lock:user:name"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:hashtak"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Cmd"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Link"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:forward"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Keyboard"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:geam"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Photo"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Animation"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Video"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Audio"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:vico"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Sticker"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Document"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Unsupported"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Markdaun"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Contact"..chat_id)  MOHMADdevVEER:del(devVEER.."lock:Spam"..chat_id)
end
local function add_lockal(chat_id)
MOHMADdevVEER:set(devVEER.."lock:Bot:kick"..chat_id,'del')  MOHMADdevVEER:set(devVEER..'lock:tagservrbot'..chat_id,true)   MOHMADdevVEER:set(devVEER.."lock:user:name"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:hashtak"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Cmd"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Link"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:forward"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Keyboard"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:geam"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Photo"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Animation"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Video"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Audio"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:vico"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Sticker"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Document"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Unsupported"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Markdaun"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Contact"..chat_id,'del')    MOHMADdevVEER:set(devVEER.."lock:Spam"..chat_id,'del')  
end
function rem_group(chat_id) 
MOHMADdevVEER:srem(devVEER..'bot:gpsby:id',chat_id) MOHMADdevVEER:del(devVEER.."test:group"..chat_id)   MOHMADdevVEER:srem(devVEER.."bot:gps:id", chat_id) MOHMADdevVEER:del(devVEER.."add:bot:group"..chat_id,true) 
rem_lockal(chat_id) 
end
function add_group(chat_id) 
MOHMADdevVEER:sadd(devVEER..'bot:gpsby:id',chat_id) MOHMADdevVEER:sadd(devVEER.."botgps",chat_id)  MOHMADdevVEER:set(devVEER.."test:group"..chat_id,'VEER')    MOHMADdevVEER:set(devVEER.."add:bot:group"..chat_id, true)   
add_lockal(chat_id)
end
function get_rtba(msg) 
if is_devmohmad(msg) then 
t = 'المطور'  
elseif is_sudo(msg) then 
t = 'المطور'  
elseif is_owner(msg) then 
t = 'المنشئ'  
elseif is_monsh(msg) then 
t = 'المدير'  
elseif is_mod(msg) then 
t = 'الادمن'  
end  
return 
t 
end
function sendaction(chat_id, action, progress) 
tdcli_function ({ ID = "SendChatAction",  chat_id_ = chat_id, action_ = {  ID = "SendMessage" .. action .. "Action", progress_ = progress or 100} }, dl_cb, nil) 
end
function check_markdown(text)  
str = text if str then if str:match('_') then output = str:gsub('_',[[_]]) elseif str:match('*') then output = str:gsub('*','\\*') elseif str:match('`') then output = str:gsub('`','\\`') else output = str end return output end 
end
function is_filter(msg, value)  
local names = MOHMADdevVEER:smembers(devVEER..'filters:'..msg.chat_id_)  local var = false for i=1, #names do  if names[i] == value and not is_vipgroup(msg) then  var = true      end end return var  
end 
function is_muted(chat,user)
local hash =  MOHMADdevVEER:sismember(devVEER..'mutes'..chat,user) if hash then return true else return false end 
end
function VEERmonshn(chat_id, user_id, msg_id, text, offset, length) 
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) 
end
function VEER1(chat,user) 
local sudoe = MOHMADdevVEER:sismember(devVEER..'sudo:bot',user) local vipss = MOHMADdevVEER:sismember(devVEER..'vip:groups',user)  local monh = MOHMADdevVEER:sismember(devVEER..'modergroup'..chat,user)  local noow = MOHMADdevVEER:sismember(devVEER..'moder'..chat,user)  local nomo = MOHMADdevVEER:sismember(devVEER..'mods:'..chat,user)  local novip2 = MOHMADdevVEER:sismember(devVEER..'vip:group'..chat,user)  if tonumber(SUDO) == tonumber(user) or sudoe or vipss or monh  or noow or nomo  or novip2 then  return true  else  return false  end  
end 
function VEER2(chat,user) 
local sudoe = MOHMADdevVEER:sismember(devVEER..'sudo:bot',user) local vipss = MOHMADdevVEER:sismember(devVEER..'vip:groups',user)  local noow = MOHMADdevVEER:sismember(devVEER..'moder'..chat,user)  if tonumber(SUDO) == tonumber(user) or sudoe or vipss or noow  then  return true else  return false end 
end 
function VEER3(chat,user) 
local sudoe = MOHMADdevVEER:sismember(devVEER..'sudo:bot',user) local noow = MOHMADdevVEER:sismember(devVEER..'moder'..chat,user)  if tonumber(SUDO) == tonumber(user) or sudoe or monh   then return true else return false end 
end 
function VEER4(chat,user) 
local sudoe = MOHMADdevVEER:sismember(devVEER..'sudo:bot',user) local noow = MOHMADdevVEER:sismember(devVEER..'moder'..chat,user)  local monh = MOHMADdevVEER:sismember(devVEER..'modergroup'..chat,user)     local memr = MOHMADdevVEER:sismember(devVEER..'mepar',user)    if tonumber(SUDO) == tonumber(user) or sudoe or monh or memr or noow then     return true     else     return false     end     
end 
function getInputFile(file) 
local input = tostring(file) if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end return infile 
end
function send_inlineVEER(chat_id,text,keyboard,inline,reply_id) 
local url = 'https://api.telegram.org/bot'..chaneel if keyboard then VEERtoken = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard)) else VEERtoken = url .. '/sendMessage?chat_id=' ..chat_id.. '&text=' ..URL.escape(text)..'&parse_mode=html' end https.request(VEERtoken) 
end
local function getUserProfilePhotos(user_id, offset, limit, cb, cmd)  
tdcli_function ({  ID = "GetUserProfilePhotos",   user_id_ = user_id,  offset_ = offset,  limit_ = limit  }, cb or dl_cb, cmd) 
end
local function deleteMessages(chat_id, message_ids, cb, cmd)   
tdcli_function ({  ID = "DeleteMessages",  chat_id_ = chat_id,  message_ids_ = message_ids  }, cb or dl_cb, cmd) 
end
local function forwardMessages(chat_id, from_chat_id, message_ids, disable_notification, cb, cmd)  
tdcli_function ({    ID = "ForwardMessages",    chat_id_ = chat_id,    from_chat_id_ = from_chat_id,    message_ids_ = message_ids,    disable_notification_ = disable_notification,    from_background_ = 1 }, cb or dl_cb, cmd) 
end
function getUser(user_id, cb) 
tdcli_function ({   ID = "GetUser",  user_id_ = user_id }, cb, nil) 
end
local function getMessage(chat_id, message_id,cb) 
tdcli_function ({ ID = "GetMessage", chat_id_ = chat_id, message_id_ = message_id }, cb, nil) 
end 
function OpenChat(chat_id, cb) 
tdcli_function ({ID = "OpenChat",chat_id_ = chat_id}, cb or dl_cb, nil) 
end
function getChat(chat_id, dl_cb, cmd)
tdcli_function ({ID = "GetChat",chat_id_ = chat_id}, dl_cb, cmd) 
end
function pin(channel_id, message_id, disable_notification)   
tdcli_function ({  ID = "PinChannelMessage",  channel_id_ = getChatId(channel_id).ID,  message_id_ = message_id,  disable_notification_ = 1  }, dl_cb, cmd)   
end
local function timstoop() 
local uptime = io.popen("uptime -p"):read("*all") minutes = uptime:match(", %d+ minutes") or uptime:match(", %d+ minute") if minutes then minutes = minutes else minutes = "" end local c_ = string.match(minutes, "%d+") if c_ then c = c_ else c = 0 end return c..' دقيقه ' 
end
local function getUser(user_id,cb) 
tdcli_function ({ ID = "GetUser", user_id_ = user_id }, cb, nil) 
end 
local function changeChatMemberStatus(chat_id, user_id, status) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatus" .. status }, }, dl_cb, nil) 
end 
local function getChatHistory(chat_id, from_message_id, offset, limit,cb)
tdcli_function ({ ID = "GetChatHistory", chat_id_ = chat_id, from_message_id_ = from_message_id, offset_ = offset, limit_ = limit }, cb, nil) 
end 
local function getMe(cb) 
tdcli_function ({ID = "GetMe",}, cb, nil) 
end
local function unpinChannelMessage(channel_id) 
tdcli_function ({ ID = "UnpinChannelMessage", channel_id_ = getChatId(channel_id).ID }, dl_cb, nil) 
end 
local function pinChannelMessage(channel_id, message_id,disable_notification) 
tdcli_function ({ ID = "PinChannelMessage", channel_id_ = getChatId(channel_id).ID, message_id_ = message_id, disable_notification_ = disable_notification, }, dl_cb, nil) 
end
local function VEER_sendMssg(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..chaneel local url = send_api..'/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text) if reply_to_message_id ~= 0 then url = url .. '&reply_to_message_id=' .. reply_to_message_id/2097152/0.5  end if markdown == 'md' or markdown == 'markdown' then url = url..'&parse_mode=Markdown' elseif markdown == 'html' then url = url..'&parse_mode=HTML' end return s_api(url)  
end
local function GetInputFile(file)  
local file = file or ""   if file:match('/') then  infile = {ID= "InputFileLocal", path_  = file}  elseif file:match('^%d+$') then  infile = {ID= "InputFileId", id_ = file}  else  infile = {ID= "InputFilePersistentId", persistent_id_ = file}  end return infile 
end
local function sendAudio(chat_id,reply_id,audio,title,caption)  
tdcli_function({ID="SendMessage",  chat_id_ = chat_id,  reply_to_message_id_ = reply_id,  disable_notification_ = 0,  from_background_ = 1,  reply_markup_ = nil,  input_message_content_ = {  ID="InputMessageAudio",  audio_ = GetInputFile(audio),  duration_ = '',  title_ = title or '',  performer_ = '',  caption_ = caption or ''  }},dl_cb,nil)
end  
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local function sendChatAction(chatid,action,func) 
pcall(tdcli_function({ID = 'SendChatAction',chat_id_ = chatid,action_ = {ID = "SendMessage"..action.."Action",progress_ = 1},}, func or dl_cb,nil)) 
end
local function getchat(GroupID,func) 
pcall(tdcli_function({ID="GetChat",chat_id_ = GroupID},func or dl_cb,nil)) 
end
local function numrgroup(GroupID)  
tdcli_function ({ ID = "GetChannelFull",channel_id_ = getChatId(GroupID).ID },function(arg,tah)   MOHMADdevVEER:set(devVEER.."numgrop"..GroupID,tah.member_count_) end,nil)  return MOHMADdevVEER:get(devVEER.."numgrop"..GroupID)   
end
local function title_name(GroupID) 
pcall(tdcli_function({ID ="GetChat",chat_id_=GroupID },function(arg,data)  MOHMADdevVEER:set(devVEER..'group:name'..GroupID,data.title_)  end,nil)) return MOHMADdevVEER:get(devVEER..'group:name'..GroupID)  
end
local function changeChatTitle(chat_id, title) 
tdcli_function ({ ID = "ChangeChatTitle", chat_id_ = chat_id, title_ = title }, dl_cb, nil) 
end
local function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo,caption)   
tdcli_function ({ ID = "SendMessage",   chat_id_ = chat_id,   reply_to_message_id_ = reply_to_message_id,   disable_notification_ = disable_notification,   from_background_ = from_background,   reply_markup_ = reply_markup,   input_message_content_ = {   ID = "InputMessagePhoto",   photo_ = getInputFile(photo),   added_sticker_file_ids_ = {},   width_ = 0,   height_ = 0,   caption_ = caption  },   }, dl_cb, nil)  
end
local function setphoto(chat_id, photo) 
tdcli_function ({ ID = "ChangeChatPhoto",   chat_id_ = chat_id,  photo_ = getInputFile(photo) }, dl_cb, nil) 
end
local function getChatId(id) 
local chat = {} local id = tostring(id) if id:match('^-100') then local channel_id = id:gsub('-100', '') chat = {ID = channel_id, type = 'channel'} else local group_id = id:gsub('-', '') chat = {ID = group_id, type = 'group'} end return chat 
end
local function getUser(user_id, cb)  
tdcli_function({ID = "GetUser", user_id_ = user_id}, cb, nil) 
end
local function adduser(chat_id, user_id, forward_limit) 
tdcli_function ({ ID = "AddChatMember", chat_id_ = chat_id, user_id_ = user_id, forward_limit_ = forward_limit or 50 }, dl_cb, nil) 
end
local function kick(msg,chat,user)  
if tonumber(user) == tonumber(bot_id) then  return false  end  if VEER1(chat,user) then  else  changeChatMemberStatus(chat, user, "Kicked")  tdcli_function({ID="ChangeChatMemberStatus",chat_id_=chat,user_id_=user,status_={ID="ChatMemberStatusLeft"}},function(arg,ta) end,nil) end  
end
local function kicck(msg,chat,user)   
if tonumber(user) == tonumber(bot_id) then   return false   else  changeChatMemberStatus(chat, user, "Kicked")   tdcli_function({ID="ChangeChatMemberStatus",chat_id_=chat,user_id_=user,status_={ID="ChatMemberStatusLeft"}},function(arg,ta) end,nil)  end   
end
local function monsend(msg,chat,text,user)   
entities = {}   
entities[0] = {ID='MessageEntityBold', offset_=0, length_=0}   
if text and text:match('{') and text:match('}')  then   
local x = utf8.len(text:match('(.*){'))   
local offset = x + 1  
local y = utf8.len(text:match('{(.*)}'))   
local length = y + 1  
text = text:gsub('{','')   
text = text:gsub('}','')   
table.insert(entities,{ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user})   
end   
if text and text:match('❛') and text:match('❜') then   
local x = utf8.len(text:match('(.*)❛'))   
local offset = x + 2
local y = utf8.len(text:match('❛(.*)❜'))   
local length = y + 1
text = text:gsub('❛','')   
text = text:gsub('❜','')    
table.insert(entities,{ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user})   
end   
return tdcli_function ({ID="SendMessage", chat_id_=chat, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_=entities}}, dl_cb, nil)   end
local function get_id(msg,taha,text) 
local get_id = text local get_id = get_id:gsub('IDGET',msg.sender_user_id_) local get_id = get_id:gsub('USERGET',USERNAME_GET) local get_id = get_id:gsub('RTBGET',t) local get_id = get_id:gsub('RTGGET',rtpa) local get_id = get_id:gsub('MSGGET',tonumber(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 1)) local get_id = get_id:gsub('TFGET',formsgg(tonumber(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 1))) local get_id = get_id:gsub('PHOTOGET',taha.total_count_) local get_id = get_id:gsub('NKOGET',nko)
return get_id 
end
local function monsendwel(msg,chat,text,user)   
entities = {}   entities[0] = {ID='MessageEntityBold', offset_=0, length_=0}   if text and text:match('<VEER>') and text:match('</VEER>')  then   local x = utf8.len(text:match('(.*)<VEER>'))   local offset = x + 1  local y = utf8.len(text:match('<VEER>(.*)</VEER>'))   local length = y + 1  text = text:gsub('<VEER>','')   text = text:gsub('</VEER>','')   table.insert(entities,{ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user})   end   if text and text:match('❛') and text:match('❜') then   local x = utf8.len(text:match('(.*)❛'))   local offset = x   local y = utf8.len(text:match('❛(.*)❜'))   local length = y   text = text:gsub('❛','')   text = text:gsub('❜','')   table.insert(entities,{ID="MessageEntityBold", offset_=offset, length_=length})   end   return tdcli_function ({ID="SendMessage", chat_id_=chat, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_=entities}}, dl_cb, nil)   
end
local function addmod(chat_id)   
tdcli_function ({ID = "GetChannelMembers", channel_id_ = getChatId(chat_id).ID,filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100 },function(arg,data)  local admins = data.members_ for i=0 , #admins do  if data.members_[i].status_.ID == "ChatMemberStatusCreator" then owner_id = admins[i].user_id_  MOHMADdevVEER:sadd(devVEER..'moder'..chat_id,owner_id)   tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_ },function(arg,b)   if b.username_ == true then  MOHMADdevVEER:set(devVEER.."user:Name"..b.id_,"@"..b.username_) end end,nil)    end  if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then  MOHMADdevVEER:sadd(devVEER..'mods:'..chat_id,admins[i].user_id_)   tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_ },function(arg,b)   if b.username_ == true then  MOHMADdevVEER:set(devVEER.."user:Name"..b.id_,"@"..b.username_) end end,nil)    else  MOHMADdevVEER:srem(devVEER..'mods:'..chat_id,admins[i].user_id_)   end end end,nil)     
end
local function delete_msg(chatid,mid) 
tdcli_function ({ID="DeleteMessages", chat_id_=chatid, message_ids_=mid}, dl_cb, nil) 
end
local function trigger_anti_spam_mod(msg,type)
if type == 'del' then 
delete_msg(msg.chat_id_,{[0] = msg.id_})    
return false  
end 
end

local function trigger_anti_spam(msg,type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
if type == 'kick' then 
if data.username_ then
taha = '\n*📮¦ العضــو » ❪*[@'..data.username_..']*❫\n📬¦ قام بالتكرار هنا وتم طرده *'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, taha, 1, "md")  
kick(msg,msg.chat_id_,msg.sender_user_id_) 
else
kick(msg,msg.chat_id_,msg.sender_user_id_) 
VEERmonshn(msg.chat_id_, msg.sender_user_id_, msg.id_, '📮¦ العضــو » ( '..CatchName(data.first_name_,20)..' )\n📬¦ قام بالتكرار هنا وتم طرده \n' , 14, utf8.len(data.first_name_)) 
end
return false  
end 
if type == 'del' then 
delete_msg(msg.chat_id_,{[0] = msg.id_})    
end 
if type == 'keed' then
if data.username_ then
taha = '\n*📮¦ العضــو » ❪*[@'..data.username_..']*❫\n📬¦ قام بالتكرار هنا وتم تقييده *'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, taha, 1, "md")  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,msg.sender_user_id_) 
else
VEERmonshn(msg.chat_id_, msg.sender_user_id_, msg.id_, '📮¦ العضــو » ( '..CatchName(data.first_name_,20)..' )\n📬¦ قام بالتكرار هنا وتم تقييده \n' , 14, utf8.len(data.first_name_)) 
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,msg.sender_user_id_) 
end
return false  
end  
if type == 'mute' then
if data.username_ then
taha = '\n*📮¦ العضــو » ❪*[@'..data.username_..']*❫\n📬¦ قام بالتكرار هنا وتم كتمه *'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, taha, 1, "md")  
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_) 
else
VEERmonshn(msg.chat_id_, msg.sender_user_id_, msg.id_, '📮¦ العضــو » ( '..CatchName(data.first_name_,20)..' )\n📬¦ قام بالتكرار هنا وتم كتمه \n' , 14, utf8.len(data.first_name_))  
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_) 
end
return false  
end
end,nil)   
end  

function Tepy_Text(CMD, text, lower_case)
if text then
local MSG_TEXT = {}
if lower_case then
MSG_TEXT = { string.match(text:lower(), CMD) }
else
MSG_TEXT = { string.match(text, CMD) }
end
if next(MSG_TEXT) then
return MSG_TEXT
end
end
end

function Msg_Process(msg)
for name,plugin in pairs(plugins) do
if plugin.VEER_TEXT and msg then
print('\27[30;35m The Msg Process :'..name..'\n\27[1;37m')
pre_msg = plugin.VEER_TEXT(msg)
end
end
return VEER_sendMsg(msg.chat_id_, msg.id_, 1,pre_msg, 1, 'md')  
end

function match_plugin(msg, CMD, plugin, plugin_name)
MSG_TEXT = Tepy_Text(CMD, text)
if MSG_TEXT then
print('\27[30;35m The Text : '..CMD..' | In File : '..plugin_name..' \n\27[1;37m')
if plugin.VEER then
local TEXT = plugin.VEER(msg,MSG_TEXT)
if TEXT then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,TEXT, 1, 'md')  
end
end
return
end
end

function FILES_PLUGIN(plugin, plugin_name, msg)
for k, CMD in pairs(plugin.CMDS) do
match_plugin(msg, CMD, plugin, plugin_name)
end
end

function TEXT_FILES(msg)
for name, plugin in pairs(plugins) do
FILES_PLUGIN(plugin, name, msg)
end
end
print("____________________\nFILES IN BOT ↓")
print("____________________\n")
local files = io.popen('ls plugins_'):lines()
for fa in files do
if fa:match(".lua$") then
print(fa..'\n\n')
end
end 


load_plugins()
function SEND_FILES(msg)
Msg_Process(msg)
TEXT_FILES(msg)
end
function VEERadd(msg,data)
if msg then 
local text = msg.content_.text_
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print('OLD MESSAGE')
return false
end
if chat_type == 'super' then 
if msg.content_.ID == "MessageChatAddMembers" and not MOHMADdevVEER:get(devVEER..'lock:klsh:add'..bot_id) then   
for i=0,#msg.content_.members_ do    
addbotgrop = msg.content_.members_[i].id_    
if addbotgrop and addbotgrop == tonumber(bot_id) then  
local photo = MOHMADdevVEER:get("addreply1photo1"..bot_id)   
if photo then  
local klishwelc = MOHMADdevVEER:get("klish:welc"..bot_id)  
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, photo,klishwelc)     
else   
local klishwelc = '🚨¦ مرحبا صديقي انا بوت حمايه ،\n🛠¦ يمڪنني حمايه مجموعتڬ ،\n📮¦ ارفعني ڪمشرف في المجموعه ،\n📛¦ ۅمن بعدها يتم تفعيل المجموعه ،\n🎲¦ ويتم رفع الادمنيه والمدير تلقائيا\n'
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,'./requfiles/photo_VEER.jpg',klishwelc)     
end 
end   
end 
end
if text == 'مسح كليشه الترحيب' and is_devmohmad(msg) then
MOHMADdevVEER:del("klish:welc"..bot_id)  
MOHMADdevVEER:del("addreply1photo1"..bot_id)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦ تم مسح كليشه ترحيب عند اضافه البوت *\n', 1, 'md') 
end
if text == "متجر الملفات" or text == 'المتجر' then
if not is_devmohmad(msg) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦ هاذا الامر خاص بالمطور الاساسي *\n', 1, 'md') 
return false
end
local Get_Files, res = https.request("https://raw.githubusercontent.com/NOVAR1/NOVAR1/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
if Get_info then
local TextS = "\n📂¦ اهلا بك في متجر الملفات \n📮¦ الملفات الموجوده حاليا \n ٴ━━━━━━━━━━━━\n\n"
local TextE = "\nٴ━━━━━━━━━━━━\n📌¦ تدل علامة (✔) الملف مفعل\n".."📌¦ تدل علامة (✖) الملف معطل\n"
local NumFile = 0
for name in pairs(res.plugins_) do
local Check_File_is_Found = io.open("plugins_/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔)"
else
CeckFile = "(✖)"
end
NumFile = NumFile + 1
TextS = TextS..NumFile.."• `"..name..'` » '..CeckFile..'\n'
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1,TextS..TextE, 1, 'md') 
end
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1,"📮¦ لا يوجد اتصال من ال api \n", 1, 'md') 
end
return false
end

if text and text:match('تعطيل ملف (.*)') and is_devmohmad(msg) then  
local file = text:match('تعطيل ملف (.*)')
local file_bot = io.open("plugins_/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*🗂¦ الملف » {"..file.."}\n📬¦ تم تعطيله وحذفه بنجاح \n✓*"
else
t = "*📬¦ بالتاكيد تم تعطيل وحذف ملف » {"..file.."} \n✓*"
end
local json_file, res = https.request("https://raw.githubusercontent.com/NOVAR1/NOVAR1/master/plugins_/"..file)
if res == 200 then
os.execute("rm -fr plugins_/"..file)
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
load_plugins()
dofile('VEER.lua')  
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1,"*📮¦ عذرا لا يوجد هاكذا ملف في المتجر *\n", 1, 'md') 
end
return false
end
if text and text:match('تفعيل ملف (.*)') and is_devmohmad(msg) then  
local file = text:match('تفعيل ملف (.*)')
local file_bot = io.open("plugins_/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*📬¦ بالتاكيد تم تنزيل وتفعيل ملف » {"..file.."} \n✓*"
else
t = "*🗂¦ الملف » {"..file.."}\n📬¦ تم تنزيله وتفعيله بنجاح \n💥*"
end
local json_file, res = https.request("https://raw.githubusercontent.com/NOVAR1/NOVAR1/master/plugins_/"..file)
if res == 200 then
local chek = io.open("plugins_/"..file,'w+')
chek:write(json_file)
chek:close()
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
load_plugins()
dofile('VEER.lua')  
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1,"*📮¦ عذرا لا يوجد هاكذا ملف في المتجر *\n", 1, 'md') 
end
return false
end
if text == 'تحديث' and is_devmohmad(msg) then  
dofile('VEER.lua')  
load_plugins()
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ تم تحديث الملفات ♻* \n', 1, 'md') 
end 

if text == 'تفعيل' and not is_sudo(msg) and add_in_ch(msg) then      
if not MOHMADdevVEER:get(devVEER..'lock:bot:free'..bot_id) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa_add = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa_add = 'الادمن'
end
if msg.can_be_deleted_ == false then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ تنبيــــه لا استطيع تفعيل المجموعه انا لست ادمن يرجى ترقيتي ادمن *\n🍃\n", 1, "md") 
return false  end 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if MOHMADdevVEER:sismember(devVEER..'bot:gps:id',msg.chat_id_) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ المجموعه تم تفعيلها بالتاكيد \nꪜ*', 1, 'md')
MOHMADdevVEER:set(devVEER.."add:bot:group"..msg.chat_id_, true) 
else
addmod(msg.chat_id_) 
if ( data.member_count_ > tonumber(MOHMADdevVEER:get(devVEER..'setadd:bot'..bot_id) or 100) ) then
test = '*📮¦ تـم تفعيــل المجموعه بـنجـاح 🍃\n📬¦ تم ترقية المنشئ والادمنيه *\n\nꪜ'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,test, 1, 'md')
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,msg.sender_user_id_)  
MOHMADdevVEER:sadd(devVEER..'add:num'..msg.sender_user_id_,msg.chat_id_) 
MOHMADdevVEER:set(devVEER.."add:bot:group"..msg.chat_id_, true)  
MOHMADdevVEER:sadd(devVEER..'bot:gpsby:id', msg.chat_id_)   
MOHMADdevVEER:sadd(devVEER..'bot:gpsby:id:add', msg.chat_id_)   
MOHMADdevVEER:sadd(devVEER.."botgps", msg.chat_id_)  
MOHMADdevVEER:sadd(devVEER.."bot:gps:id", msg.chat_id_)  
else
local taha = MOHMADdevVEER:get(devVEER..'setadd:bot'..bot_id)
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '🔬*¦* المجموعه تحتوي على *{'..data.member_count_..'}* عضو\n💥*¦* لا استطيع تفعيل المجموعه \n📑*¦* يجب ان يكون عدد الاعضاء *{'..(taha or 100)..'}* \n ', 1, 'md') 
MOHMADdevVEER:del(devVEER.."test:group" .. msg.chat_id_)
end
if data.member_count_ > tonumber(MOHMADdevVEER:get(devVEER..'setadd:bot'..bot_id) or 100) and not is_devmohmad(msg) then    
local numadd = MOHMADdevVEER:scard(devVEER..'add:num'..msg.sender_user_id_)
if result.username_ then
usersdd = '\n*🔸¦ المعرف » ❪* [@'..(result.username_ or '')..'] ❫'
else
usersdd = ''
end 
local GetLin,res = https.request('https://api.telegram.org/bot'..chaneel..'/exportChatInviteLink?chat_id='..msg.chat_id_) 
if res ~= 200 then  
return false  
end 
local success, res = pcall(JSON.decode, GetLin) 
if res and res.result then
linkgp = '\n⚁¦ الاسم » ❪['..chat.title_..']('..res.result..')❫'
else
linkgp = '\n⚁¦ الاسم » ❪`'..chat.title_..'`❫'
end  
local text = '📮¦ اهلا بك عزيزي المطور الاساسي '..
'\n📬¦ تم تفعيل مجموعه جديده '..
'\n  ٴ━━━━━━━━━━'..
'\n🔖¦ معلومات المجموعه'..
'\n⚀¦ الايدي » ❪`'..msg.chat_id_..'`❫'..linkgp..
'\n⚂¦ عدد الاعضاء » ❪'..data.member_count_..'❫'..
'\n  ٴ━━━━━━━━━━'..
'\n💥¦ معلومات '..rtpa_add..' الي فعل المجموعه '..
'\n🔸¦ الايدي » ❪`'..msg.sender_user_id_..'`❫'..usersdd..
'\n🔸¦ الاسم » ❪['..CatchName(result.first_name_,45)..'](tg://user?id='..msg.sender_user_id_..')❫'
VEER_sendMssg(SUDO,text,0,'md')
end end end,nil) end,nil)   
end
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ انت لست ادمن في المجموعه *\n🍃\n", 1, "md") 
end
end,nil)   
end,nil) 
end
end  
if text == 'تفعيل' and is_sudo(msg) and add_in_ch(msg) then      
if msg.can_be_deleted_ == false then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ تنبيــــه لا استطيع تفعيل المجموعه انا لست ادمن يرجى ترقيتي ادمن *\n🍃\n", 1, "md") 
return false  end 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if MOHMADdevVEER:sismember(devVEER..'bot:gps:id',msg.chat_id_) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ المجموعه تم تفعيلها بالتاكيد \nꪜ*', 1, 'md')
MOHMADdevVEER:set(devVEER.."add:bot:group"..msg.chat_id_, true) 
else
addmod(msg.chat_id_) 
if ( data.member_count_ > tonumber(MOHMADdevVEER:get(devVEER..'setadd:bot'..bot_id) or 100) ) then
test = '*📮¦ تـم تفعيــل المجموعه بـنجـاح 🍃\n📬¦ تم ترقية المنشئ والادمنيه *\n\nꪜ'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,test, 1, 'md')
MOHMADdevVEER:sadd(devVEER..'add:num'..msg.sender_user_id_,msg.chat_id_) 
MOHMADdevVEER:set(devVEER.."add:bot:group"..msg.chat_id_, true)  
MOHMADdevVEER:sadd(devVEER..'bot:gpsby:id', msg.chat_id_)   
MOHMADdevVEER:sadd(devVEER..'bot:gpsby:id:add', msg.chat_id_)   
MOHMADdevVEER:sadd(devVEER.."botgps", msg.chat_id_)  
MOHMADdevVEER:sadd(devVEER.."bot:gps:id", msg.chat_id_)  
else
local taha = MOHMADdevVEER:get(devVEER..'setadd:bot'..bot_id)
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '🔬*¦* المجموعه تحتوي على *{'..data.member_count_..'}* عضو\n💥*¦* لا استطيع تفعيل المجموعه \n📑*¦* يجب ان يكون عدد الاعضاء *{'..(taha or 100)..'}* \n ', 1, 'md') 
MOHMADdevVEER:del(devVEER.."test:group" .. msg.chat_id_)
end
if data.member_count_ > tonumber(MOHMADdevVEER:get(devVEER..'setadd:bot'..bot_id) or 100) and not is_devmohmad(msg) then    
local numadd = MOHMADdevVEER:scard(devVEER..'add:num'..msg.sender_user_id_)
if result.username_ then
usersdd = '\n🔸¦ المعرف » ❪* [@'..(result.username_ or '')..'] *❫'
else
usersdd = ''
end 
local GetLin,res = https.request('https://api.telegram.org/bot'..chaneel..'/exportChatInviteLink?chat_id='..msg.chat_id_) 
if res ~= 200 then  
return false  
end 
local success, res = pcall(JSON.decode, GetLin) 
if res and res.result then
linkgp = '\n⚁¦ الاسم » ❪['..chat.title_..']('..res.result..')❫'
else
linkgp = '\n⚁¦ الاسم » ❪`'..chat.title_..'`❫'
end  
local text = '📮¦ اهلا بك عزيزي المطور الاساسي '..
'\n📬¦ تم تفعيل مجموعه جديده '..
'\n  ٴ━━━━━━━━━━'..
'\n🔖¦ معلومات المجموعه'..
'\n⚀¦ الايدي » ❪`'..msg.chat_id_..'`❫'..linkgp..
'\n⚂¦ عدد الاعضاء » ❪'..data.member_count_..'❫'..
'\n  ٴ━━━━━━━━━━'..
'\n💥¦ معلومات المطور '..
'\n🔸¦ الايدي » ❪`'..msg.sender_user_id_..'`❫'..usersdd..
'\n🔸¦ الاسم » ❪['..CatchName(result.first_name_,45)..'](tg://user?id='..msg.sender_user_id_..')❫'..
'\n🔸¦ عدد المجموعات الي فعلهن » ❪'..numadd..'❫' 
VEER_sendMssg(SUDO,text,0,'md')
end end end,nil) end,nil)   
MOHMADdevVEER:set(devVEER.."test:group"..msg.chat_id_,'VEER')   
end  
if text == 'تعطيل' and add_in_ch(msg) and is_sudo(msg) then      
if not MOHMADdevVEER:sismember(devVEER..'bot:gps:id',msg.chat_id_) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ المجموعه تم تعطيــلها بالتاكيد \nꪜ*', 1, 'md')
MOHMADdevVEER:del(devVEER.."add:bot:group"..msg.chat_id_, true)  
MOHMADdevVEER:del(devVEER.."test:group" .. msg.chat_id_)
else
test = '*📮¦ تـم تعطيــل المجموعه بـنجـاح 🍃 *\n\nꪜ'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,test, 1, 'md')
MOHMADdevVEER:del(devVEER.."add:bot:group"..msg.chat_id_, true)  
MOHMADdevVEER:srem(devVEER..'bot:gpsby:id', msg.chat_id_)   
MOHMADdevVEER:srem(devVEER.."bot:gps:id", msg.chat_id_)  
MOHMADdevVEER:srem(devVEER.."botgps", msg.chat_id_)  
MOHMADdevVEER:srem(devVEER..'add:num'..msg.sender_user_id_,msg.chat_id_) 
MOHMADdevVEER:del(devVEER.."test:group" .. msg.chat_id_)
if not is_devmohmad(msg) then    
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID}, function(arg,data)  
if result.username_ then
usersdd = '\n🔸¦ المعرف » ❪* [@'..(result.username_ or '')..'] *❫'
else
usersdd = ''
end
local GetLin,res = https.request('https://api.telegram.org/bot'..chaneel..'/exportChatInviteLink?chat_id='..msg.chat_id_) 
if res ~= 200 then  
return false  
end 
local success, res = pcall(JSON.decode, GetLin) 
if res and res.result then
linkgp = '\n*⚁¦ الاسم » ❪*['..title_name(msg.chat_id_)..']('..res.result..')❫'
else
linkgp = '\n*⚁¦ الاسم » ❪*`'..title_name(msg.chat_id_)..'`❫'
end  
local text = '*📮¦ اهلا بك عزيزي المطور الاساسي '..
'\n📬¦ تم تعطيل مجموعه جديده '..
'\n  ٴ━━━━━━━━━━'..
'\n🔖¦ معلومات المجموعه'..
'\n⚀¦ الايدي » ❪*`'..msg.chat_id_..'`*❫'..linkgp..
'\n⚂¦ عدد الاعضاء » ❪'..data.member_count_..'❫'..
'\n  ٴ━━━━━━━━━━'..
'\n💥¦ معلومات المطور '..
'\n🔸¦ الايدي » ❪*`'..msg.sender_user_id_..'`*❫'..usersdd..
'\n🔸¦ الاسم » ❪*['..CatchName(result.first_name_,20)..'](tg://user?id='..msg.sender_user_id_..')❫'
VEER_sendMssg(SUDO,text,0,'md')
end,nil)  end,nil) end end end
end
end
end
function VEER(msg,data) 
if msg then 
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print('OLD MESSAGE')
return false
end
MOHMADdevVEER:incr(devVEER..'groupmsg:'..msg.chat_id_..':') 
MOHMADdevVEER:incr(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) 
MOHMADdevVEER:incr(devVEER..'msg:chat:'..msg.chat_id_..':') 
MOHMADdevVEER:incr(devVEER..'msg:user:'..msg.chat_id_..':'..msg.sender_user_id_)
if msg.send_state_.ID == "MessageIsSuccessfullySent" then return false  end end
if msg.can_be_deleted_ == true and not is_mod(msg) then   tdcli_function ({ ID = "GetUser", user_id_ = msg.sender_user_id_ },function(arg,data)  if data.username_ == true then MOHMADdevVEER:set(devVEER.."user:Name"..msg.sender_user_id_,"@"..data.username_) end end,nil)
if MOHMADdevVEER:get(devVEER..'add:mepr:'..msg.chat_id_) and tonumber(MOHMADdevVEER:scard(devVEER..'addedtaha:'..msg.sender_user_id_)) == tonumber(MOHMADdevVEER:get(devVEER..'setadd:'..msg.chat_id_)) then  
MOHMADdevVEER:sadd(devVEER..'meaddwy:'..msg.chat_id_,msg.sender_user_id_)  
MOHMADdevVEER:del(devVEER.."addedtaha:"..msg.sender_user_id_)  
MOHMADdevVEER:srem(devVEER..'meaddtaha:'..msg.chat_id_,msg.sender_user_id_)  
tdcli_function ({
ID = "GetUser",
user_id_ = msg.sender_user_id_
},function(arg,data) 
if data.username_ then
VEER_sendMsg(msg.chat_id_,msg.id_,1,'*📬¦ العضو ↫ ❪*[@'..data.username_..']*❫*\n*💠¦ قمت باضافه ❪'..tonumber(MOHMADdevVEER:get(devVEER..'setadd:'..msg.chat_id_))..'❫* اعضاء \n*📮¦ الان يمكنك الدردشه هنا* \n💥',1,'md')  
else
taha = '📬¦ العضو ↫ ❪'..data.id_..'❫\n💠¦ قمت باضافه ❪'..tonumber(MOHMADdevVEER:get(devVEER..'setadd:'..msg.chat_id_))..'❫ اعضاء \n📮¦ الان يمكنك الدردشه هنا \n🍃'
VEERmonshn(msg.chat_id_, data.id_, 0, taha, 13, utf8.len(data.id_))  
end
end,nil)
elseif msg.content_.text_ and MOHMADdevVEER:get(devVEER..'add:mepr:'..msg.chat_id_) and not MOHMADdevVEER:sismember(devVEER..'meaddwy:'..msg.chat_id_,msg.sender_user_id_) and not MOHMADdevVEER:sismember(devVEER..'meaddtaha:'..msg.chat_id_,msg.sender_user_id_) then  
if tonumber(MOHMADdevVEER:scard(devVEER..'addedtaha:'..msg.sender_user_id_)) ~= tonumber(MOHMADdevVEER:get(devVEER..'setadd:'..msg.chat_id_)) then  
MOHMADdevVEER:sadd(devVEER..'meaddtaha:'..msg.chat_id_,msg.sender_user_id_)  
local mustadd = (MOHMADdevVEER:get(devVEER..'setadd:'..msg.chat_id_) or '0')  
tdcli_function ({
ID = "GetUser",
user_id_ = msg.sender_user_id_
},function(arg,data) 
if data.username_ then
taha = '\n*📮¦ العضو ↫ ❪*[@'..data.username_..']*❫*\n*💠¦ لا تستطيع الدردشه هنا*\n*📛¦ يجب عليك اضافة اعضاء*\n*📬¦ العدد المطاوب للاضافه ❪ '..(mustadd)..' ❫*'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, taha, 1, "md")  
else
taha = '📮¦ العضو ↫ ❪'..data.id_..'❫\n💠¦ لا تستطيع الدردشه هنا\n📛¦ يجب عليك اضافة اعضاء\n📬¦ العدد المطاوب للاضافه ❪ '..(mustadd)..' ❫'  
VEERmonshn(msg.chat_id_, data.id_, 0, taha, 13, utf8.len(data.id_))  
end
end,nil)
end  
end  
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if MOHMADdevVEER:get(devVEER..'add:mepr:'..msg.chat_id_) then  
if not MOHMADdevVEER:sismember(devVEER..'meaddwy:'..msg.chat_id_,msg.sender_user_id_) then  
if mem_id[i].username_ and mem_id[i].username_:match("[Bb][Oo][Tt]$") then  
return false  
else  
MOHMADdevVEER:sadd(devVEER..'addedtaha:'..msg.sender_user_id_,mem_id[i].id_)  
end  
end  
end  
end  
end  
if MOHMADdevVEER:get(devVEER..'add:mepr:'..msg.chat_id_) and not MOHMADdevVEER:sismember(devVEER..'meaddwy:'..msg.chat_id_,msg.sender_user_id_) then  
if msg.content_.ID == "MessageChatJoinByLink" then  
return false  
else  
deleteMessages(msg.chat_id_,{[0] = msg.id_})   
end 
end 
end
if msg.content_.photo_ and msg.reply_to_message_id_ == 0 then  
if MOHMADdevVEER:get(devVEER..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*💥¦* عذرا انا لست ادمن هنا \n', 1, 'md') 
MOHMADdevVEER:del(devVEER..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦* عذرا ليست لدي صلاحيه تغير معلومات المجموعه \n', 1, 'md') 
MOHMADdevVEER:del(devVEER..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_) 
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*🎆¦* تم تغيير صورة المجموعه \n✓', 1, 'md') 
end
end, nil) 
MOHMADdevVEER:del(devVEER..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_) 
end   
end
if msg.chat_id_ then 
local id = tostring(msg.chat_id_) 
if id:match('-100(%d+)') then 
chat_type = 'super'
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,data)   MOHMADdevVEER:set(devVEER..'group:name'..msg.chat_id_,data.title_) end,nil) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)  if data.username_ == true then MOHMADdevVEER:set(devVEER.."user:Name"..msg.sender_user_id_,"@"..data.username) end end,nil) 
if msg.can_be_deleted_ == true then
end
elseif id:match('^(%d+)') then 
chat_type = 'user' 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)  if data.username_ == true then MOHMADdevVEER:set(devVEER.."user:Name"..msg.sender_user_id_,"@"..data.username) else MOHMADdevVEER:del(devVEER.."user:Name"..msg.sender_user_id_)  end end,nil) 
MOHMADdevVEER:sadd(devVEER.."usersbot",msg.chat_id_)   
else 
chat_type = 'group' 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📮*¦* البوت لا يدعم المجموعات العاديه تم المغادره 🚨\n', 1, 'md')
changeChatMemberStatus(msg.chat_id_, bot_id, "Left")
end 
end
local text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
MOHMADdevVEER:incr(devVEER..'add:mempar'..msg.chat_id_..':'..msg.sender_user_id_) 
end
if MOHMADdevVEER:get(devVEER..'viewchannel'..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER..'viewchannel'..msg.sender_user_id_)
return false  end 
if not msg.forward_info_ then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📛¦* هاذا ليس توجيه من القناة', 1, 'md') 
MOHMADdevVEER:del(devVEER..'viewchannel'..msg.sender_user_id_) 
else 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '💥*¦*  عدد المشاهدات المنشور ( '..msg.views_..' ) مشاهده ♨', 1, 'md') 
MOHMADdevVEER:del(devVEER..'viewchannel'..msg.sender_user_id_) end end
if text then   
if is_filter(msg,text) then    
delete_msg(msg.chat_id_,{[0] = msg.id_})        
return false end   
end  
if MOHMADdevVEER:get(devVEER.."get:info:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."get:info:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
MOHMADdevVEER:del(devVEER.."get:info:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local ch = string.match(text, "(-%d+)") 
tdcli_function ({ ID = "GetChannelFull", 
channel_id_ = getChatId(ch).ID 
},function(arg,data) 
if data and data.channel_ and data.channel_.username_ ~= false then
usergp = '\n📮*¦* معرف المجموعه » ❪[@'..data.channel_.username_..']❫'
else
usergp = ''
end    
if data.message_ == "CHANNEL_INVALID" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📬¦* لا استطيع استخراج معلومات المجموعه  \n", 1, 'md')  
changeChatMemberStatus(ch, bot_id, "Left")
VEER_sendMsg(ch,0, 1, "*📛¦* يرجى تفعيل صلاحيات للبوت عندها يمكنك اضافتي\n", 1, 'md')  
return false  end
if data.message_ == "CHANNEL_PRIVATE" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📮¦* لا استطيع استخراج معلومات المجموعه  \n", 1, 'md')  
changeChatMemberStatus(ch, bot_id, "Left")
VEER_sendMsg(ch,0, 1, "*📬¦* يرجى تفعيل صلاحيات للبوت عندها يمكنك اضافتي\n", 1, 'md')  
return false  end
if data.channel_.status_.ID == "ChatMemberStatusMember" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📬¦* اني عضو بهاي المجموعه \n", 1, 'md')  
changeChatMemberStatus(ch, bot_id, "Left")
return false  end
local nummsg = tonumber(MOHMADdevVEER:get(devVEER..'groupmsg:'..ch..':')) 
local nummsgg = MOHMADdevVEER:get(devVEER..'groupmsg:'..ch..':') 
local GetLin,res = https.request('https://api.telegram.org/bot'..chaneel..'/exportChatInviteLink?chat_id='..ch) 
if res ~= 200 then  
return false  
end 
local success, res = pcall(JSON.decode, GetLin) 
if res and res.result then
linkgp = '\n*📃¦ الاسم » ❪*['..title_name(ch)..']('..res.result..')❫'
else
linkgp = '\n*📃¦ الاسم » ❪*`'..title_name(ch)..'`❫'
end  
local whogp =  '*\n👨🏻‍🎤¦ عدد الاعضاء » ❪'..data.member_count_..
'❫\n👨🏼‍✈️¦ عدد الادمنيه » ❪'..data.administrator_count_..
'❫\n💢¦ عدد المطرودين » ❪'..data.kicked_count_..
'❫\n⚜¦ الايدي » ❪*`'..(ch)..
'`❫\n*📩¦ عدد الرسائل الكروب » ❪'..nummsgg..
'❫\n💭¦ التفاعل » ❪'..formsggroup(nummsg)..
'❫*'..(linkgp)..usergp
VEER_sendMsg(msg.chat_id_, msg.id_, 1,whogp, 1, 'md') 
end,nil) 
end
if MOHMADdevVEER:get(devVEER.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
MOHMADdevVEER:del(devVEER.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local username = string.match(text, "@[%a%d_]+") 
tdcli_function ({    
ID = "SearchPublicChat",    
username_ = username  
},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه قناة *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذا لا يمكنك وضع معرف حسابات في الاشتراك *\n🍃', 1, 'md') 
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذا لا يمكنك وضع معرف مجوعه في الاشتراك *\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ البوت ادمن في القناة \n📮¦ تم تفعيل الاشتراك الاجباري في *\n*📮¦ ايدي القناة ('..data.id_..')*\n*📮¦ معرف القناة *([@'..data.type_.channel_.username_..'])\n💥', 1, 'md') 
MOHMADdevVEER:set(devVEER..'add:ch:id',data.id_)
MOHMADdevVEER:set(devVEER..'add:ch:username','@'..data.type_.channel_.username_)
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ البوت ليس ادمن في القناة يرجى ترقيته ادمن ثم اعادة المحاوله *\n💥', 1, 'md') 
end
return false  end
end,nil)
end
if MOHMADdevVEER:get(devVEER.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
MOHMADdevVEER:del(devVEER.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
MOHMADdevVEER:set(devVEER..'text:ch:user',texxt)
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ تم تغيير رسالة الاشتراك بنجاح *\n✓', 1, 'md')
end
if MOHMADdevVEER:get(devVEER.."get:link:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."get:link:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
MOHMADdevVEER:del(devVEER.."get:link:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local ch = string.match(text, "(-%d+)") 
function taha (arg ,data)   
vardump(data)
if data and data.invite_link_ == false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ ليس لدي صلاحية دعوة مستخدمين من الرابط *\n✓", 1, "md") 
return false  
end    
if data and data.channel_ and data.channel_.username_ ~= false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📮*¦* معرف المجموعه \n📬*¦* '..MOHMADdevVEER:get(devVEER..'group:name'..ch)..' \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n🍃*¦* [@'..data.channel_.username_..']', 1, 'md')    
return false  
end    
if data and data.code_ and data.code_ == 400 then    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* البوت تم طرده من المجموعه\n*📬¦* لا استطيع صنع رابط للمجموعه\n", 1, "md")    
rem_group(ch)   
return false  
end    
if data and data.channel_ and data.channel_.status_ and data.channel_.status_.ID == "ChatMemberStatusMember" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* البوت عضو في المجموعه\n*📬¦* لا استطيع استخراج رابط المجموعه \n*💠¦* تم مغادرة المجموعه وتعطيلها\n💥", 1, "md")    
rem_group(ch)   
changeChatMemberStatus(ch, bot_id, "Left")
VEER_sendMsg(ch, 0, 1, "*📮¦* البوت عضو هنا لا يستطيع نفعكم بشيئ \n*📬¦* تم مغادرة المجموعه\n💥", 1, "md")    
return false  
end    
local GetLin,res = https.request('https://api.telegram.org/bot'..chaneel..'/exportChatInviteLink?chat_id='..ch) 
if res ~= 200 then  
return false  
end 
local success, res = pcall(JSON.decode, GetLin) 
if data and data.channel_ and data.channel_.status_ and data.channel_.status_.ID == "ChatMemberStatusEditor" then
if MOHMADdevVEER:get(devVEER..'group:name'..ch) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📮*¦* رابط المجموعه \n📬*¦* '..MOHMADdevVEER:get(devVEER..'group:name'..ch)..' \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n🍃*¦* ['..(res.result or '..')..']', 1, 'md')    
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'💠*¦* رابط المجموعه \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n['..(res.result or '..')..']', 1, 'md')    
end
MOHMADdevVEER:set(devVEER.."numgrop"..ch,data.member_count_) 
tdcli_function({ID ="GetChat",chat_id_=ch},function(arg,ata) MOHMADdevVEER:set(devVEER..'group:name'..ch,ata.title_) end,nil)
end
end    
getChannelFull(ch, taha, {chat_id=ch,msg_id=msg.id})    
end 
if MOHMADdevVEER:get(devVEER..'namebot:witting'..msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER..'namebot:witting'..msg.sender_user_id_) 
return false  end 
MOHMADdevVEER:del(devVEER..'namebot:witting'..msg.sender_user_id_) 
MOHMADdevVEER:set(devVEER..'VEER:name',text) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*♻¦* تم تغير اسم البوت \n",1, 'md')  
end 
if MOHMADdevVEER:get(devVEER.."welc:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."welc:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
MOHMADdevVEER:del(devVEER.."welc:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local welcome = text:match("(.*)")  
MOHMADdevVEER:set(devVEER..'welcome:'..msg.chat_id_,welcome) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'\n📬*¦* تم وضع الترحيب \n', 1, 'md')    
end
if MOHMADdevVEER:get(devVEER.."numadd:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."numadd:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
MOHMADdevVEER:del(devVEER.."numadd:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
MOHMADdevVEER:set(devVEER..'setadd:bot'..bot_id,numadded)  VEER_sendMsg(msg.chat_id_, msg.id_,  1, "📬*¦* تم وضع عدد الاضافه *{ "..numadded..' }*', 1, 'md')  
end
if MOHMADdevVEER:get(devVEER.."set:description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."set:description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  end 
MOHMADdevVEER:del(devVEER.."set:description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
local Description = text:match("(.*)") 
setChatDescription(msg.chat_id_, Description) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'\n📬*¦* تم وضع وصف للمجموعه \n', 1, 'md')   
end 

if MOHMADdevVEER:get(devVEER.."photo:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."photo:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  end 
MOHMADdevVEER:del(devVEER.."photo:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  local pro = tonumber(text:match("(%d+)")) local function myprofile(extra, result, success) if result.total_count_ == 0 then VEER_sendMsg(msg.chat_id_, msg.id_,  1, '*🔖¦* عذرا انت لا تمتلك صور في البروفايل\n', 1, 'md') else if result.total_count_ >= pro then if result.photos_[0] then sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_, '\n🌄¦ صورتك رقم  '..pro..' \n📋¦ عدد صورك  '..result.total_count_..' \n📊¦ حجم صورتك  '..result.photos_[0].sizes_[1].photo_.size_..' ') end else VEER_sendMsg(msg.chat_id_, msg.id_,  1, '\n*📛¦* انت لا تمتلك صوره رقم  *{'..pro..'}*\n*🌁¦* عدد صورك هي *{'..result.total_count_..'}*', 1, 'md')  end end end getUserProfilePhotos(msg.sender_user_id_, pro-1, 1000, myprofile)  end
if MOHMADdevVEER:get(devVEER.."link:group"..msg.chat_id_) == 'setlinkwai' and is_mod(msg) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."link:group" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
else  
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local glink = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
local hash = "link:group"..msg.chat_id_   
MOHMADdevVEER:set(devVEER..hash,glink)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦* تم حفظ الرابط الخاص بالمجموعه', 1, 'md')  
end   
end 
end
if MOHMADdevVEER:get(devVEER.."bc:in:gropsfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الاذاعه بالتوجيه للمجموعات *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."bc:in:gropsfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  end 
if msg.forward_info_ then 
local gps = MOHMADdevVEER:scard(devVEER..'bot:gpsby:id')   
local list = MOHMADdevVEER:smembers(devVEER..'botgps')   
for k,v in pairs(list) do  
forwardMessages(v, msg.chat_id_, {[0] = msg.id_}, 1)  
end   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ تم اذاعة الرساله الى » ❪"..gps.."❫ مجموعات في البوت *\n✓", 1, "md")     
MOHMADdevVEER:del(devVEER.."bc:in:gropsfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if MOHMADdevVEER:get(devVEER..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_) 
return false  end 
end
if MOHMADdevVEER:get(devVEER.."bc:in:allfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الاذاعه بالتوجيه للكل *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."bc:in:allfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  end 
if msg.forward_info_ then 
local list = MOHMADdevVEER:smembers(devVEER..'botgps')   
for k,v in pairs(list) do  
forwardMessages(v, msg.chat_id_, {[0] = msg.id_}, 1)  
end   
local list = MOHMADdevVEER:smembers(devVEER..'usersbot')   
for k,v in pairs(list) do  
forwardMessages(v, msg.chat_id_, {[0] = msg.id_}, 1)  
end   
end 
local gpspv = MOHMADdevVEER:scard(devVEER..'usersbot')   
local gps = MOHMADdevVEER:scard(devVEER..'bot:gpsby:id')   
local gmfwd = '📮*¦ تمت اذاعة الى *'..
'\n*⚀¦ » ❪'..gpspv..'❫* مشترك في الخاص'..
'\n*⚁¦ » ❪'..gps..'❫* مجموعه في البوت\n💥' 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, gmfwd, 1, 'md')
MOHMADdevVEER:del(devVEER.."bc:in:allfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
if MOHMADdevVEER:get(devVEER.."bc:in:pvfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_,msg.id_ , 1, "*📬¦ تم الغاء الاذاعه بالتوجيه للخاص *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."bc:in:pvfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  end 
if msg.forward_info_ then 
local gps = MOHMADdevVEER:scard(devVEER..'usersbot')   
local list = MOHMADdevVEER:smembers(devVEER..'usersbot')   
for k,v in pairs(list) do  
forwardMessages(v, msg.chat_id_, {[0] = msg.id_}, 1)  
end   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ تم اذاعة الرساله الى » ❪"..gps.."❫ مشترك في البوت *\n✓", 1, "md")     
MOHMADdevVEER:del(devVEER.."bc:in:pvfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if MOHMADdevVEER:get(devVEER.."bc:in:grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الاذاعه للمجموعات *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."bc:in:grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
else 
local gps = MOHMADdevVEER:scard(devVEER.."bot:gpsby:id") or 0 
if msg.content_.text_ then
whatbc = 'الرساله'
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
VEER_sendMsg(v, 0, 1, '[ '..msg.content_.text_..' ]', 1, 'md')  
end
elseif msg.content_.photo_ then
whatbc = 'الصور'
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
whatbc = 'المتحركه'
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
whatbc = 'الملصق'
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ تم اذاعة "..whatbc.." الى » ❪"..gps.."❫ مجموعات في البوت *\n✓", 1, "md")     
MOHMADdevVEER:del(devVEER.."bc:in:grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if MOHMADdevVEER:get(devVEER.."bc:in:all" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then  
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الاذاعه للكل *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."bc:in:all" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)  
else  
local gps = MOHMADdevVEER:scard(devVEER.."bot:gpsby:id") or 0  
if msg.content_.text_ then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
VEER_sendMsg(v, 0, 1, '[ '..msg.content_.text_..' ]', 1, 'md')  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
local gpsv = MOHMADdevVEER:scard(devVEER.."usersbot") or 0 
if msg.content_.text_ then
whatbc = 'الرساله'
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
VEER_sendMsg(v, 0, 1, '[ '..msg.content_.text_..' ]', 1, 'md')  
end
elseif msg.content_.photo_ then
whatbc = 'الصور'
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
whatbc = 'المتحركه'
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
whatbc = 'الملصق'
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
local text = '📮*¦ تمت اذاعة '..whatbc..' الى *'..
'\n*⚀¦ » ❪'..gpsv..'❫* مشترك في الخاص'..
'\n*⚁¦ » ❪'..gps..'❫* مجموعه في البوت\n💥' 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md')
MOHMADdevVEER:del(devVEER.."bc:in:all" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)  
end 
end
if MOHMADdevVEER:get(devVEER.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الاذاعه للمشتركين *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
else 
local gps = MOHMADdevVEER:scard(devVEER.."usersbot") or 0 
if msg.content_.text_ then
whatbc = 'الرساله'
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
VEER_sendMsg(v, 0, 1, '[ '..msg.content_.text_..' ]', 1, 'md')  
end
elseif msg.content_.photo_ then
whatbc = 'الصور'
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
whatbc = 'المتحركه'
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
whatbc = 'الملصق'
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ تم اذاعة "..whatbc.." الى » ❪"..gps.."❫ مشترك في البوت *\n✓", 1, "md")     
MOHMADdevVEER:del(devVEER.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if MOHMADdevVEER:get(devVEER.."rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  end 
local rules = msg.content_.text_ MOHMADdevVEER:set(devVEER.."rules:group" .. msg.chat_id_, rules) VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦*تم حفظ القوانين ✔",  1, "md") end  MOHMADdevVEER:del(devVEER.."rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
if MOHMADdevVEER:get(devVEER.."sudo:dev" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."sudo:dev" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
MOHMADdevVEER:del(devVEER.."sudo:dev" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local dev = text:match("(.*)") MOHMADdevVEER:set(devVEER.."dev", dev)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'\n*📛¦* تم وضع كليشه المطور \n', 1, 'md')   
end
if MOHMADdevVEER:get(devVEER.."start:msgofstart" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."start:msgofstart" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
MOHMADdevVEER:del(devVEER.."start:msgofstart" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
local msgofstart = text:match("(.*)")  
MOHMADdevVEER:set(devVEER.."start:msgofstart1", msgofstart)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📛¦* تم وضع كليشه ستارت \n', 1, 'md')   
end

if MOHMADdevVEER:get(devVEER.."sudo:pv" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."sudo:pv" .. msg.chat_id_ .. "" .. msg.sender_user_id_) 
return false  end 
MOHMADdevVEER:del(devVEER.."sudo:pv" .. msg.chat_id_ .. "" .. msg.sender_user_id_) 
local pvstart = text:match("(.*)") 
MOHMADdevVEER:set(devVEER.."pvstart", pvstart)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'\n*📛¦* تم وضع الرد في التواصل \n', 1, 'md')  
end
if chat_type == 'user' then
if text == '/start' then  
if is_devmohmad(msg) then
local taha = '*📮¦ اهلا بك عزيزي المطور 🍃'..
'\n📬¦ هاذه اوامر الكيبورد خاصه بك'..
'\n🔖¦ ارسل الاوامر لعرض اوامر التواصل*'..
'\n🔰¦ ارسل امر وضع اسم البوت لوضع اسم لبوتك\nꪜ'
local keyboard = {
{'تفعيل تواصل 📨','تعطيل تواصل 📩','تحديث ♻','الاحصائيات 🔭'},
{'تفعيل البوت الخدمي 🎮','تعطيل البوت الخدمي 🚸','المجموعات 📇'},
{'مسح المحظورين 📢','الاعدادات 🔏','الاوامر 📑'},
{"اذاعه بالتوجيه 📬","اذاعه عام بالتوجيه 💾","اذاعه خاص بالتوجيه 🔖"},
{"اذاعه 📡","اذاعه للكل 📡","اذاعه خاص 📡"},
{"تحديث السورس 🔱",'مسح المشتركين 💯','مسح المجموعات 💯'},
{"وضع اسم البوت ⚡",'استخراج الرابط 🔦',"كشف 🔍"},
{'مسح قائمه العام 🚷','مسح المميزين عام 🌟','مسح المطورين 👮'},
{'ضع رد تواصل 💻','ضع كليشه المطور 🎐','ضع كليشه ستارت 📠'},
{'تعطيل رساله الترحيب 📱','تفعيل رساله الترحيب 🎌','ضع عدد الاعضاء 📜'},
{"حذف كليشه المطور 🀄","حذف كليشه ستارت 🃏","حذف رد التواصل 📌"},
{"جلب رد التواصل 📚","جلب كليشه ستارت 📚"},
{'المطورين 📑','المحظورين عام 💥','المميزين عام 📑'},
{'الغاء ✖'}}
send_inline_key(msg.chat_id_,taha,keyboard)
else
if not MOHMADdevVEER:get(devVEER..'START:STOP'..msg.sender_user_id_) then
function bot_kick(extra, result, success)  
if result.username_ then
username = '❪[@'..result.username_..']❫'
else
username = ''
end
MOHMADdevVEER:sadd(devVEER.."usersbot",msg.chat_id_)   
local start = MOHMADdevVEER:get(devVEER.."start:msgofstart1")  
if start then 
local text = ''..check_markdown(start)..'' 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,(text), 1, 'md')  
else
local taha = '\n📮¦ اهلا بك عزيزي '..username..''..
'\n📬¦ انا بوت اسمي ❪'..NAMEBOT..'❫'..
'\n⭐¦ اختصاصي حماية كروبات المتفاعله'..
'\n🔖¦ لتفعيل البوت اتبع مايلي'..
'\n⚀¦ اضف البوت الى المجموعه'..
'\n⚁¦ ارفع البوت ادمن في المجموعه'..
'\n⚂¦ سيتم تفعيل البوت ورفع مشرفي الكروب'..
'\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ'..
'\n🎭¦ مطور البوت ❪['..SUDOUSERNAME..']❫' 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
end 
end  
getUser(msg.sender_user_id_, bot_kick)   
end
end
MOHMADdevVEER:setex(devVEER..'START:STOP'..msg.sender_user_id_,300,true)
end 
if text and text:match('(.*)') and not text:match('/start')  and not is_devmohmad(msg) or  msg.content_.ID == "MessageUnsupported" or msg.content_.ID == 'MessagePhoto' or msg.content_.ID == 'MessageDocument' or msg.content_.photo_ or msg.content_.ID == 'MessageSticker' or msg.content_.ID == 'MessageAudio' or msg.content_.audio_ or msg.content_.ID == 'MessageAnimation' or msg.content_.ID == 'MessageVideo' or msg.content_.video_  or msg.content_.ID == 'MessageContact' or msg.content_.ID == 'MessageVoice' then     
if text  or msg.content_.ID == 'MessageVoice' or msg.content_.ID == 'MessageAudio' or msg.content_.ID == 'MessagePhoto' or msg.content_.ID == 'MessageDocument' or msg.content_.photo_ or msg.content_.ID == 'MessageSticker' or msg.content_.ID == 'MessageAudio' or msg.content_.ID == 'MessageAnimation' or msg.content_.ID == 'MessageVideo' or msg.content_.ID == 'MessageContact' or msg.content_.ID == 'MessageVoice'  then  
if tonumber(MOHMADdevVEER:get('numlocktextpv'..bot_id..msg.sender_user_id_) or 1) >= 100 then      
return false  end   
end  
if not is_devmohmad(msg) then
if msg.forward_info_ and  MOHMADdevVEER:get(devVEER..'lock:fwd'..bot_id) then     
return false  end    
if  msg.content_.ID == 'MessagePhoto' and MOHMADdevVEER:get(devVEER..'lock:photo'..bot_id) then      
return false  end     
if msg.content_.ID == 'MessageDocument' and  MOHMADdevVEER:get(devVEER..'lock:file'..bot_id) then     
return false  end    
if msg.content_.ID == 'MessageSticker' and  MOHMADdevVEER:get(devVEER..'lock:ste'..bot_id) then     
return false  end    
if msg.content_.ID == 'MessageVoice' and  MOHMADdevVEER:get(devVEER..'lock:musec'..bot_id) then     
return false  end    
if msg.content_.ID == 'MessageContact' and  MOHMADdevVEER:get(devVEER..'lock:phon'..bot_id) then     
return false  end    
if msg.content_.ID == 'MessageVideo' and  MOHMADdevVEER:get(devVEER..'lock:ved'..bot_id) then     
return false  end    
if msg.content_.ID == 'MessageAnimation' and  MOHMADdevVEER:get(devVEER..'lock:gif'..bot_id) then     
return false  end    
if msg.content_.ID == 'MessageAudio' and  MOHMADdevVEER:get(devVEER..'lock:vico'..bot_id) then     
return false  end    
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") then 
if MOHMADdevVEER:get(devVEER..'lock:links'..bot_id) then      
return false  end  
end
end  
if not MOHMADdevVEER:get(devVEER..'lock:botl'..bot_id) then    
if not is_devmohmad(msg) then     
local pvstart = MOHMADdevVEER:get(devVEER.."pvstart")    
if pvstart then    
VEER_sendMsg(msg.sender_user_id_, 0, 1, ''..check_markdown(pvstart)..'', 1, "md")    
else    
VEER_sendMsg(msg.sender_user_id_, msg.id_, 1, '📬*¦* تم ارسال رسالتك الى المطور\n*📛¦* اشترك في قناة المطور \n*🚸¦* [اضغط هنا للدخول الى قناة](https://t.me/joinchat/AAAAAER6jyl2e40Gsx8QkQ) \n', 1, "md")    
end     
if not MOHMADdevVEER:sismember(devVEER.."usersbot",msg.chat_id_) then    
MOHMADdevVEER:sadd(devVEER.."usersbot",msg.chat_id_)    
local pvstart = MOHMADdevVEER:get(devVEER.."pvstart")    
end    
tdcli_function ({ID = "ForwardMessages",    chat_id_ = SUDO,    from_chat_id_ = msg.sender_user_id_,    message_ids_ = {[0] = msg.id_},    disable_notification_ = 1,    from_background_ = 1 },function(arg,data) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,ta) 
if data.messages_[0].content_.sticker_ then
if ta.username_ == false then
local text = '📬¦ تم ارسال الملصق \n📮¦ من ↫ ❪ '..CatchName(ta.first_name_,20)..' ❫\n✓'
VEERmonshn(SUDO, msg.sender_user_id_, 0, text, 32, utf8.len(ta.first_name_)) 
else
zo = '📬¦ تم ارسال الملصق \n*📮¦ من ↫ ❪ *[@'..ta.username_..'] ❫\n✓'
VEER_sendMsg(SUDO, 0, 1, zo, 1, "md") 
end end end,nil) end,nil)
end end end    
if is_devmohmad(msg) and msg.reply_to_message_id_ ~= 0  then     
function bot_in_daerct(extra, result, success)    
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
if text =='حظر' then
tdcli_function ({ID = "GetUser",user_id_ = id_user
},function(arg,data) 
if not MOHMADdevVEER:sismember(devVEER..'pv:ban'..msg.chat_id_,id_user) then
if data.username_ == false then
local text = '📮¦ العضــو ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم حظره من التواصل\n✓'
MOHMADdevVEER:incrby('numlocktextpv'..bot_id..id_user,10000000)    MOHMADdevVEER:sadd(devVEER..'pv:ban'..msg.chat_id_,id_user) 
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 16, utf8.len(CatchName(data.first_name_,15)))  
else
zo = '*📮¦ العضــو ↫ ❪ *[@'..data.username_..'] ❫\n*📬¦ تم حظره من التواصل\n✓*'
MOHMADdevVEER:incrby('numlocktextpv'..bot_id..id_user,10000000)    MOHMADdevVEER:sadd(devVEER..'pv:ban'..msg.chat_id_,id_user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
else
if data.username_ == false then
local text = '📮¦ العضــو ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتأكيد تم حظره من التواصل\n✓'
MOHMADdevVEER:incrby('numlocktextpv'..bot_id..id_user,10000000)    MOHMADdevVEER:sadd(devVEER..'pv:ban'..msg.chat_id_,id_user) 
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 16, utf8.len(CatchName(data.first_name_,15)))  
else
zo = '*📮¦ العضــو ↫ ❪ *[@'..data.username_..'] ❫\n*📬¦ بالتأكيد تم حظره من التواصل\n✓*'
MOHMADdevVEER:incrby('numlocktextpv'..bot_id..id_user,10000000)    MOHMADdevVEER:sadd(devVEER..'pv:ban'..msg.chat_id_,id_user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
end
end,nil)
return false  end 
if text =='الغاء الحظر' then
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if MOHMADdevVEER:sismember(devVEER..'pv:ban'..msg.chat_id_,id_user) then
if data.username_ == false then
local text = '📮¦ العضــو ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم الغاء حظره من التواصل\n✓'
MOHMADdevVEER:del('numlocktextpv'..bot_id..id_user)    MOHMADdevVEER:srem(devVEER..'pv:ban'..msg.chat_id_,id_user)
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 16, utf8.len(CatchName(data.first_name_,15)))  
else
zo = '*📮¦ العضــو ↫ ❪ *[@'..data.username_..'] ❫\n*📬¦ تم الغاء حظره من التواصل\n✓*'
MOHMADdevVEER:del('numlocktextpv'..bot_id..id_user)    MOHMADdevVEER:srem(devVEER..'pv:ban'..msg.chat_id_,id_user)
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
else
if data.username_ == false then
local text = '📮¦ العضــو ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتأكيد تم الغاء حظره من التواصل\n✓'
MOHMADdevVEER:del('numlocktextpv'..bot_id..id_user)    MOHMADdevVEER:srem(devVEER..'pv:ban'..msg.chat_id_,id_user)
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 16, utf8.len(CatchName(data.first_name_,15)))  
else
zo = '*📮¦ العضــو ↫ ❪ *[@'..data.username_..'] ❫\n*📬¦ بالتأكيد تم الغاء حظره من التواصل\n✓*'
MOHMADdevVEER:del('numlocktextpv'..bot_id..id_user)    MOHMADdevVEER:srem(devVEER..'pv:ban'..msg.chat_id_,id_user)
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
end
end,nil)
return false  end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
local taha = '\n📬¦ فشل ارسال رسالتك لان العضو قام بحظر البوت'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, taha, 1, "md") 
return false  end 
if text then    
VEER_sendMsg(id_user,msg.id_,  1,  text, 1, 'html')    
if data.username_ == false then
local text = '📬¦ تم ارسال رسالتك \n📮¦ الى ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n✓'
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 33, utf8.len(CatchName(data.first_name_,15))) 
else
zo = '📬¦ تم ارسال رسالتك \n*📮¦ الى ↫ ❪ *[@'..data.username_..'] ❫\n✓'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
end    
if msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
if data.username_ == false then
local text = '📬¦ تم ارسال رسالتك \n📮¦ الى ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n✓'
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 33, utf8.len(CatchName(data.first_name_,15))) 
else
zo = '📬¦ تم ارسال رسالتك \n*📮¦ الى ↫ ❪ *[@'..data.username_..'] ❫\n✓'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
end      
if msg.content_.ID == 'MessagePhoto' then    
if msg.content_.photo_.sizes_[0] then    
end    
sendPhoto(id_user, msg.id_, 0, 1, nil,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
if data.username_ == false then
local text = '📬¦ تم ارسال الصوره \n📮¦ الى ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n✓'
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 33, utf8.len(CatchName(data.first_name_,15))) 
else
zo = '📬¦ تم ارسال رسالتك \n*📮¦ الى ↫ ❪ *[@'..data.username_..'] ❫\n✓'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
end     
if msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
if data.username_ == false then
local text = '📬¦ تم ارسال المتحركه \n📮¦ الى ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n✓'
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 35, utf8.len(CatchName(data.first_name_,15))) 
else
zo = '📬¦ تم ارسال رسالتك \n*📮¦ الى ↫ ❪ *[@'..data.username_..'] ❫\n✓'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
end     
if msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_)    
if data.username_ == false then
local text = '📬¦ تم ارسال الصوت \n📮¦ الى ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n✓'
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 32, utf8.len(CatchName(data.first_name_,15))) 
else
zo = '📬¦ تم ارسال رسالتك \n*📮¦ الى ↫ ❪ *[@'..data.username_..'] ❫\n✓'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
end     
if msg.content_.ID == 'MessageContact' then   
sendContact(id_user, msg.id_, 0, 1, nil,msg.content_.contact_.phone_number_, msg.content_.contact_.first_name_,'', bot_id)       
if data.username_ == false then
local text = '📬¦ تم ارسال جهة الاتصال \n📮¦ الى ↫ ❪ '..CatchName(data.first_name_,15)..' ❫\n✓'
VEERmonshn(msg.chat_id_, id_user, msg.id_, text, 38, utf8.len(CatchName(data.first_name_,15))) 
else
zo = '📬¦ تم ارسال رسالتك \n*📮¦ الى ↫ ❪ *[@'..data.username_..'] ❫\n✓'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, "md") 
end
end     
end,nil)
end,nil)
end,nil)
end    
getMessage(msg.chat_id_, msg.reply_to_message_id_,bot_in_daerct)    
end 
if text == 'فتح الكل' and is_devmohmad(msg) then   taha = '*🚸¦* تم فتح جميع الاوامر   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")      MOHMADdevVEER:del(devVEER..'lock:photo'..bot_id)    MOHMADdevVEER:del(devVEER..'lock:vico'..bot_id)    MOHMADdevVEER:del(devVEER..'lock:ste'..bot_id)    MOHMADdevVEER:del(devVEER..'lock:file'..bot_id)    MOHMADdevVEER:del(devVEER..'lock:phon'..bot_id)    MOHMADdevVEER:del(devVEER..'lock:links'..bot_id)    MOHMADdevVEER:del(devVEER..'lock:ved'..bot_id)    MOHMADdevVEER:del(devVEER..'lock:fwd'..bot_id)    MOHMADdevVEER:del(devVEER..'lock:gif'..bot_id)    MOHMADdevVEER:del(devVEER..'lock:musec'..bot_id)    end      
if text == 'قفل الكل' and is_devmohmad(msg) then   taha = '*📛¦* تم قفل جميع الاوامر  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")      MOHMADdevVEER:set(devVEER..'lock:photo'..bot_id,true)    MOHMADdevVEER:set(devVEER..'lock:vico'..bot_id,true)    MOHMADdevVEER:set(devVEER..'lock:ste'..bot_id,true)    MOHMADdevVEER:set(devVEER..'lock:file'..bot_id,true)    MOHMADdevVEER:set(devVEER..'lock:phon'..bot_id,true)    MOHMADdevVEER:set(devVEER..'lock:links'..bot_id,true)    MOHMADdevVEER:set(devVEER..'lock:ved'..bot_id,true)    MOHMADdevVEER:set(devVEER..'lock:fwd'..bot_id,true)    MOHMADdevVEER:set(devVEER..'lock:gif'..bot_id,true)    MOHMADdevVEER:set(devVEER..'lock:musec'..bot_id,true)     end   
if text == 'فتح الصور' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح الصور   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:photo'..bot_id) end  
if text == 'قفل الصور' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل الصور  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:photo'..bot_id,true) end 
if text == 'فتح الصوت' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح الصوت   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:vico'..bot_id) end  
if text == 'قفل الصوت' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل الصوت  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:vico'..bot_id,true) end 
if text == 'فتح الاغاني' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح الاغاني   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:musec'..bot_id) end  
if text == 'قفل الاغاني' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل الاغاني  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:musec'..bot_id,true) end 
if text == 'فتح المتحركه' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح المتحركه   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:gif'..bot_id) end  
if text == 'قفل المتحركه' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل المتحركه  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:gif'..bot_id,true) end 
if text == 'فتح التوجيه' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح التوجيه   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:fwd'..bot_id) end  
if text == 'قفل التوجيه' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل التوحيه  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:fwd'..bot_id,true) end 
if text == 'فتح الفيديو' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح الفيديو   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:ved'..bot_id) end  
if text == 'قفل الفيديو' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل الفيديو  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:ved'..bot_id,true) end 
if text == 'فتح الروابط' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح الروابط   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:links'..bot_id) end  
if text == 'قفل الروابط' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل الروابط  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:links'..bot_id,true) end 
if text == 'فتح الجهات' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح الجهات   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:phon'..bot_id) end  
if text == 'قفل الجهات' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل الجهات  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:phon'..bot_id,true) end 
if text == 'فتح الملفات' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح الملفات   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:file'..bot_id) end  
if text == 'قفل الملفات' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل الملفات  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:file'..bot_id,true) end 
if text == 'فتح الملصقات' and is_devmohmad(msg) then  taha = '*🚸¦* تم فتح الملصقات   ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:del(devVEER..'lock:ste'..bot_id) end  
if text == 'قفل الملصقات' and is_devmohmad(msg) then  taha = '*📛¦* تم قفل الملصقات  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md")  MOHMADdevVEER:set(devVEER..'lock:ste'..bot_id,true) end 
if text == 'الاعدادات 🔏' and is_devmohmad(msg) then  if MOHMADdevVEER:get(devVEER..'lock:photo'..bot_id) then    lock_photo = '* مقفل ✓ *'      else     lock_photo = '*مفتوح ✘*'    end    if MOHMADdevVEER:get(devVEER..'lock:vico'..bot_id) then    lockvic = '* مقفل ✓ *'      else     lockvic = '*مفتوح ✘*'    end    if MOHMADdevVEER:get(devVEER..'lock:ste'..bot_id) then    lockste = '* مقفل ✓ *'      else     lockste = '*مفتوح ✘*'    end    if MOHMADdevVEER:get(devVEER..'lock:file'..bot_id) then    lockfile = '* مقفل ✓ *'     else     lockfile = '*مفتوح ✘*'    end    if MOHMADdevVEER:get(devVEER..'lock:phon'..bot_id) then    lockphon = '* مقفل ✓ *'      else     lockphon = '*مفتوح ✘*'    end    if MOHMADdevVEER:get(devVEER..'lock:links'..bot_id) then    lock_link = '* مقفل ✓ *'      else     lock_link = '*مفتوح ✘*'    end    if MOHMADdevVEER:get(devVEER..'lock:ved'..bot_id) then    lock_vid = '* مقفل ✓ *'      else     lock_vid = '*مفتوح ✘*'    end    if MOHMADdevVEER:get(devVEER..'lock:fwd'..bot_id) then    lock_fwd = '* مقفل ✓ *'      else     lock_fwd = '*مفتوح ✘*'    end    if MOHMADdevVEER:get(devVEER..'lock:gif'..bot_id) then    lock_gif = '* مقفل ✓ *'      else     lock_gif = '*مفتوح ✘*'    end    if MOHMADdevVEER:get(devVEER..'lock:musec'..bot_id) then    lock_muse = '* مقفل ✓ *'      else     lock_muse = '*مفتوح ✘*'    end    local text = '*📛¦* اهلا بك في اعدادات الخاص 🍃'..'\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n'..    '\n*📬¦* الروابط '..lock_link..    '\n'..'*📬¦* الصور '..lock_photo..    '\n'..'*📬¦* الاغاني '..lockvic..    '\n'..'*📬¦* الملصقات '..lockste..    '\n'..'*📬¦* الملفات '..lockfile..    '\n'..'*📬¦* الجهات '..lockphon..    '\n'..'*📬¦* الفيديو '..lock_vid..    '\n'..'*📬¦* التوجيه '..lock_fwd..    '\n'..'*📬¦* المتحركه '..lock_gif..    '\n'..'*📬¦* الصوت '..lock_muse..    '\n\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n🚨*¦* اضافه الى ذالك تستطيع قفل وفتح الكل\n🚸*¦* قفل الكل \n🚸*¦* فتح الكل'    VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md')     end     
if text =='الاوامر 📑' or text == 'الاوامر' then
if not is_devmohmad(msg) then
else 
local text = [[* 
💁🏻‍♂¦ اهلآ بك، عزيزي ... 🍃
📮¦ في اوامـر التواصل 
📬¦ قڤل – فتح + الامر ↓
ٴ━━━━━━━━━━
📬¦ الروابطہَ — الصور
📬¦ الاغانيہَ — الملصقات
📬¦ الملفات — الجهات
📬¦ الفيديو — التوجيهہَ
📬¦ الصوت — المتحركۃ
📬¦ الكلَ { لـ؛قڤل چميع الاوآمر } 
ٴ━━━━━━━━━━
📨¦ لحظَر والغَاء الحظر ڤي التواصل
📨¦ حظر » بالرد ؏َ الشخص
📨¦ الغاء الحظر » بالرد ؏َ الشخص
📨¦ الاعدادات 
ٴ━━━━━━━━━━
..
*]] 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md')  
end
end  
if text == 'مسح المحظورين 📢' and is_devmohmad(msg) then       local list = MOHMADdevVEER:smembers(devVEER..'pv:ban'..msg.chat_id_)   for k,v in pairs(list) do     MOHMADdevVEER:del(devVEER..'pv:ban'..msg.chat_id_)   MOHMADdevVEER:del('numlocktextpv'..bot_id..v)  end   VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📛*¦* تم مسح المحظورين', 1, 'md')     end
if text == 'تفعيل البوت الخدمي 🎮' and is_devmohmad(msg) then local  taha = '*📛¦*تم تفعيل البوت خدمي  ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") MOHMADdevVEER:del(devVEER..'lock:bot:free'..bot_id) end 
if text == 'تعطيل البوت الخدمي 🚸' and is_devmohmad(msg) then taha = '*📛¦*تم تعطيل البوت الخدمي  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") MOHMADdevVEER:set(devVEER..'lock:bot:free'..bot_id,true) end
if text == 'تفعيل تواصل 📨' and is_devmohmad(msg) then local  taha = '*📛¦*تم تفعيل بوت التواصل  ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") MOHMADdevVEER:del(devVEER..'lock:botl'..bot_id) end 
if text == 'تعطيل تواصل 📩' and is_devmohmad(msg) then taha = '*📛¦*تم تعطيل التواصل  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") MOHMADdevVEER:set(devVEER..'lock:botl'..bot_id,true) end
if text == 'تحديث ♻' and is_devmohmad(msg) then  local filed = io.popen('ls plugins_'):lines() for files in filed do if files:match(".lua$") then end end dofile('VEER.lua') load_plugins() io.popen("rm -rf ~/.telegram-cli/data/audio/*") io.popen("rm -rf ~/.telegram-cli/data/document/*") io.popen("rm -rf ~/.telegram-cli/data/photo/*") io.popen("rm -rf ~/.telegram-cli/data/sticker/*") io.popen("rm -rf ~/.telegram-cli/data/temp/*") io.popen("rm -rf ~/.telegram-cli/data/thumb/*") io.popen("rm -rf ~/.telegram-cli/data/video/*") io.popen("rm -rf ~/.telegram-cli/data/voice/*") io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*")   VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📛¦* تم تحديث البوت', 1, 'md') end 
if text == "وضع اسم البوت ⚡" and is_devmohmad(msg) then MOHMADdevVEER:setex(devVEER..'namebot:witting'..msg.sender_user_id_,300,true) VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦* ارسل لي الاسم 📯\n",1, 'md')  end
if text == 'مسح المميزين عام 🌟' and is_devmohmad(msg) then      local list = MOHMADdevVEER:smembers(devVEER..'vip:groups')    if #list == 0 then  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد مميزين عام ليتم مسحهم\n', 1, 'md')   return false  end  local num = 0  for k,v in pairs(list) do    MOHMADdevVEER:srem(devVEER.."vip:groups",v)    num = num + 1  end   VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المميزين عام *\n', 1, 'md')   end
if text == 'مسح المطورين 👮' and is_devmohmad(msg) then     local list = MOHMADdevVEER:smembers(devVEER..'sudo:bot')    if #list == 0 then  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد مطورين ليتم مسحهم\n', 1, 'md')   return false  end  local num = 0  for k,v in pairs(list) do    MOHMADdevVEER:srem(devVEER.."sudo:bot",v)    num = num + 1  end   VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المطورين *\n', 1, 'md')   end
if text == 'مسح قائمه العام 🚷' and is_devmohmad(msg) then   local list = MOHMADdevVEER:smembers(devVEER..'VEER:gbaned')    if #list == 0 then  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد محظورين عام ليتم مسحهم\n', 1, 'md')   return false  end  local num = 0  for k,v in pairs(list) do    MOHMADdevVEER:srem(devVEER.."VEER:gbaned",v)    num = num + 1  end   VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المحظورين عام *\n', 1, 'md')   end
if text and text:match("^ضع رد تواصل 💻$") and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."sudo:pv" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📬*¦* ارسل لي النص الذي تريده ', 1, 'md') end 
if text and text:match("^ضع كليشه المطور 🎐$") and is_devmohmad(msg) then MOHMADdevVEER:setex(devVEER.."sudo:dev" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📬*¦* ارسل لي النص الذي تريده ', 1, 'md') end 
if text and text:match("^ضع كليشه ستارت 📠$") and is_devmohmad(msg) then MOHMADdevVEER:setex(devVEER.."start:msgofstart" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📬*¦* ارسل لي النص الذي تريده ', 1, 'md') end 
if text == 'تفعيل رساله الترحيب 🎌' and is_devmohmad(msg) then local  taha = '*📛¦*تم تفعيل رسالة ترحيب عند الاضافه  ✔' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") MOHMADdevVEER:del(devVEER..'lock:klsh:add'..bot_id) end 
if text == 'تعطيل رساله الترحيب 📱' and is_devmohmad(msg) then taha = '*📮¦*تم تعطيل رسالة ترحيب عند الاضافه  ❌' VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") MOHMADdevVEER:set(devVEER..'lock:klsh:add'..bot_id,true) end
if text == "حذف رد التواصل 🔧" and is_devmohmad(msg) then  MOHMADdevVEER:del(devVEER.."pvstart") VEER_sendMsg( msg.chat_id_, msg.id_, 1, '*📛¦*تم حذف رد التوصل', 1, "md") end 
if text == "حذف كليشه ستارت 🃏" and is_devmohmad(msg) then  MOHMADdevVEER:del(devVEER.."start:msgofstart1") VEER_sendMsg( msg.chat_id_, msg.id_, 1, '*📛¦*تم حذف كليشه ستارت', 1, "md") end 
if text == "حذف كليشه المطور 🀄" and is_devmohmad(msg) then  MOHMADdevVEER:del(devVEER.."dev") VEER_sendMsg( msg.chat_id_, msg.id_, 1, '*📛¦*تم حذف كليشه المطور', 1, "md") end 
if text and text:match("^ضع عدد الاعضاء 📜$") and is_devmohmad(msg) then  MOHMADdevVEER:setex(devVEER.."numadd:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  local t = '*📊¦ ارسل لي العدد الان*'  VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') end
if text == "جلب رد التواصل 📚" and is_devmohmad(msg) then if MOHMADdevVEER:get(devVEER.."pvstart") then pvstart = MOHMADdevVEER:get(devVEER.."pvstart") VEER_sendMsg(msg.chat_id_, msg.id_, 1,''..check_markdown(pvstart)..'', 1, 'md')  else  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*✉¦ لا يوجد رد في التواصل \n📮¦* ارسل `ضع رد التواصل`\n🍃', 1, 'md')  end  end
if text == "جلب كليشه ستارت 📚" and is_devmohmad(msg) then  local start = MOHMADdevVEER:get(devVEER.."start:msgofstart1")  if start then VEER_sendMsg(msg.chat_id_, msg.id_, 1,''..check_markdown(start)..'', 1, 'md') else VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*🎭¦ لم يتم وضع كليشه ستارت *\n', 1, 'md') end end
if text == 'الاحصائيات 🔭' and is_devmohmad(msg) then    local grall = MOHMADdevVEER:scard(devVEER.."botgps") or 0    local gradd = MOHMADdevVEER:scard(devVEER..'bot:gpsby:id') or 0    local uspv = MOHMADdevVEER:scard(devVEER.."usersbot") or 0    VEER_sendMsg(msg.chat_id_, msg.id_, 1,'\n*📬¦ عدد المجموعات المفعله ↫ ❪'..gradd..'❫\n💥¦ عدد المشتركين ↫ ❪'..uspv..'❫*\n✓', 1, 'md')   end
if text=="اذاعه بالتوجيه 📬" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."bc:in:gropsfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true)   VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي التوجيه ليتم اذاعته للمجموعات\n✓", 1, "md")   end
if text=="اذاعه خاص بالتوجيه 🔮" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."bc:in:pvfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true)   VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي التوجيه ليتم اذاعته للخاص\n✓", 1, "md")   end
if text=="اذاعه عام بالتوجيه 💾" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."bc:in:allfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true)   VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي التوجيه ليتم اذاعته للكل\n✓", 1, "md")   end
if text=="اذاعه 📡" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."bc:in:grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true)   VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي سواء كان » ❪ رساله , صوره , متحركه , ملصق  ❫ للاذاعه الى المجموعات\n✓", 1, "md")   end
if text=="اذاعه للكل 📡" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."bc:in:all" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true)   VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي سواء كان » ❪ رساله , صوره , متحركه , ملصق  ❫ للاذاعه الى الكل\n✓", 1, "md")   end
if text=="اذاعه خاص 📡" and msg.reply_to_message_id_ == 0 and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true)   VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي سواء كان » ❪ رساله , صوره , متحركه , ملصق  ❫ للاذاعه الى الخاص\n✓", 1, "md")   end 
if text ==('المجموعات 📇') and is_devmohmad(msg) then    local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')   if #list == 0 then  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*💥¦ لا توجد مجموعات حاليا *\n', 1, 'md')  return false  end local t = '⚡¦* اهلا بك في ايدي المجموعات 🍁*\n*ٴ⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃*\n'    for k,v in pairs(list) do     local nummsg = tonumber(MOHMADdevVEER:get(devVEER..'groupmsg:'..v..':'))   numrgroup(v) local numg = (MOHMADdevVEER:get(devVEER.."numgrop"..v) or '3')  local namechat = MOHMADdevVEER:get(devVEER..'group:name'..v)   if namechat then  t = t..'*'..k.."➛* `"..v.."` "..tfgroup(nummsg).."\n*« "..namechat..' » ❪'..numg..'❫*\n*ٴ⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃*\n'     else  t = t..'*'..k.."➛* `"..v.."` "..tfgroup(nummsg).."\n* ❪"..numg..'❫*\n*ٴ⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃*\n'     end  file = io.open("VEER_groups", "w") file:write([[ ]]..isnothtml(t)..[[ ]]) file:close()   end    t = t..'*📮¦*لعرض معلومات مجموعه معينه\n*💥¦ ارسل كشف من ثم ايدي المجموعه*\n*🚸¦ مثال ❪كشف -10012345667❫*\n꞉'    if #list >= 25 then    local groups = MOHMADdevVEER:scard(devVEER..'bot:gpsby:id')    sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './VEER_groups','📛¦ عذرا لديك الكثير من المجموعات\n📬¦ تم ارسال المجموعات في الملف\n🚸¦ عدد المجموعات •⊱'..groups..'⊰•',dl_cb, nil)   else   VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')    end   end
if text == "تحديث السورس 🔱" and is_devmohmad(msg) then  VEER_sendMsg(msg.chat_id_, msg.id_, 1, '♻ • جاري تحديث السورس • ♻', 1, 'md') 
os.execute('rm -rf VEER.lua') 
os.execute("rm -fr plugins_/help_rep.lua")
os.execute('wget https://raw.githubusercontent.com/NOVAR1/VEER/master/VEER.lua') 
os.execute('cd plugins_;wget https://raw.githubusercontent.com/NOVAR1/VEER/master/plugins_/help_rep.lua') 
sleep(0.5) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '🚸*¦* تم تحديث ♻ السورس ✔ ', 1, 'md') 
dofile('VEER.lua')  
end
if text == 'مسح المشتركين 💯' and is_devmohmad(msg) then     local list = MOHMADdevVEER:smembers(devVEER..'usersbot')     local pv = 0  for k,v in pairs(list) do      MOHMADdevVEER:srem(devVEER..'usersbot',v)    pv = pv + 1  end     VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*🎲¦ تم مسح » ❪'..pv..'❫ من المشتركين *\n', 1, 'md')   end  
if text == 'مسح المجموعات 💯' and is_devmohmad(msg) then   local lgp = MOHMADdevVEER:smembers(devVEER.."bot:gpsby:id")   local lsug = MOHMADdevVEER:smembers(devVEER.."botgps")   local lgpn = MOHMADdevVEER:scard(devVEER.."bot:gpsby:id")   local lsugn = MOHMADdevVEER:scard(devVEER.."bot:gpsby:id")   for k,v in pairs(lgp) do   rem_group(v)     changeChatMemberStatus(v, bot_id, "Left")    end   for k,v in pairs(lsug) do    rem_group(v)     changeChatMemberStatus(v, bot_id, "Left")    end   VEER_sendMsg(msg.chat_id_, msg.id_, 1,"*📮¦* تم مغادره البوت من » ❪"..lsugn.."❫ مجموعات \n✓", 1, 'md')   end
if text == 'المحظورين عام 📑' and is_devmohmad(msg) then   local list = MOHMADdevVEER:smembers(devVEER..'VEER:gbaned')  local t = '*📮¦ قائمه المحظورين عام *\n*ٴ━━━━━━━━━*\n'   for k, v in pairs(list) do   local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)  if taha then  local username = taha  t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"     else  t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"     end  end   if #list == 0 then   t = '*📬¦* لا يوجد محظورين عام في البوت'   end   VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')  end  
if text == 'المطورين 📑' and is_devmohmad(msg) then   local list = MOHMADdevVEER:smembers(devVEER..'sudo:bot')  local t = '*📮¦ قائمه مطورين البوت *\n*ٴ━━━━━━━━━*\n'   for k, v in pairs(list) do   local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)  if taha then  local username = taha  t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"     else  t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"     end  end   if #list == 0 then   t = '*📬¦* لا يوجد مطورين في البوت'   end   VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')  end  
if text == 'المميزين عام 📑' and is_devmohmad(msg) then   local list = MOHMADdevVEER:smembers(devVEER..'vip:groups')  local t = '*📮¦ قائمه المميزين عام *\n*ٴ━━━━━━━━━*\n'   for k, v in pairs(list) do   local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)  if taha then  local username = taha  t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"     else  t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"     end  end   if #list == 0 then   t = '*📬¦* لا يوجد مميزين عام في البوت'   end   VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')  end  
if text and text:match("^استخراج الرابط 🔦$") and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."get:link:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)   local t = '*📮¦ حسنآ ارسل لي ايدي المجموعه*\n💥'   VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')  end
if text and text:match("^كشف 🔍$") and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."get:info:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  local t = '*📮¦ حسنآ ارسل لي ايدي المجموعه*\n💥'   VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')  end
end
if chat_type == 'super' then 
if not MOHMADdevVEER:sismember(devVEER..'bot:gpsby:id',msg.chat_id_) then
print('\27[30;36m»» THE GROUP IS NOT ADD ↓\n»» '..msg.chat_id_..'\n\27[1;37m')
return false end
if msg.content_.game_ then
print('\27[30;36m»» T H E  G A M E \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.text_ then
print('\27[30;36m»» T H E  T E X T \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.sticker_ then
print('\27[30;36m»» T H E S T I C K E R \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.animation_ then
print('\27[30;36m»» T H E G I F \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.voice_ then
print('\27[30;36m»» T H E V O I C E \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.video_ then
print('\27[30;36m»» T H E V I D E O \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.photo_ then
print('\27[30;36m»» T H E P H O T O \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.document_ then
print('\27[30;36m»» T H E D O C U M E N T \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.audio_  then
print('\27[30;36m»» T H E A U D I O \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.location_ then
print('\27[30;36m»» T H E L O C A T I O N \27[1;37m')
seavusername(msg.sender_user_id_) 
elseif msg.content_.contact_ then
print('\27[30;36m»» T H E C O N T A C T \27[1;37m')
seavusername(msg.sender_user_id_) 
end
local user_id = msg.sender_user_id_
floods = MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"flood") or 'nil'
NUM_MSG_MAX = MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"floodmax") or 5
TIME_CHECK = MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"floodtime") or 5
if MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"flood") then 
if not is_vipgroup(msg) then
if msg.content_.ID == "MessageChatAddMembers" then 
return else
local post_count = tonumber(MOHMADdevVEER:get(devVEER..'floodc:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
if post_count > tonumber(MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"flood") 
trigger_anti_spam(msg,type)  
end
MOHMADdevVEER:setex(devVEER..'floodc:'..msg.sender_user_id_..':'..msg.chat_id_, tonumber(MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
end 
end
local edit_id = data.text_ or 'nil'  
NUM_MSG_MAX = 5
if MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"floodmax") then
NUM_MSG_MAX = MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"floodmax") 
end
if MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"floodtime") then
TIME_CHECK = MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end	  
if tonumber(MOHMADdevVEER:get('numlockpinmsg'..msg.chat_id_..msg.sender_user_id_) or 1) >= 100  then
MOHMADdevVEER:del(devVEER.."lockpin"..msg.chat_id_) 
else
if msg.content_.ID == 'MessagePinMessage' then    
if is_owner(msg) and MOHMADdevVEER:get(devVEER.."lockpin"..msg.chat_id_) then    
MOHMADdevVEER:set(devVEER..'pinned'..msg.chat_id_, msg.content_.message_id_) 
elseif not MOHMADdevVEER:get(devVEER.."lockpin"..msg.chat_id_) then    
MOHMADdevVEER:set(devVEER..'pinned'..msg.chat_id_, msg.content_.message_id_)    
end    
end
end
if is_monsh(msg) then  
else   
if not is_owner(msg) then  
if MOHMADdevVEER:get(devVEER.."lockpin"..msg.chat_id_) then 
if msg.content_.ID == 'MessagePinMessage' then  
unpinChannelMessage(msg.chat_id_)  
local PinnedMessage = MOHMADdevVEER:get(devVEER..'pinned'..msg.chat_id_)  
if PinnedMessage then  
pinChannelMessage(msg.chat_id_,tonumber(PinnedMessage), 0)  end  end  end  end  end  
if msg.content_.ID == 'MessagePinMessage' then    
if tonumber(MOHMADdevVEER:get('numlockpinmsg'..msg.chat_id_..msg.sender_user_id_) or 1) >= 100 then    
local PinnedMessage = MOHMADdevVEER:get(devVEER..'pinned'..msg.chat_id_)  
if PinnedMessage then  
pinChannelMessage(msg.chat_id_,tonumber(PinnedMessage), 0) 
end
end   
end
--------------------------------
if msg.content_.ID == 'MessageText' and not is_vipgroup(msg) then      
if MOHMADdevVEER:get(devVEER..'lock:text'..msg.chat_id_) then       
delete_msg(msg.chat_id_,{[0] = msg.id_})   
return false end    
end     
---الاشعارات
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if MOHMADdevVEER:get(devVEER..'lock:tagservr'..msg.chat_id_) then  
delete_msg(msg.chat_id_,{[0] = msg.id_})       
end    
end   
---الاضافات والدخول
if msg.content_.ID == "MessageChatAddMembers" and not is_vipgroup(msg) then   
if MOHMADdevVEER:get(devVEER.."lock:AddMempar"..msg.chat_id_) == 'kick' then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
kicck(msg,msg.chat_id_,mem_id[i].id_)
end
end
end
if msg.content_.ID == "MessageChatJoinByLink" and not is_vipgroup(msg) then 
if MOHMADdevVEER:get(devVEER.."lock:Join"..msg.chat_id_) == 'kick' then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
return false  
end
end

--المعرفات
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "del" and not is_vipgroup(msg) then    
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "ked" and not is_vipgroup(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "kick" and not is_vipgroup(msg) then    
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "ktm" and not is_vipgroup(msg) then    
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "del" and not is_vipgroup(msg) then    
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "ked" and not is_vipgroup(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "kick" and not is_vipgroup(msg) then    
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "ktm" and not is_vipgroup(msg) then    
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
--الهاشتاك
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "del" and not is_vipgroup(msg) then    
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "ked" and not is_vipgroup(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "kick" and not is_vipgroup(msg) then    
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "ktm" and not is_vipgroup(msg) then    
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "del" and not is_vipgroup(msg) then    
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "ked" and not is_vipgroup(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "kick" and not is_vipgroup(msg) then    
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "ktm" and not is_vipgroup(msg) then    
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
---الشارحه
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "del" and not is_vipgroup(msg) then    
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "ked" and not is_vipgroup(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "kick" and not is_vipgroup(msg) then    
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "ktm" and not is_vipgroup(msg) then    
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "del" and not is_vipgroup(msg) then    
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "ked" and not is_vipgroup(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "kick" and not is_vipgroup(msg) then    
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "ktm" and not is_vipgroup(msg) then    
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
----الروابط
if msg.content_.caption_ then 
if not is_vipgroup(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "del" and not is_vipgroup(msg) then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "ked" and not is_vipgroup(msg) then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "kick" and not is_vipgroup(msg) then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "ktm" and not is_vipgroup(msg) then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not is_vipgroup(msg) then
if MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "del" and not is_vipgroup(msg) then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "ked" and not is_vipgroup(msg) then 
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "kick" and not is_vipgroup(msg) then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "ktm" and not is_vipgroup(msg) then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end

---الصور
if msg.content_.ID == 'MessagePhoto' and not is_vipgroup(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:Photo"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Photo"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Photo"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Photo"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
--الفيديو
if msg.content_.ID == 'MessageVideo' and not is_vipgroup(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:Video"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Video"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Video"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Video"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
---المتحركات
if msg.content_.ID == 'MessageAnimation' and not is_vipgroup(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:Animation"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Animation"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Animation"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Animation"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
--الالعاب
if msg.content_.game_ and not is_vipgroup(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:geam"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:geam"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:geam"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:geam"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
---الصوت
if msg.content_.ID == 'MessageAudio' and not is_vipgroup(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:Audio"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Audio"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Audio"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Audio"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
---البصمات
if msg.content_.ID == 'MessageVoice' and not is_vipgroup(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
---الكيبورد
if msg.reply_markup_ and msg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' and not is_vipgroup(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:Keyboard"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Keyboard"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Keyboard"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Keyboard"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
--الملصقات
if msg.content_.ID == 'MessageSticker' and not is_mod(msg) and not is_vipgroup(msg) and not is_vipgroups(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:Sticker"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Sticker"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Sticker"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Sticker"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
--التوجيه
if msg.forward_info_ and not is_vipgroup(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:forward"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif MOHMADdevVEER:get(devVEER.."lock:forward"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif MOHMADdevVEER:get(devVEER.."lock:forward"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif MOHMADdevVEER:get(devVEER.."lock:forward"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
if msg.forward_info_ and is_vipgroup(msg) then 
return false
end
---الملفات
if msg.content_.ID == 'MessageDocument' and not is_vipgroup(msg) then     
if MOHMADdevVEER:get(devVEER.."lock:Document"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Document"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Document"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Document"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
--الكاميرا الاماميه
if msg.content_.ID == "MessageUnsupported" and not is_vipgroup(msg) then      
if MOHMADdevVEER:get(devVEER.."lock:Unsupported"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Unsupported"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Unsupported"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Unsupported"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
--الماركداون
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not is_vipgroup(msg) then
if MOHMADdevVEER:get(devVEER.."lock:Markdaun"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Markdaun"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Markdaun"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Markdaun"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 
--الجهات
if msg.content_.ID == 'MessageContact' and not is_vipgroup(msg) then      
if MOHMADdevVEER:get(devVEER.."lock:Contact"..msg.chat_id_) == "del" then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Contact"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Contact"..msg.chat_id_) == "kick" then
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Contact"..msg.chat_id_) == "ktm" then
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
---الكلايش
if msg.content_.text_ and not is_vipgroup(msg) then  
local _nl, ctrl_ = string.gsub(text, '%c', '')  
local _nl, real_ = string.gsub(text, '%d', '')   
sens = 400  
if MOHMADdevVEER:get(devVEER.."lock:Spam"..msg.chat_id_) == "del" and utf8.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Spam"..msg.chat_id_) == "ked" and utf8.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
ked(msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Spam"..msg.chat_id_) == "kick" and utf8.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
kicck(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
elseif MOHMADdevVEER:get(devVEER.."lock:Spam"..msg.chat_id_) == "ktm" and utf8.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end
---------
-->>lock by del user chat <<--
if msg.content_.ID == 'MessagePinMessage' then
if MOHMADdevVEER:sismember(devVEER..'LOCK:PINMSG'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
local PinnedMessage = MOHMADdevVEER:get(devVEER..'pinned'..msg.chat_id_)  
if PinnedMessage then  
pinChannelMessage(msg.chat_id_,tonumber(PinnedMessage),0) 
end
else
MOHMADdevVEER:set(devVEER..'pinned'..msg.chat_id_, msg.content_.message_id_)    
end  
end  
 
if msg.content_.caption_ and not is_owner(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if MOHMADdevVEER:sismember(devVEER..'LOCK:LINKS'..msg.chat_id_,msg.sender_user_id_) then
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
end
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not is_vipgroup(msg) then
if MOHMADdevVEER:sismember(devVEER..'LOCK:LINKS'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
-- المعرفات
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") and not is_owner(msg) then     
if MOHMADdevVEER:sismember(devVEER..'LOCK:USERNAME'..msg.chat_id_,msg.sender_user_id_) then
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
if msg.content_.caption_ and not is_owner(msg) then  
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if MOHMADdevVEER:sismember(devVEER..'LOCK:USERNAME'..msg.chat_id_,msg.sender_user_id_) then
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
end
-- الصور
if msg.content_.ID == 'MessagePhoto' then 
if MOHMADdevVEER:sismember(devVEER..'LOCK:PHOTO'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
-- الصوت
if msg.content_.ID == 'MessageVoice' or msg.content_.ID == 'MessageAudio' then
if MOHMADdevVEER:sismember(devVEER..'LOCK:VICO'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end

--المتحركه
if msg.content_.ID == 'MessageAnimation' then
if MOHMADdevVEER:sismember(devVEER..'LOCK:GIF'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
--الفيديو
if msg.content_.ID == 'MessageVideo' then
if MOHMADdevVEER:sismember(devVEER..'LOCK:VIDEO'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
--الملصقات
if msg.content_.ID == 'MessageSticker' then     
print('ملصق')
if MOHMADdevVEER:sismember(devVEER..'LOCK:STEKR'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
--السيبفي
if msg.content_.ID == "MessageUnsupported" then
if MOHMADdevVEER:sismember(devVEER..'LOCK:SELPHY'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
--الماركداون
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if MOHMADdevVEER:sismember(devVEER..'LOCK:MARKDWN'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
end
end
--التوجيه
if msg.forward_info_ then
if MOHMADdevVEER:sismember(devVEER..'LOCK:FWD'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end
--الاونلاين
if msg.reply_markup_ and msg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' then     
if MOHMADdevVEER:sismember(devVEER..'LOCK:INLIN'..msg.chat_id_,msg.sender_user_id_) and not is_owner(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_, message_ids_={[0] = msg.id_}}, dl_cb, nil) 
end
end 
 
local status_welcome = (MOHMADdevVEER:get(devVEER..'add:welc:'..msg.chat_id_) or 'rem')  
if status_welcome == 'add' and not MOHMADdevVEER:get(devVEER..'lock:tagservr'..msg.chat_id_)  then
if msg.content_.ID == "MessageChatJoinByLink" then
if not is_banned(msg.chat_id_,msg.sender_user_id_) then 
function wlc(extra,result,success) 
if MOHMADdevVEER:get(devVEER..'welcome:'..msg.chat_id_) then 
t = MOHMADdevVEER:get(devVEER..'welcome:'..msg.chat_id_) 
else  
t = '\n• نورت حبي \n•  name \n• ngp' 
end 
t = t:gsub('name','<VEER>'..CatchName(result.first_name_,25)..'</VEER>') 
t = t:gsub('ngp',MOHMADdevVEER:get(devVEER..'group:name'..msg.chat_id_)) 
monsendwel(msg,msg.chat_id_,t,msg.sender_user_id_) 
end 
getUser(msg.sender_user_id_,wlc) 
end 
end
end 
if text == 'قفل الدردشه' and msg.reply_to_message_id_ == 0 and is_monsh(msg) then 
MOHMADdevVEER:set(devVEER.."lock:text"..msg.chat_id_,true) 
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الدردشه \n✓',msg.sender_user_id_)  
elseif text == 'قفل الاضافه' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:set(devVEER.."lock:AddMempar"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل اضافة الاعضاء \n✓',msg.sender_user_id_)  
elseif text == 'قفل الدخول' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:set(devVEER.."lock:Join"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل دخول الاعضاء \n✓',msg.sender_user_id_)  
elseif text == 'قفل البوتات' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:set(devVEER.."lock:Bot:kick"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل البوتات \n✓',msg.sender_user_id_)  
elseif text == 'قفل البوتات بالطرد' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:set(devVEER.."lock:Bot:kick"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل البوتات بالطرد\n✓',msg.sender_user_id_)  
elseif text == 'قفل البوتات بالتقييد' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:set(devVEER.."lock:Bot:kick"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل البوتات بالتقييد\n✓',msg.sender_user_id_)  
elseif text == 'قفل اشعارات البوتات' and msg.reply_to_message_id_ == 0 and is_mod(msg) then  
MOHMADdevVEER:set(devVEER..'lock:tagservrbot'..msg.chat_id_,true)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل اشعارات البوتات \n✓',msg.sender_user_id_)  
elseif text == 'قفل الاشعارات' and msg.reply_to_message_id_ == 0 and is_mod(msg) then  
MOHMADdevVEER:set(devVEER..'lock:tagservr'..msg.chat_id_,true)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الاشعارات \n✓',msg.sender_user_id_)  
elseif text == 'قفل التثبيت' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:set(devVEER.."lockpin"..msg.chat_id_, true) 
MOHMADdevVEER:sadd(devVEER..'lock:pin',msg.chat_id_) tdcli_function ({ ID = "GetChannelFull",  channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  MOHMADdevVEER:set(devVEER..'pinned'..msg.chat_id_,data.pinned_message_id_)  end,nil)
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل التثبيت هنا \n✓',msg.sender_user_id_)  
elseif text == 'قفل التعديل' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:set(devVEER..'lock:edit'..msg.chat_id_,true) 
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل تعديل الكلمات \n✓',msg.sender_user_id_)  
elseif text == 'قفل تعديل الميديا' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:set(devVEER..'lock:edit:media'..msg.chat_id_,true) 
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل تعديل الميديا \n✓',msg.sender_user_id_)  
elseif text == 'قفل الكل' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
add_lockal(msg.chat_id_)
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل جميع الاوامر \n✓',msg.sender_user_id_)  
end
if text == 'فتح الاضافه' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:del(devVEER.."lock:AddMempar"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح اضافة الاعضاء \n✓',msg.sender_user_id_)  
elseif text == 'فتح الدردشه' and msg.reply_to_message_id_ == 0 and is_monsh(msg) then 
MOHMADdevVEER:del(devVEER.."lock:text"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الدردشه \n✓',msg.sender_user_id_)  
elseif text == 'فتح الدخول' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:del(devVEER.."lock:Join"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح دخول الاعضاء \n✓',msg.sender_user_id_)  
elseif text == 'فتح البوتات' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:del(devVEER.."lock:Bot:kick"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فـتح البوتات \n✓',msg.sender_user_id_)  
elseif text == 'فتح البوتات بالطرد' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:del(devVEER.."lock:Bot:kick"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فـتح البوتات بالطرد\n✓',msg.sender_user_id_)  
elseif text == 'فتح البوتات بالتقييد' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:del(devVEER.."lock:Bot:kick"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فـتح البوتات بالتقييد\n✓',msg.sender_user_id_)  
elseif text == 'فتح اشعارات البوتات' and msg.reply_to_message_id_ == 0 and is_mod(msg) then  
MOHMADdevVEER:del(devVEER..'lock:tagservrbot'..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فـتح اشعارات البوتات \n✓',msg.sender_user_id_)  
elseif text == 'فتح الاشعارات' and msg.reply_to_message_id_ == 0 and is_mod(msg) then  
MOHMADdevVEER:del(devVEER..'lock:tagservr'..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فـتح الاشعارات \n✓',msg.sender_user_id_)  
elseif text == 'فتح التثبيت' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:del(devVEER.."lockpin"..msg.chat_id_)  MOHMADdevVEER:srem(devVEER..'lock:pin',msg.chat_id_)
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فـتح التثبيت هنا \n✓',msg.sender_user_id_)  
elseif text == 'فتح التعديل' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:del(devVEER..'lock:edit'..msg.chat_id_) 
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فـتح تعديل الكلمات \n✓',msg.sender_user_id_)  
elseif text == 'فتح تعديل الميديا' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
MOHMADdevVEER:del(devVEER..'lock:edit:media'..msg.chat_id_) 
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فـتح تعديل الميديا \n✓',msg.sender_user_id_)  
elseif text == 'فتح الكل' and msg.reply_to_message_id_ == 0 and is_mod(msg) then 
rem_lockal(msg.chat_id_) 
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فـتح جميع الاوامر \n✓',msg.sender_user_id_)  
end
if text == 'قفل الروابط' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Link"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الروابط \n✓',msg.sender_user_id_)  
elseif text == 'قفل الروابط بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Link"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الروابط بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الروابط بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Link"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الروابط بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الروابط بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Link"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الروابط بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الروابط' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Link"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الروابط \n✓',msg.sender_user_id_)  
end
if text == 'قفل المعرفات' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:user:name"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل المعرفات \n✓',msg.sender_user_id_)  
elseif text == 'قفل المعرفات بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:user:name"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل المعرفات بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل المعرفات بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:user:name"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل المعرفات بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل المعرفات بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:user:name"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل المعرفات بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح المعرفات' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:user:name"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح المعرفات \n✓',msg.sender_user_id_)  
end
if text == 'قفل التاك' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:hashtak"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل التاك \n✓',msg.sender_user_id_)  
elseif text == 'قفل التاك بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:hashtak"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل التاك بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل التاك بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:hashtak"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل التاك بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل التاك بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:hashtak"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل التاك بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح التاك' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:hashtak"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح التاك \n✓',msg.sender_user_id_)  
end
if text == 'قفل الشارحه' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Cmd"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الشارحه \n✓',msg.sender_user_id_)  
elseif text == 'قفل الشارحه بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Cmd"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الشارحه بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الشارحه بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Cmd"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الشارحه بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الشارحه بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Cmd"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الشارحه بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الشارحه' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Cmd"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الشارحه \n✓',msg.sender_user_id_)  
end
if text == 'قفل الصور' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Photo"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الصور \n✓',msg.sender_user_id_)  
elseif text == 'قفل الصور بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Photo"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الصور بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الصور بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Photo"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الصور بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الصور بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Photo"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الصور بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الصور' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Photo"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الصور \n✓',msg.sender_user_id_)  
end
if text == 'قفل الفيديو' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Video"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الفيديو \n✓',msg.sender_user_id_)  
elseif text == 'قفل الفيديو بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Video"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الفيديو بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الفيديو بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Video"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الفيديو بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الفيديو بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Video"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الفيديو بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الفيديو' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Video"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الفيديو \n✓',msg.sender_user_id_)  
end
if text == 'قفل المتحركه' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Animation"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل المتحركه \n✓',msg.sender_user_id_)  
elseif text == 'قفل المتحركه بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Animation"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل المتحركه بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل المتحركه بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Animation"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل المتحركه بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل المتحركه بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Animation"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل المتحركه بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح المتحركه' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Animation"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح المتحركه \n✓',msg.sender_user_id_)  
end
if text == 'قفل الالعاب' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:geam"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الالعاب \n✓',msg.sender_user_id_)  
elseif text == 'قفل الالعاب بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:geam"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الالعاب بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الالعاب بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:geam"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الالعاب بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الالعاب بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:geam"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الالعاب بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الالعاب' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:geam"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الالعاب \n✓',msg.sender_user_id_)  
end
if text == 'قفل الاغاني' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Audio"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الاغاني \n✓',msg.sender_user_id_)  
elseif text == 'قفل الاغاني بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Audio"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الاغاني بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الاغاني بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Audio"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الاغاني بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الاغاني بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Audio"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الاغاني بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الاغاني' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Audio"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الاغاني \n✓',msg.sender_user_id_)  
end
if text == 'قفل الصوت' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:vico"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الصوت \n✓',msg.sender_user_id_)  
elseif text == 'قفل الصوت بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:vico"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الصوت بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الصوت بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:vico"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الصوت بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الصوت بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:vico"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الصوت بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الصوت' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:vico"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الصوت \n✓',msg.sender_user_id_)  
end
if text == 'قفل الكيبورد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Keyboard"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الكيبورد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الكيبورد بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Keyboard"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الكيبورد بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الكيبورد بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Keyboard"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الكيبورد بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الكيبورد بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Keyboard"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الكيبورد بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الكيبورد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Keyboard"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الكيبورد \n✓',msg.sender_user_id_)  
end
if text == 'قفل الملصقات' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Sticker"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الملصقات \n✓',msg.sender_user_id_)  
elseif text == 'قفل الملصقات بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Sticker"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الملصقات بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الملصقات بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Sticker"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الملصقات بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الملصقات بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Sticker"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الملصقات بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الملصقات' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Sticker"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الملصقات \n✓',msg.sender_user_id_)  
end
if text == 'قفل التوجيه' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:forward"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل التوجيه \n✓',msg.sender_user_id_)  
elseif text == 'قفل التوجيه بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:forward"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل التوجيه بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل التوجيه بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:forward"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل التوجيه بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل التوجيه بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:forward"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل التوجيه بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح التوجيه' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:forward"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح التوجيه \n✓',msg.sender_user_id_)  
end
if text == 'قفل الملفات' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Document"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الملفات \n✓',msg.sender_user_id_)  
elseif text == 'قفل الملفات بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Document"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الملفات بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الملفات بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Document"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الملفات بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الملفات بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Document"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الملفات بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الملفات' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Document"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الملفات \n✓',msg.sender_user_id_)  
end
if text == 'قفل السيلفي' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Unsupported"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل السيلفي \n✓',msg.sender_user_id_)  
elseif text == 'قفل السيلفي بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Unsupported"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل السيلفي بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل السيلفي بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Unsupported"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل السيلفي بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل السيلفي بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Unsupported"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل السيلفي بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح السيلفي' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Unsupported"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح السيلفي \n✓',msg.sender_user_id_)  
end
if text == 'قفل الماركداون' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Markdaun"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الماركداون \n✓',msg.sender_user_id_)  
elseif text == 'قفل الماركداون بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Markdaun"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الماركداون بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الماركداون بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Markdaun"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الماركداون بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الماركداون بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Markdaun"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الماركداون بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الماركداون' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Markdaun"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الماركداون \n✓',msg.sender_user_id_)  
end
if text == 'قفل الجهات' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Contact"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الجهات \n✓',msg.sender_user_id_)  
elseif text == 'قفل الجهات بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Contact"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الجهات بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الجهات بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Contact"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الجهات بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الجهات بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Contact"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الجهات بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الجهات' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Contact"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الجهات \n✓',msg.sender_user_id_)  
end
if text == 'قفل الكلايش' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Spam"..msg.chat_id_,'del')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الكلايش \n✓',msg.sender_user_id_)  
elseif text == 'قفل الكلايش بالتقييد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Spam"..msg.chat_id_,'ked')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الكلايش بالتقييد \n✓',msg.sender_user_id_)  
elseif text == 'قفل الكلايش بالكتم' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Spam"..msg.chat_id_,'ktm')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الكلايش بالكتم \n✓',msg.sender_user_id_)  
elseif text == 'قفل الكلايش بالطرد' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:set(devVEER.."lock:Spam"..msg.chat_id_,'kick')  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم قفـل الكلايش بالطرد \n✓',msg.sender_user_id_)  
elseif text == 'فتح الكلايش' and is_mod(msg) and msg.reply_to_message_id_ == 0 then 
MOHMADdevVEER:del(devVEER.."lock:Spam"..msg.chat_id_)  
monsend(msg,msg.chat_id_,'💥¦ اهــلا عـزيـزي {'..get_rtba(msg)..'} 🍃\n📮¦ تـم فتح الكلايش \n✓',msg.sender_user_id_)  
end
if text == "حذف الصوره" and is_mod(msg) then 
deleteChatPhoto(msg.chat_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_,1, '*📬¦* تم حذف صورة المجموعه \n',1,'md') 
end
if text and text:match("^ضع وصف$") and is_mod(msg) then  
MOHMADdevVEER:setex(devVEER.."set:description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📋¦* ارسل النص الذي تريده '  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
if text and text:match("^ضع ترحيب$") and is_mod(msg) then  
MOHMADdevVEER:setex(devVEER.."welc:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📃¦* ارسل النص الذي تريده '  
local tt = '\n*📬¦* ايضا يمكنك وضع \n*📛¦* دالة طباعه الاسم `name` \n*📛¦* ودالة طباعه اسم المجموعه `ngp`'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t..tt, 1, 'md') 
end
if text and text:match("^جلب صوره$") and not MOHMADdevVEER:get(devVEER.."lock:get:photo"..msg.chat_id_) then  
MOHMADdevVEER:setex(devVEER.."photo:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📛¦* ارسل رقم الصوره الان '  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
if text and text == 'تغير كليشه الترحيب' and is_devmohmad(msg)  then    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*🚸¦ حسنآ ارسل لي نص الترحيب *\n', 1, 'md')   
MOHMADdevVEER:set("addreply1:"..msg.sender_user_id_..bot_id,"rep")   
return false   end     
if text then    
local rep = MOHMADdevVEER:get("addreply1:"..msg.sender_user_id_..bot_id)   
if rep == 'rep' then    
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del("addreply1:"..msg.sender_user_id_..bot_id)   
return false  end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📷¦ ارسل لي صورة الترحيب *\n", 1, 'md')   
MOHMADdevVEER:set("addreply1:"..msg.sender_user_id_..bot_id,"repp")   
MOHMADdevVEER:set("addreply2:"..msg.sender_user_id_..bot_id, text)   
MOHMADdevVEER:set("klish:welc"..bot_id,text)   
return false   
end   
end   
if msg.content_.photo_ then   
local test = MOHMADdevVEER:get("addreply1:"..msg.sender_user_id_..bot_id)   
if test == 'repp' then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم تغير كليشه الترحيب 💯*\n", 1, 'md')   
MOHMADdevVEER:del("addreply1:"..msg.sender_user_id_..bot_id)   
local test = MOHMADdevVEER:get("addreply2:"..msg.sender_user_id_..bot_id)   
if msg.content_.photo_ then   
if msg.content_.photo_.sizes_[1] then   
MOHMADdevVEER:set("addreply1photo1"..bot_id, msg.content_.photo_.sizes_[1].photo_.persistent_id_)   
end 
end   
MOHMADdevVEER:del("addreply2:"..msg.sender_user_id_..bot_id)   
return false   end   
end
--======================
--ردود المجموعه بالرد
if text == "مسح الردود بالرد" and is_monsh(msg) then  
local list = MOHMADdevVEER:smembers(devVEER.."rep:media"..msg.chat_id_)  
local taha = MOHMADdevVEER:scard(devVEER.."rep:media"..msg.chat_id_)  
for k,v in pairs(list) do  
MOHMADdevVEER:del(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:gif"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:vico"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:stekr"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."taha:"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:photo"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:video"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:document"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:audio"..v..msg.chat_id_)  
MOHMADdevVEER:srem(devVEER.."rep:media"..msg.chat_id_,v)  
end  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦* المجموعه تحتوي على *{"..taha.."}* رد \n*📮¦* تم مسح الردود جميعها \n", 1, 'md')  
end
if  text == "قائمه الردود بالرد" and is_monsh(msg) then  
local list = MOHMADdevVEER:smembers(devVEER.."rep:media"..msg.chat_id_)  
t = "*📮¦ قائمة ردود المجموعه بالرد 🍃\nٴ━━━━━━━━━━━*\n"    
for k,v in pairs(list) do  
if MOHMADdevVEER:get(devVEER.."addreply1:gif"..v..msg.chat_id_) then
taha = 'متحركه 🎆'
elseif MOHMADdevVEER:get(devVEER.."addreply1:vico"..v..msg.chat_id_)  then
taha = 'بصمه 🎵'
elseif MOHMADdevVEER:get(devVEER.."addreply1:stekr"..v..msg.chat_id_)  then
taha = 'ملصق 🃏'
elseif MOHMADdevVEER:get(devVEER.."taha:"..v..msg.chat_id_) then
taha = 'رساله 💭'
elseif MOHMADdevVEER:get(devVEER.."addreply1:photo"..v..msg.chat_id_)  then
taha = 'صوره 🌇'
elseif MOHMADdevVEER:get(devVEER.."addreply1:video"..v..msg.chat_id_)  then
taha = 'فيديو 📹'
elseif MOHMADdevVEER:get(devVEER.."addreply1:document"..v..msg.chat_id_)  then
taha = 'ملف 📁'
elseif MOHMADdevVEER:get(devVEER.."addreply1:audio"..v..msg.chat_id_)  then
taha = 'اغنيه 🎵'
end
t = t..'*'..k..'• *❨`'..v..'`❩ *» {'..taha..'}*\n'    
end  
if #list == 0 then  
t = "*📬¦* لا يوجد ردود مضافه"  
end  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, t, 1, 'md')  
end  
if text == 'اضف رد بالرد' and is_mod(msg)  then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ حسنآ ارسل لي الكلمه الان *\n💥', 1, 'md')  
MOHMADdevVEER:set(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  end    
if text then   
local tsssst = MOHMADdevVEER:get(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == 'rep' then   
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_)  
return false  end 
if MOHMADdevVEER:sismember(devVEER..'rep:media'..msg.chat_id_,text) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ لقد تم اضافة رد بهاذه الكلمه \n📬¦ ارسل كلمه اخرى او ارسل الغاء*\n🍃\n", 1, 'md')  
else
media = '{ متحركه ‹› ملصق ‹› صوره ‹› اغنيه ‹› بصمه ‹› ملف ‹› فيديو }'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ حسنآ ارسل الرد الان\n📤¦ يمكنك ارسال الرد » "..media.."*\n🍃", 1, 'md')  
MOHMADdevVEER:set(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_,"repp")  
MOHMADdevVEER:set(devVEER.."addreply2:"..msg.sender_user_id_..msg.chat_id_, text)  
MOHMADdevVEER:sadd(devVEER.."rep:media"..msg.chat_id_,text)  
end
return false  end  
end  
if text and text == 'حذف رد بالرد' and  is_monsh(msg) then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ حسنآ ارسل لي الكلمه الان *\n💥', 1, 'md')  
MOHMADdevVEER:set(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = MOHMADdevVEER:get(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_)  
if test and test == 'reppp' then   
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_)  
return false  end 
if not MOHMADdevVEER:sismember(devVEER..'rep:media'..msg.chat_id_,text) then
MOHMADdevVEER:del(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦ الكلمه » {* ["..text.."] *} 🍃\n⚡¦ لا يوجد رد بهاذه الكلمه*\n💥\n", 1, 'md')  
MOHMADdevVEER:del("addreply1:gif"..text..msg.chat_id_)  
MOHMADdevVEER:del("addreply1:vico"..text..msg.chat_id_)  
MOHMADdevVEER:del("addreply1:stekr"..text..msg.chat_id_)  
MOHMADdevVEER:del("taha:"..text..msg.chat_id_)  
MOHMADdevVEER:del("addreply1:photo"..text..msg.chat_id_)
MOHMADdevVEER:del("addreply1:video"..text..msg.chat_id_)
MOHMADdevVEER:del("addreply1:document"..text..msg.chat_id_)
MOHMADdevVEER:del("addreply1:audio"..text..msg.chat_id_)
MOHMADdevVEER:srem("rep:media"..msg.chat_id_,text)  
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ الكلمه » {* ["..text.."] *} 🍃\n📬¦ تم حذفها من قائمة الردود *\n💥\n", 1, 'md')  
MOHMADdevVEER:del(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:gif"..text..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:vico"..text..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:stekr"..text..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."taha:"..text..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:photo"..text..msg.chat_id_)
MOHMADdevVEER:del(devVEER.."addreply1:video"..text..msg.chat_id_)
MOHMADdevVEER:del(devVEER.."addreply1:document"..text..msg.chat_id_)
MOHMADdevVEER:del(devVEER.."addreply1:audio"..text..msg.chat_id_)
MOHMADdevVEER:srem(devVEER.."rep:media"..msg.chat_id_,text)  
end
return false  end  
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = MOHMADdevVEER:get(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_)  
if test == 'repp' then  
if text then 
what = 'رساله 💭'
elseif msg.content_.sticker_ then 
what = 'ملصق 🎭'
elseif msg.content_.voice_ then 
what = 'صوت 🎙'
elseif msg.content_.animation_ then
what = 'متحركه 🃏'
elseif msg.content_.audio_ then 
what = 'اغنيه 🎵'
elseif msg.content_.document_ then 
what = 'ملف 📁'
elseif msg.content_.photo_ then 
what = 'صوره 🎆'
elseif msg.content_.video_ then  
what = 'فيديو 📹'
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📌¦ تم حفظ الردَ الخاص پك\n📨¦ نو؏ الرد — { '..what..' }*', 1, 'md')  
MOHMADdevVEER:del(devVEER.."addreply1:"..msg.sender_user_id_..msg.chat_id_)  
local test = MOHMADdevVEER:get(devVEER.."addreply2:"..msg.sender_user_id_..msg.chat_id_)  
if msg.content_.sticker_ then   
MOHMADdevVEER:set(devVEER.."addreply1:stekr"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
MOHMADdevVEER:set(devVEER.."addreply1:vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
MOHMADdevVEER:set(devVEER.."addreply1:gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
MOHMADdevVEER:set(devVEER.."taha:"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
MOHMADdevVEER:set(devVEER.."addreply1:audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
MOHMADdevVEER:set(devVEER.."addreply1:document"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
MOHMADdevVEER:set(devVEER.."addreply1:video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
MOHMADdevVEER:set(devVEER.."addreply1:video:caption"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
MOHMADdevVEER:set(devVEER.."addreply1:photo"..test..msg.chat_id_, photo_in_group)  
MOHMADdevVEER:set(devVEER.."addreply1:photo:caption"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
MOHMADdevVEER:del(devVEER.."addreply2:"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end

if text and msg.reply_to_message_id_ ~= 0 and not MOHMADdevVEER:get(devVEER..'lock:rep:rd'..msg.chat_id_) then  
local anemi = MOHMADdevVEER:get(devVEER.."addreply1:gif"..text..msg.chat_id_)   
local veico = MOHMADdevVEER:get(devVEER.."addreply1:vico"..text..msg.chat_id_)   
local stekr = MOHMADdevVEER:get(devVEER.."addreply1:stekr"..text..msg.chat_id_)     
local taha = MOHMADdevVEER:get(devVEER.."taha:"..text..msg.chat_id_)   
local photo = MOHMADdevVEER:get(devVEER.."addreply1:photo"..text..msg.chat_id_)
local photo_caption = (MOHMADdevVEER:get(devVEER.."addreply1:photo:caption"..text..msg.chat_id_) or '' )
local video = MOHMADdevVEER:get(devVEER.."addreply1:video"..text..msg.chat_id_)
local video_caption = MOHMADdevVEER:get(devVEER.."addreply1:video:caption"..text..msg.chat_id_)
local document = MOHMADdevVEER:get(devVEER.."addreply1:document"..text..msg.chat_id_)
local audio = MOHMADdevVEER:get(devVEER.."addreply1:audio"..text..msg.chat_id_)
if taha then    
VEER_sendMsg(msg.chat_id_, msg.reply_to_message_id_, 1, ''..check_markdown(taha)..'', 1, 'md')     
return false   
end    
if veico then    
sendVoice(msg.chat_id_, msg.reply_to_message_id_, 0, 1, nil, veico)   
return false   
end    
if stekr then    
sendSticker(msg.chat_id_, msg.reply_to_message_id_, 0, 1, nil, stekr)   
return false   
end   
if anemi then    
sendDocument(msg.chat_id_, msg.reply_to_message_id_, 0, 1,nil, anemi)   
return false   
end   
if photo then
sendPhoto(msg.chat_id_, msg.reply_to_message_id_, 0, 1, nil, photo,photo_caption)
return false  
end
if video then
sendVideo(msg.chat_id_, msg.reply_to_message_id_, 0, 1, nil,video,video_caption)
return false  
end
if document then
sendDocument(msg.chat_id_, msg.reply_to_message_id_, 0, 1,nil, document)   
return false  
end
if audio then
sendAudio(msg.chat_id_,msg.reply_to_message_id_,audio)  
return false  
end
end
--======================
--ردود المجموعه
if text == "مسح الردود" and is_monsh(msg) then  
local list = MOHMADdevVEER:smembers(devVEER.."repmedia"..msg.chat_id_)  
local taha = MOHMADdevVEER:scard(devVEER.."repmedia"..msg.chat_id_)  
for k,v in pairs(list) do  
MOHMADdevVEER:del(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."add:reply1:gif"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."add:reply1:vico"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."add:reply1:stekr"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."add:reply:rd"..v..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:photo:gp"..v..msg.chat_id_)
MOHMADdevVEER:del(devVEER.."addreply1:video:gp"..v..msg.chat_id_)
MOHMADdevVEER:del(devVEER.."addreply1:document:gp"..v..msg.chat_id_)
MOHMADdevVEER:del(devVEER.."addreply1:audio:gp"..v..msg.chat_id_)
MOHMADdevVEER:srem(devVEER.."repmedia"..msg.chat_id_,v)  
end  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦* المجموعه تحتوي على *{"..taha.."}* رد \n*📮¦* تم مسح الردود جميعها \n", 1, 'md')  
end
if  text == "قائمه الردود" and is_monsh(msg) then  
local list = MOHMADdevVEER:smembers(devVEER.."repmedia"..msg.chat_id_)  
t = "*📮¦ قائمة ردود المجموعه 🍃\nٴ━━━━━━━━━━━*\n"    
for k,v in pairs(list) do  
if MOHMADdevVEER:get(devVEER.."add:reply1:gif"..v..msg.chat_id_) then
taha = 'متحركه 🎆'
elseif MOHMADdevVEER:get(devVEER.."add:reply1:vico"..v..msg.chat_id_) then
taha = 'بصمه 🎙'
elseif MOHMADdevVEER:get(devVEER.."add:reply1:stekr"..v..msg.chat_id_) then
taha = 'ملصق 🃏'
elseif MOHMADdevVEER:get(devVEER.."add:reply:rd"..v..msg.chat_id_) then
taha = 'رساله 💭'
elseif MOHMADdevVEER:get(devVEER.."addreply1:photo:gp"..v..msg.chat_id_) then
taha = 'صوره 🌇'
elseif MOHMADdevVEER:get(devVEER.."addreply1:video:gp"..v..msg.chat_id_) then
taha = 'فيديو 📹'
elseif MOHMADdevVEER:get(devVEER.."addreply1:document:gp"..v..msg.chat_id_) then
taha = 'ملف 📁'
elseif MOHMADdevVEER:get(devVEER.."addreply1:audio:gp"..v..msg.chat_id_) then
taha = 'اغنيه 🎵'
end
t = t..'*'..k..'• *❨`'..v..'`❩ *» {'..taha..'}*\n'    
end  
if #list == 0 then  
t = "*📬¦* لا يوجد ردود مضافه"  
end  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, t, 1, 'md')  
end  
if text and text == 'اضف رد' and is_monsh(msg)  then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ حسنآ ارسل لي الكلمه الان *\n', 1, 'md')  
MOHMADdevVEER:set(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = MOHMADdevVEER:get(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == 'rep' then   
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
return false  end 
if MOHMADdevVEER:sismember(devVEER..'repmedia'..msg.chat_id_,text) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ لقد تم اضافة رد بهاذه الكلمه \n📬¦ ارسل كلمه اخرى او ارسل الغاء*\n🍃\n", 1, 'md')  
else
media = '{ متحركه ‹› ملصق ‹› صوره ‹› اغنيه ‹› بصمه ‹› ملف ‹› فيديو }'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ حسنآ ارسل الرد الان\n📤¦ يمكنك ارسال الرد » "..media.."*\n🍃", 1, 'md')  
MOHMADdevVEER:set(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_,"repp")  
MOHMADdevVEER:set(devVEER.."add:reply2"..msg.sender_user_id_..msg.chat_id_, text)  
MOHMADdevVEER:sadd(devVEER.."repmedia"..msg.chat_id_,text)  
end
return false  end  
end
if text == 'حذف رد' and is_monsh(msg) then   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ حسنآ ارسل لي الكلمه الان *\n', 1, 'md')  
MOHMADdevVEER:set(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = MOHMADdevVEER:get(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == 'reppp' then   
if not MOHMADdevVEER:sismember(devVEER..'repmedia'..msg.chat_id_,text) then
MOHMADdevVEER:del(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_)
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦ الكلمه » {* ["..text.."] *} 🍃\n⚡¦ لا يوجد رد بهاذه الكلمه*\n💥\n", 1, 'md')  
MOHMADdevVEER:del("add:reply1:gif"..text..msg.chat_id_)  
MOHMADdevVEER:del("add:reply1:vico"..text..msg.chat_id_)  
MOHMADdevVEER:del("add:reply1:stekr"..text..msg.chat_id_)  
MOHMADdevVEER:del("add:reply:rd"..text..msg.chat_id_)  
MOHMADdevVEER:del("addreply1:photo:gp"..text..msg.chat_id_)
MOHMADdevVEER:del("addreply1:video:gp"..text..msg.chat_id_)
MOHMADdevVEER:del("addreply1:document:gp"..text..msg.chat_id_)
MOHMADdevVEER:del("addreply1:audio:gp"..text..msg.chat_id_)
MOHMADdevVEER:srem("repmedia"..msg.chat_id_,text)  
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ الكلمه » {* ["..text.."] *} 🍃\n📬¦ تم حذفها من قائمة الردود *\n💥\n", 1, 'md')  
MOHMADdevVEER:del(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."add:reply1:gif"..text..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."add:reply1:vico"..text..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."add:reply1:stekr"..text..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."add:reply:rd"..text..msg.chat_id_)  
MOHMADdevVEER:del(devVEER.."addreply1:photo:gp"..text..msg.chat_id_)
MOHMADdevVEER:del(devVEER.."addreply1:video:gp"..text..msg.chat_id_)
MOHMADdevVEER:del(devVEER.."addreply1:document:gp"..text..msg.chat_id_)
MOHMADdevVEER:del(devVEER.."addreply1:audio:gp"..text..msg.chat_id_)
MOHMADdevVEER:srem(devVEER.."repmedia"..msg.chat_id_,text)  
end
return false  end  
end

if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = MOHMADdevVEER:get(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
if test == 'repp' then  
if text then 
what = 'رساله 💭'
elseif msg.content_.sticker_ then 
what = 'ملصق 🎭'
elseif msg.content_.voice_ then 
what = 'صوت 🎙'
elseif msg.content_.animation_ then
what = 'متحركه 🃏'
elseif msg.content_.audio_ then 
what = 'اغنيه 🎵'
elseif msg.content_.document_ then 
what = 'ملف 📁'
elseif msg.content_.photo_ then 
what = 'صوره 🎆'
elseif msg.content_.video_ then  
what = 'فيديو 📹'
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📌¦ تم حفظ الردَ الخاص پك\n📨¦ نو؏ الرد — { '..what..' }*', 1, 'md')  
MOHMADdevVEER:del(devVEER.."add:reply1"..msg.sender_user_id_..msg.chat_id_)  
local test = MOHMADdevVEER:get(devVEER.."add:reply2"..msg.sender_user_id_..msg.chat_id_)  
if msg.content_.sticker_ then   
MOHMADdevVEER:set(devVEER.."add:reply1:stekr"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
MOHMADdevVEER:set(devVEER.."add:reply1:vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
MOHMADdevVEER:set(devVEER.."add:reply1:gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
MOHMADdevVEER:set(devVEER.."add:reply:rd"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
MOHMADdevVEER:set(devVEER.."addreply1:audio:gp"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
MOHMADdevVEER:set(devVEER.."addreply1:document:gp"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
MOHMADdevVEER:set(devVEER.."addreply1:video:gp"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
MOHMADdevVEER:set(devVEER.."addreply1:video:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
MOHMADdevVEER:set(devVEER.."addreply1:photo:gp"..test..msg.chat_id_, photo_in_group)  
MOHMADdevVEER:set(devVEER.."addreply1:photo:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
MOHMADdevVEER:del(devVEER.."add:reply2"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end
if text and not MOHMADdevVEER:get(devVEER..'lock:rep'..msg.chat_id_) then  
local anemi = MOHMADdevVEER:get(devVEER.."add:reply1:gif"..text..msg.chat_id_)   
local veico = MOHMADdevVEER:get(devVEER.."add:reply1:vico"..text..msg.chat_id_)   
local stekr = MOHMADdevVEER:get(devVEER.."add:reply1:stekr"..text..msg.chat_id_)     
local taha = MOHMADdevVEER:get(devVEER.."add:reply:rd"..text..msg.chat_id_)   
local video_caption = MOHMADdevVEER:get(devVEER.."addreply1:video:caption:gp"..text..msg.chat_id_)
local photo_caption = (MOHMADdevVEER:get(devVEER.."addreply1:photo:caption:gp"..text..msg.chat_id_) or '' )
local photo = MOHMADdevVEER:get(devVEER.."addreply1:photo:gp"..text..msg.chat_id_)
local video = MOHMADdevVEER:get(devVEER.."addreply1:video:gp"..text..msg.chat_id_)
local document = MOHMADdevVEER:get(devVEER.."addreply1:document:gp"..text..msg.chat_id_)
local audio = MOHMADdevVEER:get(devVEER.."addreply1:audio:gp"..text..msg.chat_id_)
if taha then    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, ''..check_markdown(taha)..'', 1, 'md')     
return false   
end    
if veico then    
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
return false   
end    
if stekr then    
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
return false   
end   
if anemi then    
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, anemi)   
return false   end   
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, photo,photo_caption)
return false  
end
if video then
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video,video_caption)
return false  
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
return false  
end
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
return false  
end
end

--======================
--ردود المطور بالرد
if text == 'تفعيل ردود المطور بالرد' and is_devmohmad(msg) then   
if MOHMADdevVEER:get(devVEER..'lock:rep:all:rd'..bot_id) then
taha = '*📮¦ تم تفعيل ردود المطور بالرد *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:rep:all:rd'..bot_id)   
else
taha = '*📮¦ بالتاكيد تم تفعيل ردود الطور بالرد *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل ردود المطور بالرد' and is_devmohmad(msg) then  
if not MOHMADdevVEER:get(devVEER..'lock:rep:all:rd'..bot_id) then
taha = '*📮¦ تم تعطيل ردود المطور بالرد *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:rep:all:rd'..bot_id,true)   
else
taha = '*📮¦ بالتاكيد تم تعطيل ردود الطور بالرد *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == "مسح ردود المطور بالرد" and is_devmohmad(msg) then    
local list = MOHMADdevVEER:smembers(devVEER.."rep:media:all:rd"..bot_id)    
local taha = MOHMADdevVEER:scard(devVEER.."rep:media:all:rd"..bot_id)    
for k,v in pairs(list) do    
MOHMADdevVEER:del(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id)    
MOHMADdevVEER:del(devVEER.."add:repallt:gif:all:rd"..v..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:tvico:all:rd"..v..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:tstekr:all:rd"..v..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:text:all:rd"..v..bot_id)    
MOHMADdevVEER:del(devVEER.."all:addreply1:photo:gp"..v..bot_id)
MOHMADdevVEER:del(devVEER.."all:addreply1:video:gp"..v..bot_id)
MOHMADdevVEER:del(devVEER.."all:addreply1:document:gp"..v..bot_id)
MOHMADdevVEER:del(devVEER.."all:addreply1:audio:gp"..v..bot_id)
MOHMADdevVEER:srem(devVEER.."rep:media:all:rd"..bot_id,v)    
end    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦* المجموعه تحتوي على *{"..taha.."}* رد \n*📮¦* تم مسح الردود جميعها \n", 1, 'md')    
end
if  text == "ردود المطور بالرد" and is_devmohmad(msg) then    
local list = MOHMADdevVEER:smembers(devVEER.."rep:media:all:rd"..bot_id)    
t = "*📮¦ قائمة ردود المطور بالرد 🍃\nٴ━━━━━━━━━━━*\n"    
for k,v in pairs(list) do    
if MOHMADdevVEER:get(devVEER.."add:repallt:gif:all:rd"..v..bot_id) then
taha = 'متحركه 🎆'
elseif MOHMADdevVEER:get(devVEER.."add:rep:tvico:all:rd"..v..bot_id) then
taha = 'بصمه 🎙'
elseif MOHMADdevVEER:get(devVEER.."add:rep:tstekr:all:rd"..v..bot_id)  then
taha = 'ملصق 🃏'
elseif MOHMADdevVEER:get(devVEER.."add:rep:text:all:rd"..v..bot_id) then
taha = 'رساله 💭'
elseif MOHMADdevVEER:get(devVEER.."all:addreply1:photo:gp"..v..bot_id)  then
taha = 'صوره 🌇'
elseif MOHMADdevVEER:get(devVEER.."all:addreply1:video:gp"..v..bot_id)  then
taha = 'فيديو 📹'
elseif MOHMADdevVEER:get(devVEER.."all:addreply1:document:gp"..v..bot_id)  then
taha = 'ملف 📁'
elseif MOHMADdevVEER:get(devVEER.."all:addreply1:audio:gp"..v..bot_id)  then
taha = 'اغنيه 🎵'
end
t = t..'*'..k..'• *❨`'..v..'`❩ *» {'..taha..'}*\n'    
end    
if #list == 0 then    
t = "*📬¦* لا يوجد ردود مضافه"    
end    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, t, 1, 'md')    
end
if text and text == 'اضف رد بالرد عام' and is_devmohmad(msg)  then     
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ حسنآ ارسل لي الكلمه الان *\n💥', 1, 'md')  
MOHMADdevVEER:set(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id,'yes')    
return false    end      
if text then     
local tt = MOHMADdevVEER:get(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id)    
if tt == 'yes' then     
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id)    
return false  end 
if MOHMADdevVEER:sismember(devVEER.."rep:media:all:rd"..bot_id,text) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ لقد تم اضافة رد بهاذه الكلمه \n📬¦ ارسل كلمه اخرى او ارسل الغاء*\n🍃\n", 1, 'md')  
else
media = '{ متحركه ‹› ملصق ‹› صوره ‹› اغنيه ‹› بصمه ‹› ملف ‹› فيديو }'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ حسنآ ارسل الرد الان\n📤¦ يمكنك ارسال الرد » "..media.."*\n🍃", 1, 'md')  
MOHMADdevVEER:set(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id,'yes1')    
MOHMADdevVEER:set(devVEER.."addreply2:"..msg.sender_user_id_..bot_id, text)    
MOHMADdevVEER:sadd(devVEER.."rep:media:all:rd"..bot_id,text)    
end
return false    end    
end
if text and text == 'حذف رد بالرد عام' and  is_devmohmad(msg) then     
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ حسنآ ارسل لي الكلمه الان *\n💥', 1, 'md')  
MOHMADdevVEER:set(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id,'yes11')    
return false    end    
--للكل بالرد
if text then 
local test = MOHMADdevVEER:get(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id)    
if test and test == 'yes11' then     
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id)    
return false  end 
if not MOHMADdevVEER:sismember(devVEER..'rep:media:all:rd'..bot_id,text) then
MOHMADdevVEER:del(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id)    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🎫¦ الكلمه » {* ["..text.."] *} 🍂\n📮¦ لا يوجد رد بهاذه الكلمه*\n💥\n", 1, 'md')  
MOHMADdevVEER:del("add:repallt:gif:all:rd"..text..bot_id)    
MOHMADdevVEER:del("add:rep:tvico:all:rd"..text..bot_id)    
MOHMADdevVEER:del("add:rep:tstekr:all:rd"..text..bot_id)    
MOHMADdevVEER:del("add:rep:text:all:rd"..text..bot_id)    
MOHMADdevVEER:del("all:addreply1:photo:gp"..text..bot_id)
MOHMADdevVEER:del("all:addreply1:video:gp"..text..bot_id)
MOHMADdevVEER:del("all:addreply1:document:gp"..text..bot_id)
MOHMADdevVEER:del("all:addreply1:audio:gp"..text..bot_id)
MOHMADdevVEER:del("rep:media:all:rd"..bot_id,text)    
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📌¦ الكلمه » {* ["..text.."] *} 🍂\n💢¦ تم حذفها من قائمة الردود *\n💥\n", 1, 'md')  
MOHMADdevVEER:del(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id)    
MOHMADdevVEER:del(devVEER.."add:repallt:gif:all:rd"..text..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:tvico:all:rd"..text..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:tstekr:all:rd"..text..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:text:all:rd"..text..bot_id)    
MOHMADdevVEER:del(devVEER.."all:addreply1:photo:gp"..text..bot_id)
MOHMADdevVEER:del(devVEER.."all:addreply1:video:gp"..text..bot_id)
MOHMADdevVEER:del(devVEER.."all:addreply1:document:gp"..text..bot_id)
MOHMADdevVEER:del(devVEER.."all:addreply1:audio:gp"..text..bot_id)
MOHMADdevVEER:srem(devVEER.."rep:media:all:rd"..bot_id,text)    
end
return false    end    
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = MOHMADdevVEER:get(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id)    
if test == 'yes1' then    
if text then 
what = 'رساله 💭'
elseif msg.content_.sticker_ then 
what = 'ملصق 🎭'
elseif msg.content_.voice_ then 
what = 'صوت 🎙'
elseif msg.content_.animation_ then
what = 'متحركه 🃏'
elseif msg.content_.audio_ then 
what = 'اغنيه 🎵'
elseif msg.content_.document_ then 
what = 'ملف 📁'
elseif msg.content_.photo_ then 
what = 'صوره 🎆'
elseif msg.content_.video_ then  
what = 'فيديو 📹'
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📌¦ تم حفظ الردَ الخاص پك\n📨¦ نو؏ الرد — { '..what..' }*', 1, 'md')  
MOHMADdevVEER:del(devVEER.."add:repallt:rd"..msg.sender_user_id_..bot_id)    
local test = MOHMADdevVEER:get(devVEER.."addreply2:"..msg.sender_user_id_..bot_id)    
if msg.content_.sticker_ then     
MOHMADdevVEER:set(devVEER.."add:rep:tstekr:all:rd"..test..bot_id, msg.content_.sticker_.sticker_.persistent_id_)    
end     
if msg.content_.voice_ then    
MOHMADdevVEER:set(devVEER.."add:rep:tvico:all:rd"..test..bot_id, msg.content_.voice_.voice_.persistent_id_)    
end     
if msg.content_.animation_ then     
MOHMADdevVEER:set(devVEER.."add:repallt:gif:all:rd"..test..bot_id, msg.content_.animation_.animation_.persistent_id_)    
end    
if text then     
MOHMADdevVEER:set(devVEER.."add:rep:text:all:rd"..test..bot_id, text)    
end    
if msg.content_.audio_ then
MOHMADdevVEER:set(devVEER.."all:addreply1:audio:gp"..test..bot_id, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
MOHMADdevVEER:set(devVEER.."all:addreply1:document:gp"..test..bot_id, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
MOHMADdevVEER:set(devVEER.."all:addreply1:video:gp"..test..bot_id, msg.content_.video_.video_.persistent_id_)  
MOHMADdevVEER:set(devVEER.."all:addreply1:video:caption:gp"..test..bot_id,(msg.content_.caption_ or ''))  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
MOHMADdevVEER:set(devVEER.."all:addreply1:photo:gp"..test..bot_id, photo_in_group)  
MOHMADdevVEER:set(devVEER.."all:addreply1:photo:caption:gp"..test..bot_id,(msg.content_.caption_ or ''))  
end
MOHMADdevVEER:del(devVEER.."addreply2:"..msg.sender_user_id_..bot_id)    
return false    
end    
end
if text and msg.reply_to_message_id_ ~= 0 and not MOHMADdevVEER:get(devVEER..'lock:rep:all:rd'..bot_id) then   
local anemi = MOHMADdevVEER:get(devVEER.."add:repallt:gif:all:rd"..text..bot_id)    
local veico = MOHMADdevVEER:get(devVEER.."add:rep:tvico:all:rd"..text..bot_id)    
local stekr = MOHMADdevVEER:get(devVEER.."add:rep:tstekr:all:rd"..text..bot_id)      
local taha = MOHMADdevVEER:get(devVEER.."add:rep:text:all:rd"..text..bot_id)    
local video_caption = MOHMADdevVEER:get(devVEER.."all:addreply1:video:caption:gp"..text..bot_id)
local photo_caption = (MOHMADdevVEER:get(devVEER.."all:addreply1:photo:caption:gp"..text..bot_id) or '' )
local photo = MOHMADdevVEER:get(devVEER.."all:addreply1:photo:gp"..text..bot_id)
local video = MOHMADdevVEER:get(devVEER.."all:addreply1:video:gp"..text..bot_id)
local document = MOHMADdevVEER:get(devVEER.."all:addreply1:document:gp"..text..bot_id)
local audio = MOHMADdevVEER:get(devVEER.."all:addreply1:audio:gp"..text..bot_id)
if taha then     
VEER_sendMsg(msg.chat_id_, msg.reply_to_message_id_, 1, ''..check_markdown(taha)..'', 1, 'md')      
return false    
end     
if veico then     
sendVoice(msg.chat_id_, msg.reply_to_message_id_, 0, 1, nil, veico)    
return false    end     
if stekr then     
sendSticker(msg.chat_id_, msg.reply_to_message_id_, 0, 1, nil, stekr)    
return false    
end    
if anemi then     
sendDocument(msg.chat_id_, msg.reply_to_message_id_, 0, 1,nil, anemi)    
return false    
end    
if photo then
sendPhoto(msg.chat_id_, msg.reply_to_message_id_, 0, 1, nil, photo,photo_caption)
return false  
end
if video then
sendVideo(msg.chat_id_, msg.reply_to_message_id_, 0, 1, nil,video,video_caption)
return false  
end
if document then
sendDocument(msg.chat_id_, msg.reply_to_message_id_, 0, 1,nil, document)   
return false  
end
if audio then
sendAudio(msg.chat_id_,msg.reply_to_message_id_,audio)  
return false  
end
end    
--======================
--ردود المطور
if text == 'تفعيل ردود المطور' and is_devmohmad(msg) then   
if MOHMADdevVEER:get(devVEER..'lock:rep:all'..bot_id) then
taha = '*📮¦ تم تفعيل ردود المطور *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:rep:all'..bot_id)   
else
taha = '*📮¦ بالتاكيد تم تفعيل ردود الطور *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل ردود المطور' and is_devmohmad(msg) then  
if not MOHMADdevVEER:get(devVEER..'lock:rep:all'..bot_id) then
taha = '*📮¦ تم تعطيل ردود المطور *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:rep:all'..bot_id,true)   
else
taha = '*📮¦ بالتاكيد تم تعطيل ردود الطور *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == "مسح ردود المطور" and is_devmohmad(msg) then    
local list = MOHMADdevVEER:smembers(devVEER.."rep:media:all"..bot_id)    
local taha = MOHMADdevVEER:scard(devVEER.."rep:media:all"..bot_id)    
for k,v in pairs(list) do    
MOHMADdevVEER:del(devVEER.."add:repallt"..msg.sender_user_id_..bot_id)    
MOHMADdevVEER:del(devVEER.."add:repallt:gif:all"..v..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:tvico:all"..v..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:tstekr:all"..v..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:text:all"..v..bot_id)    
MOHMADdevVEER:del(devVEER.."mall:addreply1:photo:gp"..v..bot_id)
MOHMADdevVEER:del(devVEER.."mall:addreply1:video:gp"..v..bot_id)
MOHMADdevVEER:del(devVEER.."mall:addreply1:document:gp"..v..bot_id)
MOHMADdevVEER:del(devVEER.."mall:addreply1:audio:gp"..v..bot_id)
MOHMADdevVEER:srem(devVEER.."rep:media:all"..bot_id,v)    
MOHMADdevVEER:del("add:repallt"..msg.sender_user_id_..bot_id)    
MOHMADdevVEER:del("add:repallt:gif:all"..v..bot_id)    
MOHMADdevVEER:del("add:rep:tvico:all"..v..bot_id)    
MOHMADdevVEER:del("add:rep:tstekr:all"..v..bot_id)    
MOHMADdevVEER:del("add:rep:text:all"..v..bot_id)    
MOHMADdevVEER:del("mall:addreply1:photo:gp"..v..bot_id)
MOHMADdevVEER:del("mall:addreply1:video:gp"..v..bot_id)
MOHMADdevVEER:del("mall:addreply1:document:gp"..v..bot_id)
MOHMADdevVEER:del("mall:addreply1:audio:gp"..v..bot_id)
MOHMADdevVEER:srem("rep:media:all"..bot_id,v)    
end    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦* المجموعه تحتوي على *{"..taha.."}* رد \n*📮¦* تم مسح الردود جميعها \n", 1, 'md')    
end
if  text == "ردود المطور" and is_devmohmad(msg) then    
local list = MOHMADdevVEER:smembers(devVEER.."rep:media:all"..bot_id)    
t = "*📮¦ قائمة ردود المطور 🍃\nٴ━━━━━━━━━━━*\n"    
for k,v in pairs(list) do    
if MOHMADdevVEER:get(devVEER.."add:repallt:gif:all"..v..bot_id) then
taha = 'متحركه 🎆'
elseif MOHMADdevVEER:get(devVEER.."add:rep:tvico:all"..v..bot_id) then
taha = 'بصمه 🎙'
elseif MOHMADdevVEER:get(devVEER.."add:rep:tstekr:all"..v..bot_id) then
taha = 'ملصق 🃏'
elseif MOHMADdevVEER:get(devVEER.."add:rep:text:all"..v..bot_id) then
taha = 'رساله 💭'
elseif MOHMADdevVEER:get(devVEER.."mall:addreply1:photo:gp"..v..bot_id)  then
taha = 'صوره 🌇'
elseif MOHMADdevVEER:get(devVEER.."mall:addreply1:video:gp"..v..bot_id)  then
taha = 'فيديو 📹'
elseif MOHMADdevVEER:get(devVEER.."mall:addreply1:document:gp"..v..bot_id)  then
taha = 'ملف 📁'
elseif MOHMADdevVEER:get(devVEER.."mall:addreply1:audio:gp"..v..bot_id)  then
taha = 'اغنيه 🎵'
end
t = t..'*'..k..'• *❨`'..v..'`❩ *» {'..taha..'}*\n'    
end    
if #list == 0 then    
t = "*📬¦* لا يوجد ردود مضافه"    
end    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, t, 1, 'md')    
end
if text and text == 'اضف رد عام' and is_devmohmad(msg)  then     
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ حسنآ ارسل لي الكلمه الان *\n💥', 1, 'md')  
MOHMADdevVEER:set(devVEER.."add:repallt"..msg.sender_user_id_..bot_id,'yes')    
return false    end      
if text then    
local tt = MOHMADdevVEER:get(devVEER.."add:repallt"..msg.sender_user_id_..bot_id)    
if tt == 'yes' then     
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."add:repallt"..msg.sender_user_id_..bot_id)    
return false  end 
if MOHMADdevVEER:sismember(devVEER.."rep:media:all"..bot_id,text) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦ لقد تم اضافة رد بهاذه الكلمه \n📬¦ ارسل كلمه اخرى او ارسل الغاء*\n🍃\n", 1, 'md')  
else
media = '{ متحركه ‹› ملصق ‹› صوره ‹› اغنيه ‹› بصمه ‹› ملف ‹› فيديو }'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ حسنآ ارسل الرد الان\n📤¦ يمكنك ارسال الرد » "..media.."*\n🍃", 1, 'md')  
MOHMADdevVEER:set(devVEER.."add:repallt"..msg.sender_user_id_..bot_id,'yes1')    
MOHMADdevVEER:set(devVEER.."addreply2:"..msg.sender_user_id_..bot_id, text)    
MOHMADdevVEER:sadd(devVEER.."rep:media:all"..bot_id,text)    
end
return false    end    
end
if text and text == 'حذف رد عام' and  is_devmohmad(msg) then     
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ حسنآ ارسل لي الكلمه الان *\n💥', 1, 'md')  
MOHMADdevVEER:set(devVEER.."add:repallt"..msg.sender_user_id_..bot_id,'yes11')    
return false    end    
if text then 
local test = MOHMADdevVEER:get(devVEER.."add:repallt"..msg.sender_user_id_..bot_id)    
if test and test == 'yes11' then   
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."add:repallt"..msg.sender_user_id_..bot_id)    
return false  end   
if not MOHMADdevVEER:sismember(devVEER..'rep:media:all'..bot_id,text) then
MOHMADdevVEER:del(devVEER.."add:repallt"..msg.sender_user_id_..bot_id)    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🎫¦ الكلمه » {* ["..text.."] *} 🍂\n📮¦ لا يوجد رد بهاذه الكلمه*\n💥\n", 1, 'md')  
MOHMADdevVEER:del(devVEER.."add:repallt:gif:all"..text..bot_id)    MOHMADdevVEER:del(devVEER.."add:rep:tvico:all"..text..bot_id)    MOHMADdevVEER:del(devVEER.."add:rep:tstekr:all"..text..bot_id)    MOHMADdevVEER:del(devVEER.."add:rep:text:all"..text..bot_id) MOHMADdevVEER:srem("rep:media:all"..bot_id,text) 
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📌¦ الكلمه » {* ["..text.."] *} 🍂\n💢¦ تم حذفها من قائمة الردود *\n💥\n", 1, 'md')  
MOHMADdevVEER:del(devVEER.."add:repallt"..msg.sender_user_id_..bot_id)    
MOHMADdevVEER:del(devVEER.."add:repallt:gif:all"..text..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:tvico:all"..text..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:tstekr:all"..text..bot_id)    
MOHMADdevVEER:del(devVEER.."add:rep:text:all"..text..bot_id)    
MOHMADdevVEER:del(devVEER.."mall:addreply1:photo:gp"..text..bot_id)
MOHMADdevVEER:del(devVEER.."mall:addreply1:video:gp"..text..bot_id)
MOHMADdevVEER:del(devVEER.."mall:addreply1:document:gp"..text..bot_id)
MOHMADdevVEER:del(devVEER.."mall:addreply1:audio:gp"..text..bot_id)
MOHMADdevVEER:srem(devVEER.."rep:media:all"..bot_id,text)    
end
return false    end    
end    
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = MOHMADdevVEER:get(devVEER.."add:repallt"..msg.sender_user_id_..bot_id)    
if test == 'yes1' then    
if text then 
what = 'رساله 💭'
elseif msg.content_.sticker_ then 
what = 'ملصق 🎭'
elseif msg.content_.voice_ then 
what = 'صوت 🎙'
elseif msg.content_.animation_ then
what = 'متحركه 🃏'
elseif msg.content_.audio_ then 
what = 'اغنيه 🎵'
elseif msg.content_.document_ then 
what = 'ملف 📁'
elseif msg.content_.photo_ then 
what = 'صوره 🎆'
elseif msg.content_.video_ then  
what = 'فيديو 📹'
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📌¦ تم حفظ الردَ الخاص پك\n📨¦ نو؏ الرد — { '..what..' }*', 1, 'md')  
MOHMADdevVEER:del(devVEER.."add:repallt"..msg.sender_user_id_..bot_id)    
local test = MOHMADdevVEER:get(devVEER.."addreply2:"..msg.sender_user_id_..bot_id)    
if msg.content_.sticker_ then     
MOHMADdevVEER:set(devVEER.."add:rep:tstekr:all"..test..bot_id, msg.content_.sticker_.sticker_.persistent_id_)    
end     
if msg.content_.voice_ then    
MOHMADdevVEER:set(devVEER.."add:rep:tvico:all"..test..bot_id, msg.content_.voice_.voice_.persistent_id_)    
end     
if msg.content_.animation_ then     
MOHMADdevVEER:set(devVEER.."add:repallt:gif:all"..test..bot_id, msg.content_.animation_.animation_.persistent_id_)    
end    
if text then     
MOHMADdevVEER:set(devVEER.."add:rep:text:all"..test..bot_id, text)    
end    
if msg.content_.audio_ then
MOHMADdevVEER:set(devVEER.."mall:addreply1:audio:gp"..test..bot_id, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
MOHMADdevVEER:set(devVEER.."mall:addreply1:document:gp"..test..bot_id, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
MOHMADdevVEER:set(devVEER.."mall:addreply1:video:gp"..test..bot_id, msg.content_.video_.video_.persistent_id_)  
MOHMADdevVEER:set(devVEER.."mall:addreply1:video:caption:gp"..test..bot_id,(msg.content_.caption_ or ''))  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
MOHMADdevVEER:set(devVEER.."mall:addreply1:photo:gp"..test..bot_id, photo_in_group)  
MOHMADdevVEER:set(devVEER.."mall:addreply1:photo:caption:gp"..test..bot_id,(msg.content_.caption_ or ''))  
end
MOHMADdevVEER:del(devVEER.."addreply2:"..msg.sender_user_id_..bot_id)    
return false    end    
end
if text and not MOHMADdevVEER:get(devVEER..'lock:rep:all'..bot_id) then    
local anemi = MOHMADdevVEER:get(devVEER.."add:repallt:gif:all"..text..bot_id)    
local veico = MOHMADdevVEER:get(devVEER.."add:rep:tvico:all"..text..bot_id)    
local stekr = MOHMADdevVEER:get(devVEER.."add:rep:tstekr:all"..text..bot_id)      
local taha = MOHMADdevVEER:get(devVEER.."add:rep:text:all"..text..bot_id)    
local video_caption = MOHMADdevVEER:get(devVEER.."mall:addreply1:video:caption:gp"..text..bot_id)
local photo_caption = (MOHMADdevVEER:get(devVEER.."mall:addreply1:photo:caption:gp"..text..bot_id) or '' )
local photo = MOHMADdevVEER:get(devVEER.."mall:addreply1:photo:gp"..text..bot_id)
local video = MOHMADdevVEER:get(devVEER.."mall:addreply1:video:gp"..text..bot_id)
local document = MOHMADdevVEER:get(devVEER.."mall:addreply1:document:gp"..text..bot_id)
local audio = MOHMADdevVEER:get(devVEER.."mall:addreply1:audio:gp"..text..bot_id)
if taha then     
VEER_sendMsg(msg.chat_id_, msg.id_, 1, ''..check_markdown(taha)..'', 1, 'md')      
return false    end     
if veico then     
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)    
return false    
end     
if stekr then     
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)    
return false    
end    
if anemi then     
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, anemi)    
return false    
end    
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, photo,photo_caption)
return false  
end
if video then
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video,video_caption)
return false  
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
return false  
end
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
return false  
end
end
--======================
if text ==('ايديي') then   
VEER_sendMsg(msg.chat_id_, msg.id_,  1, '*📮¦ اضغط على الايدي ليتم نسخه ➘*\n\n*📬¦ الايدي ◂⊱ *`'..msg.sender_user_id_..'` *⊰▸*\n💥', 1, 'md')   
end

if text == "تنظيف المجموعات" and is_devmohmad(msg) then
local group = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')   
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
MOHMADdevVEER:srem(devVEER.."bot:gpsby:id",group[i])  
rem_group(group[i])   
changeChatMemberStatus(group[i], bot_id, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
MOHMADdevVEER:srem(devVEER..'bot:gpsby:id',group[i]) 
rem_group(group[i])   
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
MOHMADdevVEER:srem(devVEER..'bot:gpsby:id',group[i]) 
rem_group(pv[i])   
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
MOHMADdevVEER:srem(devVEER..'bot:gpsby:id',group[i]) 
rem_group(group[i])   
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦ لا يوجد مجموعات وهميه في البوت* \n🍃', 1, 'md')   
else
local taha = (w + q)
local sendok = #group - taha
if q == 0 then
taha = ''
else
taha = '\n*🚸¦ تم ازالة ↫ ❪ '..q..' ❫ مجموعات من البوت*'
end
if w == 0 then
VEER = ''
else
VEER = '\n*📬¦ تم ازالة ↫ ❪'..w..'❫ مجموعه لان البوت عضو*'
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦ عدد المجموعات الان ↫ ❪ '..#group..' ❫*'..VEER..''..taha..'\n*📡¦ الان عدد المجموعات الحقيقي ↫ ❪ '..sendok..' ❫ مجموعات*\n💥', 1, 'md')   
end
end
end,nil)
end
return false
end
if text == "تنظيف المشتركين" and is_devmohmad(msg) then
local pv = MOHMADdevVEER:smembers(devVEER..'usersbot')   
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
MOHMADdevVEER:srem(devVEER.."usersbot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦ لا يوجد مشتركين وهميين في البوت* \n🍃', 1, 'md')   
else
local ok = #pv - sendok
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦ عدد المشتركين الان ↫ ❪ '..#pv..' ❫*\n*📬¦ تم ازالة ↫ ❪ '..sendok..' ❫ من المشتركين*\n*📡¦ الان عدد المشتركين الحقيقي ↫ ❪ '..ok..' ❫ مشترك*\n💥', 1, 'md')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "وضع اسم البوت" and is_devmohmad(msg) then MOHMADdevVEER:setex(devVEER..'namebot:witting'..msg.sender_user_id_,300,true) VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦* ارسل لي الاسم 📯\n",1, 'md')  end
if text == 'مسح البوتات' and is_monsh(msg) then   
tdcli_function ({ 
ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
local taha = tah.members_[i].user_id_
x = x + 1 end
kicck(msg,msg.chat_id_,admins[i].user_id_)
c = c + 1
end     
if (c - x) == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ لا توجد بوتات هنا *\n ", 1, 'md')
else
local t = '*📮¦ عدد البوتات هنا » ❪'..c..'❫*\n*📬¦ عدد البوتات التي هي ادمن » ❪'..x..'❫*\n*💠¦ تم طرد » ❪'..(c - x)..'❫ من البوتات*'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end 
end,nil)  
end   
if text == ("كشف البوتات") and is_monsh(msg) then 
local function cb(extra,result,success)
local admins = result.members_  
text = '*💠¦ اهلا بك عزيزي في كشف البوتات*\nٴ━━━━━━━━━━\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = ' ❪✯❫'
end
text = text.."⟡➺ [@"..ta.username_..']'..tr.."\n"
if #admins == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ لا توجد بوتات هنا *\n ", 1, 'md')
return false end
if #admins == i then 
local a = '\nٴ━━━━━━━━━━\n*📮¦ عدد البوتات التي هنا » ❪'..n..'❫* بوت\n'
local f = '*📮¦ عدد البوتات التي هي ادمن » ❪'..t..'❫*\n*⚠¦ ملاحضه علامة ال (✯) تعني ان البوت ادمن *\n💥'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end
getChannelMembers(msg.chat_id_, 0, 'Bots', 200,cb)
end
if text == 'قفل التكرار بالطرد' and is_mod(msg) then 
MOHMADdevVEER:hset("flooding:settings:"..msg.chat_id_ ,"flood",'kick')  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📮*¦* تم قفل التكرار بالطرد \n*📬¦ خـاصيــه ، الطرد 🍃*\n💥',1, 'md')
elseif text == 'قفل التكرار' and is_mod(msg) then 
MOHMADdevVEER:hset("flooding:settings:"..msg.chat_id_ ,"flood",'del')  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📮*¦* تم قفل التكرار \n*📬¦ خـاصيــه ، الحذف 🍃*\n💥',1, 'md')
elseif text == 'قفل التكرار بالتقييد' and is_mod(msg) then 
MOHMADdevVEER:hset("flooding:settings:"..msg.chat_id_ ,"flood",'keed')  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📮*¦* تم قفل التكرار بالتقييد \n*📬¦ خـاصيــه ، التقييد 🍃*\n💥',1, 'md')
elseif text == 'قفل التكرار بالكتم' and is_mod(msg) then 
MOHMADdevVEER:hset("flooding:settings:"..msg.chat_id_ ,"flood",'mute')  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📮*¦* تم قفل التكرار بالكتم \n*📬¦ خـاصيــه ، الكتم 🍃*\n💥',1, 'md')
elseif text == 'فتح التكرار' and is_mod(msg) then 
MOHMADdevVEER:hdel("flooding:settings:"..msg.chat_id_ ,"flood")  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📮*¦* تم فتح التكرار \n💥',1, 'md')
end 
if MOHMADdevVEER:get(devVEER.."bc:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
MOHMADdevVEER:del(devVEER..'id:gp'..msg.chat_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."bc:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
MOHMADdevVEER:del(devVEER.."bc:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(.*)") 
local iduserr = MOHMADdevVEER:get(devVEER..'id:gp'..msg.chat_id_)  
VEER_sendMsg((iduserr), 0, 1, numadded, 1, "html")   
VEER_sendMsg(msg.chat_id_, msg.id_,  1, "📬*¦* تم ارسال رسالتك الى  *{ "..iduserr..' }* ', 1, 'md')  
end
if text and text:match("^اذاعه (-%d+)$") and is_devmohmad(msg) then  
taha = text:match("^اذاعه (-%d+)$")
MOHMADdevVEER:set(devVEER..'id:gp'..msg.chat_id_,taha)  
MOHMADdevVEER:setex(devVEER.."bc:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📊¦ ارسل لي النص الذي تريده*'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
if text then 
if is_mod(msg) then
if text == 'ارسال نسخه' and is_devmohmad(msg) then  sendDocument(SUDO, 0, 0, 1, nil, './VEER.lua', '🚸¦اسم الملف ( VEER.lua )\n♻¦عدد المشتركين ( '..(MOHMADdevVEER:scard(devVEER.."usersbot") or 0)..' )\n📮¦عدد المجموعات ( '..(MOHMADdevVEER:scard(devVEER.."botgps") or 0)..' )',dl_cb, nil)  end
if text == 'اذاعه خاص' and tonumber(msg.reply_to_message_id_) > 0 and is_devmohmad(msg) then 
function cb(a,b,c) 
if b.content_.text_ then
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
VEER_sendMsg(v, 0, 1, '[ '..b.content_.text_..' ]', 1, 'md')  
end
elseif b.content_.photo_ then
if b.content_.photo_.sizes_[0] then
photo = b.content_.photo_.sizes_[0].photo_.persistent_id_
elseif b.content_.photo_.sizes_[1] then
photo = b.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(b.content_.caption_ or '')) 
end
elseif b.content_.animation_ then
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, b.content_.animation_.animation_.persistent_id_,(b.content_.caption_ or ''))    
end 
elseif b.content_.sticker_ then
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, b.content_.sticker_.sticker_.persistent_id_)   
end 
end
local pv = MOHMADdevVEER:scard(devVEER.."usersbot")      
local text = '📮*¦ تمت الاذاعه الى » ❪'..pv..'❫* مشتركين في البوت \n💥' 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md') 
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb) 
end
if text == 'اذاعه' and tonumber(msg.reply_to_message_id_) > 0 and is_devmohmad(msg) then 
function cb(a,b,c) 
if b.content_.text_ then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
VEER_sendMsg(v, 0, 1, '[ '..b.content_.text_..' ]', 1, 'md')  
end
elseif b.content_.photo_ then
if b.content_.photo_.sizes_[0] then
photo = b.content_.photo_.sizes_[0].photo_.persistent_id_
elseif b.content_.photo_.sizes_[1] then
photo = b.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(b.content_.caption_ or ''))
end 
elseif b.content_.animation_ then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, b.content_.animation_.animation_.persistent_id_,(b.content_.caption_ or ''))    
end 
elseif b.content_.sticker_ then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, b.content_.sticker_.sticker_.persistent_id_)   
end 
end
local grp = MOHMADdevVEER:scard(devVEER.."bot:gpsby:id")       
local text = '📬*¦ تمت الاذاعه الى » ❪'..grp..'❫* مشتركين في البوت \n💥' 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md') 
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb) 
end
if text == 'اذاعه عام' and tonumber(msg.reply_to_message_id_) > 0 and is_devmohmad(msg) then 
function cb(a,b,c) 
if b.content_.text_ then
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
VEER_sendMsg(v, 0, 1, '[ '..b.content_.text_..' ]', 1, 'md')  
end
elseif b.content_.photo_ then
if b.content_.photo_.sizes_[0] then
photo = b.content_.photo_.sizes_[0].photo_.persistent_id_
elseif b.content_.photo_.sizes_[1] then
photo = b.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(b.content_.caption_ or '')) 
end
elseif b.content_.animation_ then
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, b.content_.animation_.animation_.persistent_id_,(b.content_.caption_ or ''))    
end 
elseif b.content_.sticker_ then
local list = MOHMADdevVEER:smembers(devVEER..'usersbot') 
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, b.content_.sticker_.sticker_.persistent_id_)   
end 
end
if b.content_.text_ then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
VEER_sendMsg(v, 0, 1, '[ '..b.content_.text_..' ]', 1, 'md')  
end
elseif b.content_.photo_ then
if b.content_.photo_.sizes_[0] then
photo = b.content_.photo_.sizes_[0].photo_.persistent_id_
elseif b.content_.photo_.sizes_[1] then
photo = b.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(b.content_.caption_ or ''))
end 
elseif b.content_.animation_ then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, b.content_.animation_.animation_.persistent_id_,(b.content_.caption_ or ''))    
end 
elseif b.content_.sticker_ then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id') 
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, b.content_.sticker_.sticker_.persistent_id_)   
end 
end
local grp = MOHMADdevVEER:scard(devVEER.."bot:gpsby:id")  
local pv = MOHMADdevVEER:scard(devVEER.."usersbot")          
local text = '📬*¦ تمت الاذاعه الى *'..
'\n*⚀¦ » ❪'..pv..'❫* مشترك في الخاص'..
'\n*⚁¦ » ❪'..grp..'❫* مجموعه في البوت\n💥' 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md') 
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb) 
end 
end
if text == "تحديث السورس" and is_devmohmad(msg) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '♻ • جاري تحديث السورس • ♻', 1, 'md') 
os.execute('rm -rf VEER.lua') 
os.execute("rm -fr plugins_/help_rep.lua")
os.execute('wget https://raw.githubusercontent.com/NOVAR1/VEER/master/VEER.lua') 
os.execute('cd plugins_;wget https://raw.githubusercontent.com/NOVAR1/VEER/master/plugins_/help_rep.lua') 
sleep(0.5) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '🚸*¦* تم تحديث ♻ السورس ✔ ', 1, 'md') 
dofile('VEER.lua')  
end
if text == 'الاحصائيات' and is_devmohmad(msg) then  
local grall = MOHMADdevVEER:scard(devVEER.."botgps") or 0  
local gradd = MOHMADdevVEER:scard(devVEER..'bot:gpsby:id') or 0  
local uspv = MOHMADdevVEER:scard(devVEER.."usersbot") or 0  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*\n📬¦ عدد المجموعات المفعله ↫ ❪'..gradd..'❫\n💥¦ عدد المشتركين ↫ ❪'..uspv..'❫*\n✓', 1, 'md') 
end
if text == 'مسح المشتركين' and is_devmohmad(msg) then   
local list = MOHMADdevVEER:smembers(devVEER..'usersbot')   
local pv = 0
for k,v in pairs(list) do    
MOHMADdevVEER:srem(devVEER..'usersbot',v)  
pv = pv + 1
end   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*🎲¦ تم مسح » ❪'..pv..'❫ من المشتركين *\n', 1, 'md') 
end  
if text ==  ""..NAMEBOT..' غادر' and is_owner(msg) then 
MOHMADdevVEER:srem(devVEER.."addgrop", msg.chat_id_) 
MOHMADdevVEER:del(devVEER.."add:bot:group"..msg.chat_id_, true) 
rem_group(msg.chat_id_)  
rem_lockal(msg.chat_id_) 
MOHMADdevVEER:del(devVEER.."test:group"..msg.chat_id_)   
MOHMADdevVEER:del(devVEER..'moder'..msg.chat_id_) 
MOHMADdevVEER:del(devVEER..'modergroup'..msg.chat_id_) 
MOHMADdevVEER:del(devVEER..'mods:'..msg.chat_id_) 
MOHMADdevVEER:del(devVEER.."add:bot:group"..msg.chat_id_, true) 
MOHMADdevVEER:srem(devVEER..'bot:gpsby:id', msg.chat_id_)  
MOHMADdevVEER:srem(devVEER.."botgps", msg.chat_id_)   
changeChatMemberStatus(msg.chat_id_, bot_id, "Left") 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '💥*¦*  تم مغادرة المجموعه ', 1, 'md') 
return false  
end
if text == 'مسح المقيدين' and is_mod(msg) then     
local list = MOHMADdevVEER:smembers(devVEER..'tedmembars'..msg.chat_id_) 
local pv = 0
for k,v in pairs(list) do   
MOHMADdevVEER:del(devVEER..'tedmembars'..msg.chat_id_) 
MOHMADdevVEER:srem(devVEER.."keed", msg.chat_id_)  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..v.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
pv = pv + 1
end 
if pv == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'🚸*¦* لا يوجد مقيدين هنا\n', 1, 'md')   
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'🚸*¦ تم مسح {'..pv..'} من المقيدين*\n', 1, 'md')   
end
end
if text and text:match('^كشف @(.*)') then 
local username = text:match('^كشف @(.*)') 
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, kk, success) 
if kk and kk.message_ and kk.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📬¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if kk.type_.ID == "ChannelChatInfo" then 
if kk.type_.channel_.is_supergroup_ == false then
local ac = 'قناة'
local chan = '*📮¦ نوع الحساب » ❪ '..ac..' ❫\n📬¦ الايدي » ❪*`'..kk.id_..'`*❫\n📛¦ المعرف » ❪* [@'..username..'] *❫\n💥¦ الاسم » ❪ *`'..kk.title_..'`* ❫*'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,chan, 1, 'md')
else
local aac = 'مجموعه'
local chanb = '*📮¦ نوع الحساب » ❪ '..aac..' ❫\n📬¦ الايدي » ❪*`'..kk.id_..'`*❫\n📛¦ المعرف » ❪* [@'..username..'] *❫\n💥¦ الاسم » ❪ *`'..kk.title_..'`* ❫*'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,chanb, 1, 'md')
end
return false  end
if kk.id_ then  
local msgss = tonumber(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..kk.id_) or 0)  
if tonumber(kk.id_) == tonumber(373906612) then
t = 'مطور السورس'
elseif tonumber(kk.id_) == tonumber(bot_id) then
t = 'هاذا بوت'
elseif tonumber(kk.id_) == tonumber(SUDO) then
t = 'مطور اساسي'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',kk.id_) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,kk.id_) then
t = 'المنشئ'
elseif MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,kk.id_) then
t = 'المدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,kk.id_) then
t = 'الادمن'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',kk.id_) then
t = 'مميز عام'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,kk.id_) then
t = 'عضو مميز'
else
t = 'مجرد عضو'
end
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = kk.id_},function(arg,da) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = kk.id_,offset_ = 0,limit_ = 100},function(arg,pho) 
tdcli_function ({ID = "GetUser",user_id_ = kk.id_},function(arg,data) 
if pho.total_count_ == 0 then
photouser1 = ''
else
photouser1 = '\n🎆¦ عدد صوره » ❪ '..pho.total_count_..' ❫'
end
if MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',kk.id_) then
kkeed = 'محظور عام'
elseif MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,kk.id_) then
kkeed = 'محظور'
elseif MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,kk.id_) then
kkeed = 'مكتوم'
elseif MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,kk.id_) then
kkeed = 'مقيد'
else
kkeed = ' لا يوجد'
end
if da.status_.ID == "ChatMemberStatusKicked" then
tt = 'مطرود'
elseif da.status_.ID == "ChatMemberStatusLeft" then
tt = 'مغادر'
elseif da.status_.ID ~= "ChatMemberStatusLeft" then
tt = 'موجود'
end
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'منشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'ادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
else
rtpa = 'عضو'
end
if data.type_.ID == "UserTypeBot" then
acca = 'بوت'
elseif data.type_.ID == "UserTypeGeneral" then
acca = 'شخصي'
end
if data.first_name_ == false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ الحساب محذوف لا استطيع استخراج معلوماته *\n', 1, 'md')
return false  end
text = '*🗯¦ ايديه » ❪* `'..kk.id_..
'` ❫\n💠*¦ معـرفه » ❪* [@'..data.username_..']'..
' ❫\n⚜*¦ اسمه » ❪* `'..CatchName(data.first_name_,20)..
'` ❫\n⭐*¦ رتبـة الكروب » ❪ '..rtpa..
' ❫\n🎖¦ رتبـة البوت » ❪ '..t..
' ❫\n📨¦ رسـائله » ❪ '..(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..kk.id_) or 0)..
' ❫\n🗳¦ تفــاعله » ❪ '..formsgg(msgss)..' ❫'..photouser1..
'\n🚸¦ نوع القيود » ❪ '..kkeed..
' ❫\n🔹¦ التواجد » ❪ '..tt..
' ❫\n⚡¦ نوع حسابه » ❪ '..acca..' ❫*'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md') 
end,nil)
end,nil)
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') then 
local iduser = text:match('كشف (%d+)')  
local msgss = tonumber(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..iduser) or 0)  
if tonumber(iduser) == tonumber(373906612) then
t = 'مطور السورس'
elseif tonumber(iduser) == tonumber(bot_id) then
t = 'هاذا البوت'
elseif tonumber(iduser) == tonumber(SUDO) then
t = 'مطور اساسي'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',iduser) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,iduser) then
t = 'المنشئ'
elseif MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,iduser) then
t = 'المدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,iduser) then
t = 'الادمن'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',iduser) then
t = 'مميز عام'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,iduser) then
t = 'عضو مميز'
else
t = 'مجرد عضو'
end
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = iduser},function(arg,da) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = iduser,offset_ = 0,limit_ = 100},function(arg,pho) 
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ لا استطيع استخراج معلوماته ✨ *\n', 1, 'md')
return false  end
if pho.total_count_ == 0 then
photouser = ''
else
photouser = '\n🎆¦ عدد صوره •⊱ '..pho.total_count_..' ⊰•'
end
if pho.total_count_ == 0 then
photouser1 = ''
else
photouser1 = '\n🌄¦ عدد صوره » ❪ '..pho.total_count_..' ❫'
end
if MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',iduser) then
kkeed = 'محظور عام'
elseif MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,iduser) then
kkeed = 'محظور'
elseif MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,iduser) then
kkeed = 'مكتوم'
elseif MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,iduser) then
kkeed = 'مقيد'
else
kkeed = ' لا يوجد'
end
if da.status_.ID == "ChatMemberStatusKicked" then
tt = 'مطرود'
elseif da.status_.ID == "ChatMemberStatusLeft" then
tt = 'مغادر'
elseif da.status_.ID ~= "ChatMemberStatusLeft" then
tt = 'موجود'
end
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'منشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'ادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
else
rtpa = 'عضو'
end
if data.type_.ID == "UserTypeBot" then
acca = 'بوت'
elseif data.type_.ID == "UserTypeGeneral" then
acca = 'شخصي'
end
if data.first_name_ == false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ الحساب محذوف لا استطيع استخراج معلوماته *\n', 1, 'md')
return false  end
if data.username_ == false then
text = '🗯¦ ايديه » ❪ '..iduser..
' ❫\n⚜¦ اسمه » ❪ {'..CatchName(data.first_name_,20)..
' }❫\n⭐¦ رتبـة الكروب » ❪ '..rtpa..
' ❫\n🎖¦ رتبـة البوت » ❪ '..t..
' ❫\n📨¦ رسـائله » ❪ '..(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..iduser) or 0)..
' ❫\n🗳¦ تفــاعله » ❪ '..formsgg(msgss)..' ❫'..photouser1..
'\n🚸¦ نوع القيود » ❪ '..kkeed..
' ❫\n🔹¦ التواجد » ❪ '..tt..
' ❫\n⚡¦ نوع حسابه » ❪ '..acca..' ❫'
monsend(msg,msg.chat_id_,text,iduser) 
else
text = '*🗯¦ ايديه » ❪* `'..iduser..
'` ❫\n💠*¦ معـرفه » ❪* [@'..data.username_..']'..
' ❫\n⚜*¦ اسمه » ❪* `'..CatchName(data.first_name_,20)..
'` ❫\n⭐*¦ رتبـة الكروب » ❪ '..rtpa..
' ❫\n🎖¦ رتبـة البوت » ❪ '..t..
' ❫\n📨¦ رسـائله » ❪ '..(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..iduser) or 0)..
' ❫\n🗳¦ تفــاعله » ❪ '..formsgg(msgss)..' ❫'..photouser1..
'\n🚸¦ نوع القيود » ❪ '..kkeed..
' ❫\n🔹¦ التواجد » ❪ '..tt..
' ❫\n⚡¦ نوع حسابه » ❪ '..acca..' ❫*'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md') 
end
end,nil)
end,nil)
end,nil)
return false 
end

if text ==("كشف") and msg.reply_to_message_id_ ~= 0 then  
function id_by_reply(extra, result, success) 
local msgss = tonumber(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..result.sender_user_id_) or 0)  
if tonumber(result.sender_user_id_) == tonumber(373906612) then
t = 'مطور السورس'
elseif tonumber(result.sender_user_id_) == tonumber(bot_id) then
t = 'هاذا البوت'
elseif tonumber(result.sender_user_id_) == tonumber(SUDO) then
t = 'مطور اساسي'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',result.sender_user_id_) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,result.sender_user_id_) then
t = 'المنشئ'
elseif MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_) then
t = 'المدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_) then
t = 'الادمن'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',result.sender_user_id_) then
t = 'مميز عام'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_) then
t = 'عضو مميز'
else
t = 'مجرد عضو'
end
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = result.sender_user_id_},function(arg,da) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = result.sender_user_id_,offset_ = 0,limit_ = 100},function(arg,pho) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if pho.total_count_ == 0 then
photouser = ''
else
photouser = '\n🎆¦ عدد صوره •⊱ '..pho.total_count_..' ⊰•'
end
if pho.total_count_ == 0 then
photouser1 = ''
else
photouser1 = '\n🎆¦ عدد صوره » ❪ '..pho.total_count_..' ❫'
end
if MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',result.sender_user_id_) then
kkeed = 'محظور عام'
elseif MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_) then
kkeed = 'محظور'
elseif MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_) then
kkeed = 'مكتوم'
elseif MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) then
kkeed = 'مقيد'
else
kkeed = 'لا يوجد'
end
if da.status_.ID == "ChatMemberStatusKicked" then
tt = 'مطرود'
elseif da.status_.ID == "ChatMemberStatusLeft" then
tt = 'مغادر'
elseif da.status_.ID ~= "ChatMemberStatusLeft" then
tt = 'موجود'
end
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'منشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'ادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
else
rtpa = 'عضو'
end
if data.type_.ID == "UserTypeBot" then
acca = 'بوت'
elseif data.type_.ID == "UserTypeGeneral" then
acca = 'شخصي'
end
if data.first_name_ == false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ الحساب محذوف لا استطيع استخراج معلوماته *\n', 1, 'md')
return false  end
if data.username_ == false then
text = '🗯¦ ايديه » ❪ '..result.sender_user_id_..
' ❫\n⚜¦ اسمه » ❪ {'..CatchName(data.first_name_,20)..
' }❫\n⭐¦ رتبـة الكروب » ❪ '..rtpa..
' ❫\n🎖¦ رتبـة البوت » ❪ '..t..
' ❫\n📨¦ رسـائله » ❪ '..(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..result.sender_user_id_) or 0)..
' ❫\n🗳¦ تفــاعله » ❪ '..formsgg(msgss)..' ❫'..photouser1..
'\n🚸¦ نوع القيود » ❪ '..kkeed..
' ❫\n🔹¦ التواجد » ❪ '..tt..
' ❫\n⚡¦ نوع حسابه » ❪ '..acca..' ❫'
monsend(msg,msg.chat_id_,text,data.id_) 
else
text = '*🗯¦ ايديه » ❪* `'..result.sender_user_id_..
'` ❫\n💠*¦ معـرفه » ❪* [@'..data.username_..']'..
' ❫\n⚜*¦ اسمه » ❪* `'..CatchName(data.first_name_,20)..
'` ❫\n⭐*¦ رتبـة الكروب » ❪ '..rtpa..
' ❫\n🎖¦ رتبـة البوت » ❪ '..t..
' ❫\n📨¦ رسـائله » ❪ '..(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..result.sender_user_id_) or 0)..
' ❫\n🗳¦ تفــاعله » ❪ '..formsgg(msgss)..' ❫'..photouser1..
'\n🚸¦ نوع القيود » ❪ '..kkeed..
' ❫\n🔹¦ التواجد » ❪ '..tt..
' ❫\n⚡¦ نوع حسابه » ❪ '..acca..' ❫*'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md') 
end
end,nil)
end,nil)
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end 


if text and text:match('^كشف (.*)') then 
local username = text:match('^كشف (.*)') 
if not text:find('@') then
function mention(extra, tes, success)
if tes.content_.entities_[0].user_id_ then  
local msgss = tonumber(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..tes.content_.entities_[0].user_id_) or 0)  
if tonumber(tes.content_.entities_[0].user_id_) == tonumber(373906612) then
t = 'مطور السورس'
elseif tonumber(tes.content_.entities_[0].user_id_) == tonumber(bot_id) then
t = 'هاذا بوت'
elseif tonumber(tes.content_.entities_[0].user_id_) == tonumber(SUDO) then
t = 'مطور اساسي'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',tes.content_.entities_[0].user_id_) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,tes.content_.entities_[0].user_id_) then
t = 'المنشئ'
elseif MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,tes.content_.entities_[0].user_id_) then
t = 'المدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,tes.content_.entities_[0].user_id_) then
t = 'الادمن'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',tes.content_.entities_[0].user_id_) then
t = 'مميز عام'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,tes.content_.entities_[0].user_id_) then
t = 'عضو مميز'
else
t = 'مجرد عضو'
end
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = tes.content_.entities_[0].user_id_},function(arg,da) 
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = tes.content_.entities_[0].user_id_,
offset_ = 0,
limit_ = 100
},function(arg,pho) 
tdcli_function ({
ID = "GetUser",
user_id_ = tes.content_.entities_[0].user_id_
},function(arg,data) 
if pho.total_count_ == 0 then
photouser1 = ''
else
photouser1 = '\n🎆¦ عدد صوره » ❪ '..pho.total_count_..' ❫'
end
if MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',tes.content_.entities_[0].user_id_) then
kkeed = 'محظور عام'
elseif MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,tes.content_.entities_[0].user_id_) then
kkeed = 'محظور'
elseif MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,tes.content_.entities_[0].user_id_) then
kkeed = 'مكتوم'
elseif MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,tes.content_.entities_[0].user_id_) then
kkeed = 'مقيد'
else
kkeed = ' لا يوجد'
end
if da.status_.ID == "ChatMemberStatusKicked" then
tt = 'مطرود'
elseif da.status_.ID == "ChatMemberStatusLeft" then
tt = 'مغادر'
elseif da.status_.ID ~= "ChatMemberStatusLeft" then
tt = 'موجود'
end
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'منشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'ادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
else
rtpa = 'عضو'
end
if data.type_.ID == "UserTypeBot" then
acca = 'بوت'
elseif data.type_.ID == "UserTypeGeneral" then
acca = 'شخصي'
end
if data.first_name_ == false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ الحساب محذوف لا استطيع استخراج معلوماته *\n', 1, 'md')
return false  end
text = '🗯¦ ايديه » ❪ '..tes.content_.entities_[0].user_id_..
' ❫\n⚜¦ اسمه » ❪ {'..CatchName(data.first_name_,20)..
' }❫\n⭐¦ رتبـة الكروب » ❪ '..rtpa..
' ❫\n🎖¦ رتبـة البوت » ❪ '..t..
' ❫\n📨¦ رسـائله » ❪ '..(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..tes.content_.entities_[0].user_id_) or 0)..
' ❫\n🗳¦ تفــاعله » ❪ '..formsgg(msgss)..' ❫'..photouser1..
'\n🚸¦ نوع القيود » ❪ '..kkeed..
' ❫\n🔹¦ التواجد » ❪ '..tt..
' ❫\n⚡¦ نوع حسابه » ❪ '..acca..' ❫'
monsend(msg,msg.chat_id_,text,tes.content_.entities_[0].user_id_) 
end,nil)
end,nil)
end,nil)
end 
end
getMessage(msg.chat_id_,msg.id_,mention)   
end
end
if text and text:match("^جلب الرابط$") and is_devmohmad(msg) then  
MOHMADdevVEER:setex(devVEER.."get:link:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📮¦ حسنآ ارسل لي ايدي المجموعه*\n💥'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
if text and text:match("^معلومات$") and is_devmohmad(msg) then  
MOHMADdevVEER:setex(devVEER.."get:info:gp" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📮¦ حسنآ ارسل لي ايدي المجموعه*\n💥'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
if text == 'الكروبات' and is_sudo(msg) then 
local t = MOHMADdevVEER:scard(devVEER.."botgps")
local y = MOHMADdevVEER:scard(devVEER.."bot:gpsby:id") 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ العدد الكلي للكروبات هو » ❪'..(y)..'❫* \n', 1, 'md') 
end
if text == 'المشتركين' and is_sudo(msg) then     
local addgrop = MOHMADdevVEER:scard(devVEER.."usersbot") or 0    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عدد المشتركين في البوت » ❪ '..addgrop..' ❫*\n💥', 1, 'md')    
end      
if text and text:match("^ضع عدد التفعيل$") and is_devmohmad(msg) then  
MOHMADdevVEER:setex(devVEER.."numadd:bot" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📊¦ ارسل لي العدد الان*'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
if text == 'مسح المجموعات' and is_devmohmad(msg) then 
local lgp = MOHMADdevVEER:smembers(devVEER.."bot:gpsby:id") 
local lsug = MOHMADdevVEER:smembers(devVEER.."botgps") 
local lgpn = MOHMADdevVEER:scard(devVEER.."bot:gpsby:id") 
local lsugn = MOHMADdevVEER:scard(devVEER.."bot:gpsby:id") 
for k,v in pairs(lgp) do 
rem_group(v)   
changeChatMemberStatus(v, bot_id, "Left")  
end 
for k,v in pairs(lsug) do  
rem_group(v)   
changeChatMemberStatus(v, bot_id, "Left")  
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,"*📮¦* تم مغادره البوت من » ❪"..lsugn.."❫ مجموعات \n✓", 1, 'md') 
end
if text ==('رفع الادمنيه') and is_monsh(msg) then
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(msg.chat_id_).ID,
filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100
},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,admins[i].user_id_) 
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,b) 
if b.username_ == true then
MOHMADdevVEER:set(devVEER.."user:Name"..b.id_,"@"..b.username_)
end
if b.first_name_ == false then
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,admins[i].user_id_) 
end
end,nil)   
else
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,admins[i].user_id_) 
end
end
if num2 == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📛¦ لا توجد ادمنية ليتم رفعهم*\n✓', 1, 'md') 
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📛¦ تمت ترقية •⊱ '..num2..' ⊰• من ادمنية المجموعه*\n✓', 1, 'md') 
end
end,nil)   
end
if text ==('المنشئ') then
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(msg.chat_id_).ID,
filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100
},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id
},function(arg,b) 
if b.first_name_ == false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ حساب المنشئ محذوف *\n', 1, 'md')
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,owner_id) 
return false  end
local textm = '📮¦ منشئ المجموعه » ( {'..(b.first_name_)..'} ) \n👮'
sendMention(msg,msg.chat_id_,textm,owner_id)   
end,nil)   
end
end
end,nil)   
end
if text ==('رفع المنشئ') and is_monsh(msg) then
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(msg.chat_id_).ID,
filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100
},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,owner_id) 
end
end
tdcli_function ({ID = "GetUser",user_id_ = owner_id
},function(arg,b) 
if b.first_name_ == false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ المنشئ حاذف لا استطيع رفعه منشئ *\n', 1, 'md')
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,owner_id) 
return false  end
if b.username_ == false then 
local text = '📮¦ تم ترقية منشئ المجموعه \n•⊱ '..CatchName(b.first_name_,50)..' ⊰• \n✓'
VEERmonshn(msg.chat_id_, owner_id, msg.id_, text, 31, utf8.len(b.first_name_)) 
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📛¦ تم ترقية منشئ المجموعه \n •⊱* ['..CatchName(b.first_name_,20)..'](t.me/'..b.username_..') *⊰• *\n✓', 1, 'md') 
MOHMADdevVEER:set(devVEER.."user:Name"..b.id_,"@"..b.username_)
end
end,nil)   
end,nil)   
end
if text and text:match('^ضع اسم (.*)') and is_owner(msg) then 
local name = text:match('^ضع اسم (.*)') 
tdcli_function ({ ID = "ChangeChatTitle",
chat_id_ = msg.chat_id_, 
title_ = name 
},function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📬¦* اني مو ادمن هنا  \n", 1, 'md')  
return false  end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📬¦* ماعندي صلاحيه اغير اسم المجموعه \n", 1, 'md')  
else
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📬¦* تم وضع اسم للمجموعه \n", 1, 'md')  
MOHMADdevVEER:set(devVEER..'group:name'..msg.chat_id_,name)
end
end,nil) 
end
if text=="ضع رابط" and msg.reply_to_message_id_ == 0  and is_mod(msg) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📛¦* حسناا ارسل لي رابط المجموعه ", 1, 'md')       
MOHMADdevVEER:set(devVEER.."link:group"..msg.chat_id_, 'setlinkwai') 
end
if text == "الرابط" then 
local link = MOHMADdevVEER:get(devVEER.."link:group"..msg.chat_id_)            
if link then                              
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*ٴ📮¦ »* رابط مجموعة ↓\n*ٴ📬¦ » '..MOHMADdevVEER:get(devVEER..'group:name'..msg.chat_id_)..' *\n*ٴ📛¦* » ['..link..']\n💥', 1, 'md')                          
else                
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦* لا يوجد رابط المجموعه\n*📬¦ ارسل » ❪ ضع رابط ❫ لوضع رابط المجموعه*\n💥', 1, 'md')              
end            
end
if text and text:match("^مسح الرابط$") and is_mod(msg) then              
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* تم مسح رابط المجموعه \n✓", 1 , "md")           
MOHMADdevVEER:del(devVEER.."link:group" .. msg.chat_id_)       
end
if text=="اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then 
MOHMADdevVEER:setex(devVEER.."bc:in:gropsfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي التوجيه ليتم اذاعته للمجموعات\n✓", 1, "md") 
end
if text=="اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then 
MOHMADdevVEER:setex(devVEER.."bc:in:pvfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي التوجيه ليتم اذاعته للخاص\n✓", 1, "md") 
end
if text=="اذاعه عام بالتوجيه" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then 
MOHMADdevVEER:setex(devVEER.."bc:in:allfwd" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي التوجيه ليتم اذاعته للكل\n✓", 1, "md") 
end
if text=="اذاعه" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then 
MOHMADdevVEER:setex(devVEER.."bc:in:grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي سواء كان »❪ رساله , صوره , متحركه , ملصق  ❫ للاذاعه الى المجموعات\n✓", 1, "md") 
end
if text=="اذاعه للكل" and msg.reply_to_message_id_ == 0  and is_devmohmad(msg) then 
MOHMADdevVEER:setex(devVEER.."bc:in:all" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي سواء كان »❪ رساله , صوره , متحركه , ملصق  ❫ للاذاعه الى الكل\n✓", 1, "md") 
end
if text=="اذاعه خاص" and msg.reply_to_message_id_ == 0 and is_devmohmad(msg) then 
MOHMADdevVEER:setex(devVEER.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* ارسل لي سواء كان »❪ رساله , صوره , متحركه , ملصق  ❫ للاذاعه الى الخاص\n✓", 1, "md") 
end 
if text and text:match("^ضع قوانين$") and is_mod(msg) then 
MOHMADdevVEER:setex(devVEER.."rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "📪*¦* ارسل لي النص الان \n💥", 1, "md")  
end
if text and text:match("^مسح القوانين$")  and is_mod(msg) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "📪*¦* تم مسح القوانين \n✓", 1, "md")  
MOHMADdevVEER:del(devVEER.."rules:group" .. msg.chat_id_) 
end
if text and text:match("^القوانين$") then 
local rules = MOHMADdevVEER:get(devVEER.."rules:group" .. msg.chat_id_)   
if rules then     
VEER_sendMsg(msg.chat_id_, msg.id_, 1, rules, 1, nil)   
else      
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* لا يوجد قوانين هنا \n💥",  1, "md")   
end    
end
if text == 'السورس' or text =='سورس' or text=='يا سورس' then
local text = [[
📮¦ اهلا بك في سورس ستورم 🍃
ٴ━━━━━━━━━━
🗃¦ لتنصيب السورس ↓↑
ٴ━━━━━━━━━━
⚜¦ افتح ترمنال جديد 
⚜¦ انسخ رابط كيثاب السورس  ↡
`git clone https://github.com/NOVAR1/VEER.git; cd VEER;chmod +x tg;chmod +x VEER.sh;chmod +x SM;./VEER.sh`
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
⚜¦ راح يطلب معلومات منك الاتيه ↓
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
📬¦ بعد كل امر اضغط انتر 
⓵ ¦ يطلب » توكن البوت 
⓶ ¦ يطلب » ايدي المطور الاساسي
⓷ ¦ يطلب » معرف المطور الاساسي
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
📌¦ راح تلقائيا يشتغل بسكرين 
💭¦ كود رن السورس
`cd VEER;./VR`
💭¦ كود حذف السورس 
`rm -rf VEER`
ٴ━━━━━━━━━━
⚜¦ للمزيد من المعلومات راسلنا
💥¦ مطور السورس » @TAHAJ20
📯¦ قناة السورس » @VEERCLI
]] 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,text, 1, 'md')   
end
if text ==  ""..NAMEBOT..' شنو رئيك بهاذا' or text == 'شنو رئيك بهذا' or text == 'شنو رئيك بهاذا'  then function necha(extra, result, success) local taha = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله 💋🙄','يلعب ع البنات 🙄', 'ولد زايعته الكاع 😶🙊','صاك يخبل ومعضل ','محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️','اموت عليه 🌝','هوه غير الحب مال اني 🤓❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات  ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️','مو خوش ولد 🤓' } VEER_sendMsg(msg.chat_id_, result.id_, 1,''..taha[math.random(#taha)]..'', 1, 'md')   end   if tonumber(msg.reply_to_message_id_) == 0 then   else   getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),necha)     end end
if text == ""..NAMEBOT..' شنو رئيك بهاي' or text == 'شنو رئيج بهايه' or text == 'شنو رئيج بهاية' or text == 'شو رئيك بهي' then function necha(extra, result, success) local taha = {'الكبد مال اني هيه ','ختولي ماحبها ','خانتني ويه صديقي 😔','بس لو الكفها اله اعضها 💔','خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒','جذابه ومنافقه سوتلي مشكله ويه الحب مالتي ','ئووووووووف اموت ع ربها ','ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفون 7 ','صديقتي وختي وروحي وحياتي ','فد وحده منحرفه 😥','ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐','ام سحوره سحرت اخويا وعلكته 6 سنوات 🤕','ماحبها 🙁','بله هاي جهره تسئل عليها ؟ ','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🏼','ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹' } VEER_sendMsg(msg.chat_id_, result.id_, 1,''..taha[math.random(#taha)]..'', 1, 'md') end  if tonumber(msg.reply_to_message_id_) == 0 then   else  getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),necha)   end  end
if text and text:match('^'..NAMEBOT..' هينه @(.*)') and is_sudo(msg) then  
local username = text:match('^'..NAMEBOT..' هينه @(.*)')
function hena(extra,result,success) 
if result.id_ then  
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, 'انجب حبي شون اهين نفسي \n ', 1, 'md')  
return false  end  
if tonumber(result.id_) == tonumber(SUDO) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, ' انجب لك شون اهين مطوري \n ', 1, 'md')  
return false  end  
local taha = { 
"تعال لك @"..username.." ابو البنات ابو الوصخ ",
"ها ولك @"..username.." اني كليوم اهينك ؟",
"لك  @"..username.." حبي اكعد راحه ولتندك باسيادك",
"خاب انجب @"..username.." لا اهينك هسه ",
} 
VEER_sendMsg(msg.chat_id_, result.id_, 1,''..taha[math.random(#taha)]..'', 1, 'html') 
else  
end 
end 
saddbyusername(username,hena) 
end
if text == ""..NAMEBOT.." هينه" and tonumber(msg.reply_to_message_id_) ~= 0 then 
function necha(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, 'دنجب لك 😂 تريدني احجي عله  روحي\n', 1, 'md')  
return false  end  
if tonumber(result.sender_user_id_) == tonumber(SUDO) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, 'شو انته كاعد تمضرط غير هاذا المطور مالتي 😌\n ', 1, 'md')  
return false  end 
local taha = { 
"تعال لك كواد فرخ دودكي مستنقع 😹👻",
"ها ولك بعدك لو بطلت اذا بعدك دحن علينا حبي 🤤😹",
"يمعود هاذا من جماعة لا تعورني 😹",
"حبيبي شدا تحس انته هسه من تكمز !؟ دبطل حركاتكم هاي 🌝❤️"
} 
VEER_sendMsg(msg.chat_id_, result.id_, 1,''..taha[math.random(#taha)]..'', 1, 'md') 
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),necha)   
end
if text ==  ""..NAMEBOT.." بوسه" and tonumber(msg.reply_to_message_id_) ~= 0 then  
function necha(extra, result, success) 
local taha = {
'خلي يزحفلي وابوسه 😻',
'يعني كل شويه ابوسه كافي 😒',
'اخ ممممح من الحلكك ولك ',
'ما ابوسه والله زاحف هاذا',
'اخ يفدوا مممح 💚'
} 
VEER_sendMsg(msg.chat_id_, result.id_, 1,''..taha[math.random(#taha)]..'', 1, 'md') 
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),necha)    
end
if text and text:match('^غادر (-%d+)') and is_devmohmad(msg) then 
gp = text:match('غادر (-%d+)') 
MOHMADdevVEER:srem(devVEER..'bot:gps',gp) 
MOHMADdevVEER:srem(devVEER..'bot:gpsby:id',gp) 
MOHMADdevVEER:srem(devVEER.."botgps",gp) 
MOHMADdevVEER:del(devVEER..'mod:'..gp) 
MOHMADdevVEER:del(devVEER..'moder'..gp) 
MOHMADdevVEER:del(devVEER..'banned:'..gp) 
MOHMADdevVEER:del(devVEER.."add:bot:group"..gp) 
MOHMADdevVEER:del(devVEER.."setmoder:"..gp) 
MOHMADdevVEER:del(devVEER.."gps:settings:"..gp) 
MOHMADdevVEER:del(devVEER.."gps:settings:"..gp) 
VEER_sendMsg(text:match('غادر (-%d+)'), 0, 1,'💢*¦*تم مغادره البوت من المجموعه \n♨*¦*الامر بواسطه مطور البوت \n 📪*¦*للاستفسار راسل مطور البوت ', 1, 'md') 
changeChatMemberStatus(text:match('غادر (-%d+)'), bot_id, "Left") 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📬*¦*تم ازاله المجموعه من مجموعات البوت بنجاح ✔ ', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) > 0 then
if text ==("مسح") and is_mod(msg) then 
delete_msg(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
end
if text ==('تفعيل الترحيب') and is_mod(msg) then 
MOHMADdevVEER:set(devVEER..'add:welc:'..msg.chat_id_,'add') 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'💥*¦*  تم تفعيل الترحيب', 1, 'md') 
end
if text ==('تعطيل الترحيب') and is_mod(msg) then 
MOHMADdevVEER:set(devVEER..'add:welc:'..msg.chat_id_,'rem') 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'💥*¦*  تم تعطيل الترحيب', 1, 'md') 
end
if text ==('مسح الترحيب') and is_mod(msg) then 
MOHMADdevVEER:del(devVEER..'welcome:'..msg.chat_id_,welcome) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'💥*¦*  تم مسح ترحيب المجموعه', 1, 'md') 
end
if text and text:match("^ضع صوره") and is_mod(msg) and msg.reply_to_message_id_ == 0 then  
MOHMADdevVEER:set(devVEER..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📷*¦* ارسل لي الصوره الان ', 1, 'md') 
end           
if text ==('المجموعات') and is_devmohmad(msg) then
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  
if #list == 0 then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*💥¦ لا توجد مجموعات حاليا *\n', 1, 'md')   
return false  end
local t = '⚡¦* اهلا بك في ايدي المجموعات 🍁*\n*ٴ⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃*\n'  
for k,v in pairs(list) do   
local nummsg = tonumber(MOHMADdevVEER:get(devVEER..'groupmsg:'..v..':')) 
numrgroup(v) local numg = (MOHMADdevVEER:get(devVEER.."numgrop"..v) or '3')
local namechat = MOHMADdevVEER:get(devVEER..'group:name'..v) 
if namechat then
t = t..'*'..k.."➛* `"..v.."` "..tfgroup(nummsg).."\n*« "..namechat..' » ❪'..numg..'❫*\n*ٴ⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃*\n'   
else
t = t..'*'..k.."➛* `"..v.."` "..tfgroup(nummsg).."\n* ❪"..numg..'❫*\n*ٴ⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃⁃*\n'   
end
file = io.open("VEER_groups.txt", "w") file:write([[ ]]..isnothtml(t)..[[ ]]) file:close() 
end  
t = t..'*📮¦*لعرض معلومات مجموعه معينه\n*💥¦ ارسل كشف من ثم ايدي المجموعه*\n*🚸¦ مثال ❪كشف -10012345667❫*\n꞉'  
if #list >= 25 then  
local groups = MOHMADdevVEER:scard(devVEER..'bot:gpsby:id')  
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './VEER_groups.txt','📛¦ عذرا لديك الكثير من المجموعات\n📬¦ تم ارسال المجموعات في الملف\n🚸¦ عدد المجموعات •⊱'..groups..'⊰•',dl_cb, nil) 
else 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')  
end 
end
if text ==('مسح المطرودين') and is_monsh(msg) then local function delbans(extra, result)  if not msg.can_be_deleted_ == true then  VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🚨¦* تنبيــه انا لست ادمن يرجى ترقيتي ادمن هنا \n", 1, "md") else  local num = 0 for k,y in pairs(result.members_) do num = num + 1  changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)  end  VEER_sendMsg(msg.chat_id_, msg.id_,  1,'تم الغاء الحظر عن *('..num..')* اشخاص \n', 1, 'md') end  end  getChannelMembers(msg.chat_id_, 0, 'Kicked', 200000, delbans, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    end
if text ==('مسح المحذوف') and is_monsh(msg) then local function deleteaccounts(extra, result) if not msg.can_be_deleted_ == true then VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🚨¦* تنبيــه انا لست ادمن يرجى ترقيتي ادمن هنا 👮\n", 1, "md") else for k,v in pairs(result.members_) do  local function cleanaccounts(extra, result) if not result.first_name_ then changeChatMemberStatus(msg.chat_id_, result.id_, "Kicked") end end  getUser(v.user_id_, cleanaccounts, nil) end  VEER_sendMsg(msg.chat_id_, msg.id_, 0,'💥*¦*  تم مسح الحسابات المحذوفه', 1, 'md') end end  tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 1000}, deleteaccounts, nil) end 
if is_mod(msg) then 
local function getadd_or_rem(taha)     
if taha == 'welcome' then     
local hash = MOHMADdevVEER:get(devVEER..'add:welc:'..msg.chat_id_)     
if hash == 'add' then     
return '✓'     
else     
return '✘'     
end     
elseif taha == 'spam' then     
local hash = MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"flood")     
if hash then      
if MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
return 'بالطرد 🚷'     
elseif MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
return 'بالتقيد 🔏'     
elseif MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
return 'بالكتم 🔇'           
elseif MOHMADdevVEER:hget("flooding:settings:"..msg.chat_id_,"flood") == "del" then     
return 'بالمسح ⚡'     
end      
else     
return '✘'     
end      
end     
end    
if text == 'الاعدادات' and is_monsh(msg) then    
if MOHMADdevVEER:get(devVEER..'lock:tagservrbot'..msg.chat_id_) then
lock_tagservr_bot = '✓'
else 
lock_tagservr_bot = '✘'    
end
if MOHMADdevVEER:get(devVEER..'lockpin'..msg.chat_id_) then    
lock_pin = '✓'
else 
lock_pin = '✘'    
end
if MOHMADdevVEER:get(devVEER..'lock:tagservr'..msg.chat_id_) then    
lock_tagservr = '✓'
else 
lock_tagservr = '✘'    
end
if MOHMADdevVEER:get(devVEER..'lock:text'..msg.chat_id_) then    
lock_text = '✓'
else 
lock_text = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:AddMempar"..msg.chat_id_) == 'kick' then
lock_add = '✓'
else 
lock_add = '✘'    
end    
if MOHMADdevVEER:get(devVEER.."lock:Join"..msg.chat_id_) == 'kick' then
lock_join = '✓'
else 
lock_join = '✘'    
end    
if MOHMADdevVEER:get(devVEER..'lock:edit'..msg.chat_id_) then    
lock_edit = '✓'
else 
lock_edit = '✘'    
end
if MOHMADdevVEER:get(devVEER..'lock:edit:media'..msg.chat_id_) then    
lock_edit_med = '✓'
else 
lock_edit_med = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:Photo"..msg.chat_id_) == "del" then
lock_photo = '✓' 
elseif MOHMADdevVEER:get(devVEER.."lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = 'بالتقيد 🔏'   
elseif MOHMADdevVEER:get(devVEER.."lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = 'بالطرد 🚷'   
else
lock_photo = '✘'   
end    
if MOHMADdevVEER:get(devVEER.."lock:Contact"..msg.chat_id_) == "del" then
lock_phon = '✓' 
elseif MOHMADdevVEER:get(devVEER.."lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = 'بالطرد 🚷'    
else
lock_phon = '✘'    
end    
if MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "del" then
lock_links = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "ked" then
lock_links = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "ktm" then
lock_links = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "kick" then
lock_links = 'بالطرد 🚷'    
else
lock_links = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = 'بالكتم 🔇'   
elseif MOHMADdevVEER:get(devVEER.."lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = 'بالطرد 🚷'    
else
lock_cmds = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "del" then
lock_user = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "ked" then
lock_user = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "ktm" then
lock_user = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "kick" then
lock_user = 'بالطرد 🚷'    
else
lock_user = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = 'بالطرد 🚷'    
else
lock_hash = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "del" then
lock_muse = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = 'بالطرد 🚷'    
else
lock_muse = '✘'    
end 
if MOHMADdevVEER:get(devVEER.."lock:Video"..msg.chat_id_) == "del" then
lock_ved = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = 'بالطرد 🚷'    
else
lock_ved = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:Animation"..msg.chat_id_) == "del" then
lock_gif = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = 'بالطرد 🚷'    
else
lock_gif = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = 'بالطرد 🚷'    
else
lock_ste = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:geam"..msg.chat_id_) == "del" then
lock_geam = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = 'بالطرد 🚷'    
else
lock_geam = '✘'    
end    
if MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "del" then
lock_vico = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = 'بالطرد 🚷'    
else
lock_vico = '✘'    
end    
if MOHMADdevVEER:get(devVEER.."lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = 'بالتقيد 🔏'
elseif MOHMADdevVEER:get(devVEER.."lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = 'بالطرد 🚷'
else
lock_inlin = '✘'
end
if MOHMADdevVEER:get(devVEER.."lock:forward"..msg.chat_id_) == "del" then
lock_fwd = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = 'بالطرد 🚷'    
else
lock_fwd = '✘'    
end    
if MOHMADdevVEER:get(devVEER.."lock:Document"..msg.chat_id_) == "del" then
lock_file = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Document"..msg.chat_id_) == "ked" then 
lock_file = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Document"..msg.chat_id_) == "kick" then 
lock_file = 'بالطرد 🚷'    
else
lock_file = '✘'    
end    
if MOHMADdevVEER:get(devVEER.."lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = 'بالطرد 🚷'    
else
lock_self = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:Bot:kick"..msg.chat_id_) == 'del' then
lock_bots = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Bot:kick"..msg.chat_id_) == 'ked' then
lock_bots = 'بالتقيد 🔏'   
elseif MOHMADdevVEER:get(devVEER.."lock:Bot:kick"..msg.chat_id_) == 'kick' then
lock_bots = 'بالطرد 🚷'    
else
lock_bots = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = 'بالطرد 🚷'    
else
lock_mark = '✘'    
end
if MOHMADdevVEER:get(devVEER.."lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = '✓'
elseif MOHMADdevVEER:get(devVEER.."lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = 'بالتقيد 🔏'    
elseif MOHMADdevVEER:get(devVEER.."lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = 'بالكتم 🔇'    
elseif MOHMADdevVEER:get(devVEER.."lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = 'بالطرد 🚷'    
else
lock_spam = '✘'    
end        
tdcli_function({ID ="GetChat",
chat_id_=msg.chat_id_},
function(arg,data) 
tdcli_function ({ ID = "GetChannelFull", 
channel_id_ = getChatId(msg.chat_id_).ID },
function(arg,tah)  
if tah.invite_link_ then
linkgn = '📛*¦* اسم الكروب ➘\n ٴ❴ ['..data.title_..']('..tah.invite_link_..') ❵ ➺'
else
linkgn = '📛*¦* اسم الكروب ➘\n ٴ❴ `'..data.title_..'` ❵ ➺'
end
local text = 
'\n*📮¦ اهلا بك عزيزي في الاعدادات 🌟*\nٴ━━━━━━━━━━━━'..
'\n*💥¦ الروابط ↫❪ '..lock_links..
' ❫*\n'..'*💥¦ المعرفات ↫❪ '..lock_user..
' ❫*\n'..'*💥¦ التاك ↫❪ '..lock_hash..
' ❫*\n'..'*💥¦ البوتات ↫❪ '..lock_bots..
' ❫*\n'..'*💥¦ التوجيه ↫❪ '..lock_fwd..
' ❫*\n'..'*💥¦ التثبيت ↫❪ '..lock_pin..
' ❫*\n'..'*💥¦ الاشعارات ↫❪ '..lock_tagservr..
' ❫*\n'..'*💥¦ اشعارات البوتات ↫❪ '..lock_tagservr_bot..
' ❫*\n'..'*💥¦ الماركدون ↫❪ '..lock_mark..
' ❫*\n'..'*💥¦ التعديل ↫❪ '..lock_edit..
' ❫*\n'..'*💥¦ تعديل الميديا ↫❪ '..lock_edit_med..
' ❫*\nٴ━━━━━━━━━━━━'..
'\n'..'*💥¦ الكلايش ↫❪ '..lock_spam..
' ❫*\n'..'*💥¦ الكيبورد ↫❪ '..lock_inlin..
' ❫*\n'..'*💥¦ الاغاني ↫❪ '..lock_vico..
' ❫*\n'..'*💥¦ المتحركه ↫❪ '..lock_gif..
' ❫*\n'..'*💥¦ الملفات ↫❪ '..lock_file..
' ❫*\n'..'*💥¦ الدردشه ↫❪ '..lock_text..
' ❫*\n'..'*💥¦ الفيديو ↫❪ '..lock_ved..
' ❫*\n'..'*💥¦ الصور ↫❪ '..lock_photo..
' ❫*\nٴ━━━━━━━━━━━━'..
'\n'..'*💥¦ الصوت ↫❪ '..lock_muse..
' ❫*\n'..'*💥¦ الملصقات ↫❪ '..lock_ste..
' ❫*\n'..'*💥¦ الجهات ↫❪ '..lock_phon..
' ❫*\n'..'*💥¦ الدخول ↫❪ '..lock_join..
' ❫*\n'..'*💥¦ الاضافه ↫❪ '..lock_add..
' ❫*\n'..'*💥¦ السيلفي ↫❪ '..lock_self..
' ❫*\n'..'*💥¦ الالعاب ↫❪ '..lock_geam..
' ❫*\n'..'*💥¦ التكرار ↫❪ '..getadd_or_rem('spam')..
' ❫*\n'..'*💥¦ الترحيب ↫❪ '..getadd_or_rem('welcome')..
' ❫*\n'..'*💥¦ عدد التكرار ↫❪ '..NUM_MSG_MAX..
' ❫*\n   ٴ━━━━━━━━━━━━\n'..
'\n'..linkgn..'\n*📮¦ ايدي الكروب ➘ \nٴ❴* `'..msg.chat_id_..'` *❵* ➺\nٴ'    
VEER_sendMsg(msg.chat_id_, msg.id_, 1, text, 1, 'md')     
end,nil) 
end,nil)  
end    
if text and text:match("^تغير الاشتراك$") and is_devmohmad(msg) then  
MOHMADdevVEER:setex(devVEER.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📮¦ حسنآ ارسل لي معرف القناة*\n💥'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
if text and text:match("^تغير رساله الاشتراك$") and is_devmohmad(msg) then  
MOHMADdevVEER:setex(devVEER.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📮¦ حسنآ ارسل لي النص الذي تريده*\n💥'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
if text == "حذف رساله الاشتراك" and is_devmohmad(msg) then  
MOHMADdevVEER:del(devVEER..'text:ch:user')
taha = "*📮¦ تم مسح رساله الاشتراك*\n✓"
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
end
if text == "تفعيل الاشتراك الاجباري" and is_devmohmad(msg) then  
if MOHMADdevVEER:get(devVEER..'add:ch:id') then
local addchusername = MOHMADdevVEER:get(devVEER..'add:ch:username')
taha = "*📮¦ الاشتراك الاجباري مفعل \n📮¦ على القناة » *["..addchusername.."]\n✓"
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
else
MOHMADdevVEER:setex(devVEER.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
taha = "*📮¦ اهلا عزيزي المطور \n📮¦ ارسل معرف قناتك ليتم تفعيل الاشتراك الاجباري*\n✓"
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
end
end
if text == "تعطيل الاشتراك الاجباري" and is_devmohmad(msg) then  
MOHMADdevVEER:del(devVEER..'add:ch:id')
MOHMADdevVEER:del(devVEER..'add:ch:username')
taha = "*📮¦ تم تعطيل الاشتراك الاجباري *\n✓"
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
end
if text == "الاشتراك الاجباري" and is_devmohmad(msg) then  
if MOHMADdevVEER:get(devVEER..'add:ch:username') then
local addchusername = MOHMADdevVEER:get(devVEER..'add:ch:username')
taha = "*📮¦ تم تفعيل الاشتراك الاجباري \n📮¦ على القناة » *["..addchusername.."]\n✓"
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
else
taha = "*📮¦ لا يوجد قناة في الاشتراك الاجباري *\n✓"
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
end
end
if text and text:match('^ضع تكرار (%d+)$') and is_mod(msg) then MOHMADdevVEER:hset("flooding:settings:"..msg.chat_id_ ,"floodmax" ,text:match('ضع تكرار (.*)')) VEER_sendMsg(msg.chat_id_, msg.id_, 1,'💥*¦*  تم وضع عدد التكرار في المجموعه ( '..text:match('ضع تكرار (.*)')..' )', 1, 'md') end if text and text:match('^ضع زمن التكرار (%d+)$') and is_mod(msg) then MOHMADdevVEER:hset("flooding:settings:"..msg.chat_id_ ,"floodtime" ,text:match('ضع زمن التكرار (.*)')) VEER_sendMsg(msg.chat_id_, msg.id_, 1,'💥*¦*  تم وضع زمن التكرار في المجموعه ( '..text:match('ضع زمن التكرار (.*)')..' )', 1, 'md') end
if text == 'الترحيب' then 
local getwelcom = MOHMADdevVEER:get(devVEER..'welcome:'..msg.chat_id_)  
if getwelcom then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, ''..getwelcom..'', 1, 'html') 
else 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📛¦* عذرا لم يتم وضع الترحيب \n', 1, 'md') 
end 
end

if text ==('رفع مميز') and is_mod(msg) or text ==('رفع عضو مميز') and is_mod(msg) then
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
setvip = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه مميز للـكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setvip, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_)  
else
setvip = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تـم تـرقيتـه مميز للـكروب'   
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end
else
if data.username_ == false then
setvip = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو مميز \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setvip, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_)  
else
setvip = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد هو مميز'   
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^رفع مميز @(.*)') and is_mod(msg) or text and text:match('^رفع عضو مميز @(.*)') and is_mod(msg) then 
local SET1 = text:match('^رفع مميز @(.*)') 
local SET2 = text:match('^رفع عضو مميز @(.*)') 
local username = (SET1 or SET2)
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if not MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,result.id_) then
setvip = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تـم تـرقيتـه مميز للـكروب'   
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
setvip = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد هو مميز'   
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
else  
setvip = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^رفع مميز (%d+)') and is_mod(msg) or text and text:match('^رفع عضو مميز (%d+)') and is_mod(msg) then 
local SET1 = text:match('رفع مميز (%d+)')
local SET2 = text:match('رفع عضو مميز (%d+)')
local user = (SET1 or SET2)
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,user) then
if data.username_ == false then
setvip = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه مميز للـكروب\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setvip, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,user)  
else
setvip = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تـم تـرقيتـه مميز للـكروب'   
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end
else
if data.username_ == false then
setvip = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو مميز \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setvip, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,user)  
else
setvip = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد هو مميز'   
MOHMADdevVEER:sadd(devVEER..'vip:group'..msg.chat_id_,user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end
end
end,nil)   
end
if text ==('تنزيل مميز') and is_mod(msg) or text ==('تنزيل عضو مميز') and is_mod(msg) then
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
setvip = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من المميزين\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setvip, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_)  
else
setvip = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تم تنزيله من المميزين'   
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end
else
if data.username_ == false then
setvip = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس مميز \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setvip, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_)  
else
setvip = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس مميز'   
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^تنزيل مميز @(.*)') and is_mod(msg) or text and text:match('^تنزيل عضو مميز @(.*)') and is_mod(msg) then 
local SET1 = text:match('^تنزيل مميز @(.*)') 
local SET2 = text:match('^تنزيل عضو مميز @(.*)') 
local username = (SET1 or SET2)
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع تنزيل القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n??', 1, 'md') 
return false  end
if result.id_ then  
if MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,result.id_) then
setvip = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تم تنزيله من المميزين'   
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,result.id_)  
else
setvip = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس مميز'   
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,result.id_)  
end
else  
setvip = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^تنزيل مميز (%d+)') and is_mod(msg) or text and text:match('^تنزيل عضو مميز (%d+)') and is_mod(msg) then 
local SET1 = text:match('تنزيل مميز (%d+)')
local SET2 = text:match('تنزيل عضو مميز (%d+)')
local user = (SET1 or SET2)
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,user) then
if data.username_ == false then
setvip = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من المميزين\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setvip, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,user)  
else
setvip = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تم تنزيله من المميزين'   
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end
else
if data.username_ == false then
setvip = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس مميز \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setvip, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,user)  
else
setvip = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو ليس مميز'   
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvip, 1, 'md') 
end
end
end,nil)   
end
if text ==('مسح المكتومين') and is_mod(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'mutes'..msg.chat_id_) 
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد مكتومين ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,v) 
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المكتومين *\n', 1, 'md') 
end 
if text ==('مسح المحظورين') and is_mod(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'VEER:baned'..msg.chat_id_) 
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد محظورين ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,v) 
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المحظورين *\n', 1, 'md') 
end 

if text == 'مسح المميزين' and is_mod(msg) then  
local list = MOHMADdevVEER:smembers(devVEER..'vip:group'..msg.chat_id_) 
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد مميزين ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,v) 
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المميزين *\n', 1, 'md') 
end 
if text ==('مسح الادمنيه') and is_monsh(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'mods:'..msg.chat_id_) 
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد ادمنيه ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,v) 
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من الادمنيه *\n', 1, 'md') 
end
if text ==('مسح المدراء') and is_owner(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'modergroup'..msg.chat_id_) 
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد مدراء ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,v) 
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المدراء *\n', 1, 'md') 
end 
if text == 'مسح المنشئين' and is_sudo(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'moder'..msg.chat_id_) 
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد منشئين ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,v) 
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المنشئين *\n', 1, 'md') 
end

if text == 'مسح المميزين عام' and is_devmohmad(msg) then    
local list = MOHMADdevVEER:smembers(devVEER..'vip:groups')  
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦* لا يوجد مميزين عام ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER.."vip:groups",v)  
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المميزين عام *\n', 1, 'md') 
end
if text == 'مسح المطورين' and is_devmohmad(msg) then   
local list = MOHMADdevVEER:smembers(devVEER..'sudo:bot')  
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد مطورين ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER.."sudo:bot",v)  
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المطورين *\n', 1, 'md') 
end
if text == 'مسح قائمه العام' and is_devmohmad(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'VEER:gbaned')  
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد محظورين عام ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER.."VEER:gbaned",v)  
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من المحظورين عام *\n', 1, 'md') 
end	 
if text ==('رفع مميز عام') and is_devmohmad(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'vip:groups',result.sender_user_id_) then
if data.username_ == false then
setvips = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه مميز عام في البوت\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setvips, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'vip:groups',result.sender_user_id_)  
else
setvips = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تـم تـرقيتـه مميز عام في البوت'   
MOHMADdevVEER:sadd(devVEER..'vip:groups',result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end
else
if data.username_ == false then
setvips = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو مميز عام \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setvips, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'vip:groups',result.sender_user_id_)  
else
setvips = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو مميز عام'   
MOHMADdevVEER:sadd(devVEER..'vip:groups',result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^رفع مميز عام @(.*)') and is_devmohmad(msg) then 
local username = text:match('^رفع مميز عام @(.*)') 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if not MOHMADdevVEER:sismember(devVEER..'vip:groups',result.id_) then
setvips = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تـم تـرقيتـه مميز عام البوت'   
MOHMADdevVEER:sadd(devVEER..'vip:groups',result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
setvips = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو مميز عام'   
MOHMADdevVEER:sadd(devVEER..'vip:groups',result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
else  
setvips = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^رفع مميز عام (%d+)') and is_devmohmad(msg) then 
local user = text:match('رفع مميز عام (%d+)')
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'vip:groups',user) then
if data.username_ == false then
setvips = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه مميز عام البوت\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setvips, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'vip:groups',user)  
else
setvips = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تـم تـرقيتـه مميز عام البوت'   
MOHMADdevVEER:sadd(devVEER..'vip:groups',user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end
else
if data.username_ == false then
setvips = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو مميز عام \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setvips, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'vip:groups',user)  
else
setvips = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو مميز عام'   
MOHMADdevVEER:sadd(devVEER..'vip:groups',user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end
end
end,nil)   
end
if text ==('تنزيل مميز عام') and is_devmohmad(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'vip:groups',result.sender_user_id_) then
if data.username_ == false then
setvips = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من مميزين عام\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setvips, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'vip:groups',result.sender_user_id_)  
else
setvips = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تم تنزيله من مميزين عام'   
MOHMADdevVEER:srem(devVEER..'vip:groups',result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end
else
if data.username_ == false then
setvips = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس مميز عام \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setvips, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'vip:groups',result.sender_user_id_)  
else
setvips = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس مميز عام'   
MOHMADdevVEER:srem(devVEER..'vip:groups',result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^تنزيل مميز عام @(.*)') and is_devmohmad(msg) then 
local username = text:match('^تنزيل مميز عام @(.*)') 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع تنزيل القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if MOHMADdevVEER:sismember(devVEER..'vip:groups',result.id_) then
setvips = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تم تنزيله من مميزين عام'   
MOHMADdevVEER:srem(devVEER..'vip:groups',result.id_)  
else
setvips = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس مميز عام'   
MOHMADdevVEER:srem(devVEER..'vip:groups',result.id_)  
end
else  
setvips = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^تنزيل مميز عام (%d+)') and is_devmohmad(msg) then 
local user = text:match('تنزيل مميز عام (%d+)')
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'vip:groups',user) then
if data.username_ == false then
setvips = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من مميزين عام\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setvips, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'vip:groups',user)  
else
setvips = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تم تنزيله من مميزين عام'   
MOHMADdevVEER:srem(devVEER..'vip:groups',user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end
else
if data.username_ == false then
setvips = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس مميز عام \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setvips, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'vip:groups',user)  
else
setvips = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو ليس مميز عام'   
MOHMADdevVEER:srem(devVEER..'vip:groups',user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setvips, 1, 'md') 
end
end
end,nil)   
end
if text ==('رفع مدير') and is_owner(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه مدير للـكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تـم تـرقيتـه مدير للـكروب'   
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو مدير \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو مدير'   
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^رفع مدير @(.*)') and is_owner(msg) then 
local username = text:match('^رفع مدير @(.*)') 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if not MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تـم تـرقيتـه مدير للـكروب'   
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو مدير'   
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
else  
zo = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^رفع مدير (%d+)') and is_owner(msg) then 
local user = text:match('رفع مدير (%d+)')
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه مدير للـكروب\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تـم تـرقيتـه مدير للـكروب'   
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو مدير \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو مدير'   
MOHMADdevVEER:sadd(devVEER..'modergroup'..msg.chat_id_,user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end
if text ==('تنزيل مدير') and is_owner(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من المدراء\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تم تنزيله من المدراء'   
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس مدير \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس مدير'   
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^تنزيل مدير @(.*)') and is_owner(msg) then 
local username = text:match('^تنزيل مدير @(.*)') 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع تنزيل القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تم تنزيله من المدراء'   
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,result.id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس مدير'   
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,result.id_)  
end
else  
zo = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^تنزيل مدير (%d+)') and is_owner(msg) then 
local user = text:match('تنزيل مدير (%d+)')
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من المدراء\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تم تنزيله من المدراء'   
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس مدير \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو ليس مدير'   
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end
if text ==('رفع ادمن') and is_monsh(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه ادمن للـكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تـم تـرقيتـه ادمن للـكروب'   
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ادمن \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو ادمن'   
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^رفع ادمن @(.*)') and is_monsh(msg) then 
local username = text:match('^رفع ادمن @(.*)') 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if not MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تـم تـرقيتـه ادمن للـكروب'   
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو ادمن'   
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
else  
zo = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^رفع ادمن (%d+)') and is_monsh(msg) then 
local user = text:match('رفع ادمن (%d+)')
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه ادمن للـكروب\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تـم تـرقيتـه ادمن للـكروب'   
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ادمن \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو ادمن'   
MOHMADdevVEER:sadd(devVEER..'mods:'..msg.chat_id_,user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end
if text ==('تنزيل ادمن') and is_monsh(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من الادمنيه\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تم تنزيله من الادمنيه'   
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس ادمن \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس ادمن'   
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^تنزيل ادمن @(.*)') and is_monsh(msg) then 
local username = text:match('^تنزيل ادمن @(.*)') 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع تنزيل القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تم تنزيله من الادمنيه'   
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,result.id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس ادمن'   
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,result.id_)  
end
else  
zo = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^تنزيل ادمن (%d+)') and is_monsh(msg) then 
local user = text:match('تنزيل ادمن (%d+)')
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من الادمنيه\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تم تنزيله من الادمنيه'   
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس ادمن \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو ليس ادمن'   
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end
if text ==('رفع منشئ') and is_sudo(msg) or text ==('رفع منشى') and is_sudo(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
setmonsh = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه منشئ للـكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setmonsh, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,result.sender_user_id_)  
else
setmonsh = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تـم تـرقيتـه منشئ للـكروب'   
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end
else
if data.username_ == false then
setmonsh = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو منشئ \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setmonsh, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,result.sender_user_id_)  
else
setmonsh = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو منشئ'   
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^رفع منشئ @(.*)') and is_sudo(msg) or text and text:match('^رفع منشى @(.*)') and is_sudo(msg) then 
local username1 = text:match('^رفع منشئ @(.*)') 
local username2 = text:match('^رفع منشى @(.*)') 
local username = username1 or username2
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if not MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,result.id_) then
setmonsh = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تـم تـرقيتـه منشئ للـكروب'   
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
setmonsh = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو منشئ'   
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
else  
setmonsh = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^رفع منشئ (%d+)') and is_sudo(msg) or text and text:match('^رفع منشى (%d+)') and is_sudo(msg) then 
local user1 = text:match('رفع منشئ (%d+)')
local user2 = text:match('رفع منشى (%d+)')
local user = user1 or user2
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,user) then
if data.username_ == false then
setmonsh = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه منشئ للـكروب\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setmonsh, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,user)  
else
setmonsh = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تـم تـرقيتـه منشئ للـكروب'   
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end
else
if data.username_ == false then
setmonsh = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو منشئ \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setmonsh, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,user)  
else
setmonsh = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو منشئ'   
MOHMADdevVEER:sadd(devVEER..'moder'..msg.chat_id_,user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end
end
end,nil)   
end
if text ==('تنزيل منشئ') and is_sudo(msg) or text ==('تنزيل منشى') and is_sudo(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
setmonsh = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من المنشئين\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setmonsh, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,result.sender_user_id_)  
else
setmonsh = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تم تنزيله من المنشئين'   
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end
else
if data.username_ == false then
setmonsh = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس منشئ \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, setmonsh, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,result.sender_user_id_)  
else
setmonsh = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس منشئ'   
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^تنزيل منشئ @(.*)') and is_sudo(msg) or text and text:match('^تنزيل منشى @(.*)') and is_sudo(msg) then 
local username1 = text:match('^تنزيل منشئ @(.*)') 
local username2 = text:match('^تنزيل منشى @(.*)') 
local username = username1 or username2
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع تنزيل القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,result.id_) then
setmonsh = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تم تنزيله من المنشئين'   
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,result.id_)  
else
setmonsh = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس منشئ'   
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,result.id_)  
end
else  
setmonsh = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^تنزيل منشئ (%d+)') and is_sudo(msg) or text and text:match('^تنزيل منشئ (%d+)') and is_sudo(msg) then 
local user1 = text:match('تنزيل منشئ (%d+)')
local user2 = text:match('تنزيل منشى (%d+)')
local user = user1 or user2
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,user) then
if data.username_ == false then
setmonsh = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من المنشئين\n'   
VEERmonshn(msg.chat_id_, user, msg.id_, setmonsh, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,user)  
else
setmonsh = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تم تنزيله من المنشئين'   
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end
else
if data.username_ == false then
setmonsh = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس منشئ \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, setmonsh, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,user)  
else
setmonsh = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو ليس منشئ'   
MOHMADdevVEER:srem(devVEER..'moder'..msg.chat_id_,user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, setmonsh, 1, 'md') 
end
end
end,nil)   
end
if text ==('رفع مطور') and is_devmohmad(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'sudo:bot',result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه مطور البوت\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'sudo:bot',result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تـم تـرقيتـه مطور البوت'   
MOHMADdevVEER:sadd(devVEER..'sudo:bot',result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو مطور \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'sudo:bot',result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو مطور'   
MOHMADdevVEER:sadd(devVEER..'sudo:bot',result.sender_user_id_)  
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^رفع مطور @(.*)') and is_devmohmad(msg) then 
local username = text:match('^رفع مطور @(.*)') 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if not MOHMADdevVEER:sismember(devVEER..'sudo:bot',result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تـم تـرقيتـه مطور البوت'   
MOHMADdevVEER:sadd(devVEER..'sudo:bot',result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو مطور'   
MOHMADdevVEER:sadd(devVEER..'sudo:bot',result.id_)  
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
else  
zo = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^رفع مطور (%d+)') and is_devmohmad(msg) then 
local user = text:match('رفع مطور (%d+)')
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'sudo:bot',user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تـرقيتـه مطور البوت\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'sudo:bot',user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تـم تـرقيتـه مطور البوت'   
MOHMADdevVEER:sadd(devVEER..'sudo:bot',user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو مطور \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'sudo:bot',user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو مطور'   
MOHMADdevVEER:sadd(devVEER..'sudo:bot',user)  
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end
if text ==('تنزيل مطور') and is_devmohmad(msg) then 
function prom_reply(extra, result, success) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'sudo:bot',result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من المطورين\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'sudo:bot',result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* تم تنزيله من المطورين'   
MOHMADdevVEER:srem(devVEER..'sudo:bot',result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس مطور \n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'sudo:bot',result.sender_user_id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس مطور'   
MOHMADdevVEER:srem(devVEER..'sudo:bot',result.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^تنزيل مطور @(.*)') and is_devmohmad(msg) then 
local username = text:match('^تنزيل مطور @(.*)') 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع تنزيل القناة في البوت *\n💥', 1, 'md') 
return false  end
if result and result.type_ and result.type_.user_ and result.type_.user_.type_ and result.type_.user_.type_.ID == "UserTypeBot" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if result.id_ then  
if MOHMADdevVEER:sismember(devVEER..'sudo:bot',result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* تم تنزيله من المطورين'   
MOHMADdevVEER:srem(devVEER..'sudo:bot',result.id_)  
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` *❫*\n*🚸¦* بالتاكيد هو ليس مطور'   
MOHMADdevVEER:srem(devVEER..'sudo:bot',result.id_)  
end
else  
zo = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^تنزيل مطور (%d+)') and is_devmohmad(msg) then 
local user = text:match('تنزيل مطور (%d+)')
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if data and data.type_ and data.type_.ID == "UserTypeBot" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع رفع وتنزيل البوتات *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'sudo:bot',user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم تنزيله من المطورين\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'sudo:bot',user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* تم تنزيله من المطورين'   
MOHMADdevVEER:srem(devVEER..'sudo:bot',user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد هو ليس مطور \n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'sudo:bot',user)  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` *❫*\n*🚸¦* بالتاكيد هو ليس مطور'   
MOHMADdevVEER:srem(devVEER..'sudo:bot',user)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت وليس لدي قيود * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) or MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_) or MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم رفع قيوده\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تم رفع قيوده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم رفع قيوده\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تم رفع قيوده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and is_mod(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت وليس لدي قيود * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,user) or MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,user) or MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم رفع قيوده\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,user) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,user)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تم رفع قيوده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,user) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,user)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,user)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم رفع قيوده\n💥'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,user) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,user)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تم رفع قيوده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,user) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,user)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,user)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and is_mod(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ هاذا المعرف قناة وليس معرف حساب *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت وليس لدي قيود * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.id_
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,result.id_) or MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,result.id_) or MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تم رفع قيوده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.id_) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.id_)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تم رفع قيوده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.id_) 
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.id_)   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end,nil)   
end  
saddbyusername(username,unbanusername) 
end 

if text == 'الغاء الحظر' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) or text == 'الغاء حظر' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست محظور * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" }, 
},function(arg,ban) 
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ يرجى تفعيل صلاحيه حظر المستخدمين لاتمكن من الغاء حظره *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم الغاء حظره\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تم الغاء حظره\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم الغاء حظره\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تم الغاء حظره\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end,nil)   
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^الغاء الحظر (%d+)') and is_mod(msg) or text and text:match('^الغاء حظر (%d+)') and is_mod(msg) then 
local user1 = text:match('الغاء الحظر (%d+)') 
local user2 = text:match('الغاء حظر (%d+)') 
local user = user1 or user2
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست محظور * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" }, 
},function(arg,ban) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ يرجى تفعيل صلاحيه حظر المستخدمين لاتمكن من الغاء حظره *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم الغاء حظره\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تم الغاء حظره\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,user)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم الغاء حظره\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تم الغاء حظره\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,user)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end,nil)  
end
if text and text:match('^الغاء الحظر @(.*)') and is_mod(msg) or text and text:match('^الغاء حظر @(.*)') and is_mod(msg) then  
local username1 = text:match('الغاء الحظر @(.*)')  
local username2 = text:match('الغاء حظر @(.*)')  
local username = username1 or username2 
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع حظر القناة *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست محظور * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.id_
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" }, 
},function(arg,ban) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ يرجى تفعيل صلاحيه حظر المستخدمين لاتمكن من الغاء حظره *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تم الغاء حظره\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تم الغاء حظره\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:baned'..msg.chat_id_,result.id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end,nil)   
end,nil)  
end  
saddbyusername(username,unbanusername) 
end 
if text == 'المحظورين' and is_mod(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'VEER:baned'..msg.chat_id_)
local t = '*📮¦ قائمه محظورين المجموعه *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد محظورين في هاذه المجموعه' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  
if text == 'الادمنيه' and is_mod(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'mods:'..msg.chat_id_)
local t = '*📮¦ قائمه ادمنيه المجموعه *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد ادمنيه في هاذه المجموعه' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  
if text == 'المميزين' and is_mod(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'vip:group'..msg.chat_id_)
local t = '*📮¦ قائمه مميزين المجموعه *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد مميزين في هاذه المجموعه' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  
if text == 'المميزين عام' and is_devmohmad(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'vip:groups')
local t = '*📮¦ قائمه المميزين عام *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد مميزين عام في البوت' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  
if text == 'المطورين' and is_devmohmad(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'sudo:bot')
local t = '*📮¦ قائمه مطورين البوت *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد مطورين في البوت' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  
if text == 'المدراء' and is_owner(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'modergroup'..msg.chat_id_)
local t = '*📮¦ قائمه مدراء المجموعه *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد مدراء في هاذه المجموعه' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end 
if text == 'المحظورين عام' and is_devmohmad(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'VEER:gbaned')
local t = '*📮¦ قائمه المحظورين عام *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد محظورين عام في البوت' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  
if text == 'المنشئين' and is_owner(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'moder'..msg.chat_id_)
local t = '*📮¦ قائمه منشئين المجموعه *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد منشئين في هاذه المجموعه' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  
if text == 'المكتومين' and is_mod(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'mutes'..msg.chat_id_)
local t = '*📮¦ قائمه مكتومين المجموعه *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد مكتومين في هاذه المجموعه' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  
if text == 'المقيدين' and is_mod(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'tedmembars'..msg.chat_id_)
local t = '*📮¦ قائمه مقيدين المجموعه *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد مقيدين في هاذه المجموعه' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  

if text ==('حظر عام') and is_devmohmad(msg) then 
function prom_reply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع حظر نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,result.sender_user_id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع حظر » ❪ '..get_mokforkick(msg.chat_id_,result.sender_user_id_)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" }, 
},function(arg,ban) 
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم حظره عام من الكروبات\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',result.sender_user_id_)   
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,result.sender_user_id_) end
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تـم حظره عام من الكروبات\n🍃'   
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,result.sender_user_id_) end
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',result.sender_user_id_)   
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم حظره عام من الكروبات\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',result.sender_user_id_)   
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,result.sender_user_id_) end
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تـم حظره عام من الكروبات\n🍃'   
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',result.sender_user_id_)   
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,result.sender_user_id_) end
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^حظر عام @(.*)') and is_devmohmad(msg) then 
local username = text:match('^حظر عام @(.*)') 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع حظر القناة *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع حظر نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,result.id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع حظر » ❪ '..get_mokforkick(msg.chat_id_,result.id_)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" }, 
},function(arg,ban) 
if result.id_ then  
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n🍃', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تـم حظره عام من الكروبات\n🍃'   
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',result.id_)   
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,result.id_) end
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تـم حظره عام من الكروبات\n🍃'     
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',result.id_)   
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,result.id_) end
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
else  
zo = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end,nil)   
end   
saddbyusername(username,promreply) 
end
if text and text:match('^حظر عام (%d+)') and is_devmohmad(msg) then 
local user = text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع حظر نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,user) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع حظر » ❪ '..get_mokforkick(msg.chat_id_,user)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusKicked" }, 
},function(arg,ban) 
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if data and data.code_ and data.code_ == 6 then
zo = '*📬¦ العضــو » ❪ '..user..' ❫\n🚸¦ تـم حظره عام من الكروبات\n🍃*'   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,user) end
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',user)   
return false  end
if not MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم حظره عام من الكروبات\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,user) end
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تـم حظره عام من الكروبات\n🍃'   
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,user) end
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',user)   
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم حظره عام من الكروبات\n🍃'     
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,user) end
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تـم حظره عام من الكروبات\n🍃'     
MOHMADdevVEER:sadd(devVEER..'VEER:gbaned',user)   
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,user) end
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end,nil)   
end
if text == 'الغاء العام' and tonumber(msg.reply_to_message_id_) > 0 and is_devmohmad(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست محظور * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" }, 
},function(arg,ban) 
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ يرجى تفعيل صلاحيه حظر المستخدمين لاتمكن من الغاء حظره عام *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم الغاء حظره عام\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تم الغاء حظره عام\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',result.sender_user_id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم الغاء حظره عام\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تم الغاء حظره عام\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',result.sender_user_id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end,nil)   
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^الغاء العام (%d+)') and is_devmohmad(msg) then 
local user = text:match('الغاء العام (%d+)') 
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست محظور * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" }, 
},function(arg,ban) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ يرجى تفعيل صلاحيه حظر المستخدمين لاتمكن من الغاء حظره عام *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم الغاء حظره عام\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تم الغاء حظره عام\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',user)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم الغاء حظره عام\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تم الغاء حظره عام\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',user)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end,nil)  
end
if text and text:match('^الغاء العام @(.*)') and is_devmohmad(msg) then  
local username = text:match('الغاء العام @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع حظر القناة *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست محظور * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.id_
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" }, 
},function(arg,ban) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ يرجى تفعيل صلاحيه حظر المستخدمين لاتمكن من الغاء حظره عام *\n🍃', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'VEER:gbaned',result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تم الغاء حظره عام\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',result.id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تم الغاء حظره عام\n🍃'   
MOHMADdevVEER:srem(devVEER..'VEER:gbaned',result.id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end,nil)   
end,nil)  
end  
saddbyusername(username,unbanusername) 
end 
if text ==('كتم') and is_mod(msg) then 
if msg.can_be_deleted_ == false then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🚨¦* انا لست ادمن يرجى رفعي والمحاوله مره اخره\n", 1, "md") 
return false  end 
function prom_reply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع كتم نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,result.sender_user_id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع كتم » ❪ '..get_mokforkick(msg.chat_id_,result.sender_user_id_)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if not MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم كتمه من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*📬¦* تـم كتمه من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم كتمه من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تـم كتمه من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^كتم @(.*)') and is_mod(msg) then 
local username = text:match('^كتم @(.*)') 
if msg.can_be_deleted_ == false then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* انا لست ادمن يرجى رفعي والمحاوله مره اخره\n", 1, "md") 
return false  end 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ هاذا المعرف قناة وليس معرف حساب *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع كتم نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,result.id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع كتم » ❪ '..get_mokforkick(msg.chat_id_,result.id_)..' ❫ *\n', 1, 'md') 
return false  end 
if not MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تـم كتمه من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,result.id_)   
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تـم كتمه من الكروب\n🍃'     
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,result.id_)   
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^كتم (%d+)') and is_mod(msg) then 
local user = text:match('كتم (%d+)')
if msg.can_be_deleted_ == false then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🚨¦* انا لست ادمن يرجى رفعي والمحاوله مره اخره\n", 1, "md") 
return false  end 
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع كتم نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,user) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع كتم » ❪ '..get_mokforkick(msg.chat_id_,user)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "USER_ADMIN_INVALID" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع كتم ادمنية المجموعه *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم كتمه من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تـم كتمه من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,user)   
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم كتمه من الكروب\n🍃'     
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تـم كتمه من الكروب\n🍃'     
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,user)   
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end
if text ==('الغاء كتم') and is_mod(msg) or text ==('الغاء الكتم') and is_mod(msg) and tonumber(msg.reply_to_message_id_) > 0 then
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست مكتوم * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم الغاء كتمه\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تم الغاء كتمه\n🍃'   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم الغاء كتمه\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تم الغاء كتمه\n🍃'   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^الغاء كتم (%d+)') and is_mod(msg) or text and text:match('^الغاء الكتم (%d+)') and is_mod(msg) then 
local SET1 = text:match('الغاء كتم (%d+)')
local SET2 = text:match('الغاء الكتم (%d+)')
local user = (SET1 or SET2)
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست مكتوم * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم الغاء كتمه\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تم الغاء كتمه\n🍃'   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,user)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم الغاء كتمه\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تم الغاء كتمه\n🍃'   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,user)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)  
end
if text and text:match('^الغاء كتم @(.*)') and is_mod(msg) or text and text:match('^الغاء الكتم @(.*)') and is_mod(msg) then 
local SET1 = text:match('^الغاء كتم @(.*)') 
local SET2 = text:match('^الغاء الكتم @(.*)') 
local username = (SET1 or SET2)
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ هاذا المعرف قناة وليس معرف حساب *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست مكتوم * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.id_
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'mutes'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تم الغاء كتمه\n🍃'   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تم الغاء كتمه\n🍃'   
MOHMADdevVEER:srem(devVEER..'mutes'..msg.chat_id_,result.id_)   
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end,nil)   
end  
saddbyusername(username,unbanusername) 
end 
end

if text ==('حظر') then 
if is_mod(msg) or is_canban(msg) then
if not is_owner(msg) and not is_canban(msg) and MOHMADdevVEER:get(devVEER..'LOCK:BAN:KICK'..msg.chat_id_) then 
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع الحظر لقد تم تعطيل { الحظر - الطرد } \n👨🏻‍✈️*")   
return false  end 
if MOHMADdevVEER:sismember(devVEER..'LOCK:BAN'..msg.chat_id_,msg.sender_user_id_) then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ تم وضع القيود عليك لا تستطيع { طرد او حظر } المستخدمين \n👨🏻‍✈️*")   
return false  end 
function prom_reply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع حظر نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,result.sender_user_id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع حظر » ❪ '..get_mokforkick(msg.chat_id_,result.sender_user_id_)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" }, 
},function(arg,ban) 
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "USER_ADMIN_INVALID" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع حظر ادمنية المجموعه *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ ليس لدي صلاحية حظر المستخدمين *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم حظره من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تـم حظره من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم حظره من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تـم حظره من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,result.sender_user_id_)   
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
else
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انت لست ادمن \n👨🏻‍✈️*")   
end
end
if text and text:match('^حظر @(.*)') then 
local username = text:match('^حظر @(.*)') 
if is_mod(msg) or is_canban(msg) then
if not is_owner(msg) and not is_canban(msg) and MOHMADdevVEER:get(devVEER..'LOCK:BAN:KICK'..msg.chat_id_) then 
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع الحظر لقد تم تعطيل { الحظر - الطرد } \n👨🏻‍✈️*")   
return false  end 
if MOHMADdevVEER:sismember(devVEER..'LOCK:BAN'..msg.chat_id_,msg.sender_user_id_) then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ تم وضع القيود عليك لا تستطيع { طرد او حظر } المستخدمين \n👨🏻‍✈️*")   
return false  end 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع حظر القناة *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع حظر نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,result.id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع حظر » ❪ '..get_mokforkick(msg.chat_id_,result.id_)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" }, 
},function(arg,ban) 
if result.id_ then  
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "USER_ADMIN_INVALID" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع حظر ادمنية المجموعه *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ ليس لدي صلاحية حظر المستخدمين *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تـم حظره من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,result.id_)   
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تـم حظره من الكروب\n🍃'     
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,result.id_)   
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
else  
zo = ''   
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end,nil)   
end   
saddbyusername(username,promreply) 
else
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انت لست ادمن \n👨🏻‍✈️*")   
end
end

if text and text:match('^حظر (%d+)') then 
local user = text:match('حظر (%d+)')
if is_mod(msg) or is_canban(msg) then
if not is_owner(msg) and not is_canban(msg) and MOHMADdevVEER:get(devVEER..'LOCK:BAN:KICK'..msg.chat_id_) then 
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع الحظر لقد تم تعطيل { الحظر - الطرد } \n👨🏻‍✈️*")   
return false  end 
if MOHMADdevVEER:sismember(devVEER..'LOCK:BAN'..msg.chat_id_,msg.sender_user_id_) then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ تم وضع القيود عليك لا تستطيع { طرد او حظر } المستخدمين \n👨🏻‍✈️*")   
return false  end 
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع حظر نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,user) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع حظر » ❪ '..get_mokforkick(msg.chat_id_,user)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusKicked" }, 
},function(arg,ban) 
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "USER_ADMIN_INVALID" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع حظر ادمنية المجموعه *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ ليس لدي صلاحية حظر المستخدمين *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'VEER:baned'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم حظره من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تـم حظره من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,user)   
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم حظره من الكروب\n🍃'     
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تـم حظره من الكروب\n🍃'     
MOHMADdevVEER:sadd(devVEER..'VEER:baned'..msg.chat_id_,user)   
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end,nil)   
else
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انت لست ادمن \n👨🏻‍✈️*")   
end
return false 
end
if text and text:match('^طرد @(.*)') then
local username = text:match('^طرد @(.*)') 
if is_mod(msg) or is_canban(msg) then
if not is_owner(msg) and not is_canban(msg) and MOHMADdevVEER:get(devVEER..'LOCK:BAN:KICK'..msg.chat_id_) then 
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع الحظر لقد تم تعطيل { الحظر - الطرد } \n👨🏻‍✈️*")   
return false  end 
if MOHMADdevVEER:sismember(devVEER..'LOCK:BAN'..msg.chat_id_,msg.sender_user_id_) then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ تم وضع القيود عليك لا تستطيع { طرد او حظر } المستخدمين \n👨🏻‍✈️*")   
return false  end 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.code_ and result.code_ == 400 and result.message_ == "USERNAME_NOT_OCCUPIED" then  
zo = '*📬¦* المعرف غلط او لا يوجد هاكذا حساب في التلكرام'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا تستطيع طرد القناة *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع طرد نفسي * \n', 1, 'md')  
return false  end 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = result.id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusLeft" then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تـم طرده من الكروب\n🍃'     
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
return false  end
if VEER1(msg.chat_id_,result.id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع طرد » ❪ '..get_mokforkick(msg.chat_id_,result.id_)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" }, 
},function(arg,ban) 
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "USER_ADMIN_INVALID" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع طرد ادمنية المجموعه *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ ليس لدي صلاحية حظر المستخدمين *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تـم طرده من الكروب\n🍃'     
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
changeChatMemberStatus(msg.chat_id_, result.id_, "Left") 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end,nil)   
end,nil)   
end   
saddbyusername(username,promreply) 
else
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انت لست ادمن \n👨🏻‍✈️*")   
end
end

if text ==('طرد') then
if is_mod(msg) or is_canban(msg) then
if not is_owner(msg) and not is_canban(msg) and MOHMADdevVEER:get(devVEER..'LOCK:BAN:KICK'..msg.chat_id_) then 
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع الحظر لقد تم تعطيل { الحظر - الطرد } \n👨🏻‍✈️*")   
return false  end 
if MOHMADdevVEER:sismember(devVEER..'LOCK:BAN'..msg.chat_id_,msg.sender_user_id_) then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ تم وضع القيود عليك لا تستطيع { طرد او حظر } المستخدمين \n👨🏻‍✈️*")   
return false  end 
function prom_reply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع طرد نفسي * \n', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,result.sender_user_id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع طرد » ❪ '..get_mokforkick(msg.chat_id_,result.sender_user_id_)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = result.sender_user_id_},function(arg,da) 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" }, 
},function(arg,ban) 
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "USER_ADMIN_INVALID" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع طرد ادمنية المجموعه *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ ليس لدي صلاحية حظر المستخدمين *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n', 1, 'md') 
return false  end
if da.status_.ID == "ChatMemberStatusLeft" then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم طرده من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'VEER:kick'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تـم طرده من الكروب\n🍃'   
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
kick(msg,msg.chat_id_,result.sender_user_id_)
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم طرده من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
MOHMADdevVEER:sadd(devVEER..'VEER:kick'..msg.chat_id_,result.sender_user_id_)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تـم طرده من الكروب\n🍃'   
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
kick(msg,msg.chat_id_,result.sender_user_id_)
end
end,nil)   
end,nil)   
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
else
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انت لست ادمن \n👨🏻‍✈️*")   
end
end

if text and text:match('^طرد (%d+)') then
local user = text:match('طرد (%d+)')
if is_mod(msg) or is_canban(msg) then
if not is_owner(msg) and not is_canban(msg) and MOHMADdevVEER:get(devVEER..'LOCK:BAN:KICK'..msg.chat_id_) then 
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع الحظر لقد تم تعطيل { الحظر - الطرد } \n👨🏻‍✈️*")   
return false  end 
if MOHMADdevVEER:sismember(devVEER..'LOCK:BAN'..msg.chat_id_,msg.sender_user_id_) then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ تم وضع القيود عليك لا تستطيع { طرد او حظر } المستخدمين \n👨🏻‍✈️*")   
return false  end 
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع طرد نفسي * \n', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,user) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع طرد » ❪ '..get_mokforkick(msg.chat_id_,user)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = user},function(arg,da) 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusKicked" }, 
},function(arg,ban) 
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "USER_ADMIN_INVALID" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع طرد ادمنية المجموعه *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ ليس لدي صلاحية حظر المستخدمين *\n💥', 1, 'md') 
return false  end
if ban and ban.code_ and ban.code_ == 3 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا لست ادمن في المجموعه *\n💥', 1, 'md') 
return false  end
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if da.status_.ID == "ChatMemberStatusLeft" then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم طرده من الكروب\n🍃'     
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تـم طرده من الكروب\n🍃'     
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
kick(msg,msg.chat_id_,user)
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم طرده من الكروب\n🍃'     
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
MOHMADdevVEER:sadd(devVEER..'VEER:kick'..msg.chat_id_,user)   
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تـم طرده من الكروب\n🍃'     
MOHMADdevVEER:sadd(devVEER..'VEER:kick'..msg.chat_id_,user)   
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
kick(msg,msg.chat_id_,user)
end
end,nil)   
end,nil)   
end,nil) 
else
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انت لست ادمن \n👨🏻‍✈️*")   
end
return false 
end

if text ==('تقييد') and is_mod(msg) or text ==('تقيد') and is_mod(msg) then 
if msg.can_be_deleted_ == false then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🚨¦* انا لست ادمن يرجى رفعي والمحاوله مره اخره\n", 1, "md") 
return false  end 
function prom_reply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع تقييد نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,result.sender_user_id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع تقييد » ❪ '..get_mokforkick(msg.chat_id_,result.sender_user_id_)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if not MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تقييده من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تـم تقييده من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم تقييده من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تـم تقييده من الكروب\n🍃'   
MOHMADdevVEER:sadd(devVEER..'mutes'..msg.chat_id_,result.sender_user_id_)   
seavusername(result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
if tonumber(msg.reply_to_message_id_) == 0 then 
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   
end 
end
if text and text:match('^تقييد @(.*)') and is_mod(msg) or text and text:match('^تقيد @(.*)') and is_mod(msg) then 
local username1 = text:match('^تقييد @(.*)') 
local username2 = text:match('^تقيد @(.*)') 
local username = username1 or username2
if msg.can_be_deleted_ == false then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🚨¦* انا لست ادمن يرجى رفعي والمحاوله مره اخره\n", 1, "md") 
return false  end 
function promreply(extra,result,success) 
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ هاذا المعرف قناة وليس معرف حساب *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع تقييد نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,result.id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع تقييد » ❪ '..get_mokforkick(msg.chat_id_,result.id_)..' ❫ *\n', 1, 'md') 
return false  end 
if not MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تـم تقييده من الكروب\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,result.id_) 
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
else
zo = '*📮¦* العضــو » ❪ [@'..username..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تـم تقييده من الكروب\n🍃'     
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,result.id_) 
MOHMADdevVEER:set(devVEER.."user:Name"..result.id_,"@"..username)
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end   
saddbyusername(username,promreply) 
end
if text and text:match('^تقييد (%d+)') and is_mod(msg) or text and text:match('^تقيد (%d+)') and is_mod(msg) then 
local user1 = text:match('تقييد (%d+)')
local user2 = text:match('تقيد (%d+)')
local user = user1 or user2
if msg.can_be_deleted_ == false then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🚨¦* انا لست ادمن يرجى رفعي والمحاوله مره اخره\n", 1, "md") 
return false  end 
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لأ أستطيع تقييد نفسي * ', 1, 'md')  
return false  end 
if VEER1(msg.chat_id_,user) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ عذرآ لآ أستطيع تقييد » ❪ '..get_mokforkick(msg.chat_id_,user)..' ❫ *\n', 1, 'md') 
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if ban and ban.code_ and ban.code_ == 400 and ban.message_ == "USER_ADMIN_INVALID" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع تقييد ادمنية المجموعه *\n💥', 1, 'md') 
return false  end
if not MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تـم تقييده من الكروب\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,user) 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تـم تقييده من الكروب\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,user) 
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تـم تقييده من الكروب\n🍃'     
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,user) 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تـم تقييده من الكروب\n🍃'     
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,user) 
seavusername(user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end
if text == 'الغاء التقييد' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) or text == 'الغاء التقيد' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست مقييد * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم الغاء تقييده\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* تم الغاء تقييده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم الغاء تقييده\n🍃'   
VEERmonshn(msg.chat_id_, result.sender_user_id_, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.sender_user_id_..'` ❫\n*🚸¦* بالتاكيد تم الغاء تقييده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)   
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^الغاء التقييد (%d+)') and is_mod(msg) or text and text:match('^الغاء التقيد (%d+)') and is_mod(msg) then 
local user1 = text:match('الغاء التقييد (%d+)') 
local user = text:match('الغاء التقيد (%d+)') 
local user = user1 or user2
if tonumber(user) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست مقيد * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,user) then
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ تم الغاء تقييده\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,user) 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* تم الغاء تقييده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
else
if data.username_ == false then
zo = '📮¦ العضــو » ❪ '..CatchName(data.first_name_,15)..' ❫\n📬¦ بالتاكيد تم الغاء تقييده\n🍃'   
VEERmonshn(msg.chat_id_, user, msg.id_, zo, 16, utf8.len(CatchName(data.first_name_,15)))  
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,user) 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..user..'` ❫\n*🚸¦* بالتاكيد تم الغاء تقييده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,user) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end
end,nil)  
end
if text and text:match('^الغاء التقييد @(.*)') and is_mod(msg) or text and text:match('^الغاء التقيد @(.*)') and is_mod(msg) then  
local username1 = text:match('الغاء التقييد @(.*)')  
local username2 = text:match('الغاء التقيد @(.*)')  
local username = username1 or username2
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
local taha = '*📮¦ المعرف لا يوجد فيه حساب *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ هاذا المعرف قناة وليس معرف حساب *\n💥', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ انا البوت ولست مقيد * \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.id_
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦ لا استطيع استخراج معلوماته*\n💥', 1, 'md') 
return false  end
if MOHMADdevVEER:sismember(devVEER..'tedmembars'..msg.chat_id_,result.id_) then
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* تم الغاء تقييده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
else
zo = '*📮¦* العضــو » ❪ [@'..data.username_..'] ❫\n*📬¦ الايـدي » ❪* `'..result.id_..'` ❫\n*🚸¦* بالتاكيد تم الغاء تقييده\n🍃'   
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
MOHMADdevVEER:srem(devVEER..'tedmembars'..msg.chat_id_,result.id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, zo, 1, 'md') 
end
end,nil)   
end  
saddbyusername(username,unbanusername) 
end 
if text and text:match('^مسح (%d+)$') and is_monsh(msg) then  
local taha = tonumber(text:match('^مسح (%d+)$')) 
if taha > 100 then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦ تستطيح المسح فقط (100) رساله*\n', 1, 'md') 
else 
function cb(a,b,c) 
local msgs = b.messages_  
for i=1 , #msgs do 
tdcli_function ({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_={[0] = b.messages_[i].id_}},function(arg,data) 
if data.message_ == "Message can't be deleted" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📬¦* لا استطيع المسح انا لست ادمن \n", 1, 'md')  
return false  end 
end,nil) 
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'💥*¦ تم مسح {'..b.total_count_..'} رساله فقط* \n', 1, 'md')  
end 
getChatHistory(msg.chat_id_, 0, 0, taha + 3,cb) 
end 
end  
if tonumber(msg.reply_to_message_id_) > 0 then
if text==("حذف") and is_mod(msg) then 
tdcli_function ({ID="DeleteMessages", chat_id_=msg.chat_id_,  message_ids_={[0] = tonumber(msg.reply_to_message_id_),msg.id_} },function(arg,data)  if data.code_ == 6 then VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📮¦* انا لست ادمن او ليست لدي صلاحيه حذف الرسائل \n💥", 1, 'md')   return false  end  end,nil) 
end	 
end
if text and text:match('^منع (.*)') and is_mod(msg) then 
local taha = text:match('^منع (.*)') 
if MOHMADdevVEER:sismember(devVEER..'filters:'..msg.chat_id_,taha) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦ الكلمه » ❪ '..taha..' ❫*\n*📪¦* بالتأكيد تم منع هاذه الكلمه \n💥', 1, 'md') 
else
MOHMADdevVEER:sadd(devVEER..'filters:'..msg.chat_id_,taha) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦ الكلمه » ❪ '..taha..' ❫*\n*💠¦* تم منع ارسال هاذه الكلمه \n✓', 1, 'md') 
end
end 
if text and text:match('^الغاء المنع (.*)')  and is_mod(msg) then  
local taha = text:match('^الغاء المنع (.*)') 
if not MOHMADdevVEER:sismember(devVEER..'filters:'..msg.chat_id_,taha) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*⚜¦ الكلمه » ❪ '..taha..' ❫*\n*🗳¦* بالتأكيد تم الغاء منع الكلمه\n💥', 1, 'md') 
else
MOHMADdevVEER:srem(devVEER..'filters:'..msg.chat_id_,taha) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ الكلمه » ❪ '..taha..' ❫*\n*⚜¦* تم الغاء منع هاذه الكلمه\n✓', 1, 'md') 
end
elseif text and text:match('^الغاء منع (.*)') and is_mod(msg) then  
local taha = text:match('^الغاء منع (.*)')
if not MOHMADdevVEER:sismember(devVEER..'filters:'..msg.chat_id_,taha) then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*⚜¦ الكلمه » ❪ '..taha..' ❫*\n*🗳¦* بالتأكيد تم الغاء منع الكلمه\n💥', 1, 'md') 
else
MOHMADdevVEER:srem(devVEER..'filters:'..msg.chat_id_,taha) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ الكلمه » ❪ '..taha..' ❫*\n*⚜¦* تم الغاء منع هاذه الكلمه\n✓', 1, 'md') 
end
end 
if text ==('مسح قائمه المنع') and is_mod(msg) then MOHMADdevVEER:del(devVEER..'filters:'..msg.chat_id_) VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📇*¦* تم مسح قائمه المنع', 1, 'md') end 
if text == ('قائمه المنع') and is_mod(msg) then  
local list = MOHMADdevVEER:smembers(devVEER..'filters:'..msg.chat_id_) 
local t = '*📋¦* قائمه منع الكلمات 🍂 \n--------------------\n' for k,v in pairs(list) do t = t..'*'..k.."» { * `"..v.."` *} *\n"  end if #list == 0 then t = '*🚨¦* قائمه المنع فارغه' end VEER_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md') end 
if text ==('تثبيت') and msg.reply_to_message_id_ ~= 0 and is_mod(msg) then  
if MOHMADdevVEER:sismember(devVEER..'lock:pin',msg.chat_id_) and not is_monsh(msg) then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📮¦* التثبيت مقفل في المجموعه \n🍃", 1, 'md')  
return false  end
if MOHMADdevVEER:sismember(devVEER..'LOCK:PINMSG'..msg.chat_id_,msg.sender_user_id_) then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📮¦* تم منعك من التثبيت هنا لا تستطيع التثبيت \n🍃", 1, 'md')  
return false  end
local id = msg.id_ 
local msgs = {[0] = id}  
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(msg.chat_id_).ID,
message_id_ = msg.reply_to_message_id_,
disable_notification_ = 1  
},function(arg,data) 
if data.message_ == "CHAT_NOT_MODIFIED" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📮¦* بالتاكيد تم تثبيت الرساله \n🍃", 1, 'md')  
elseif data.code_ == 6 then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📮¦* لا استطيع تثبيت الرساله انا لست ادمن \n✘", 1, 'md')  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📮¦* ليس لدي صلاحيه لتثبيت الرسائل \n✘", 1, 'md')  
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🗯¦* الـرسالــه تــم تثـبيتهـا بنجاح \n✓", 1, 'md')   
end 
end,nil) 
end
if text == 'اطردني' and not MOHMADdevVEER:get(devVEER.."lock:kickme"..msg.chat_id_)   then 
tdcli_function ({
ID = "GetChatMember",
chat_id_ = msg.chat_id_,
user_id_ = msg.sender_user_id_},
function(arg,data) 
if data.status_.ID == "ChatMemberStatusCreator" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📮*¦* لا استطيع طردك انته منشئ المجموعه\n🍃', 1, 'md') 
return false  end
if data.status_.ID == "ChatMemberStatusEditor" then
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📮*¦* لا استطيع طردك انت ادمن في المجموعه \n🍃', 1, 'md') 
return false  end
if not msg.can_be_deleted_ == true then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📮¦* لا استطيع الطرد انا لست ادمن هنا \n💥", 1, "md") 
MOHMADdevVEER:del(devVEER..'kick:'..msg.chat_id_..':'..msg.sender_user_id_, true) 
return false  end 
if VEER1(msg.chat_id_,msg.sender_user_id_) then 
if tonumber(msg.sender_user_id_) == tonumber(SUDO) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',msg.sender_user_id_) then
t = 'المطور'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,msg.sender_user_id_) then
t = 'المنشئ'
elseif MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,msg.sender_user_id_) then
t = 'المدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,msg.sender_user_id_) then
t = 'الادمن'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',msg.sender_user_id_) then
t = 'مميز عام'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,msg.sender_user_id_) then
t = 'مميز'
else
t = ' '
end
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦* عذرا انت ❪ '..get_mok(msg.chat_id_,msg.sender_user_id_)..' ❫ لا استطيع طردك \n🍃', 1, 'md') 
MOHMADdevVEER:del(devVEER..'kick:'..msg.chat_id_..':'..msg.sender_user_id_, true) 
return false  end  
local hash = 'kick:'..msg.chat_id_..':'..msg.sender_user_id_ 
MOHMADdevVEER:set(devVEER..hash, "waite") 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📮*¦* رائع الان يمكنك تطبيق الشروط\n⚀*¦* ارسل ❪ نعم ❫ ليتم طردك\n*⚁¦* ارسل ❪ لا ❫ لالغاء طردك\n💥', 1, 'md') 
end,nil)
end 
if text then 
local hash = 'kick:'..msg.chat_id_..':'..msg.sender_user_id_ 
if text:match("^نعم$") and MOHMADdevVEER:get(devVEER..hash) == "waite" then 
MOHMADdevVEER:set(devVEER..hash, "نعم") 
elseif text:match("^لا$") and MOHMADdevVEER:get(devVEER..hash) == "waite" then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📬¦* حسنآ لن يتم طردك من هنا\n💭', 1, 'md') 
MOHMADdevVEER:del(devVEER..hash, true) 
end 
end 
local hash = 'kick:'..msg.chat_id_..':'..msg.sender_user_id_ 
if MOHMADdevVEER:get(devVEER..hash) then 
if MOHMADdevVEER:get(devVEER..hash) == "نعم" then 
if VEER1(msg.chat_id_,msg.sender_user_id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦* عذرا انت ❪ '..get_mok(msg.chat_id_,msg.sender_user_id_)..' ❫ لا استطيع طردك \n🍃', 1, 'md') 
else  
kick(msg,msg.chat_id_,msg.sender_user_id_)  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦* تم طردك من هنا \n🍃', 1, 'md') 
end 
MOHMADdevVEER:del(devVEER..'kick:'..msg.chat_id_..':'..msg.sender_user_id_, true) 
end 
end
if text == 'نزلني' and not MOHMADdevVEER:get(devVEER.."lock:demrtpa"..msg.chat_id_)   then 
local hash = 'demrtpa:'..msg.chat_id_..':'..msg.sender_user_id_ MOHMADdevVEER:set(devVEER..hash, "waite") 
if VEER2(msg.chat_id_,msg.sender_user_id_) then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦* انت من ضمن ❪ '..get_mok2(msg.chat_id_,msg.sender_user_id_)..' ❫ ليس من صلاحياتي تنزيلك \n⭐', 1, 'md') 
MOHMADdevVEER:del(devVEER..'demrtpa:'..msg.chat_id_..':'..msg.sender_user_id_, true)  
else  
if not is_memar(msg)  then  
MOHMADdevVEER:del(devVEER..'demrtpa:'..msg.chat_id_..':'..msg.sender_user_id_, true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦* انت هنا لست سواء عضو ليس لديك رتبه في البوت\n💥', 1, 'md') 
MOHMADdevVEER:del(devVEER..'demrtpa:'..msg.chat_id_..':'..msg.sender_user_id_, true)  
else 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '📛*¦* اهلا بك عزيزي ❪ '..get_mok3(msg.chat_id_,msg.sender_user_id_)..' ❫🍃\n📮*¦* رائع الان يمكنك تطبيق الشروط\n⚀*¦* ارسل ❪ نعم ❫ ليتم تنزيلك\n*⚁¦* ارسل ❪ لا ❫ لالغاء تنزيلك\n🍃', 1, 'md') 
end 
end 
end 
if text then 
local hash = 'demrtpa:'..msg.chat_id_..':'..msg.sender_user_id_ 
if text:match("^نعم$") and MOHMADdevVEER:get(devVEER..hash) == "waite" then 
MOHMADdevVEER:set(devVEER..hash, "نعم") 
elseif text:match("^لا$") and MOHMADdevVEER:get(devVEER..hash) == "waite" then 
MOHMADdevVEER:del(devVEER..'demrtpa:'..msg.chat_id_..':'..msg.sender_user_id_, true) 
if is_monsh(msg) then 
t = 'المدراء'  
elseif is_mod(msg) then 
t = 'الادمنيه'  
elseif is_vipgroup(msg) then 
t = 'المميزين'  
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦* لن يتم تنزيلك ستبقى ضمن ❪ '..t..' ❫\n💥', 1, 'md') 
end 
end 
local hash = 'demrtpa:'..msg.chat_id_..':'..msg.sender_user_id_ 
if MOHMADdevVEER:get(devVEER..hash) then 
if MOHMADdevVEER:get(devVEER..hash) == "نعم" then 
MOHMADdevVEER:srem(devVEER..'modergroup'..msg.chat_id_,msg.sender_user_id_)  
MOHMADdevVEER:srem(devVEER..'mods:'..msg.chat_id_,msg.sender_user_id_) 
MOHMADdevVEER:srem(devVEER..'vip:group'..msg.chat_id_,msg.sender_user_id_) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '*📮¦* تم تنزيلك الان انت عضو في المجموعه\n🍃', 1, 'md') 
MOHMADdevVEER:del(devVEER..'demrtpa:'..msg.chat_id_..':'..msg.sender_user_id_, true) 
end 
end
if text == "تفعيل الاضافه" and is_owner(msg) then 
if not msg.can_be_deleted_ == true then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🚨¦* تنبيــه انا لست ادمن يرجى ترقيتي ادمن هنا 👮\n", 1, "md") 
else  
MOHMADdevVEER:set(devVEER..'add:mepr:'..msg.chat_id_,true) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,"📮❯ تم تفعيل الاضافه اجباري", 1, 'md') 
end 
end
if text == "تعطيل الاضافه" and is_owner(msg) then 
MOHMADdevVEER:del(devVEER..'add:mepr:'..msg.chat_id_) 
MOHMADdevVEER:del(devVEER..'meaddwy:'..msg.chat_id_) 
MOHMADdevVEER:del(devVEER..'meaddtaha:'..msg.chat_id_) 
local taha = MOHMADdevVEER:keys("addedtaha:*") 
for i=1,#taha do MOHMADdevVEER:del(devVEER..taha[i]) 
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,"📮❯ تم تعطيل الاضافه اجباري", 1, 'md') 
end
if text and text:match("^ضع عدد الاضافه (%d+)$") and is_owner(msg) then 
local numadded = string.match(text, "^ضع عدد الاضافه (%d+)$") 
MOHMADdevVEER:set(devVEER..'setadd:'..msg.chat_id_,numadded) 
VEER_sendMsg(msg.chat_id_, msg.id_,  1, "📬❯ تم وضع عدد الاضافه *{ "..numadded..' }*', 1, 'md') 
end 
if text==('المجموعه') and is_mod(msg) then  
if not msg.can_be_deleted_ == true then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*🚨¦* تنبيــه انا لست ادمن يرجى ترقيتي ادمن هنا 👮\n", 1, "md") 
return false  end 
tdcli_function({ID ="GetChat",
chat_id_=msg.chat_id_},
function(arg,ta) 
tdcli_function ({ ID = "GetChannelFull", 
channel_id_ = getChatId(msg.chat_id_).ID },
function(arg,data) 
if data.invite_link_ then
linkgn = '\n📛*¦* اسم الكروب ➘\n ٴ❪ ['..ta.title_..']('..data.invite_link_..') ❫ ➺'
else
linkgn = '\n📛*¦* اسم الكروب ➘\n ٴ❪ `'..ta.title_..'` ❫ ➺'
end
local nummsg = tonumber(MOHMADdevVEER:get(devVEER..'groupmsg:'..msg.chat_id_..':')) 
local nummsgg = MOHMADdevVEER:get(devVEER..'groupmsg:'..msg.chat_id_..':') 
local taha = '*📮¦ اهلا بك في معلومات المجموعه*\nٴ━━━━━━━━━━\n*'..
'👨🏻‍✈️¦* عدد الادمنيه ↫ *❪ '..data.administrator_count_..
' ❫*\n*🚯¦* عدد المطرودين ↫ *❪ '..data.kicked_count_..
' ❫*\n*🙋🏻‍♂¦* عدد الاعضاء ↫ *❪ '..data.member_count_..
' ❫*\n*📨¦* عدد الرسائل ↫ *❪ '..(nummsgg)..
' ❫*\n📈*¦* التفاعل ↫ *❪ '..(formsggroup(nummsg))..
' ❫*\n*🗳¦* الايدي   ➘\n ٴ❪`'..(msg.chat_id_)..
'`❫ ➺'..linkgn..''  
VEER_sendMsg(msg.chat_id_, msg.id_, 1, taha, 1, 'md') 
end,nil)
end,nil)
end 
if text and text:match("^مشاهده منشور$") then MOHMADdevVEER:set(devVEER..'viewchannel'..msg.sender_user_id_,true) VEER_sendMsg(msg.chat_id_, msg.id_, 1, '♼*¦* حسننا ارسل التوجيه من القناة سارسل عدد المشاهدات', 1, 'md') end 
if text and text:match("^ضع رد تواصل$") and is_devmohmad(msg) then   MOHMADdevVEER:setex(devVEER.."sudo:pv" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📬*¦* ارسل لي النص الذي تريده ', 1, 'md') end 
if text and text:match("^ضع كليشه المطور$") and is_devmohmad(msg) then MOHMADdevVEER:setex(devVEER.."sudo:dev" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📬*¦* ارسل لي النص الذي تريده ', 1, 'md') end 
if text and text:match("^ضع كليشه ستارت$") and is_devmohmad(msg) then MOHMADdevVEER:setex(devVEER.."start:msgofstart" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  VEER_sendMsg(msg.chat_id_, msg.id_, 1,'📬*¦* ارسل لي النص الذي تريده ', 1, 'md') end 
if msg.content_.ID == 'MessageChatChangeTitle' then tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,data)  MOHMADdevVEER:set(devVEER..'group:name'..msg.chat_id_,data.title_) end,nil)  end
if text== ('ضع اسم') and is_owner(msg) then 
local function name_reply(extra, result, success) 
tdcli_function ({ ID = "ChangeChatTitle",
chat_id_ = result.chat_id_, 
title_ = result.content_.text_ 
},function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📬¦* اني مو ادمن هنا  \n", 1, 'md')  
return false  end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📬¦* ماعندي صلاحيه اغير اسم المجموعه \n", 1, 'md')  
else
VEER_sendMsg(msg.chat_id_,msg.id_, 1, "*📬¦* تم وضع اسم للمجموعه \n", 1, 'md')  
MOHMADdevVEER:set(devVEER..'group:name'..result.chat_id_,result.content_.text_)
end
end,nil) 
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),name_reply)   
end
if text== ('ضع صوره') and msg.reply_to_message_id_ ~= 0 and is_mod(msg) then 
local function setlink_reply(extra, result, success) 
if result.content_.photo_ then  
if result.content_.photo_.sizes_[3] then  
photo_id = result.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = result.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = result.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
VEER_sendMsg(result.chat_id_, result.id_, 1, '*💥¦* عذرا انا لست ادمن هنا \n', 1, 'md') 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
VEER_sendMsg(result.chat_id_, result.id_, 1, '*📮¦* عذرا ليست لدي صلاحيه تغير معلومات المجموعه \n', 1, 'md') 
else
VEER_sendMsg(result.chat_id_, result.id_, 1, '*🎆¦* تم تغيير صورة المجموعه \n✓', 1, 'md') 
end
end, nil) 
end   
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),setlink_reply) 
end
if text == 'تفعيل الردود بالرد' and is_monsh(msg) then   
if MOHMADdevVEER:get(devVEER..'lock:rep:rd'..msg.chat_id_) then
taha = '*📮¦ تم تفعيل الردود بالرد *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:rep:rd'..msg.chat_id_)  
else
taha = '*📮¦ بالتاكيد تم تفعيل الردود بالرد *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل الردود بالرد' and is_monsh(msg) then  
if not MOHMADdevVEER:get(devVEER..'lock:rep:rd'..msg.chat_id_) then
taha = '*📮¦ تم تعطيل الردود بالرد *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:rep:rd'..msg.chat_id_,true)   
else
taha = '*📮¦ بالتاكيد تم تعطيل الردود بالرد *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل الردود' and is_monsh(msg) then   
if MOHMADdevVEER:get(devVEER..'lock:rep'..msg.chat_id_) then
taha = '*📮¦ تم تفعيل الردود *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:rep'..msg.chat_id_)  
else
taha = '*📮¦ بالتاكيد تم تفعيل الردود  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل الردود' and is_monsh(msg) then  
if not MOHMADdevVEER:get(devVEER..'lock:rep'..msg.chat_id_) then
taha = '*📮¦ تم تعطيل الردود *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:rep'..msg.chat_id_,true)   
else
taha = '*📮¦ بالتاكيد تم تعطيل الردود  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل الايدي' and is_monsh(msg) then   
if MOHMADdevVEER:get(devVEER..'lock:id'..msg.chat_id_)  then
taha = '*📮¦ تم تفعيل الايدي *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:id'..msg.chat_id_) 
else
taha = '*📮¦ بالتاكيد تم تفعيل الايدي  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل الايدي' and is_monsh(msg) then  
if not MOHMADdevVEER:get(devVEER..'lock:id'..msg.chat_id_)  then
taha = '*📮¦ تم تعطيل الايدي *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:id'..msg.chat_id_,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل الايدي  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل الايدي بالصوره' and is_monsh(msg) then   
if MOHMADdevVEER:get(devVEER..'lock:id:photo'..msg.chat_id_)  then
taha = '*📮¦ تم تفعيل الايدي *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:id:photo'..msg.chat_id_) 
MOHMADdevVEER:del(devVEER..'lock:id'..msg.chat_id_) 
else
taha = '*📮¦ بالتاكيد تم تفعيل الايدي  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل الايدي بالصوره' and is_monsh(msg) then  
if not MOHMADdevVEER:get(devVEER..'lock:id:photo'..msg.chat_id_)  then
taha = '*📮¦ تم تعطيل الايدي بالصوره *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:id:photo'..msg.chat_id_,true) 
MOHMADdevVEER:set(devVEER..'lock:id'..msg.chat_id_,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل الايدي بالصوره *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل جلب الصوره' and is_mod(msg) then   
if MOHMADdevVEER:get(devVEER..'lock:get:photo'..msg.chat_id_) then
taha = '*📮¦ تم تفعيل امر جلب الصور *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:get:photo'..msg.chat_id_) 
else
taha = '*📮¦ بالتاكيد تم تفعيل امر جلب الصور  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل جلب الصوره' and is_mod(msg) then   
if not MOHMADdevVEER:get(devVEER..'lock:get:photo'..msg.chat_id_) then
taha = '*📮¦ تم تعطيل امر جلب الصور *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:get:photo'..msg.chat_id_,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل امر جلب الصور  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل اطردني' and is_mod(msg) then   
if MOHMADdevVEER:get(devVEER..'lock:kickme'..msg.chat_id_)  then
taha = '*📮¦ تم تفعيل امر اطردني *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:kickme'..msg.chat_id_) 
else
taha = '*📮¦ بالتاكيد تم تفعيل امر اطردني  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل اطردني' and is_mod(msg) then   
if not MOHMADdevVEER:get(devVEER..'lock:kickme'..msg.chat_id_)  then
taha = '*📮¦ تم تعطيل امر اطردني *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:kickme'..msg.chat_id_,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل امر اطردني  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل نزلني' and is_monsh(msg) then   
if MOHMADdevVEER:get(devVEER..'lock:demrtpa'..msg.chat_id_) then
taha = '*📮¦ تم تفعيل امر نزلني *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:demrtpa'..msg.chat_id_) 
else
taha = '*📮¦ بالتاكيد تم تفعيل امر نزلني  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل نزلني' and is_monsh(msg) then   
if not MOHMADdevVEER:get(devVEER..'lock:demrtpa'..msg.chat_id_) then
taha = '*📮¦ تم تعطيل امر نزلني *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:demrtpa'..msg.chat_id_,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل امر نزلني  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل البوت الخدمي' and is_devmohmad(msg) then 
if MOHMADdevVEER:get(devVEER..'lock:bot:free'..bot_id) then
taha = '*📮¦ تم تفعيل البوت الخدمي *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:bot:free'..bot_id) 
else
taha = '*📮¦ بالتاكيد تم تفعيل البوت الخدمي  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل البوت الخدمي' and is_devmohmad(msg) then 
if not MOHMADdevVEER:get(devVEER..'lock:bot:free'..bot_id) then
taha = '*📮¦ تم تعطيل البوت الخدمي *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:bot:free'..bot_id,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل البوت الخدمي  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل كليشه الترحيب' and is_devmohmad(msg) then 
if MOHMADdevVEER:get(devVEER..'lock:klsh:add'..bot_id) then
taha = '*📮¦ تم تفعيل كليشه الترحيب عند الاضافه*\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:klsh:add'..bot_id) 
else
taha = '*📮¦ بالتاكيد تم تفعيل كليشه الترحيب عند الاضافه*\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل كليشه الترحيب' and is_devmohmad(msg) then 
if not MOHMADdevVEER:get(devVEER..'lock:klsh:add'..bot_id) then
taha = '*📮¦ تم تعطيل كليشه الترحيب عند الاضافه*\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:klsh:add'..bot_id,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل كليشه الترحيب عند الاضافه*\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل التواصل' and is_devmohmad(msg) then 
if MOHMADdevVEER:get(devVEER..'lock:botl'..bot_id) then
taha = '*📮¦ تم تفعيل البوت التواصل *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'lock:botl'..bot_id) 
else
taha = '*📮¦ بالتاكيد تم تفعيل البوت التواصل  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل التواصل' and is_devmohmad(msg) then 
if not MOHMADdevVEER:get(devVEER..'lock:botl'..bot_id) then
taha = '*📮¦ تم تعطيل البوت التواصل *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'lock:botl'..bot_id,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل البوت التواصل  *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تفعيل الحظر' and is_monsh(msg) then   
if MOHMADdevVEER:get(devVEER..'LOCK:BAN:KICK'..msg.chat_id_)  then
taha = '*📮¦ تم تفعيل { الحظر - الطرد } *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:del(devVEER..'LOCK:BAN:KICK'..msg.chat_id_) 
else
taha = '*📮¦ بالتاكيد تم تفعيل { الحظر - الطرد } *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text == 'تعطيل الحظر' and is_monsh(msg) then  
if not MOHMADdevVEER:get(devVEER..'LOCK:BAN:KICK'..msg.chat_id_)  then
taha = '*📮¦ تم تعطيل { الحظر - الطرد } *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
MOHMADdevVEER:set(devVEER..'LOCK:BAN:KICK'..msg.chat_id_,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل { الحظر - الطرد } *\n✓' 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end
if text and text:match("^صورتي (%d+)") and not MOHMADdevVEER:get(devVEER.."lock:get:photo"..msg.chat_id_)  then 
local pro = tonumber(text and text:match("^صورتي (%d+)")) 
local function myprofile(extra, result, success) 
if result.total_count_ == 0 then 
VEER_sendMsg(msg.chat_id_, msg.id_,  1, '*💥¦* عذرا انت لا تضع صوره في حسابك', 1, 'md') 
else 
if result.total_count_ >= pro then 
if result.photos_[0] then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_, '\n🌁¦ صورتك رقم  '..pro..' \n📑¦ عدد صورك  '..result.total_count_..' \n📊¦ حجم صورتك  '..result.photos_[0].sizes_[1].photo_.size_..' ') 
end 
else 
VEER_sendMsg(msg.chat_id_, msg.id_,  1, '\n*📮¦* انت لا تمتلك صوره رقم  *{'..pro..'}*\n*🌁¦* عدد صورك هي *{'..result.total_count_..'}*', 1, 'md')   
end 
end 
end 
getUserProfilePhotos(msg.sender_user_id_, pro-1, 1000, myprofile) 
end
if text ==('ايدي') and msg.reply_to_message_id_ ~= 0 and not msg.forward_info_  then   
function id_reply(extra, result, success)   
if not result.forward_info_ then  
VEER_sendMsg(msg.chat_id_, msg.id_,  1, '*📮¦ اضغط على الايدي ليتم نسخه ➘*\n*📬¦ الايدي » *`'..result.sender_user_id_..'` * «*\n💥', 1, 'md')   
return false  end 
end 
getMessage(msg.chat_id_,msg.reply_to_message_id_,id_reply)   
end 
if text == "مطورين البوت" or text == "اريد بوت" or text == "المطور" or text == "مطور" then  
local dev = MOHMADdevVEER:get(devVEER.."dev") 
if dev then 
VEER_sendMsg(msg.chat_id_, msg.id_,1,''..check_markdown(dev)..'',1,'md') 
else 
VEER_sendMsg(msg.chat_id_, msg.id_,1,'💢*¦* عذرا لم يتم وضع كليشه المطور ',1,'md')  
end  
end
if text == "حذف كليشه المطور" and is_devmohmad(msg) then  
MOHMADdevVEER:del(devVEER.."dev") 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, '*📛¦*تم حذف كليشه المطور', 1, "md") 
end 
if text == "جلب رد التواصل" and is_devmohmad(msg) then 
if MOHMADdevVEER:get(devVEER.."pvstart") then
pvstart = MOHMADdevVEER:get(devVEER.."pvstart")
VEER_sendMsg(msg.chat_id_, msg.id_, 1,''..check_markdown(pvstart)..'', 1, 'md') 
else 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*✉¦ لا يوجد رد في التواصل \n📮¦* ارسل `ضع رد التواصل`\n🍃', 1, 'md') 
end 
end
if text == "جلب كليشه ستارت" and is_devmohmad(msg) then  
local start = MOHMADdevVEER:get(devVEER.."start:msgofstart1")  
if start then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,''..check_markdown(start)..'', 1, 'md') 
else 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*✉¦ لا توجد كليشه في ستارت \n📮¦* ارسل `ضع كليشه ستارت`\n🍃', 1, 'md') 
end 
end
if text == "حذف رد التواصل" and is_devmohmad(msg) then  
MOHMADdevVEER:del(devVEER.."pvstart") 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, '*📛¦*تم حذف رد التوصل', 1, "md") 
end 
if text == "حذف كليشه ستارت" and is_devmohmad(msg) then  
MOHMADdevVEER:del(devVEER.."start:msgofstart1") 
VEER_sendMsg( msg.chat_id_, msg.id_, 1, '*📛¦*تم حذف كليشه ستارت', 1, "md") 
end 
if text == 'معلوماتي' or text=='موقعي' or text == 'اكشفني' then 
local msgtaha = 500 
local msggstaha = MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 0  
local nupmsgg =  tonumber((msggstaha / msgtaha) * 100)   
local msguser = tonumber(MOHMADdevVEER:get(devVEER..'msg:user:'..msg.chat_id_..':'..msg.sender_user_id_) or 1) 
local tahamsg = (MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if is_devmohmad(msg) then 
t = 'مطور اساسي 🌟'  
elseif is_sudo(msg) then 
t = 'مطور البوت ✨'  
elseif is_owner(msg) then 
t = 'المنشئ 🔥'  
elseif is_monsh(msg) then 
t = 'المدير ☄'     
elseif is_mod(msg) then 
t = 'الادمن 💐' 
elseif is_vipgroups(msg) then 
t = 'مميز عام 🍃'  
elseif is_vipgroup(msg) then 
t = 'مميز 🏅'   
else 
t = 'عضو 👧'   
end       
tdcli_function ({ID = "GetChatMember",
chat_id_ = msg.chat_id_,
user_id_ = msg.sender_user_id_
},function(arg,da) 
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 100
},function(arg,pho) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ then
usertaha = '\n*💠¦ معـرفك » ❪ *[@'..data.username_..']* ❫*'
else
usertaha = ''
end
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ 🍃'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن 🎉'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو 👧'
end
if pho.total_count_ == 0 then
photouser1 = ''
else
photouser1 = '\n*🎆¦ عدد صوره » ❪ '..pho.total_count_..' ❫*'
end
local taha = '\n*📛¦ اهلا عزيزي المستخدم 🍂\nٴ━━━━━━━━━━━*'..'\n*🗯¦ ايديـك » ❪ '..msg.sender_user_id_..' ❫*'..usertaha..'\n*⚜¦ اسمك » ❪* `'..CatchNamee(data.first_name_,45)..'` *❫*'..'\n*📨¦ رسـائلك » ❪ '..tahamsg..' ❫*'..photouser1..'\n*🎖¦ رتبتـك » ❪ '..t..' ❫*\n*⭐¦ رتبة الكروب » ❪ '..rtpa..' ❫*\n*🗳¦ تفــاعلك » ❪ '..formsgg(msguser)..' ❫*\n*📮¦ نسبـة تفاعلك » ❪ '..string.sub(nupmsgg, 1,5)..'% ❫*'
VEER_sendMsg(msg.chat_id_, msg.id_, 1, ''..taha..'', 1, "md") 
end,nil)
end,nil)
end,nil)
end
if text == 'عدد الاضافه' or text == 'شكد اضيف' or text == 'شكد العدد' then 
local whatnumadded = (MOHMADdevVEER:get(devVEER..'setadd:'..msg.chat_id_) or 0) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,"📇*¦* عدد الاضافات المطلوبه\n📮*¦* *"..whatnumadded.."* اشخاص \n", 1, 'md') 
end
if text == "مسح رسايلي" or text == "مسح رسائلي" or text == "حذف رسايلي" or text == "حذف رسائلي" then  
local getmsgs = MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local taha = '\n*📨¦ عدد رسائلك » ❪ '..getmsgs..' ❫ رساله\n📮¦ تم مسح جميع رسائلك *\n🍃'  
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md')  
MOHMADdevVEER:del(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) 
end
if text == "رسايلي" or text == "رسائلي" or text == "msg" then 
local getmsgs = MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local taha = '*📨¦ عدد رسائلك هنا » ❪ '..getmsgs..' ❫ رسالة *' 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
end 
end
if text == "معرفي"  then  
function getmepar(extra,result,success)  
if result.username_ then 
zo = '*📮¦ معرفك  ⟀ *\n\n*📬¦ ➺⦅* [@'..result.username_..']* ⦆*\n' 
else 
zo = '*📬¦ انت لا تمتلك معرف في حسابك *\n🍃' 
end 
local taha = zo
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
end 
getUser(msg.sender_user_id_, getmepar) 
end
if text == "اسمي"  then 
function setname(extra,result,success) 
if result.first_name_  then
taha1 = '*⚀¦ اسمك الاول ⇍ ❪ *`'..(result.first_name_)..'`* ❫*'
else
taha1 = ''
end   
if result.last_name_ then 
taha2 = '*⚁¦ اسمك الثاني ⇍ ❪ *`'..result.last_name_..'` *❫*\n💥' 
else
taha2 = ''
end      
local taha = taha1..'\n\n'..taha2
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
end 
getUser(msg.sender_user_id_,setname) 
end 
if text ==('الرتبه') and msg.reply_to_message_id_ ~= 0 then
function rtpa(extra, result, success) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = result.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
local zo = '📮¦ هاذا اني \n📬¦ رتبتي في الكروب » ❪ {'..rtpa..'} ❫\n💥'
monsend(msg,msg.chat_id_,zo,result.sender_user_id_)   
return false  end 
local zo = '*💭¦ رتبة، الپوت » { '..get_rtpa(msg.chat_id_,result.sender_user_id_)..' }\n⚜¦ رتبتةهہ، الكروپ » { '..rtpa..' }*\n'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,zo, 1, 'md') 
end,nil)
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),rtpa) 
end
if text and text:match('^الرتبه @(.*)') then 
local username = text:match('^الرتبه @(.*)') 
function rtpa(extra, result, success) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = result.id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
if tonumber(result.id_) == tonumber(bot_id) then
local zo = '📮¦ هاذا اني \n📬¦ رتبتي في الكروب » ❪ {'..rtpa..'} ❫\n💥'
monsend(msg,msg.chat_id_,zo,result.id_)   
return false  end 
local zo = '*💭¦ رتبة، الپوت » { '..get_rtpa(msg.chat_id_,result.id_)..' }\n⚜¦ رتبتةهہ، الكروپ » { '..rtpa..' }*\n'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,zo, 1, 'md') 
end,nil)
end
saddbyusername(username,rtpa) 
end
if text and text:match('^الرتبه (%d+)') then 
local userid = text:match('^الرتبه (%d+)') 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = userid},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
if tonumber(userid) == tonumber(bot_id) then
local zo = '📮¦ هاذا اني \n📬¦ رتبتي في الكروب » ❪ {'..rtpa..'} ❫\n💥'
monsend(msg,msg.chat_id_,zo,userid)   
return false  end 
local zo = '*💭¦ رتبة، الپوت » { '..get_rtpa(msg.chat_id_,userid)..' }\n⚜¦ رتبتةهہ، الكروپ » { '..rtpa..' }*\n'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,zo, 1, 'md') 
end,nil)
end
if text == "تفاعلي" then
local msguser = tonumber(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 1) 
taha = '*📮¦ تفاعلك هنا » ❪ '..formsgg(msguser)..' ❫\n🍃*'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
end
if text == "جهاتي" then
local addmempar = tonumber(MOHMADdevVEER:get(devVEER..'add:mempar'..msg.chat_id_..':'..msg.sender_user_id_) or 0) 
if addmempar == 0 then
taha = '*📮¦ عذرا انت لم تقم باضافه احد هنا *'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
else
tahaa = '*📮¦ عدد جهاتك المضافه هنا » ❪ '..addmempar..' ❫ جهة \n💥*'
VEER_sendMsg(msg.chat_id_, msg.id_, 1,tahaa, 1, 'md') 
end
end
if text ==('رتبتي')  then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
if tonumber(msg.sender_user_id_) == tonumber(373906612) then
t = 'مطور السورس 🔱'
elseif tonumber(msg.sender_user_id_) == tonumber(SUDO) then
t = 'مطور اساسي 🍃'
elseif MOHMADdevVEER:sismember(devVEER..'sudo:bot',msg.sender_user_id_) then
t = 'المطور 🔰'
elseif MOHMADdevVEER:sismember(devVEER..'moder'..msg.chat_id_,msg.sender_user_id_) then
t = 'المنشئ 👮'
elseif MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,msg.sender_user_id_) then
t = 'المدير 👦'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,msg.sender_user_id_) then
t = 'الادمن 👨'
elseif MOHMADdevVEER:sismember(devVEER..'vip:groups',msg.sender_user_id_) then
t = 'مميز عام 🌟'
elseif MOHMADdevVEER:sismember(devVEER..'vip:group'..msg.chat_id_,msg.sender_user_id_) then
t = 'عضو مميز ⭐'
else
t = 'عضو 👶'
end
local zo = '\n📮¦ رتبة البوت » ❲ {'..t..'} ❳\n📬¦ رتبتة الكروب » ❲ ❛'..rtpa..'❜ ❳\n💥'
monsend(msg,msg.chat_id_,zo,msg.sender_user_id_)   
end,nil)
end
if text == 'تغير الايدي' and is_devmohmad(msg) or text == 'تغيير الايدي' and is_devmohmad(msg) then
MOHMADdevVEER:setex(devVEER.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
local tahaid= [[
*📮¦ اهلا عزيزي المطور 
📬¦ يمكنك استخدام الدوال الاتيه ↓
 ٴ━━━━━━━━━━
1• دالة طبع الايدي »* `IDGET`
*2• دالة طبع المعرف »* `USERGET`
*3• دالة طبع رتبة البوت »* `RTBGET`
*4• دالة طبع رتبة الكروب »* `RTGGET`
*5• دالة طبع تفاعلك »* `TFGET`
*6• دالة طبع رسائلك »* `MSGGET`
*7• دالة طبع صورك »* `PHOTOGET`
*8• دالة طبع نقودك »* `NKOGET`
]]
VEER_sendMsg(msg.chat_id_, msg.id_, 1,tahaid, 1, 'md')
return false  
end 
if text == 'مسح تغير الايدي' and is_devmohmad(msg) or text == 'حذف تغير الايدي' and is_devmohmad(msg) then
MOHMADdevVEER:del(devVEER.."KLISH:ID")
VEER_sendMsg(msg.chat_id_, msg.id_, 1,  '*📮¦ تم مسح كليشه الايدي *\n', 1, 'md')
return false  
end 
if MOHMADdevVEER:get(devVEER.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
MOHMADdevVEER:del(devVEER.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false  end 
MOHMADdevVEER:del(devVEER.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
local CHENGER_ID = text:match("(.*)")  
if CHENGER_ID:find('NKOGET') then
local filegames = io.open("plugins_/games.lua","r")
if not filegames then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'\n📬¦ لا يمكنك وضع دالة طبع عدد النقود في كليشة الايدي يرجى تفعيل الملف ارسل ` تفعيل ملف games.lua`\n', 1, 'md')    
return false  end 
end
MOHMADdevVEER:set(devVEER.."KLISH:ID",CHENGER_ID)
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'\n📬*¦* تم تغير كليشه الايدي \n', 1, 'md')    
end
if text == ("ايدي") and msg.reply_to_message_id_ == 0 then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da)  tdcli_function ({ ID = "SendChatAction",  chat_id_ = msg.sender_user_id_, action_ = {  ID = "SendMessageTypingAction", progress_ = 100}  },function(arg,ta)  tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)  tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,taha,success) 
if da.status_.ID == "ChatMemberStatusCreator" then 
rtpa = 'منشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then 
rtpa = 'ادمن' 
elseif da.status_.ID == "ChatMemberStatusMember" then 
rtpa = 'عضو'
 end
if result.username_ then 
username = '\n💠¦ معرفك ⇜ ❪ @'..result.username_..' ❫' 
else 
username = '' 
end
if result.username_ then 
usernamee = '\n*💠¦ معرفك » ❪* [@'..result.username_..']* ❫*' 
else usernamee = '' 
end
if result.username_ then 
USERNAME_GET = '@'..result.username_..'' 
else 
USERNAME_GET = ' لا يوجد ' 
end
local msguser = tonumber(MOHMADdevVEER:get(devVEER..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 1) 
local addmempar = tonumber(MOHMADdevVEER:get(devVEER..'add:mempar'..msg.chat_id_..':'..msg.sender_user_id_) or 0) 
t = get_rtpa(msg.chat_id_,msg.sender_user_id_)
NUMPGAME = (MOHMADdevVEER:get(devVEER..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0)
if tonumber(NUMPGAME) == 0 then
nko = '0'
else
nko = NUMPGAME
end
if not MOHMADdevVEER:get(devVEER..'lock:id'..msg.chat_id_) then      
local get_id_text = MOHMADdevVEER:get(devVEER.."KLISH:ID")
if get_id_text then
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then   
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, taha.photos_[0].sizes_[1].photo_.persistent_id_,get_id(msg,taha,get_id_text))       
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,get_id(msg,taha,get_id_text)..'\n• لا يمكنني عرض صورتك لانك قمت بحظر البوت\n', 1, 'html')   
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '\n• ليس لديك صور في حسابك 🍃\n'..get_id(msg,taha,get_id_text),1, 'html')      
end 
end
else
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, taha.photos_[0].sizes_[1].photo_.persistent_id_,'\n⚜¦ ايديك ⇜ ❪ '..msg.sender_user_id_..' ❫'..username..'\n⚔¦ رتبة البوت ⇜ ❪ '..get_rtpa(msg.chat_id_,msg.sender_user_id_)..' ❫\n🏆¦ رتبة الكروب ⇜ ❪ '..rtpa..' ❫\n📈¦ تفاعلك ⇜ ❪ '..formsgg(msguser)..' ❫\n📨¦ رسائلك ⇜ ❪ '..(msguser)..' ❫\n🌁¦ صورك ⇜ ❪ '..taha.total_count_..' ❫\n')       
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*\n⚜¦ ايديك » ❪ '..msg.sender_user_id_..' ❫*'..usernamee..'\n*⚔¦ رتبة البوت » ❪ '..get_rtpa(msg.chat_id_,msg.sender_user_id_)..' ❫\n🏆¦ رتبة الكروب » ❪ '..rtpa..' ❫\n📈¦ تفاعلك » ❪ '..formsgg(msguser)..' ❫\n📨¦ رسائلك » ❪ '..(msguser)..' ❫\n'..'\n🌇¦ لا يمكنني عرض صورتك لانك قمت بحظر البوت*', 1, 'md')   
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '\n*📷¦ ليس لديك صور في حسابك 🍃'..'\n⚜¦ ايديك » ❪ '..msg.sender_user_id_..' ❫*'..usernamee..'\n*⚔¦ رتبة البوت » ❪ '..get_rtpa(msg.chat_id_,msg.sender_user_id_)..' ❫\n🏆¦ رتبة الكروب » ❪ '..rtpa..' ❫\n📈¦ تفاعلك » ❪ '..formsgg(msguser)..' ❫\n📨¦ رسائلك » ❪ '..(msguser)..' ❫*\n',1, 'md')      
end 
end
end
else
if MOHMADdevVEER:get(devVEER..'lock:id:photo'..msg.chat_id_) then      
local get_id_text = MOHMADdevVEER:get(devVEER.."KLISH:ID")
if get_id_text then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,get_id(msg,taha,get_id_text), 1, 'html')   
else
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*\n⚜¦ ايديك » ❪ '..msg.sender_user_id_..' ❫*'..usernamee..'\n*⚔¦ رتبة البوت » ❪ '..get_rtpa(msg.chat_id_,msg.sender_user_id_)..' ❫\n🏆¦ رتبة الكروب » ❪ '..rtpa..' ❫\n📈¦ تفاعلك » ❪ '..formsgg(msguser)..' ❫\n📨¦ رسائلك » ❪ '..(msguser)..' ❫\n📱¦ جهاتك » ❪ '..(addmempar)..' ❫*', 1, 'md')   
end
end
end
end,nil)
end,nil)
end,nil)
end,nil)
end

if text == 'قفل التثبيت' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  MOHMADdevVEER:set(devVEER..'pinned'..msg.chat_id_,data.pinned_message_id_)  end,nil)
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال التثبيت \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = result.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
MOHMADdevVEER:sadd(devVEER..'LOCK:PINMSG'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertp(data.first_name_)..'}'..'\n📬¦ تم منعه من التثبيت هنا\n',result.sender_user_id_)   
else
if MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,result.sender_user_id_) then
tt = 'مدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,result.sender_user_id_) then
tt = 'ادمن'
else
tt = 'عضو'
end
if tt ~= 'عضو' then 
MOHMADdevVEER:sadd(devVEER..'LOCK:PINMSG'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertp(data.first_name_)..'}'..'\n📬¦ تم منعه من التثبيت هنا\n',result.sender_user_id_)   
else
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هذا مجرد عضو هنا\n👨🏻‍✈️*")   
end
end
end,nil)   
end,nil)
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل التثبيت @(.*)') and is_owner(msg) then   
local user = text:match('قفل التثبيت @(.*)')    
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  MOHMADdevVEER:set(devVEER..'pinned'..msg.chat_id_,data.pinned_message_id_)  end,nil)
function py_username(extra, result, success)   
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = result.id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال التثبيت \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:PINMSG'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من التثبيت هنا\n',result.id_)   
else
if MOHMADdevVEER:sismember(devVEER..'modergroup'..msg.chat_id_,result.id_) then
tt = 'مدير'
elseif MOHMADdevVEER:sismember(devVEER..'mods:'..msg.chat_id_,result.id_) then
tt = 'ادمن'
else
tt = 'عضو'
end
if tt ~= 'عضو' then
MOHMADdevVEER:sadd(devVEER..'LOCK:PINMSG'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من التثبيت هنا\n',result.id_)   
else
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هذا مجرد عضو \n👨🏻‍✈️*")   
end
end
end,nil)
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح التثبيت' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:PINMSG'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع التثبيت عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح التثبيت @(.*)') and is_owner(msg) then   
local username = text:match('فتح التثبيت @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:PINMSG'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع التثبيت عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end

if text == 'قفل الملصقات' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الملصقات \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:STEKR'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الملصقات هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل الملصقات @(.*)') and is_owner(msg) then   
local user = text:match('قفل الملصقات @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الملصقات \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:STEKR'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الملصقات هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح الملصقات' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:STEKR'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع الملصقات عنه\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح الملصقات @(.*)') and is_owner(msg) then   
local username = text:match('فتح الملصقات @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:STEKR'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع الملصقات عنه\n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
-------------------------
if text == 'قفل الصور' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الصور \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:PHOTO'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الصور هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل الصور @(.*)') and is_owner(msg) then   
local user = text:match('قفل الصور @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الصور \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:PHOTO'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الصور هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح الصور' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:PHOTO'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع الصور عنه\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح الصور @(.*)') and is_owner(msg) then   
local username = text:match('فتح الصور @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:PHOTO'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع الصور عنه\n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل الاونلاين' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الاونلاين \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:INLIN'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الاونلاين هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل الاونلاين @(.*)') and is_owner(msg) then   
local user = text:match('قفل الاونلاين @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الاونلاين \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:INLIN'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الاونلاين هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح الاونلاين' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:INLIN'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع الاونلاين عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح الاونلاين @(.*)') and is_owner(msg) then   
local username = text:match('فتح الاونلاين @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:INLIN'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع الاونلاين عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل التوجيه' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال التوجيه \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:FWD'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال التوجيه هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل التوجيه @(.*)') and is_owner(msg) then   
local user = text:match('قفل التوجيه @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال التوجيه \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:FWD'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال التوجيه هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح التوجيه' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:FWD'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع التوجيه عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح التوجيه @(.*)') and is_owner(msg) then   
local username = text:match('فتح التوجيه @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:FWD'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع التوجيه عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل الروابط' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الروابط \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:LINKS'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الروابط هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل الروابط @(.*)') and is_owner(msg) then   
local user = text:match('قفل الروابط @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الروابط \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:LINKS'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الروابط هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح الروابط' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:LINKS'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع الروابط عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح الروابط @(.*)') and is_owner(msg) then   
local username = text:match('فتح الروابط @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:LINKS'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع الروابط عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل السيلفي' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال السيلفي \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:SELPHY'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال السيلفي هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل السيلفي @(.*)') and is_owner(msg) then   
local user = text:match('قفل السيلفي @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال السيلفي \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:SELPHY'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال السيلفي هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح السيلفي' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:SELPHY'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع السيلفي عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح السيلفي @(.*)') and is_owner(msg) then   
local username = text:match('فتح السيلفي @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:SELPHY'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع السيلفي عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل الصوت' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الصوت \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:VICO'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الصوت هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل الصوت @(.*)') and is_owner(msg) then   
local user = text:match('قفل الصوت @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الصوت \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:VICO'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الصوت هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح الصوت' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:VICO'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع الصوت عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح الصوت @(.*)') and is_owner(msg) then   
local username = text:match('فتح الصوت @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:VICO'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع الصوت عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل الفيديو' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الفيديو \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:VIDEO'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الفيديو هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل الفيديو @(.*)') and is_owner(msg) then   
local user = text:match('قفل الفيديو @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الفيديو \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:VIDEO'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الفيديو هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح الفيديو' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:VIDEO'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع الفيديو عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح الفيديو @(.*)') and is_owner(msg) then   
local username = text:match('فتح الفيديو @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:VIDEO'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع الفيديو عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل الماركداون' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الماركداون \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:MARKDWN'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الماركداون هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل الماركداون @(.*)') and is_owner(msg) then   
local user = text:match('قفل الماركداون @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال الماركداون \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:MARKDWN'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال الماركداون هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح الماركداون' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:MARKDWN'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع الماركداون عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح الماركداون @(.*)') and is_owner(msg) then   
local username = text:match('فتح الماركداون @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:MARKDWN'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع الماركداون عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل المتحركه' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال المتحركه \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:GIF'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال المتحركه هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل المتحركه @(.*)') and is_owner(msg) then   
local user = text:match('قفل المتحركه @(.*)')    
function py_username(extra, result, success)   

if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال المتحركه \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:GIF'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال المتحركه هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح المتحركه' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:GIF'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع المتحركه عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح المتحركه @(.*)') and is_owner(msg) then   
local username = text:match('فتح المتحركه @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:GIF'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع المتحركه عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل المعرفات' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال المعرفات \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:USERNAME'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من ارسال المعرفات هنا\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل المعرفات @(.*)') and is_owner(msg) then   
local user = text:match('قفل المعرفات @(.*)')    
function py_username(extra, result, success)   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من ارسال المعرفات \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:USERNAME'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من ارسال المعرفات هنا\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح المعرفات' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:USERNAME'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منع المعرفات عنه \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح المعرفات @(.*)') and is_owner(msg) then   
local username = text:match('فتح المعرفات @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:USERNAME'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منع المعرفات عنه \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'قفل الحظر' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من { طرد - حظر } المستخدمين \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.sender_user_id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'LOCK:BAN'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منعه من » ( طرد - حظر ) المستخدمين\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^قفل الحظر @(.*)') and is_owner(msg) then   
local user = text:match('قفل الحظر @(.*)')    
function py_username(extra, result, success)   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا استطيع منع القنواة\n👨🏻‍✈️*")   
return false 
end      
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ لا تستطيع منعي من { طرد - حظر } المستخدمين \n👨🏻‍✈️*")   
return false  
end   
if getrtp(msg.chat_id_,result.id_) then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ عذرا لا تستطيع منع » { المنشئين والمطورين } \n👨🏻‍✈️*")   
return false  
end    
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
MOHMADdevVEER:sadd(devVEER..'LOCK:BAN'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منعه من » ( طرد - حظر ) المستخدمين\n',result.id_)   
end
tdcli_function ({ID = "SearchPublicChat",username_ = user},py_username,nil) 
end 
----------------------------------------------
if text == 'فتح الحظر' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'LOCK:BAN'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ 📬¦ تم الغاء منعه من ( طرد - حظر ) المستخدمين \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^فتح الحظر @(.*)') and is_owner(msg) then   
local username = text:match('فتح الحظر @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'LOCK:BAN'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منعه من ( طرد - حظر ) المستخدمين \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text == 'منح الحظر' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا بوت استطيع طرد - حظر المستخدمين \n👨🏻‍✈️*")   
return false  
end   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:sadd(devVEER..'SET:BAN'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم منحه صلاحية ( طرد - حظر ) المستخدمين \n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text == 'الغاء منح الحظر' and tonumber(msg.reply_to_message_id_) > 0 and is_owner(msg) then   
function by_reply(extra, result, success)   
if not msg.can_be_deleted_ == true then   
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي \n👨🏻‍✈️*")   
return false 
end      
if tonumber(result.sender_user_id_) == tonumber(bot_id) then    
VEER_send(msg.chat_id_,msg.id_,"*📮¦ انا بوت لا تستطيع منعي من الحظر - الطرد \n👨🏻‍✈️*")   
return false  
end   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
MOHMADdevVEER:srem(devVEER..'SET:BAN'..msg.chat_id_,result.sender_user_id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(data.first_name_)..'}'..'\n📬¦ تم الغاء منحه صلاحية ( طرد - حظر ) المستخدمين\n',result.sender_user_id_)   
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
if text and text:match('^منح الحظر @(.*)') and is_owner(msg) then   
local username = text:match('منح الحظر @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:sadd(devVEER..'SET:BAN'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم منحه صلاحية ( طرد - حظر ) المستخدمين \n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text and text:match('^الغاء منح الحظر @(.*)') and is_owner(msg) then   
local username = text:match('الغاء منح الحظر @(.*)')   
function py_username(extra,result,success)   
if result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED" then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
VEER_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false 
end      
MOHMADdevVEER:srem(devVEER..'SET:BAN'..msg.chat_id_,result.id_)     
sendMention(msg,msg.chat_id_,'📮¦ العضو » {'..CatchNamertprtp(result.type_.user_.first_name_)..'}'..'\n📬¦ تم الغاء منحه صلاحية ( طرد - حظر ) المستخدمين\n',result.id_)   
end    
tdcli_function ({ID = "SearchPublicChat",username_ = username},py_username,nil) 
end
if text ==('مسح صلاحيات الحظر') and is_owner(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'SET:BAN'..msg.chat_id_) 
if #list == 0 then
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦* لا يوجد اعضاء لديهم صلاحياة الحظر ليتم مسحهم\n', 1, 'md') 
return false  end
local num = 0
for k,v in pairs(list) do  
MOHMADdevVEER:srem(devVEER..'SET:BAN'..msg.chat_id_,v) 
num = num + 1
end 
VEER_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ تم مسح {'..num..'} من الذين لديهم صلاحيات الحظر *\n', 1, 'md') 
end
if text == 'صلاحيات الحظر' and is_owner(msg) then 
local list = MOHMADdevVEER:smembers(devVEER..'SET:BAN'..msg.chat_id_)
local t = '*📮¦ قائمه اصحاب صلاحية الحظر *\n*ٴ━━━━━━━━━*\n' 
for k, v in pairs(list) do 
local taha = MOHMADdevVEER:get(devVEER.."user:Name" .. v)
if taha then
local username = taha
t = t..'*'..k.." ➺* ❲["..username.."](tg://user?id="..v..")❳\n"   
else
t = t..'*'..k.." ➺* ❲["..v.."](tg://user?id="..v..")❳\n"   
end
end 
if #list == 0 then 
t = '*📬¦* لا يوجد اعضاء لديهم صلاحيات الحظر في هاذه المجموعه' 
end 
VEER_sendMssg(msg.chat_id_,t,msg.id_,'md')
end  
SEND_FILES(msg)
end
end
function tdcli_update_callback(data)  
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
print('\27[30;32m»» THE BOT IS KICKED GROUP ↓\n-100'..data.channel_.id_..' \n\27[1;37m')
rem_group('-100'..data.channel_.id_)   
local idch = '-100'..data.channel_.id_
MOHMADdevVEER:srem(devVEER..'bot:gpsby:id',idch) 
MOHMADdevVEER:srem(devVEER.."bot:gpsby:id:add",idch) 
MOHMADdevVEER:srem(devVEER.."bot:gps:id", idch) 
tdcli_function({ID="GetChat",chat_id_ = '-100'..data.channel_.id_},function(arg,data)  linkgp = MOHMADdevVEER:get(devVEER.."link:group"..idch)  
if linkgp then  link = '['..data.title_..']('..linkgp..')'  else  link = '`'..(data.title_ or '...')..'`' end
taha = '\n*🍃¦ اهلا عزيزي المطور *\nٴ━━━━━━━━━━━━'..
'\n*📮¦ لقد تم طردي من مجموعه جديده *'..
'\n*🔖¦* معلومات المجموعه '..
'\n*📬¦* الايدي » ❪`'..data.id_..'`❫'..
'\n*⚜¦* الاسم » ❪'..link..'❫'..
'\n*💠¦* تم مسح بيانات المجموعه وتم ازالتها من المجموعات\n💥' 
VEER_sendMsg(SUDO,0, 1,taha, 1, "md")  end,nil)
elseif data.channel_.status_.ID == "ChatMemberStatusMember" then   
print('\27[30;32m»» THE BOT IS NOT ADMIEN ↓\n»» '..'-100'..data.channel_.id_..'\n\27[1;37m')
rem_group('-100'..data.channel_.id_)   
MOHMADdevVEER:sadd(devVEER..'botgps','-100'..data.channel_.id_) 
elseif data.channel_.status_.ID == "ChatMemberStatusEditor" then   
local tahach = '-100'..data.channel_.id_
if MOHMADdevVEER:sismember(devVEER..'bot:gpsby:id:add','-100'..data.channel_.id_)  then  
print('\27[30;33m»» THE GROUP IS HAS BEEN ADD ↓\n»» '..'-100'..data.channel_.id_..'\n\27[1;37m')
else 
print('\27[30;35m»» THE BOT IS ADMIEN AND ADD GROUP ↓\n»» '..'-100'..data.channel_.id_..'\n\27[1;37m')
add_group('-100'..data.channel_.id_)   
MOHMADdevVEER:sadd(devVEER..'bot:gpsby:id','-100'..data.channel_.id_)   
MOHMADdevVEER:sadd(devVEER.."botgps",'-100'..data.channel_.id_)  
MOHMADdevVEER:sadd(devVEER.."bot:gpsby:id:add",'-100'..data.channel_.id_)  
MOHMADdevVEER:set(devVEER.."test:group"..'-100'..data.channel_.id_,'VEER')    
MOHMADdevVEER:set(devVEER.."add:bot:group"..'-100'..data.channel_.id_, true)   
end
return false 
end  
end
if data.ID == "UpdateNewMessage" then  
local msg = data.message_
text = msg.content_.text_
if msg.is_post_ ~= false then
MOHMADdevVEER:srem(devVEER.."bot:gpsby:id:add",msg.chat_id_)  
MOHMADdevVEER:srem(devVEER.."botgps",msg.chat_id_)  
MOHMADdevVEER:srem(devVEER..'bot:gpsby:id',msg.chat_id_)   
return false
end
if not msg.forward_info_ and msg.is_channel_post_ then
return false
end
if msg.date_ and msg.date_ < tonumber(os.time() - 15) then
print('OLD MESSAGE')
return false
end
if msg.sender_user_id_ and is_muted(msg.chat_id_,msg.sender_user_id_) then 
delete_msg(msg.chat_id_, {[0] = msg.id_})  
return false  
end
if msg.sender_user_id_ and is_banned(msg.chat_id_,msg.sender_user_id_) then 
kick(msg,msg.chat_id_,msg.sender_user_id_) 
delete_msg(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and is_banned(msg.chat_id_,msg.content_.members_[0].id_) then 
kick(msg,msg.chat_id_,msg.content_.members_[0].id_) 
delete_msg(msg.chat_id_, {[0] = msg.id_}) 
VEER_sendMsg(msg.chat_id_, msg.id_, 1, '',1, 'md')  
end
if msg.sender_user_id_ and is_gban(msg.chat_id_,msg.sender_user_id_) then 
kick(msg,msg.chat_id_,msg.sender_user_id_) 
delete_msg(msg.chat_id_, {[0] = msg.id_}) 
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,msg.sender_user_id_) end
return false 
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and is_gban(msg.chat_id_,msg.content_.members_[0].id_) then 
kick(msg,msg.chat_id_,msg.content_.members_[0].id_) 
delete_msg(msg.chat_id_, {[0] = msg.id_})  
local list = MOHMADdevVEER:smembers(devVEER..'bot:gpsby:id')  for k,v in pairs(list) do  kick(msg,v,msg.content_.members_[0].id_) end
end 
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and MOHMADdevVEER:get(devVEER.."lock:Bot:kick"..msg.chat_id_) == 'del'  and not is_vipgroup(msg) then  
kick(msg,msg.chat_id_,mem_id[i].id_)
end  
if MOHMADdevVEER:get(devVEER..'lock:tagservrbot'..msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and MOHMADdevVEER:get(devVEER..'lock:tagservrbot'..msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end 
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and MOHMADdevVEER:get(devVEER.."lock:Bot:kick"..msg.chat_id_) == 'ked' and not is_vipgroup(msg) then  
kick(msg,msg.chat_id_,mem_id[i].id_)
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
MOHMADdevVEER:sadd(devVEER..'tedmembars'..msg.chat_id_,msg.sender_user_id_)
end  
if MOHMADdevVEER:get(devVEER..'lock:tagservrbot'..msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and MOHMADdevVEER:get(devVEER.."lock:Bot:kick"..msg.chat_id_) == 'kick' and not is_vipgroup(msg) then  
kick(msg,msg.chat_id_,mem_id[i].id_)
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
end  
if MOHMADdevVEER:get(devVEER..'lock:tagservrbot'..msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end
VEERadd(data.message_,data)   
VEER(data.message_,data)   

elseif data.ID == 'UpdateMessageEdited' then  
local msg = data
if tonumber(msg.sender_user_id_) == tonumber(bot_id) then
return false end
local function edited_cb(extra,ta,success)    
local text = ta.content_.text_
if text:find('ايدي') then
return false end
VEERadd(ta,data)   
VEER(ta,data)   
if not text and not is_monsh(ta) then
if MOHMADdevVEER:get(devVEER..'lock:edit:media'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end
local txxt = ta.content_.text_
if txxt and not is_vipgroup(ta) then  
if is_filter(ta,txxt) then    
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end
if txxt:find("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") and MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "del" then 
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end    
if txxt:find(".[Pp][Ee]") and MOHMADdevVEER:get(devVEER..'lock:links'..msg.chat_id_) then 
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end    
if txxt:find("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") and MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "del" then 
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end    
if txxt:find("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") and MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "del" then 
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end    
if txxt:find("[Tt].[Mm][Ee]/") and MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "del" then 
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end    
if txxt:find("[Ww][Ww][Ww].") and MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "del" then 
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end    
if txxt:find(".[Cc][Oo][Mm]") then
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) and MOHMADdevVEER:get(devVEER.."lock:Link"..msg.chat_id_) == "del" then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end    
if txxt:find('@[%a%d_]+') and MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "del" then
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end
if txxt:find('@(.+)') and MOHMADdevVEER:get(devVEER.."lock:user:name"..msg.chat_id_) == "del" then
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end
if txxt:find('#[%a%d_]+') and MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "del" then
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end
if txxt:find('#(.+)') and MOHMADdevVEER:get(devVEER.."lock:hashtak"..msg.chat_id_) == "del" then
if MOHMADdevVEER:get(devVEER..'lock:edit'..data.chat_id_) then 
delete_msg(data.chat_id_,{[0] = data.message_id_}) 
end    
end
end
end   
tdcli_function ({   ID = "GetMessage", chat_id_ = data.chat_id_,   message_id_ = data.message_id_    }, edited_cb, nil)  
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then  
local filess = io.open("plugins_/help_rep.lua","r")
if not filess then
os.execute('cd plugins_ ;wget https://raw.githubusercontent.com/NOVAR1/VEER/master/plugins_/help_rep.lua')
end
local filess = io.open("requfiles/JSON.lua","r")
if not filess then
os.execute('cd requfiles ;wget https://raw.githubusercontent.com/NOVAR1/NOVAR1/master/requfiles/JSON.lua') 
dofile('VEER.lua')  
end
local filess = io.open("requfiles/dkjson.lua","r")
if not filess then
os.execute('cd requfiles ;wget https://raw.githubusercontent.com/NOVAR1/NOVAR1/master/requfiles/dkjson.lua') 
dofile('VEER.lua')  
end
local filess = io.open("requfiles/serpent.lua","r")
if not filess then
os.execute('cd requfiles ;wget https://raw.githubusercontent.com/NOVAR1/NOVAR1/master/requfiles/serpent.lua') 
dofile('VEER.lua')  
end
local list = MOHMADdevVEER:smembers(devVEER.."usersbot")
for k,v in pairs(list) do
getchat(v,function(arg,data)
end)
end
local list = MOHMADdevVEER:smembers(devVEER.."botgps")
for k,v in pairs(list) do 
getchat(v,function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;32m»» البوت عضو في المجموعه\nتم مغادرة المجموعه \n\27[1;37m')
MOHMADdevVEER:srem(devVEER..'botgps',v) 
changeChatMemberStatus(v, bot_id, "Left")
rem_group(v)   
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
MOHMADdevVEER:srem(devVEER..'botgps',v) 
rem_group(v)   
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
print('\27[30;32m»» البوت مطرود في المجموعه\nتم مسح بيانات المجموعه \n\27[1;37m')
MOHMADdevVEER:srem(devVEER..'botgps',v) 
rem_group(v)   
end
if data and data.code_ and data.code_ == 400 then
MOHMADdevVEER:srem(devVEER..'botgps',v) 
rem_group(v)   
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
MOHMADdevVEER:set(devVEER..'group:name'..v,data.title_)
print('\27[30;32m»» البوت ادمن في المجموعه \n\27[1;37m')
add_group(v)   
end end) end
end 
end
