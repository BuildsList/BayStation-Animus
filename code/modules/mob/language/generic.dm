// Noise "language", for audible emotes.
/datum/language/noise
	name = "Noise"
	desc = "Noises"
	key = ""
	flags = RESTRICTED|NONGLOBAL|INNATE|NO_TALK_MSG|NO_STUTTER

/datum/language/noise/format_message(message, verb)
	return "<span class='message'><span class='[colour]'>[message]</span></span>"

/datum/language/noise/format_message_plain(message, verb)
	return message

/datum/language/noise/format_message_radio(message, verb)
	return "<span class='[colour]'>[message]</span>"

/datum/language/noise/get_talkinto_msg_range(message)
	// if you make a loud noise (screams etc), you'll be heard from 4 tiles over instead of two
	return (copytext(message, length(message)) == "!") ? 4 : 2

// 'basic' language; spoken by default.
/datum/language/common
	name = LANGUAGE_GALCOM
	desc = "The common galactic tongue."
	speech_verb = "???????"
	whisper_verb = "??????"
	key = "0"
	flags = RESTRICTED
	syllables = list("blah","blah","blah","bleh","meh","neh","nah","wah")
	partial_understanding = list(LANGUAGE_SKRELLIAN = 30, LANGUAGE_SOL_COMMON = 30)
	shorthand = "GC"

// Otherwise we end up with Blahblehmeh Nehnahwahblah, Captain.
/datum/language/common/get_random_name(var/gender, name_count=2, syllable_count=4, syllable_divisor=2)
	return capitalize(pick(gender == FEMALE ? GLOB.first_names_female : GLOB.first_names_male)) + " " + capitalize(pick(GLOB.last_names))

//TODO flag certain languages to use the mob-type specific say_quote and then get rid of these.
/datum/language/common/get_spoken_verb(var/msg_end)
	if(msg_end == "!!")
		return pick("??????")
	else if(copytext(msg_end, length(msg_end)) == "!")
		return pick("??????????")
	else if(copytext(msg_end, length(msg_end)) == "?")
		return pick("??????????")
	return speech_verb

// Galactic common languages (systemwide accepted standards).
/datum/language/lunar
	name = LANGUAGE_LUNAR
	desc = "An older language primarily spoken on Earth's only natural satellite, this language is commonly heard from the mouths of aristocracy."
	speech_verb = "??????????"
	colour = "moon"
	key = "2"
	space_chance = 100
	syllables = list("lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit",
					 "sed", "do", "eiusmod", "tempor", "incididunt", "ut", "labore", "et", "dolore",
					 "magna", "aliqua", "ut", "enim", "ad", "minim", "veniam", "quis", "nostrud",
					 "exercitation", "ullamco", "laboris", "nisi", "ut", "aliquip", "ex", "ea", "commodo",
					 "consequat", "duis", "aute", "irure", "dolor", "in", "reprehenderit", "in",
					 "voluptate", "velit", "esse", "cillum", "dolore", "eu", "fugiat", "nulla",
					 "pariatur", "excepteur", "sint", "occaecat", "cupidatat", "non", "proident", "sunt",
					 "in", "culpa", "qui", "officia", "deserunt", "mollit", "anim", "id", "est", "laborum")
	partial_understanding = list(LANGUAGE_SOL_COMMON = 10)
	shorthand = "SL"

// Criminal language.
/datum/language/gutter
	name = "Gutter"
	desc = "Much like Common, this crude pidgin tongue descended from numerous languages and serves as a trade language for criminal elements."
	speech_verb = "???????"
	colour = "rough"
	key = "3"
	syllables = list ("gra","ba","ba","breh","bra","rah","dur","ra","ro","gro","go","ber","bar","geh","heh", "gra")
	partial_understanding = list(LANGUAGE_GALCOM = 10, LANGUAGE_INDEPENDENT = 20, LANGUAGE_SOL_COMMON = 20)
	shorthand = "GT"

/datum/language/sign
	name = LANGUAGE_SIGN
	desc = "A sign language commonly used for those who are deaf or mute."
	signlang_verb = list("?????????????")
	colour = "say_quote"
	key = "s"
	flags = SIGNLANG | NO_STUTTER | NONVERBAL
	shorthand = "HS"

/datum/language/legal
	name = LANGUAGE_LEGALESE
	desc = "A cryptic language used by interstellar bureaucrats and lawyers."
	speech_verb = "states"
	exclaim_verb = "objects"
	ask_verb = "inquiries"
	space_chance = 100
	key = "u"
	syllables = list("hitherto","whereof","hereunto","deed","hereinbefore","whereas","consensus","nonwithstanding","exonerated","effecuate","accord","caveat", "stipulation", "pledgee", "covenant", "rights", "lawful", "suit of law", "sequestrator", "et al", "et", "ex", "quid", "bono","quo","pro","ad")
	partial_understanding = list(LANGUAGE_GALCOM = 20, LANGUAGE_SKRELLIAN = 10)