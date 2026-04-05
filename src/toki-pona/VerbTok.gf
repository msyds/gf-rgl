concrete VerbTok of Verb = CatTok ** open ResTok, AdverbTok, Prelude, ParamX in {


lin

-----
-- VP
  -- : V -> VP
  -- NB. assumes that lincat V = lincat VP
  -- This will most likely change when you start working with VPs
  UseV v = {
    s = table {
      Pos => v.s ;
      Neg => v.s ++ "ala"
      } ;
    } ;

  --  : V2 -> VP ;
  -- PassV2 v2 =

  -- : VPSlash -> VP ;
  ReflVP vps = vps ;

  -- : VV  -> VP -> VP ;
  ComplVV vv vp = { s = \\p => vv.s ++ vp.s ! p ;} ;

{-
  -- : VS  -> S  -> VP ;
  ComplVS vs s =

  -- : VQ -> QS -> VP ;
  ComplVQ vq qs =

  -- : VA -> AP -> VP ;
  ComplVA va ap =

  -- : Comp -> VP ;
  UseComp comp =
-}
--------
-- Slash
  -- : V2 -> VPSlash
  SlashV2a = \v2 -> {
    s = table {
      Pos => v2.s ;
      Neg => v2.s ++ "ala"
      } ;
    } ;

  -- : V3 -> NP -> VPSlash ; -- give it (to her)
  -- Slash2V3 v3 dobj =

  -- : V3 -> NP -> VPSlash ; -- give (it) to her
  -- Slash3V3 v3 iobj =

  -- SlashV2A v2 adj =

  -- : V2S -> S  -> VPSlash ;  -- answer (to him) that it is good
  -- SlashV2S v2s s =

  -- : V2V -> VP -> VPSlash ;  -- beg (her) to go
  -- SlashV2V v2v vp = ;

  -- : V2Q -> QS -> VPSlash ;  -- ask (him) who came
  -- SlashV2Q v2q qs = ;

  -- : V2A -> AP -> VPSlash ;  -- paint (it) red
  -- SlashV2A v2a ap = ;


  -- : VPSlash -> NP -> VP
  -- Often VPSlash has a field called c2, which is used to pick right form of np complement
  ComplSlash vps np = {
    s = \\p => vps.s ! p ++ "e" ++ np.s
    } ;

  -- : VV  -> VPSlash -> VPSlash ;
  SlashVV vv vps = ComplVV vv vps;

  -- : V2V -> NP -> VPSlash -> VPSlash ; -- beg me to buy
  -- SlashV2VNP v2v np vps =

  -- : VP -> Adv -> VP ;  -- sleep here
  AdvVP vp adv = {
    s = \\p => vp.s ! p ++ adv.s ;
    } ;

  -- : AdV -> VP -> VP ;  -- always sleep
  -- AdVVP adv vp =

  -- : VPSlash -> Adv -> VPSlash ;  -- use (it) here
  -- AdvVPSlash = insertAdv ;

  -- : VP -> Adv -> VP ;  -- sleep , even though ...
  -- ExtAdvVP vp adv =  ;

  -- : AdV -> VPSlash -> VPSlash ;  -- always use (it)
  -- AdVVPSlash adv vps = vps ** { adv = adv.s ++ vps.adv } ;

  -- : VP -> Prep -> VPSlash ;  -- live in (it)
  VPSlashPrep vp prep = {
    s = \\p => vp.s ! p ++ prep.s
    } ;


--2 Complements to copula

-- Adjectival phrases, noun phrases, and adverbs can be used.

  -- : AP  -> Comp ;
  -- CompAP ap =

  -- : CN  -> Comp ;
  -- CompCN cn =

  --  NP  -> Comp ;
  -- CompNP np =

  -- : Adv  -> Comp ;
  -- CompAdv adv =

  -- : VP -- Copula alone;
  -- UseCopula =

}
