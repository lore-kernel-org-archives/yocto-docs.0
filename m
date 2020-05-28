Subject: Documentation Linter
To: docs@lists.yoctoproject.org
From: "Mark Van De Vyver" <mark@taqtiqa.com>
X-Originating-Location: Hurstville, New South Wales, AU (115.69.5.21)
X-Originating-Platform: Linux Firefox 76
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 27 May 2020 21:00:12 -0700
Message-ID: <XszS.1590638412302404292.hla4@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="6fyynamjzGWhGX8t3Pzt"

--6fyynamjzGWhGX8t3Pzt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
As mentioned in my previous message - which hasn't shown up yet - I'm new =
to Yocto and thought to try contribute via the docs.
I've made my comment on the conversion from DocBook, and this proposal wil=
l be impacted by that effort - hopefully a part of the conversion, and in a=
 way that does not block or interfere.

The idea I had was to introduce a prose linting tool.=C2=A0 Specifically, =
[Vale](https://errata-ai.gitbook.io/vale/).

Before going into the details, lets first establish if any of the followin=
g would be of use/value?

It would allow the project to achieve some consistency across paragraphs/p=
ages/documents/repositories.
This would become more important if the project decided to exploit [Antora=
's](https://antora.org) ability to create a document from different reposit=
ories.
In such a case a repo could ensure its documentation had a closer 'fit' wi=
thin the wider project documentation by ensuring it passed the same lint se=
ttings.
After the inital run/port is complete the documentation lint step could be=
 added to the githooks that verify any new commit is green.

Thoughts?
--
Kind regards
Mark

Mark Van de Vyver, B.Bus(Hons), PhD(Dist)

--6fyynamjzGWhGX8t3Pzt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br />As mentioned in my previous message - which hasn't shown up yet - =
I'm new to Yocto and thought to try contribute via the docs.<br />I've made=
 my comment on the conversion from DocBook, and this proposal will be impac=
ted by that effort - hopefully a part of the conversion, and in a way that =
does not block or interfere.<br /><br />The idea I had was to introduce a p=
rose linting tool.&nbsp; Specifically, [Vale](https://errata-ai.gitbook.io/=
vale/).<br /><br />Before going into the details, lets first establish if a=
ny of the following would be of use/value?<br /><br />It would allow the pr=
oject to achieve some consistency across paragraphs/pages/documents/reposit=
ories.<br />This would become more important if the project decided to expl=
oit [Antora's](https://antora.org) ability to create a document from differ=
ent repositories.<br />In such a case a repo could ensure its documentation=
 had a closer 'fit' within the wider project documentation by ensuring it p=
assed the same lint settings.<br />After the inital run/port is complete th=
e documentation lint step could be added to the githooks that verify any ne=
w commit is green.<br /><br />Thoughts?<br />-- <br />
<div>Kind regards</div>
<div>Mark</div>
<div>&nbsp;</div>
<div>Mark Van de Vyver, B.Bus(Hons), PhD(Dist)</div>

--6fyynamjzGWhGX8t3Pzt--
