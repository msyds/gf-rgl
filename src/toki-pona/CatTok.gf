--# -path=.:../abstract:../common:../prelude
concrete CatTok of Cat = CommonX ** open ResTok, Coordination, Prelude in {

  flags optimize=all_subs ;

  lincat

--2 Sentences and clauses
-- Constructed in SentenceTok, and also in IdiomTok
    S  = SS ;
    QS = SS ;
    RS = SS ;
    -- relative sentence. Tense and polarity fixed,
    -- but agreement may depend on the CN/NP it modifies.

    Cl = ResTok.LinCl ;
    ClSlash = SS ;
    SSlash  = SS ; -- sentence missing NP; e.g. "she has looked at"
    Imp     = SS ; -- imperative             e.g. "look at this"

--2 Questions and interrogatives

-- Constructed in QuestionTok.
    QCl = SS ;
    IComp = SS ;   -- interrogative complement of copula  e.g. "where"
    IDet = SS ;    -- interrogative determiner            e.g. "how many"
    IQuant = SS ;  -- interrogative quantifier            e.g. "which"
    IP = SS ;      -- interrogative pronoun               e.g. "who"

--2 Subord clauses and pronouns

    RCl = SS ;
    RP = SS ;

--2 Verb phrases

-- Constructed in VerbTok.
    VP = ResTok.LinVP ;
    VPSlash = SS ;
    Comp = SS ;

--2 Adjectival phrases

-- Constructed in AdjectiveTok.
    AP = SS ;

--2 Nouns and noun phrases

-- Constructed in NounTok.
-- Many atomic noun phrases e.g. "everybody"
-- are constructed in StructuralTok.

    CN = ResTok.LinCN ;
    NP = ResTok.LinNP ;
    -- NB. Pronouns need enough info to become NP or Quant.
    Pron = ResTok.LinPron ;
    Det = ResTok.LinDet ; -- s : Str , n : Number
    Predet = SS ;
    Quant = ResTok.LinQuant ; -- s : Number => Str
    Num = ResTok.LinDet ;
    Card = ResTok.LinDet ;
    ACard = SS ;
    Ord = SS ;
    DAP = SS ;


--2 Numerals

-- Constructed in NumeralTok.

    Numeral = ResTok.LinNumeral ;
    Digits = ResTok.LinNumeral ;
    Decimal = SS ;

--2 Structural words

-- Constructed in StructuralTok.
    Conj = Coordination.ConjunctionDistr ;
    Subj = SS ;
    Prep = SS ;



--2 Words of open classes

-- These are constructed in LexiconTok and in
-- additional lexicon modules.

    -- TODO: eventually different lincats
    VS,    -- sentence-complement verb            e.g. "claim"
    VQ,    -- question-complement verb            e.g. "wonder"
    VA,    -- adjective-complement verb           e.g. "look"
    V = ResTok.LinV ;

    VV     -- verb-phrase-complement verb         e.g. "want"
      = SS ;

    V2A,   -- verb with NP and AP complement      e.g. "paint"
    V2V,   -- verb with NP and V complement       e.g. "cause"
    V2S,   -- verb with NP and S complement       e.g. "tell"
    V2Q,   -- verb with NP and Q complement       e.g. "ask"
    V2 = SS ;
    V3 = SS ;

    A = SS ;
    A2  = SS ;

    N = ResTok.LinN ;
    N2 = ResTok.LinN ;
    N3 = ResTok.LinN ;
    PN = ResTok.LinPN ;

    -- From the Names module, not in the official API as of 2023-08
    GN = SS ; -- Given name,    e.g. "George"
    SN = SS ; -- Second name,   e.g. "Washington"
    LN = SS ; -- Location name, e.g. "Sweden"

  linref
    Cl = linCl ;

}
