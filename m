Subject: Re: Possible changes to the project docs
To: docs@lists.yoctoproject.org
From: "Mark Van De Vyver" <mark@taqtiqa.com>
X-Originating-Location: Hurstville, New South Wales, AU (115.69.5.21)
X-Originating-Platform: Linux Firefox 76
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 27 May 2020 22:49:11 -0700
References: <CAP71WjzD-AMauxpgbydY2fryU6+JU599UPRPXi_c582WvvfV6w@mail.gmail.com>
In-Reply-To: <CAP71WjzD-AMauxpgbydY2fryU6+JU599UPRPXi_c582WvvfV6w@mail.gmail.com>
Message-ID: <18306.1590644951892762393@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="l0TaGEe2Mf4dC1eS9Pv2"

--l0TaGEe2Mf4dC1eS9Pv2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hmm, it seems the interwebs ate my prior message.=C2=A0=C2=A0 TLDR;

Considering AsciiDoc, MkDoc-Materialize, Docusarus, Sphinx and Antora

* A switch from DocBook is a net benefit regardless of what you switch too=
.
* Making docs more accessible to dev and user contributors is the key.
* I regard ascidoc/md/rst as near enough that they don't swing the decisio=
n - in terms of being approachable to devs and users.
* A potential discriminator is l10n/i18n - on the face of it they all seem=
 to be imperfect (wip) and adequate.
* Is there any other strategic benefit to be obtained?

I think so.=C2=A0 Looking at https://antora.org/ this stands out:
*The ability to retrieve and aggregate all the content from different git =
repositories.*

This provides the following headroom:
* Move documentation into the repo that holds the related code.=C2=A0 Brin=
ging documentation closer to devs who are more likely to write some prelimi=
nary documentation and correct documentation errors/ambiguities.
* Allow individual repo's/tools to evolve at their own pace - a release th=
at repo/tool X would like to make 'yesterday' can be made and everyone can =
be confident the docs are still consistent (assumes that tool/repo-Y does n=
ot make any statements about tool/repo-X in the Y-docs)
* Allow the project to treat a repo as a 1st class citizen even if it is n=
ot under the openembedded.org or yoctoproject.org
* Corollary: Allow any repo outside of openembedded.org or yoctoproject.or=
g to incorporate whichever of the tools/repos they need (git cloning & fork=
ing model allows/encourages that) and present documentation that is integra=
ted and targeted (Antora could - eventually - allow/encourage that).
* Give the Yocto-project flexibility in how to organize itself going forwa=
rd - documentation is not an impediment.

Of course there is a learning curve and the docs need to be refactored bac=
k to their home tool/repo.
To my mind there is a categorical distinction that can be made between the=
 DocBook alternatives.

The questions is whether any of the above conjectures are of value or attr=
active?

HTH?
--
Kind regards
Mark

Mark Van de Vyver, B.Bus(Hons), PhD(Dist)

--l0TaGEe2Mf4dC1eS9Pv2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hmm, it seems the interwebs ate my prior message.&nbsp;&nbsp; TLDR;<br /><b=
r />Considering AsciiDoc, MkDoc-Materialize, Docusarus, Sphinx and Antora<b=
r /><br />* A switch from DocBook is a net benefit regardless of what you s=
witch too.<br />* Making docs more accessible to dev and user contributors =
is the key. <br />* I regard ascidoc/md/rst as near enough that they don't =
swing the decision - in terms of being approachable to devs and users.<br /=
>* A potential discriminator is l10n/i18n - on the face of it they all seem=
 to be imperfect (wip) and adequate.<br />* Is there any other strategic be=
nefit to be obtained?<br /><br />I think so.&nbsp; Looking at <a href=3D"ht=
tps://antora.org/" target=3D"_blank" rel=3D"noopener">https://antora.org/</=
a> this stands out:<br /><em><strong>The ability to retrieve and aggregate =
all the content from different git repositories.</strong></em><br /><br />T=
his provides the following headroom:<br />* Move documentation into the rep=
o that holds the related code.&nbsp; Bringing documentation closer to devs =
who are more likely to write some preliminary documentation and correct doc=
umentation errors/ambiguities.<br />* Allow individual repo's/tools to evol=
ve at their own pace - a release that repo/tool X would like to make 'yeste=
rday' can be made and everyone can be confident the docs are still consiste=
nt (assumes that tool/repo-Y does not make any statements about tool/repo-X=
 in the Y-docs) <br />* Allow the project to treat a repo as a 1st class ci=
tizen even if it is not under the openembedded.org or yoctoproject.org<br /=
>* Corollary: Allow any repo outside of openembedded.org or yoctoproject.or=
g to incorporate whichever of the tools/repos they need (git cloning &amp; =
forking model allows/encourages that) and present documentation that is int=
egrated and targeted (Antora could - eventually - allow/encourage that).<br=
 />* Give the Yocto-project flexibility in how to organize itself going for=
ward - documentation is not an impediment.<br /><br />Of course there is a =
learning curve and the docs need to be refactored back to their home tool/r=
epo.<br />To my mind there is a categorical distinction that can be made be=
tween the DocBook alternatives.<br /><br />The questions is whether any of =
the above conjectures are of value or attractive?<br /><br />HTH?<br />-- <=
br />
<div>Kind regards</div>
<div>Mark</div>
<div>&nbsp;</div>
<div>Mark Van de Vyver, B.Bus(Hons), PhD(Dist)</div>

--l0TaGEe2Mf4dC1eS9Pv2--
