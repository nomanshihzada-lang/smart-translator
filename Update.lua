require "import"
import "android.widget.*"
import "android.view.*"
import "android.app.*"
import "android.content.*"
import "android.os.*"
import "android.graphics.*"
import "android.text.*"
import "android.net.*"
import "android.view.accessibility.*"
import "java.net.*"
import "java.io.*"
import "org.json.*"

local PREF_NAME = "BridgeTech_Pro_Translator_Prefs"
local prefs = service.getSharedPreferences(PREF_NAME, 0)

-- Google Translate 啶曕 啶膏き啷€ 249 啶掂ぞ啶膏啶むさ啶苦 啶ぞ啶粪ぞ啶撪 啶曕 啶啶班 啶膏啶氞
local all_languages = {
  {"Abkhaz", "ab"},
  {"Acehnese", "ace"},
  {"Acholi", "ach"},
  {"Afar", "aa"},
  {"Afrikaans", "af"},
  {"Albanian", "sq"},
  {"Alur", "alz"},
  {"Amharic", "am"},
  {"Arabic", "ar"},
  {"Armenian", "hy"},
  {"Assamese", "as"},
  {"Avar", "av"},
  {"Awadhi", "awa"},
  {"Aymara", "ay"},
  {"Azerbaijani", "az"},
  {"Balinese", "ban"},
  {"Balochi", "bal"},
  {"Bambara", "bm"},
  {"Baoule", "bci"},
  {"Bashkir", "ba"},
  {"Basque", "eu"},
  {"Batak Karo", "btx"},
  {"Batak Simalungun", "bts"},
  {"Batak Toba", "bbc"},
  {"Belarusian", "be"},
  {"Bemba", "bem"},
  {"Bengali", "bn"},
  {"Betawi", "bew"},
  {"Bhojpuri", "bho"},
  {"Bikol", "bik"},
  {"Bosnian", "bs"},
  {"Breton", "br"},
  {"Bulgarian", "bg"},
  {"Buryat", "bua"},
  {"Cantonese", "yue"},
  {"Catalan", "ca"},
  {"Cebuano", "ceb"},
  {"Chamorro", "ch"},
  {"Chechen", "ce"},
  {"Chichewa", "ny"},
  {"Chinese (Simplified)", "zh-CN"},
  {"Chinese (Traditional)", "zh-TW"},
  {"Chuukese", "chk"},
  {"Chuvash", "cv"},
  {"Corsican", "co"},
  {"Crimean Tatar (Cyrillic)", "crh"},
  {"Crimean Tatar (Latin)", "crh-Latn"},
  {"Croatian", "hr"},
  {"Czech", "cs"},
  {"Danish", "da"},
  {"Dari", "fa-AF"},
  {"Dhivehi", "dv"},
  {"Dinka", "din"},
  {"Dogri", "doi"},
  {"Dombe", "dov"},
  {"Dutch", "nl"},
  {"Dyula", "dyu"},
  {"Dzongkha", "dz"},
  {"English", "en"},
  {"Esperanto", "eo"},
  {"Estonian", "et"},
  {"Ewe", "ee"},
  {"Faroese", "fo"},
  {"Fijian", "fj"},
  {"Filipino", "tl"},
  {"Finnish", "fi"},
  {"Fon", "fon"},
  {"French", "fr"},
  {"French (Canada)", "fr-CA"},
  {"Frisian", "fy"},
  {"Friulian", "fur"},
  {"Fulani", "ff"},
  {"Ga", "gaa"},
  {"Galician", "gl"},
  {"Georgian", "ka"},
  {"German", "de"},
  {"Greek", "el"},
  {"Guarani", "gn"},
  {"Gujarati", "gu"},
  {"Haitian Creole", "ht"},
  {"Hakha Chin", "cnh"},
  {"Hausa", "ha"},
  {"Hawaiian", "haw"},
  {"Hebrew", "iw"},
  {"Hiligaynon", "hil"},
  {"Hindi", "hi"},
  {"Hmong", "hmn"},
  {"Hungarian", "hu"},
  {"Hunsrik", "hrx"},
  {"Iban", "iba"},
  {"Icelandic", "is"},
  {"Igbo", "ig"},
  {"Ilocano", "ilo"},
  {"Indonesian", "id"},
  {"Inuktitut (Latin)", "iu-Latn"},
  {"Inuktitut (Syllabics)", "iu"},
  {"Irish", "ga"},
  {"Italian", "it"},
  {"Jamaican Patois", "jam"},
  {"Japanese", "ja"},
  {"Javanese", "jw"},
  {"Jingpo", "kac"},
  {"Kalaallisut", "kl"},
  {"Kannada", "kn"},
  {"Kanuri", "kr"},
  {"Kapampangan", "pam"},
  {"Kashmiri", "ks"},
  {"Kazakh", "kk"},
  {"Khasi", "kha"},
  {"Khmer", "km"},
  {"Kiga", "cgg"},
  {"Kikongo", "kg"},
  {"Kinyarwanda", "rw"},
  {"Kituba", "ktu"},
  {"Kokborok", "trp"},
  {"Komi", "kv"},
  {"Konkani", "gom"},
  {"Korean", "ko"},
  {"Krio", "kri"},
  {"Kurdish (Kurmanji)", "ku"},
  {"Kurdish (Sorani)", "ckb"},
  {"Kyrgyz", "ky"},
  {"Lao", "lo"},
  {"Latgalian", "ltg"},
  {"Latin", "la"},
  {"Latvian", "lv"},
  {"Ligurian", "lij"},
  {"Limburgish", "li"},
  {"Lingala", "ln"},
  {"Lithuanian", "lt"},
  {"Lombard", "lmo"},
  {"Luganda", "lg"},
  {"Luo", "luo"},
  {"Luxembourgish", "lb"},
  {"Macedonian", "mk"},
  {"Madurese", "mad"},
  {"Maithili", "mai"},
  {"Makassar", "mak"},
  {"Malagasy", "mg"},
  {"Malay", "ms"},
  {"Malay (Jawi)", "ms-Arab"},
  {"Malayalam", "ml"},
  {"Maltese", "mt"},
  {"Mam", "mam"},
  {"Manx", "gv"},
  {"Maori", "mi"},
  {"Marathi", "mr"},
  {"Marshallese", "mh"},
  {"Marwari", "mwr"},
  {"Mauritian Creole", "mfe"},
  {"Meadow Mari", "chm"},
  {"Meiteilon (Manipuri)", "mni-Mtei"},
  {"Minang", "min"},
  {"Mizo", "lus"},
  {"Mongolian", "mn"},
  {"Myanmar (Burmese)", "my"},
  {"Nahuatl (Eastern Huasteca)", "nhe"},
  {"Ndau", "ndc-ZW"},
  {"Ndebele (South)", "nr"},
  {"Nepalbhasa (Newari)", "new"},
  {"Nepali", "ne"},
  {"NKo", "bm-Nkoo"},
  {"Norwegian", "no"},
  {"Nuer", "nus"},
  {"Occitan", "oc"},
  {"Odia (Oriya)", "or"},
  {"Oromo", "om"},
  {"Ossetian", "os"},
  {"Pangasinan", "pag"},
  {"Papiamento", "pap"},
  {"Pashto", "ps"},
  {"Persian", "fa"},
  {"Polish", "pl"},
  {"Portuguese (Brazil)", "pt"},
  {"Portuguese (Portugal)", "pt-PT"},
  {"Punjabi (Gurmukhi)", "pa"},
  {"Punjabi (Shahmukhi)", "pa-Arab"},
  {"Quechua", "qu"},
  {"Q始eqchi始", "kek"},
  {"Romani", "rom"},
  {"Romanian", "ro"},
  {"Rundi", "rn"},
  {"Russian", "ru"},
  {"Sami (North)", "se"},
  {"Samoan", "sm"},
  {"Sango", "sg"},
  {"Sanskrit", "sa"},
  {"Santali (Latin)", "sat-Latn"},
  {"Santali (Ol Chiki)", "sat"},
  {"Saraiki", "skr"},
  {"Scots Gaelic", "gd"},
  {"Sepedi", "nso"},
  {"Serbian", "sr"},
  {"Sesotho", "st"},
  {"Seychellois Creole", "crs"},
  {"Shan", "shn"},
  {"Shona", "sn"},
  {"Sicilian", "scn"},
  {"Silesian", "szl"},
  {"Sindhi", "sd"},
  {"Sinhala", "si"},
  {"Slovak", "sk"},
  {"Slovenian", "sl"},
  {"Somali", "so"},
  {"Spanish", "es"},
  {"Sundanese", "su"},
  {"Susu", "sus"},
  {"Swahili", "sw"},
  {"Swati", "ss"},
  {"Swedish", "sv"},
  {"Tahitian", "ty"},
  {"Tajik", "tg"},
  {"Tamazight", "ber-Latn"},
  {"Tamazight (Tifinagh)", "ber"},
  {"Tamil", "ta"},
  {"Tatar", "tt"},
  {"Telugu", "te"},
  {"Tetum", "tet"},
  {"Thai", "th"},
  {"Tibetan", "bo"},
  {"Tigrinya", "ti"},
  {"Tiv", "tiv"},
  {"Tok Pisin", "tpi"},
  {"Tongan", "to"},
  {"Tshiluba", "lua"},
  {"Tsonga", "ts"},
  {"Tswana", "tn"},
  {"Tulu", "tcy"},
  {"Tumbuka", "tum"},
  {"Turkish", "tr"},
  {"Turkmen", "tk"},
  {"Tuvan", "tyv"},
  {"Twi", "ak"},
  {"Udmurt", "udm"},
  {"Ukrainian", "uk"},
  {"Urdu", "ur"},
  {"Uyghur", "ug"},
  {"Uzbek", "uz"},
  {"Venda", "ve"},
  {"Venetian", "vec"},
  {"Vietnamese", "vi"},
  {"Waray", "war"},
  {"Welsh", "cy"},
  {"Wolof", "wo"},
  {"Xhosa", "xh"},
  {"Yakut", "sah"},
  {"Yiddish", "yi"},
  {"Yoruba", "yo"},
  {"Yucatec Maya", "yua"},
  {"Zapotec", "zap"},
  {"Zulu", "zu"}
}

local function getLanguageNameByCode(code)
  for _, item in ipairs(all_languages) do
    if item[2] == code then
      return item[1]
    end
  end
  return "Urdu"
end

local function getSettings()
  local savedCode = prefs.getString("target_code", "ur")
  local savedName = getLanguageNameByCode(savedCode)
  return {
    target_code = savedCode,
    target_name = savedName,
    auto_speak = prefs.getBoolean("auto_speak", true),
    auto_copy = prefs.getBoolean("auto_copy", false)
  }
end

local function showSafeDialog(dialog)
  pcall(function()
    local win = dialog.getWindow()
    if win ~= nil then
      if Build.VERSION.SDK_INT >= 22 then
        win.setType(WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY)
      else
        win.setType(WindowManager.LayoutParams.TYPE_SYSTEM_ALERT)
      end
    end
  end)
  dialog.show()
end

local function copyToClipboard(text, silent)
  local cm = service.getSystemService(Context.CLIPBOARD_SERVICE)
  local clip = ClipData.newPlainText("TranslatedText", text)
  cm.setPrimaryClip(clip)
  if not silent then
    service.speak("Copied to clipboard")
  end
end

local function openExternalUrl(urlStr, dialogToClose)
  if dialogToClose ~= nil then
    pcall(function() dialogToClose.dismiss() end)
  end
  Handler(Looper.getMainLooper()).postDelayed(Runnable{
    run = function()
      local ok, err = pcall(function()
        local intent = Intent(Intent.ACTION_VIEW, Uri.parse(urlStr))
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
        service.startActivity(intent)
      end)
      if not ok then
        service.speak("Could not open link")
      end
    end
  }, 150)
end

local function shareText(text, dialogToClose)
  if dialogToClose ~= nil then
    pcall(function() dialogToClose.dismiss() end)
  end
  Handler(Looper.getMainLooper()).postDelayed(Runnable{
    run = function()
      local ok, err = pcall(function()
        local sendIntent = Intent(Intent.ACTION_SEND)
        sendIntent.putExtra(Intent.EXTRA_TEXT, text)
        sendIntent.setType("text/plain")
        local chooser = Intent.createChooser(sendIntent, "Share Translation")
        chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        chooser.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
        service.startActivity(chooser)
      end)
      if not ok then
        service.speak("Share failed")
      end
    end
  }, 150)
end

local function replaceTextInEditBox(targetNode, newText)
  local replaced = false

  local activeNode = targetNode
  local okF, freshInput = pcall(function()
    return service.findFocus(AccessibilityNodeInfo.FOCUS_INPUT)
  end)
  if okF and freshInput ~= nil then
    activeNode = freshInput
  end

  if activeNode ~= nil then
    pcall(function()
      activeNode.refresh()
    end)

    local ok1, res1 = pcall(function()
      local args = Bundle()
      args.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE, newText)
      return activeNode.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT, args)
    end)
    if ok1 and res1 == true then
      replaced = true
    end

    if not replaced then
      pcall(function()
        local cm = service.getSystemService(Context.CLIPBOARD_SERVICE)
        local oldClip = nil
        pcall(function()
          if cm.hasPrimaryClip() then
            oldClip = cm.getPrimaryClip()
          end
        end)

        local clip = ClipData.newPlainText("TranslatedText", newText)
        cm.setPrimaryClip(clip)

        activeNode.performAction(AccessibilityNodeInfo.ACTION_FOCUS)
        local curTxt = ""
        if activeNode.getText() ~= nil then
          curTxt = tostring(activeNode.getText())
        end
        local selArgs = Bundle()
        selArgs.putInt(AccessibilityNodeInfo.ACTION_ARGUMENT_SELECTION_START_INT, 0)
        selArgs.putInt(AccessibilityNodeInfo.ACTION_ARGUMENT_SELECTION_END_INT, #curTxt)
        activeNode.performAction(AccessibilityNodeInfo.ACTION_SET_SELECTION, selArgs)

        if activeNode.performAction(AccessibilityNodeInfo.ACTION_PASTE) then
          replaced = true
        end

        if oldClip ~= nil then
          Handler(Looper.getMainLooper()).postDelayed(Runnable{
            run = function()
              pcall(function() cm.setPrimaryClip(oldClip) end)
            end
          }, 500)
        end
      end)
    end
  end

  return replaced
end

local function splitTextSegments(text)
  local segments = {}
  for line in string.gmatch(text, "([^\r\n]+)") do
    local trimmed = line:match("^%s*(.-)%s*$")
    if trimmed ~= "" then
      local startPos = 1
      local len = #trimmed
      for i = 1, len do
        local ch = trimmed:sub(i, i)
        if ch == "." or ch == "?" or ch == "!" then
          local part = trimmed:sub(startPos, i):match("^%s*(.-)%s*$")
          if part ~= "" then
            table.insert(segments, part)
          end
          startPos = i + 1
        end
      end
      if startPos <= len then
        local rem = trimmed:sub(startPos, len):match("^%s*(.-)%s*$")
        if rem ~= "" then
          table.insert(segments, rem)
        end
      end
    end
  end
  if #segments == 0 and text ~= "" then
    table.insert(segments, text)
  end
  return segments
end

local showSettingsDialog
local translateText

local function showSingleLanguagePicker(onLanguagePicked)
  local cfg = getSettings()
  local dialog = LuaDialog(service)
  dialog.setTitle("Select Translation Language")

  local root = LinearLayout(service)
  root.setOrientation(LinearLayout.VERTICAL)
  root.setPadding(30, 20, 30, 20)

  local currentInfo = TextView(service)
  currentInfo.setText("Currently Checked: " .. cfg.target_name)
  currentInfo.setTextSize(15)
  currentInfo.setTypeface(nil, Typeface.BOLD)
  currentInfo.setPadding(5, 0, 5, 12)
  root.addView(currentInfo)

  local searchBox = EditText(service)
  searchBox.setHint("Search language (e.g. Urdu, English, Arabic)...")
  root.addView(searchBox)

  local scrollView = ScrollView(service)
  local sParams = LinearLayout.LayoutParams(
    LinearLayout.LayoutParams.MATCH_PARENT,
    LinearLayout.LayoutParams.WRAP_CONTENT
  )
  sParams.weight = 1
  scrollView.setLayoutParams(sParams)

  local listLayout = LinearLayout(service)
  listLayout.setOrientation(LinearLayout.VERTICAL)
  scrollView.addView(listLayout)
  root.addView(scrollView)

  local function renderList(filterQuery)
    listLayout.removeAllViews()
    local q = string.lower((filterQuery or ""):match("^%s*(.-)%s*$"))
    local activeCode = prefs.getString("target_code", "ur")

    for _, item in ipairs(all_languages) do
      local lName = item[1]
      local lCode = item[2]
      if q == "" or string.find(string.lower(lName), q, 1, true) then
        local isSelected = (lCode == activeCode)
        local rb = RadioButton(service)
        rb.setText(lName)
        rb.setTextSize(17)
        rb.setChecked(isSelected)
        rb.setPadding(15, 18, 15, 18)
        rb.setContentDescription(lName .. (isSelected and ", Checked" or ", Not checked"))

        rb.setOnClickListener(View.OnClickListener{
          onClick = function(v)
            local editor = prefs.edit()
            editor.putString("target_code", lCode)
            editor.commit()
            service.speak(lName .. " checked")
            dialog.dismiss()
            if onLanguagePicked ~= nil then
              onLanguagePicked(lName, lCode)
            end
          end
        })
        listLayout.addView(rb)
      end
    end
  end

  renderList("")

  searchBox.addTextChangedListener(TextWatcher{
    onTextChanged = function(s, start, before, count)
      renderList(tostring(s))
    end,
    beforeTextChanged = function(s, start, count, after) end,
    afterTextChanged = function(s) end
  })

  local btnBack = Button(service)
  btnBack.setText("Back")
  btnBack.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      dialog.dismiss()
      showSettingsDialog()
    end
  })
  root.addView(btnBack)

  dialog.setView(root)
  showSafeDialog(dialog)
end

local function showAboutDialog(returnToMain)
  local dialog = LuaDialog(service)
  dialog.setTitle("About Smart Translator")

  local scroll = ScrollView(service)
  local layout = LinearLayout(service)
  layout.setOrientation(LinearLayout.VERTICAL)
  layout.setPadding(35, 25, 35, 25)

  local flagTitle = TextView(service)
  flagTitle.setText("馃嚨馃嚢 Smart Translator - Version 1.1")
  flagTitle.setTextSize(19)
  flagTitle.setTypeface(nil, Typeface.BOLD)
  layout.addView(flagTitle)

  local devTitle = TextView(service)
  devTitle.setText("Project Noman Khan developed by All Technology Update")
  devTitle.setTextSize(16)
  devTitle.setTypeface(nil, Typeface.BOLD)
  devTitle.setPadding(0, 12, 0, 12)
  layout.addView(devTitle)

  local descText = TextView(service)
  descText.setText(
    "What's New in Version 1.1:\n\n" ..
    "1. Universal Screen Text Translation: Now you can translate any focused message or text anywhere on your screen (WhatsApp chats, notifications, browsers, and apps) even outside edit boxes.\n" ..
    "2. Full Message & Multi-Line Extraction: Automatically collects complete text across nested screen containers so no part of a message is missed.\n" ..
    "3. Smart Focus Priority: Prevents empty input boxes from blocking translation while reading messages in chat apps.\n" ..
    "4. Unified Single Language Selector: Simplified to one clear language selector with accurate Checked / Not Checked status across all 249 languages."
  )
  descText.setTextSize(15)
  layout.addView(descText)

  local btnClose = Button(service)
  btnClose.setText("Back")
  local bParams = LinearLayout.LayoutParams(
    LinearLayout.LayoutParams.MATCH_PARENT,
    LinearLayout.LayoutParams.WRAP_CONTENT
  )
  bParams.setMargins(0, 20, 0, 0)
  btnClose.setLayoutParams(bParams)
  btnClose.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      dialog.dismiss()
      if returnToMain then
        showSettingsDialog()
      end
    end
  })
  layout.addView(btnClose)

  scroll.addView(layout)
  dialog.setView(scroll)
  showSafeDialog(dialog)
end

local function showMoreSettingsDialog()
  local dialog = LuaDialog(service)
  dialog.setTitle("Settings, Support & Feedback")

  local scroll = ScrollView(service)
  local layout = LinearLayout(service)
  layout.setOrientation(LinearLayout.VERTICAL)
  layout.setPadding(35, 25, 35, 25)

  local header = TextView(service)
  header.setText("馃嚨馃嚢 All Technology Update - Official Support & Community")
  header.setTextSize(17)
  header.setTypeface(nil, Typeface.BOLD)
  layout.addView(header)

  local subDesc = TextView(service)
  subDesc.setText("Connect with us for the latest screen reader plugins, accessible Android apps, tech tutorials, and direct developer feedback:")
  subDesc.setTextSize(14)
  subDesc.setPadding(0, 8, 0, 18)
  layout.addView(subDesc)

  local lblFb = TextView(service)
  lblFb.setText("Send Feedback (WhatsApp Support):")
  lblFb.setTextSize(15)
  lblFb.setTypeface(nil, Typeface.BOLD)
  layout.addView(lblFb)

  local edtFb = EditText(service)
  edtFb.setHint("Write your feedback or suggestion here...")
  layout.addView(edtFb)

  local btnSendFb = Button(service)
  btnSendFb.setText("Send Feedback on WhatsApp")
  btnSendFb.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      local msg = tostring(edtFb.getText()):match("^%s*(.-)%s*$")
      if msg == "" then
        msg = "Assalam-o-Alaikum Noman Khan! Feedback regarding Smart Translator v1.1:"
      else
        msg = "Smart Translator v1.1 Feedback:\n" .. msg
      end
      local waUrl = "https://wa.me/923145406759?text=" .. URLEncoder.encode(msg, "UTF-8")
      openExternalUrl(waUrl, dialog)
    end
  })
  layout.addView(btnSendFb)

  local lblSupport = TextView(service)
  lblSupport.setText("Official Support & Community Links:")
  lblSupport.setTextSize(16)
  lblSupport.setTypeface(nil, Typeface.BOLD)
  lblSupport.setPadding(0, 22, 0, 8)
  layout.addView(lblSupport)

  local descWaCh = TextView(service)
  descWaCh.setText("Follow All Technology Updates Official WhatsApp Channel for instant plugin updates and releases:")
  descWaCh.setTextSize(14)
  layout.addView(descWaCh)

  local btnWaChannel = Button(service)
  btnWaChannel.setText("Open All Technology Updates WhatsApp Channel")
  btnWaChannel.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      openExternalUrl("https://whatsapp.com/channel/0029Vb8tKjlK0IBnVVzfv50a", dialog)
    end
  })
  layout.addView(btnWaChannel)

  local descWaGrp = TextView(service)
  descWaGrp.setText("Join All Technology Updates Community WhatsApp Group for discussions, help, and tech support:")
  descWaGrp.setTextSize(14)
  descWaGrp.setPadding(0, 14, 0, 0)
  layout.addView(descWaGrp)

  local btnWaGroup = Button(service)
  btnWaGroup.setText("Join All Technology Updates WhatsApp Group")
  btnWaGroup.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      openExternalUrl("https://chat.whatsapp.com/JGz8fgOFXth9cTWh3IRF7s?s=cl&p=a&iam=2", dialog)
    end
  })
  layout.addView(btnWaGroup)

  local descYt = TextView(service)
  descYt.setText("Subscribe to All Technology Update YouTube Channel (@0786-e9u) for video tutorials and reviews:")
  descYt.setTextSize(14)
  descYt.setPadding(0, 14, 0, 0)
  layout.addView(descYt)

  local btnYoutube = Button(service)
  btnYoutube.setText("Open All Technology Update YouTube Channel")
  btnYoutube.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      openExternalUrl("https://www.youtube.com/@0786-e9u", dialog)
    end
  })
  layout.addView(btnYoutube)

  local bottomRow = LinearLayout(service)
  bottomRow.setOrientation(LinearLayout.HORIZONTAL)
  bottomRow.setPadding(0, 22, 0, 0)

  local btnInsideAbout = Button(service)
  btnInsideAbout.setText("About")
  btnInsideAbout.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      dialog.dismiss()
      showAboutDialog(true)
    end
  })

  local btnBack = Button(service)
  btnBack.setText("Back")
  btnBack.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      dialog.dismiss()
      showSettingsDialog()
    end
  })

  local bParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.0)
  btnInsideAbout.setLayoutParams(bParams)
  btnBack.setLayoutParams(bParams)

  bottomRow.addView(btnInsideAbout)
  bottomRow.addView(btnBack)
  layout.addView(bottomRow)

  scroll.addView(layout)
  dialog.setView(scroll)
  showSafeDialog(dialog)
end

local function showResultDialog(originalText, translatedText, editNode, wasReplaced)
  local cfg = getSettings()
  if wasReplaced then
    if cfg.auto_speak then
      service.speak("Replaced with: " .. translatedText)
    else
      service.speak("Text replaced")
    end
  else
    if cfg.auto_speak then
      service.speak(translatedText)
    end
  end

  if cfg.auto_copy then
    copyToClipboard(translatedText, true)
  end

  local dialog = LuaDialog(service)
  dialog.setTitle(wasReplaced and "Replaced & Translated" or "Translation Result")

  local rootLayout = LinearLayout(service)
  rootLayout.setOrientation(LinearLayout.VERTICAL)
  rootLayout.setPadding(30, 20, 30, 20)

  local infoLabel = TextView(service)
  local statusTag = wasReplaced and " [Box Updated]" or ""
  infoLabel.setText("Translated to: " .. cfg.target_name .. statusTag)
  infoLabel.setTextSize(14)
  infoLabel.setPadding(10, 5, 10, 15)
  rootLayout.addView(infoLabel)

  local scrollView = ScrollView(service)
  local scrollParams = LinearLayout.LayoutParams(
    LinearLayout.LayoutParams.MATCH_PARENT,
    LinearLayout.LayoutParams.WRAP_CONTENT
  )
  scrollParams.weight = 1
  scrollView.setLayoutParams(scrollParams)

  local listContainer = LinearLayout(service)
  listContainer.setOrientation(LinearLayout.VERTICAL)

  local segments = splitTextSegments(translatedText)

  for idx, seg in ipairs(segments) do
    local segBox = EditText(service)
    segBox.setText(seg)
    segBox.setTextSize(17)
    segBox.setFocusable(true)
    segBox.setTextIsSelectable(true)
    segBox.setContentDescription("Segment " .. idx .. ": " .. seg)
    segBox.setPadding(20, 15, 20, 15)
    
    local itemParams = LinearLayout.LayoutParams(
      LinearLayout.LayoutParams.MATCH_PARENT,
      LinearLayout.LayoutParams.WRAP_CONTENT
    )
    itemParams.setMargins(0, 0, 0, 16)
    segBox.setLayoutParams(itemParams)
    listContainer.addView(segBox)
  end

  scrollView.addView(listContainer)
  rootLayout.addView(scrollView)

  -- 亘俟賳賵诤 讴蹖 鬲乇鬲蹖亘: Copy -> Share -> Back -> Exit
  local btnRow = LinearLayout(service)
  btnRow.setOrientation(LinearLayout.HORIZONTAL)
  btnRow.setPadding(0, 15, 0, 0)

  local btnCopy = Button(service)
  btnCopy.setText("Copy")
  btnCopy.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      copyToClipboard(translatedText, false)
    end
  })

  local btnShare = Button(service)
  btnShare.setText("Share")
  btnShare.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      shareText(translatedText, dialog)
    end
  })

  local btnBack = Button(service)
  btnBack.setText("Back")
  btnBack.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      dialog.dismiss()
      showSettingsDialog()
    end
  })

  local btnExit = Button(service)
  btnExit.setText("Exit")
  btnExit.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      dialog.dismiss()
    end
  })

  local bParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.0)
  btnCopy.setLayoutParams(bParams)
  btnShare.setLayoutParams(bParams)
  btnBack.setLayoutParams(bParams)
  btnExit.setLayoutParams(bParams)

  btnRow.addView(btnCopy)
  btnRow.addView(btnShare)
  btnRow.addView(btnBack)
  btnRow.addView(btnExit)

  rootLayout.addView(btnRow)
  dialog.setView(rootLayout)
  showSafeDialog(dialog)
end

showSettingsDialog = function()
  local cfg = getSettings()
  local dialog = LuaDialog(service)
  dialog.setTitle("Smart Translator v1.1")

  local scrollView = ScrollView(service)
  local layout = LinearLayout(service)
  layout.setOrientation(LinearLayout.VERTICAL)
  layout.setPadding(35, 25, 35, 25)

  local mainHeading = TextView(service)
  mainHeading.setText("Smart Translator")
  mainHeading.setTextSize(21)
  mainHeading.setTypeface(nil, Typeface.BOLD)
  layout.addView(mainHeading)

  local subHeading = TextView(service)
  subHeading.setText("Version 1.1 - Developed by All Technology Update 馃嚨馃嚢")
  subHeading.setTextSize(15)
  subHeading.setTypeface(nil, Typeface.BOLD)
  subHeading.setPadding(0, 4, 0, 18)
  layout.addView(subHeading)

  local lblLang = TextView(service)
  lblLang.setText("Translation Language (Auto-Detect Input):")
  lblLang.setTextSize(16)
  layout.addView(lblLang)

  local btnSelectLang = Button(service)
  btnSelectLang.setText("Language: " .. cfg.target_name .. " (Checked)")
  btnSelectLang.setContentDescription("Language: " .. cfg.target_name .. ", Checked. Tap to change language.")
  btnSelectLang.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      dialog.dismiss()
      showSingleLanguagePicker(function(newName, newCode)
        showSettingsDialog()
      end)
    end
  })
  layout.addView(btnSelectLang)

  local chkAutoSpeak = CheckBox(service)
  chkAutoSpeak.setText("Auto-Speak Translation")
  chkAutoSpeak.setChecked(cfg.auto_speak)
  chkAutoSpeak.setPadding(0, 14, 0, 0)
  layout.addView(chkAutoSpeak)

  local chkAutoCopy = CheckBox(service)
  chkAutoCopy.setText("Auto-Copy Translation to Clipboard")
  chkAutoCopy.setChecked(cfg.auto_copy)
  layout.addView(chkAutoCopy)

  local lblCustom = TextView(service)
  lblCustom.setText("Quick Text Translate (Optional):")
  lblCustom.setTextSize(16)
  lblCustom.setPadding(0, 20, 0, 5)
  layout.addView(lblCustom)

  local edtCustom = EditText(service)
  edtCustom.setHint("Enter or paste text here to translate...")
  layout.addView(edtCustom)

  local function saveCurrentPrefs()
    local editor = prefs.edit()
    editor.putBoolean("auto_speak", chkAutoSpeak.isChecked())
    editor.putBoolean("auto_copy", chkAutoCopy.isChecked())
    editor.commit()
    return getSettings().target_name
  end

  local extraRow = LinearLayout(service)
  extraRow.setOrientation(LinearLayout.HORIZONTAL)
  extraRow.setPadding(0, 18, 0, 0)

  local btnMoreSettings = Button(service)
  btnMoreSettings.setText("Settings")
  btnMoreSettings.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      saveCurrentPrefs()
      dialog.dismiss()
      showMoreSettingsDialog()
    end
  })

  local btnOuterAbout = Button(service)
  btnOuterAbout.setText("About")
  btnOuterAbout.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      saveCurrentPrefs()
      dialog.dismiss()
      showAboutDialog(true)
    end
  })

  local eParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.0)
  btnMoreSettings.setLayoutParams(eParams)
  btnOuterAbout.setLayoutParams(eParams)

  extraRow.addView(btnMoreSettings)
  extraRow.addView(btnOuterAbout)
  layout.addView(extraRow)

  local btnRow = LinearLayout(service)
  btnRow.setOrientation(LinearLayout.HORIZONTAL)
  btnRow.setPadding(0, 10, 0, 0)

  local btnTranslate = Button(service)
  btnTranslate.setText("Translate")
  btnTranslate.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      local txt = tostring(edtCustom.getText()):match("^%s*(.-)%s*$")
      if txt == "" then
        service.speak("Please enter text first")
        return
      end
      saveCurrentPrefs()
      dialog.dismiss()
      translateText(txt, nil)
    end
  })

  local btnSave = Button(service)
  btnSave.setText("Save")
  btnSave.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      local savedTargetName = saveCurrentPrefs()
      service.speak("Saved. Active language is " .. savedTargetName)
      dialog.dismiss()
    end
  })

  local btnExit = Button(service)
  btnExit.setText("Exit")
  btnExit.setOnClickListener(View.OnClickListener{
    onClick = function(v)
      dialog.dismiss()
    end
  })

  local bParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.0)
  btnTranslate.setLayoutParams(bParams)
  btnSave.setLayoutParams(bParams)
  btnExit.setLayoutParams(bParams)

  btnRow.addView(btnTranslate)
  btnRow.addView(btnSave)
  btnRow.addView(btnExit)

  layout.addView(btnRow)
  scrollView.addView(layout)
  dialog.setView(scrollView)
  showSafeDialog(dialog)
end

local function decodeHtmlEntities(str)
  if str == nil then return "" end
  local ok, spanned = pcall(function()
    if Build.VERSION.SDK_INT >= 24 then
      return tostring(Html.fromHtml(str, Html.FROM_HTML_MODE_LEGACY))
    else
      return tostring(Html.fromHtml(str))
    end
  end)
  if ok and spanned ~= nil then
    return spanned
  end
  str = str:gsub("&quot;", '"')
  str = str:gsub("&#39;", "'")
  str = str:gsub("&amp;", "&")
  str = str:gsub("&lt;", "<")
  str = str:gsub("&gt;", ">")
  return str
end

local function showErrorDialog(errMsg)
  service.speak("Translation failed")
  local errDialog = LuaDialog(service)
  errDialog.setTitle("Translation Error Log")
  errDialog.setMessage("Details: " .. tostring(errMsg))
  errDialog.setPositiveButton("Copy Error", function()
    copyToClipboard(tostring(errMsg), false)
    errDialog.dismiss()
  end)
  errDialog.setNegativeButton("Exit", function()
    errDialog.dismiss()
  end)
  showSafeDialog(errDialog)
end

local function handleTranslationSuccess(originalText, translatedText, editNode)
  local wasReplaced = false
  if editNode ~= nil then
    wasReplaced = replaceTextInEditBox(editNode, translatedText)
  end
  showResultDialog(originalText, translatedText, editNode, wasReplaced)
end

translateText = function(textToTranslate, editNode)
  local cfg = getSettings()
  service.speak("Translating to " .. cfg.target_name)

  local mainHandler = Handler(Looper.getMainLooper())
  local runnable = Runnable{
    run = function()
      local tLang = cfg.target_code
      local encodedText = URLEncoder.encode(textToTranslate, "UTF-8")
      local errorLogs = {}

      local function fetchUrl(urlStr, ua)
        local url = URL(urlStr)
        local conn = url.openConnection()
        conn.setRequestMethod("GET")
        conn.setRequestProperty("User-Agent", ua)
        conn.setRequestProperty("Accept", "*/*")
        conn.setConnectTimeout(10000)
        conn.setReadTimeout(10000)
        local code = conn.getResponseCode()
        if code ~= 200 then
          error("HTTP " .. tostring(code))
        end
        local reader = BufferedReader(InputStreamReader(conn.getInputStream(), "UTF-8"))
        local sb = StringBuilder()
        local line = reader.readLine()
        while line ~= nil do
          sb.append(line)
          line = reader.readLine()
        end
        reader.close()
        return sb.toString()
      end

      -- 丕賳噩賳 1: Google Translate Mobile Web
      local ok1, res1 = pcall(function()
        local u1 = "https://translate.google.com/m?sl=auto&tl=" .. tLang .. "&q=" .. encodedText
        local html = fetchUrl(u1, "Mozilla/5.0 (Linux; Android 10; Mobile) AppleWebKit/537.36 Chrome/120.0.0.0 Mobile Safari/537.36")
        local extracted = html:match('<div class="result%-container">(.-)</div>')
        if extracted == nil or extracted == "" then
          extracted = html:match('<div dir="ltr" class="t0">(.-)</div>')
        end
        if extracted == nil or extracted == "" then
          error("Result tag not found")
        end
        return decodeHtmlEntities(extracted)
      end)

      if ok1 and res1 ~= nil and res1 ~= "" then
        mainHandler.post(Runnable{
          run = function()
            handleTranslationSuccess(textToTranslate, res1, editNode)
          end
        })
        return
      else
        table.insert(errorLogs, "Engine 1 (Google Mobile): " .. tostring(res1))
      end

      -- 丕賳噩賳 2: Google Clients5 Dictionary API
      local ok2, res2 = pcall(function()
        local u2 = "https://clients5.google.com/translate_a/t?client=dict-chrome-ex&sl=auto&tl=" .. tLang .. "&q=" .. encodedText
        local raw = fetchUrl(u2, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
        local arr = JSONArray(raw)
        local first = arr.get(0)
        if tostring(type(first)) == "userdata" then
          local out = ""
          for i = 0, arr.length() - 1 do
            local item = arr.get(i)
            local okItem, strItem = pcall(function() return item.getString(0) end)
            if okItem and strItem ~= nil then
              out = out .. strItem
            else
              out = out .. tostring(item)
            end
          end
          return out
        else
          return tostring(first)
        end
      end)

      if ok2 and res2 ~= nil and res2 ~= "" then
        mainHandler.post(Runnable{
          run = function()
            handleTranslationSuccess(textToTranslate, res2, editNode)
          end
        })
        return
      else
        table.insert(errorLogs, "Engine 2 (Clients5): " .. tostring(res2))
      end

      -- 丕賳噩賳 3: Lingva Public Google Proxy
      local ok3, res3 = pcall(function()
        local u3 = "https://lingva.ml/api/v1/auto/" .. tLang .. "/" .. encodedText
        local raw = fetchUrl(u3, "Mozilla/5.0")
        local obj = JSONObject(raw)
        local tr = obj.getString("translation")
        if tr == nil or tr == "" then error("Empty translation") end
        return tr
      end)

      if ok3 and res3 ~= nil and res3 ~= "" then
        mainHandler.post(Runnable{
          run = function()
            handleTranslationSuccess(textToTranslate, res3, editNode)
          end
        })
        return
      else
        table.insert(errorLogs, "Engine 3 (Lingva): " .. tostring(res3))
      end

      -- 丕賳噩賳 4: MyMemory Free Translation API
      local ok4, res4 = pcall(function()
        local u4 = "https://api.mymemory.translated.net/get?q=" .. encodedText .. "&langpair=autodetect|" .. tLang
        local raw = fetchUrl(u4, "Mozilla/5.0")
        local obj = JSONObject(raw)
        local respData = obj.getJSONObject("responseData")
        local tr = respData.getString("translatedText")
        if tr == nil or tr == "" then error("Empty MyMemory result") end
        return decodeHtmlEntities(tr)
      end)

      if ok4 and res4 ~= nil and res4 ~= "" then
        mainHandler.post(Runnable{
          run = function()
            handleTranslationSuccess(textToTranslate, res4, editNode)
          end
        })
        return
      else
        table.insert(errorLogs, "Engine 4 (MyMemory): " .. tostring(res4))
      end

      mainHandler.post(Runnable{
        run = function()
          showErrorDialog(table.concat(errorLogs, "\n\n"))
        end
      })
    end
  }
  Thread(runnable).start()
end

-- 趩蹖讴 讴乇蹖诤 讴蹃 丌蹖丕 蹖蹃 賲禺氐賵氐 賳賵趫 丕蹖趫俟 丕蹖亘賱 (EditText) 蹃蹝
local function isNodeEditable(node)
  if node == nil then return false end
  local isEd = false
  pcall(function()
    if node.isEditable() then
      isEd = true
    elseif node.getClassName() ~= nil and string.find(tostring(node.getClassName()), "EditText") then
      isEd = true
    end
  end)
  return isEd
end

-- 賳賵趫 丕賵乇 丕爻 讴蹝 鬲賲丕賲 趩丕卅賱趫 賳賵趫夭 爻蹝 賲讴賲賱 俟蹖讴爻俟 丕讴俟诰丕 讴乇蹖诤 (WhatsApp 賲蹖爻噩夭 丕賵乇 毓丕賲 丕爻讴乇蹖賳 俟蹖讴爻俟 讴蹝 賱蹖蹝)
local function collectFullNodeText(node, isEditBox, depth)
  if node == nil then return "" end
  depth = depth or 0
  if depth > 12 then return "" end

  pcall(function() node.refresh() end)

  local parts = {}
  local directText = ""

  if node.getText() ~= nil and tostring(node.getText()) ~= "" then
    local isHint = false
    if Build.VERSION.SDK_INT >= 26 then
      pcall(function()
        if node.isShowingHintText() then
          isHint = true
        end
      end)
    end
    if not isHint then
      directText = tostring(node.getText()):match("^%s*(.-)%s*$")
    end
  end

  if directText ~= "" then
    table.insert(parts, directText)
  elseif not isEditBox then
    if node.getContentDescription() ~= nil and tostring(node.getContentDescription()) ~= "" then
      local cd = tostring(node.getContentDescription()):match("^%s*(.-)%s*$")
      if cd ~= "" then
        table.insert(parts, cd)
      end
    end
  end

  local count = 0
  pcall(function() count = node.getChildCount() end)
  for i = 0, count - 1 do
    local child = nil
    pcall(function() child = node.getChild(i) end)
    if child ~= nil then
      local cText = collectFullNodeText(child, isEditBox, depth + 1)
      if cText ~= "" then
        -- 趫倬賱蹖讴蹖俟 俟蹖讴爻俟 爻蹝 亘趩蹖诤
        local alreadyExists = false
        for _, existing in ipairs(parts) do
          if existing == cText then
            alreadyExists = true
            break
          end
        end
        if not alreadyExists then
          table.insert(parts, cText)
        end
      end
    end
  end

  return table.concat(parts, "\n")
end

-- 乇賵俟 賵賳趫賵 賲蹖诤 爻蹝 賲賵噩賵丿蹃 Accessibility Focused 賳賵趫 鬲賱丕卮 讴乇賳蹝 讴丕 亘蹖讴 丕倬 賮賳讴卮賳
local function findAccessibilityFocusedInTree(rootNode, depth)
  if rootNode == nil then return nil end
  depth = depth or 0
  if depth > 15 then return nil end

  local isFocused = false
  pcall(function()
    if rootNode.isAccessibilityFocused() then
      isFocused = true
    end
  end)
  if isFocused then
    return rootNode
  end

  local count = 0
  pcall(function() count = rootNode.getChildCount() end)
  for i = 0, count - 1 do
    local child = nil
    pcall(function() child = rootNode.getChild(i) end)
    if child ~= nil then
      local found = findAccessibilityFocusedInTree(child, depth + 1)
      if found ~= nil then
        return found
      end
    end
  end
  return nil
end

-- 丕爻讴乇蹖賳 讴蹝 讴爻蹖 亘诰蹖 丨氐蹝 (WhatsApp 賲蹖爻噩貙 毓丕賲 俟蹖讴爻俟貙 蹖丕 丕蹖趫俟 亘丕讴爻) 爻蹝 俟蹖讴爻俟 賳讴丕賱蹖诤
local function getScreenTargetData()
  local accNode = nil
  local inputNode = nil

  -- 1. 倬蹃賱蹝 Accessibility Focus (噩賵 趩蹖夭 丕爻 賵賯鬲 丕爻讴乇蹖賳 乇蹖趫乇 倬乇 爻賱蹖讴俟 蹃蹝) 丕俟诰丕卅蹖诤
  pcall(function()
    accNode = service.findFocus(AccessibilityNodeInfo.FOCUS_ACCESSIBILITY)
  end)
  if accNode == nil then
    pcall(function()
      accNode = service.getFocus()
    end)
  end
  if accNode == nil then
    pcall(function()
      local root = service.getRootInActiveWindow()
      accNode = findAccessibilityFocusedInTree(root, 0)
    end)
  end

  -- 2. Input Focus 亘诰蹖 趩蹖讴 讴乇蹖诤
  pcall(function()
    inputNode = service.findFocus(AccessibilityNodeInfo.FOCUS_INPUT)
  end)

  local pkgName = ""
  local refNode = accNode or inputNode
  if refNode ~= nil and refNode.getPackageName() ~= nil then
    pkgName = tostring(refNode.getPackageName())
  end

  -- 趩蹖讴 讴乇蹖诤 讴蹃 丌蹖丕 氐丕乇賮 讴丕 賮賵讴爻 賵丕賯毓蹖 丕蹖趫俟 亘丕讴爻 倬乇 蹃蹝 蹖丕 讴爻蹖 毓丕賲 俟蹖讴爻俟/賲蹖爻噩 倬乇
  local editNode = nil
  if accNode ~= nil and isNodeEditable(accNode) then
    editNode = accNode
  elseif accNode == nil and inputNode ~= nil and isNodeEditable(inputNode) then
    editNode = inputNode
  end

  local extractedText = ""
  if editNode ~= nil then
    extractedText = collectFullNodeText(editNode, true, 0)
  elseif accNode ~= nil then
    extractedText = collectFullNodeText(accNode, false, 0)
  elseif inputNode ~= nil then
    extractedText = collectFullNodeText(inputNode, isNodeEditable(inputNode), 0)
  end

  return extractedText, editNode, pkgName
end

local function main()
  local focusedText, editNode, pkgName = getScreenTargetData()

  local isLauncher = string.find(string.lower(pkgName), "launcher") or string.find(string.lower(pkgName), "home")

  if isLauncher or focusedText == "" then
    showSettingsDialog()
  else
    translateText(focusedText, editNode)
  end
end

main()
