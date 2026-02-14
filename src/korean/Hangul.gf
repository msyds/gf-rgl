--# -path=.:../abstract:../common:../prelude

resource Hangul = open Prelude in {

oper
  add_eo : Str -> Str
    -- stem ⇒ infinitive
    = \stem -> case stem of {
      -- 하 ⇒ 해
      init + #ha => init + "해" ;
      -- 찾 ⇒ 찾아, 좁다 ⇒ 좁아
      _ + #a_o + #batchim => stem + "아" ;
      -- 가 ⇒ 가, 
      _ + (#a | #eo) => stem ;
      -- 오 ⇒ 와
      init + #o => init + "ᅪ" ;
      -- 따르 ⇒ 따라
      init@(_ + (#choseong + #a_o + (#batchim | "")))
	+ (c@#choseong + #eu)
	=> init + c + "ᅡ" ;
      -- 예쁘 ⇒ 예뻐, 크 ⇒ 커
      init + #eu => init + "ᅥ" ;
      -- 기다리 ⇒ 기다려
      init + #i => init + "ᅧ" ;
      -- 주 ⇒ 줘
      init + #u => init + "ᅯ" ;
      -- 맛있 ⇒ 맛있어
      _ => stem + "어"
    } ;

  oper
    a_o : pattern Str = #("ᅡ" | "ᅩ") ;
    a : pattern Str = #"ᅡ" ;
    o : pattern Str = #"ᅩ" ;
    eo : pattern Str = #"ᅥ" ;
    eu : pattern Str = #"ᅳ" ;
    i : pattern Str = #"ᅵ" ;
    u : pattern Str = #"ᅮ" ;
    ha : pattern Str = #"하" ;

  oper
    batchim : pattern Str =
      #("ᆨ" | "ᆩ" | "ᆪ" | "ᆫ" | "ᆬ" | "ᆭ" | "ᆮ" | "ᆯ" | "ᆰ"
          | "ᆱ" | "ᆲ" | "ᆳ" | "ᆴ" | "ᆵ" | "ᆶ" | "ᆷ" | "ᆸ" | "ᆹ"
          | "ᆺ" | "ᆻ" | "ᆼ" | "ᆽ" | "ᆾ" | "ᆿ" | "ᇀ" | "ᇁ" | "ᇂ") ;
    choseong : pattern Str =
      #("ᄀ" | "ᄁ" | "ᄂ" | "ᄃ" | "ᄄ" | "ᄅ" | "ᄆ" | "ᄇ" | "ᄈ"
          | "ᄉ" | "ᄊ" | "ᄋ" | "ᄌ" | "ᄍ" | "ᄎ" | "ᄏ" | "ᄐ" | "ᄑ"
          | "ᄒ") ;
    jungseong : pattern Str =
      #("ᅡ" | "ᅢ" | "ᅣ" | "ᅤ" | "ᅥ" | "ᅦ" | "ᅧ" | "ᅨ" | "ᅩ"
          | "ᅪ" | "ᅫ" | "ᅬ" | "ᅭ" | "ᅮ" | "ᅯ" | "ᅰ" | "ᅱ" | "ᅲ"
          | "ᅳ" | "ᅴ" | "ᅵ") ;
}
