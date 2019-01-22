#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/northern_cyprus_parliament_wikipedia', column: 'wikiname')

tr_names = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://tr.wikipedia.org/wiki/KKTC_Cumhuriyet_Meclisi_8._d%C3%B6nem_milletvekilleri_listesi',
  xpath: '//table[.//th[contains(.,"Milletvekili")]]//td//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names, tr: tr_names })
