Subject: Re: Possible changes to the project docs
To: docs@lists.yoctoproject.org
From: "Mark Van De Vyver" <mark@taqtiqa.com>
X-Originating-Location: Hurstville, New South Wales, AU (115.69.5.21)
X-Originating-Platform: Linux Firefox 76
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 31 May 2020 18:19:50 -0700
References: <CAP71WjxpZAVr8VeGv3AiRiGFscTJsRGDT6KJBaP0TEDfzUHzNQ@mail.gmail.com>
In-Reply-To: <CAP71WjxpZAVr8VeGv3AiRiGFscTJsRGDT6KJBaP0TEDfzUHzNQ@mail.gmail.com>
Message-ID: <8542.1590974390362398634@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="pk06m2jLuaGKBCNI8dzk"

--pk06m2jLuaGKBCNI8dzk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 12:54 AM, Nicolas Dechesne wrote:

>=20
> hi Mark,
>=20
> thanks a lot for joining the discussion! This is very helpful and much
> appreciated.
>=20
> On Thu, May 28, 2020 at 7:49 AM Mark Van De Vyver < mark@taqtiqa.com >
> wrote:
>=20
>> Hmm, it seems the interwebs ate my prior message.=C2=A0=C2=A0 TLDR;
>=20
>=20
> I believe you replied privately to me, your message is not lost and is i=
n
> good hands , well mine ;)
>=20
>=20
>> Considering AsciiDoc, MkDoc-Materialize, Docusarus, Sphinx and Antora
>>=20
>> * A switch from DocBook is a net benefit regardless of what you switch
>> too.
>> * Making docs more accessible to dev and user contributors is the key.
>> * I regard ascidoc/md/rst as near enough that they don't swing the
>> decision - in terms of being approachable to devs and users.
>=20
>=20
>> * A potential discriminator is l10n/i18n - on the face of it they all s=
eem
>> to be imperfect (wip) and adequate.
>=20
>=20
> We don't have plans for that now, even if it might be a good thing for t=
he
> project, I think we struggle enough with one language today.
>=20
>=20

Agreed.
Unless there is a group dedicated to a translation, it would only make sen=
se to restrict the translation to some automated service - google translate=
 at worse or some thing like Transifex. Transifex offer a freelicense to "T=
ransifex for free to Open Source projects ( http://docs.transifex.com/faq/#=
what-is-considered-an-open-source-project ) that have no funding, revenue, =
and/or commercialization model".=C2=A0 Not clear if we qualify for that.
The question is whether the cost of a 'rough' translation is worth the ben=
efit of new users who are technically profficient but whose English is not =
at a level to grok the docs fully.
Thinking here of the proverbial 14yo who has just got board/device xyz and=
 stumbles upon yoctoproject.org.

>=20
>=20
>=20
>> * Is there any other strategic benefit to be obtained?
>=20
> The main goal is to ensure documentation is 'easier' to read and write,
> encouraging more contributors, while keeping the reputation of the quali=
ty
> of the project's documentation.
>=20
>=20
>> I think so.=C2=A0 Looking at https://antora.org/ this stands out:
>> *The ability to retrieve and aggregate all the content from different g=
it
>> repositories.*
>=20
>=20
> I think there are 2 sides to the problem:
> 1. the format of the documentation: DocBook (XML) vs reST vs Asciidoc. I
> think it's well accepted that Markdown is 'not enough' for large tech
> documentation/book
>=20
>=20

MD is ruled out, to my mind, by the lack of multi-repo support;
However it is worth noting the scope of the syntax/functionality should be=
 sufficient - is see here ( https://cloudflow.io/docs/current ) for a large=
r project and here ( https://jlenv.github.io/jlenv ) for my Julia port of r=
benv (devs here might be familiar with the Python port of rbenv).
Hence, I would argue that, which ever of asciidoc or rst is used, we encou=
rage users employ to a subset of the syntax to keep the docs simple and mai=
ntainable.
AFAICT we're not dealing Julia or Linux graphics code levels of complexity=
.=C2=A0 Happy to be corrected.

>=20
> 2. the tools available to process the documentation (sphinx, asciidoctor=
,
> antora.. ). Antora is a toolset on top of Asciidoc.
>=20
> The main reasons why we've started to explore/experiment with reST/Sphin=
x
> (as opposed to Asciidoc) are:
> 1. this is what Python uses, and our project is intimately=C2=A0linked t=
o
> Python. Sphinx can be extended with plugins in Python, and we have very
> capable Python developers around here.
>=20
>=20

Developer productivity is key.
I'd argue constraining to tool X's functionality.
Again, I'm happy to be wrong, yet AFAICT there shouldn't be a level of com=
plexity in this projects documentation requirements that exceeds these tool=
s.

>=20
> 2. we've closely studied what happened in the Linux kernel community, an=
d
> their thought process when they moved away from Docbook a couple of year=
s
> ago, which is nicely summarized in the following articles:
> https://lwn.net/Articles/671496/
> https://lwn.net/Articles/692704/
> https://lwn.net/Articles/692705/
> Even though the initial plan was to move from Docbook to Asciidoc, they
> ended up using reST/Sphinx in the end. Given the proximity of the YP and
> kernel communities, we should pay close attention to what they've done.
>=20
>=20

Agreed - I read that transition slightly differently: The kernel doc tooli=
ng was imperfect but generally tenable.=C2=A0 The Linux graphics code base =
complexity made the docs untenable, and forced an alternative to be sought.=
 Once the graphics code base needs were satisfied it obviously made sense t=
o standardize.=C2=A0 Just as Julia has use cases of that compexity.
Are we really dealing with that level of difficulty (as disctinct from ver=
y elborate/long chains of scripts/routines - each conceptually relatively s=
traightword in isloation).

>=20
>=20
> That said, no decision has been made, Sphinx is just the first proof of
> concept which have=C2=A0been made. So now is definitely the right time t=
o
> discuss all options!
>=20
>=20

Great. So I spent some time digging further (See Transifex note above)...

>=20
>=20
>> This provides the following headroom:
>> * Move documentation into the repo that holds the related code.=C2=A0 B=
ringing
>> documentation closer to devs who are more likely to write some prelimin=
ary
>> documentation and correct documentation errors/ambiguities.
>=20
> I agree that the project documentation would benefit from some inline
> documentation. Not for everything, but maybe for classes, variables,
> functions, it would be easier to maintain if the documentation was
> 'closer' to the doc. The kernel documentation uses a mix of inline doc v=
s
> separate doc already (with sphinx).
>=20

Agreed. Pretty much every tool can handle some level of rendering inline d=
ocs that should be adequate.
What Antora allows is doc sharing between repos, and AFAICT, Sphinx doesn'=
t provide that headroom.

>=20
>=20
>=20
>=20
>> * Allow individual repo's/tools to evolve at their own pace - a release
>> that repo/tool X would like to make 'yesterday' can be made and everyon=
e
>> can be confident the docs are still consistent (assumes that tool/repo-=
Y
>> does not make any statements about tool/repo-X in the Y-docs)
>> * Allow the project to treat a repo as a 1st class citizen even if it i=
s
>> not under the openembedded.org ( http://openembedded.org ) or yoctoproj=
ect.org
>> ( http://yoctoproject.org )
>=20
> I don't think there is such a concept of a 1st class citizen. The
> Openembedded ecosystem is made of a very large amount of layers, and onl=
y
> a minority of layers are hosted on oe.org ( http://oe.org ) or yp.org (
> http://yp.org ). I believe that all layers are treated equally, as soon =
as
> they are listed/added to the OE layer index maybe.
>=20
>=20

Yet such layers cannot present integrated documentation.
Lets take a concrete existing example:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/tree/?h=3Ddunfell

Ideally there would be a way for that project to present their (currently)=
 secondary documentation (assume the eight (8) md files are ported to which=
 ever syntax or rst or asciidoc) integrated with the yocto/oe parts of thei=
r documentation.=C2=A0 Even if this is only for some group internal documen=
t portal or readthedocs or some such portal.
In fact on the dunfell branch the current DOCUMENTATION.md suggests a Anto=
ra " playbook ( https://docs.antora.org/antora/2.2/playbook/ ) " (untested)=
:

site:
 title: Layer XYZ Documentation

content:
 sources:
 - url: .
   branches: dunfell
   start_path: documentation/introduction - url: git://git.yoctoproject.or=
g/poky.git branches: - dunfell start_path: documentation/overview-manual - =
url: git://git.yoctoproject.org/poky.git branches: - dunfell start_path: do=
cumentation/ brief-yoctoprojectqs ( http://git.yoctoproject.org/cgit/cgit.c=
gi/poky/tree/documentation/brief-yoctoprojectqs?h=3Ddunfell )
 - url: git://git.yoctoproject.org/poky.git branches: - dunfell start_path=
: documentation/ toaster-manual ( http://git.yoctoproject.org/cgit/cgit.cgi=
/poky/tree/documentation/brief-yoctoprojectqs?h=3Ddunfell )
 - url: git://git.yoctoproject.org/poky.git branches: - dunfell start_path=
: documentation/ sdk-manual ( http://git.yoctoproject.org/cgit/cgit.cgi/pok=
y/tree/documentation/brief-yoctoprojectqs?h=3Ddunfell )
output: clean: true dir: public=20
Take a second concrete example:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi

The proverbial 12-14yo with a board now has three sets of documentation to=
 contend with (following the README.md):
1. https://meta-raspberrypi.readthedocs.io
2. Yocto/OE
3. raspberrypi.org

>=20
>=20
>=20
>> * Corollary: Allow any repo outside of openembedded.org (
>> http://openembedded.org ) or yoctoproject.org ( http://yoctoproject.org=
 ) to
>> incorporate whichever of the tools/repos they need (git cloning & forki=
ng
>> model allows/encourages that) and present documentation that is integra=
ted
>> and targeted (Antora could - eventually - allow/encourage that).
>=20
>=20
> The YP documentation 'project' is about publishing documentation for wha=
t
> makes up the Yocto Project (OE-core, bitbake, ..).
>=20

Agreed. I suppose I'm arguing the project specific elements of the documen=
tation (i.e not reusable by/of interest to a repo/layer) could (ideally) be=
 limited to page header, footer and brand image detail - everything else co=
uld be reusable by layers as they think best fits their userbase/audience.

>=20
> The current Docbook structure is probably too complex (learning curve) t=
o
> be adopted in other layers. So anything we could improve to make it
> simpler for other layers to benefit from doc infrastructure would be a
> nice bonus.
>=20
>=20
>> * Give the Yocto-project flexibility in how to organize itself going
>> forward - documentation is not an impediment.
>>=20
>> Of course there is a learning curve and the docs need to be refactored
>> back to their home tool/repo.
>> To my mind there is a categorical distinction that can be made between =
the
>> DocBook alternatives.
>=20
>=20
> Can you provide more information about what Antora vs
> Asciidoc/asciidoctor?
>=20
>=20

Personally I've never encountered the need use asciidoc. Until now - I'll =
likely refactor the github.com/jlenv org documents so that each repo's docu=
mentation is pulled into a whole under jlenv.github.io/.
My understanding Antora builds on asciidoctor.js.
I'd argue for whichever tool is used: Project and layer docs should limit =
themselves to that tools built-in functionality - patching a doc tool detra=
cts dev cycles.
I'd argue to limit documentation to what is effectively the markdown level=
 of functionality - but layer/repo maintainers are best placed to make this=
 call.

Kind regards
Mark

>=20
>=20
>=20
>> The questions is whether any of the above conjectures are of value or
>> attractive?
>>=20
>> HTH?
>> --
>> Kind regards
>> Mark
>>=20
>> Mark Van de Vyver, B.Bus(Hons), PhD(Dist)
>>=20
>=20
>=20

--
Kind regards
Mark

Mark Van de Vyver, B.Bus(Hons), PhD(Dist)

--pk06m2jLuaGKBCNI8dzk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 12:54 AM, Nicolas Dechesne wrote:<br />
<blockquote>
<div dir=3D"ltr">
<div>hi Mark,</div>
<div>&nbsp;</div>
<div>thanks a lot for joining the discussion! This is very helpful and muc=
h appreciated.</div>
<br />
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">On Thu, May 28, 2020 at 7:49 AM Mark=
 Van De Vyver &lt;<a href=3D"mailto:mark@taqtiqa.com">mark@taqtiqa.com</a>&=
gt; wrote:</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">Hmm, it seems the interwebs=
 ate my prior message.&nbsp;&nbsp; TLDR;</blockquote>
<div>&nbsp;</div>
<div>I believe you replied privately to me, your message is not lost and i=
s in good hands , well mine ;)&nbsp;</div>
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">Considering AsciiDoc, MkDoc=
-Materialize, Docusarus, Sphinx and Antora<br /><br />* A switch from DocBo=
ok is a net benefit regardless of what you switch too.<br />* Making docs m=
ore accessible to dev and user contributors is the key. <br />* I regard as=
cidoc/md/rst as near enough that they don't swing the decision - in terms o=
f being approachable to devs and users.&nbsp;</blockquote>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">* A potential discriminator=
 is l10n/i18n - on the face of it they all seem to be imperfect (wip) and a=
dequate.</blockquote>
<div>&nbsp;</div>
<div>We don't have plans for that now, even if it might be a good thing fo=
r the project, I think we struggle enough with one language today.&nbsp;</d=
iv>
<div>&nbsp;</div>
</div>
</div>
</blockquote>
Agreed. <br />Unless there is a group dedicated to a translation, it would=
 only make sense to restrict the translation to some automated service - go=
ogle translate at worse or some thing like Transifex. Transifex offer a fre=
elicense to "Transifex for free to&nbsp;<a href=3D"http://docs.transifex.co=
m/faq/#what-is-considered-an-open-source-project" target=3D"_blank" rel=3D"=
noopener">Open Source projects</a>&nbsp;that have no funding, revenue, and/=
or commercialization model".&nbsp; Not clear if we qualify for that.<br />T=
he question is whether the cost of a 'rough' translation is worth the benef=
it of new users who are technically profficient but whose English is not at=
 a level to grok the docs fully.<br />Thinking here of the proverbial 14yo =
who has just got board/device xyz and stumbles upon yoctoproject.org.<br />=
<br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">* Is there any other strate=
gic benefit to be obtained?</blockquote>
<div>The main goal is to ensure documentation is 'easier' to read and writ=
e, encouraging more contributors, while keeping the reputation of the quali=
ty of the project's documentation.&nbsp;</div>
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">I think so.&nbsp; Looking a=
t <a href=3D"https://antora.org/" target=3D"_blank" rel=3D"noopener">https:=
//antora.org/</a> this stands out:<br /><em><strong>The ability to retrieve=
 and aggregate all the content from different git repositories.</strong></e=
m></blockquote>
<div>&nbsp;</div>
<div>
<div>I think there are 2 sides to the problem:</div>
<div>1. the format of the documentation: DocBook (XML) vs reST vs Asciidoc=
. I think it's well accepted that Markdown is 'not enough' for large tech d=
ocumentation/book</div>
<div>&nbsp;</div>
</div>
</div>
</div>
</blockquote>
MD is ruled out, to my mind, by the lack of multi-repo support; <br />Howe=
ver it is worth noting the scope of the syntax/functionality should be suff=
icient - is see <a href=3D"https://cloudflow.io/docs/current" target=3D"_bl=
ank" rel=3D"noopener">here</a> for a larger project and <a href=3D"https://=
jlenv.github.io/jlenv" target=3D"_blank" rel=3D"noopener">here</a> for my J=
ulia port of rbenv (devs here might be familiar with the Python port of rbe=
nv).<br />Hence, I would argue that, which ever of asciidoc or rst is used,=
 we encourage users employ to a subset of the syntax to keep the docs simpl=
e and maintainable.<br />AFAICT we're not dealing Julia or Linux graphics c=
ode levels of complexity.&nbsp; Happy to be corrected.<br /><br /><br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>
<div>2. the tools available to process the documentation (sphinx, asciidoc=
tor, antora.. ). Antora is a toolset on top of Asciidoc.&nbsp;</div>
</div>
<div>&nbsp;</div>
<div>The main reasons why we've started to explore/experiment with reST/Sp=
hinx (as opposed to Asciidoc) are:</div>
<div>1. this is what Python uses, and our project is intimately&nbsp;linke=
d to Python. Sphinx can be extended with plugins in Python, and we have ver=
y capable Python developers around here.</div>
<div>&nbsp;</div>
</div>
</div>
</blockquote>
Developer productivity is key.&nbsp; <br />I'd argue constraining to tool =
X's functionality. <br />Again, I'm happy to be wrong, yet AFAICT there sho=
uldn't be a level of complexity in this projects documentation requirements=
 that exceeds these tools.<br /><br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>2. we've closely studied what happened in the Linux kernel community,=
 and their thought process when they moved away from Docbook a couple of ye=
ars ago, which is nicely summarized in the following articles:</div>
<div><a href=3D"https://lwn.net/Articles/671496/">https://lwn.net/Articles=
/671496/</a>&nbsp;</div>
<div><a href=3D"https://lwn.net/Articles/692704/">https://lwn.net/Articles=
/692704/</a></div>
<div><a href=3D"https://lwn.net/Articles/692705/">https://lwn.net/Articles=
/692705/</a></div>
<div>Even though the initial plan was to move from Docbook to Asciidoc, th=
ey ended up using reST/Sphinx in the end. Given the proximity of the YP and=
 kernel communities, we should pay close attention to what they've done.</d=
iv>
<div>&nbsp;</div>
</div>
</div>
</blockquote>
Agreed - I read that transition slightly differently: The kernel doc tooli=
ng was imperfect but generally tenable.&nbsp; The Linux graphics code base =
complexity made the docs untenable, and forced an alternative to be sought.=
 Once the graphics code base needs were satisfied it obviously made sense t=
o standardize.&nbsp; Just as Julia has use cases of that compexity.<br />Ar=
e we really dealing with that level of difficulty (as disctinct from very e=
lborate/long chains of scripts/routines - each conceptually relatively stra=
ightword in isloation).<br /><br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>&nbsp;</div>
<div>That said, no decision has been made, Sphinx is just the first proof =
of concept which have&nbsp;been made. So now is definitely the right time t=
o discuss all options!</div>
<div>&nbsp;</div>
</div>
</div>
</blockquote>
Great. So I spent some time digging further (See Transifex note above)...<=
br /><br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">This provides the following=
 headroom:<br />* Move documentation into the repo that holds the related c=
ode.&nbsp; Bringing documentation closer to devs who are more likely to wri=
te some preliminary documentation and correct documentation errors/ambiguit=
ies.</blockquote>
<div>I agree that the project documentation would benefit from some inline=
 documentation. Not for everything, but maybe for classes, variables, funct=
ions, it would be easier to maintain if the documentation was 'closer' to t=
he doc. The kernel documentation uses a mix of inline doc vs separate doc a=
lready (with sphinx).</div>
</div>
</div>
</blockquote>
Agreed. Pretty much every tool can handle some level of rendering inline d=
ocs that should be adequate.<br />What Antora allows is doc sharing between=
 repos, and AFAICT, Sphinx doesn't provide that headroom.<br /><br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>&nbsp;</div>
<div>&nbsp;&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">* Allow individual repo's/t=
ools to evolve at their own pace - a release that repo/tool X would like to=
 make 'yesterday' can be made and everyone can be confident the docs are st=
ill consistent (assumes that tool/repo-Y does not make any statements about=
 tool/repo-X in the Y-docs) <br />* Allow the project to treat a repo as a =
1st class citizen even if it is not under the <a href=3D"http://openembedde=
d.org" target=3D"_blank" rel=3D"noopener">openembedded.org</a> or <a href=
=3D"http://yoctoproject.org" target=3D"_blank" rel=3D"noopener">yoctoproje=
ct.org</a></blockquote>
<div>I don't think there is such a concept of a 1st class citizen. The Ope=
nembedded ecosystem is made of a very large amount of layers, and only a mi=
nority of layers are hosted on <a href=3D"http://oe.org">oe.org</a> or <a h=
ref=3D"http://yp.org">yp.org</a>. I believe that all layers are treated equ=
ally, as soon as they are listed/added to the OE layer index maybe.&nbsp;</=
div>
<div>&nbsp;</div>
</div>
</div>
</blockquote>
Yet such layers cannot present integrated documentation.&nbsp;<br />Lets t=
ake a concrete existing example:<br /><a href=3D"http://git.yoctoproject.or=
g/cgit/cgit.cgi/meta-amd/tree/?h=3Ddunfell" target=3D"_blank" rel=3D"noopen=
er">http://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/tree/?h=3Ddunfell</a=
><br /><br />Ideally there would be a way for that project to present their=
 (currently) secondary documentation (assume the eight (8) md files are por=
ted to which ever syntax or rst or asciidoc) integrated with the yocto/oe p=
arts of their documentation.&nbsp; Even if this is only for some group inte=
rnal document portal or readthedocs or some such portal.<br />In fact on th=
e dunfell branch the current DOCUMENTATION.md suggests a Antora "<a href=3D=
"https://docs.antora.org/antora/2.2/playbook/" target=3D"_blank" rel=3D"noo=
pener">playbook</a>" (untested):<br /><br /><br />
<pre><code class=3D"yaml smalltalk"><span class=3D"method">site:</span>
  <span class=3D"method">title:</span> Layer XYZ <span class=3D"class">Doc=
umentation</span>

<span class=3D"method">content:</span>
  <span class=3D"method">sources:</span>
  - <span class=3D"method">url:</span> .
    <span class=3D"method">branches:</span> <span class=3D"class">dunfell<=
br />    </span></code><code class=3D"yaml smalltalk"><span class=3D"class"=
><code class=3D"yaml smalltalk"><span class=3D"method">start_path:</span> d=
ocumentation/introduction</code><code class=3D"yaml smalltalk"><code class=
=3D"yaml smalltalk"><span class=3D"method"></span></code></code></span> - =
<span class=3D"method">url:</span> <span class=3D"method">git://git.yoctopr=
oject.org/poky.git</span><span></span> <span class=3D"method">branches:</sp=
an> - </code><code class=3D"yaml smalltalk"><code class=3D"yaml smalltalk">=
<span class=3D"method">dunfell</span></code> <span class=3D"method">start_p=
ath:</span> </code><code class=3D"yaml smalltalk"><code class=3D"yaml small=
talk"><span class=3D"method">documentation/overview-manual</span></code> - =
<span class=3D"method">url:</span> <span class=3D"method"></span></code><co=
de class=3D"yaml smalltalk"><span class=3D"method"><code class=3D"yaml smal=
ltalk"><span class=3D"method">git://git.yoctoproject.org/poky.git</span></c=
ode></span><span></span> <span class=3D"method">branches:</span> - dunfell =
<span class=3D"method">start_path:</span> </code><code class=3D"yaml smallt=
alk"><code class=3D"yaml smalltalk"><code class=3D"yaml smalltalk"><span cl=
ass=3D"method">documentation/</span></code></code></code><code class=3D"yam=
l smalltalk"><a class=3D"ls-dir" href=3D"http://git.yoctoproject.org/cgit/c=
git.cgi/poky/tree/documentation/brief-yoctoprojectqs?h=3Ddunfell">brief-yoc=
toprojectqs</a>
</code><code class=3D"yaml smalltalk"><code class=3D"yaml smalltalk">  - <=
span class=3D"method">url:</span> <span class=3D"method"></span></code></co=
de><code class=3D"yaml smalltalk"><code class=3D"yaml smalltalk"><span clas=
s=3D"method"><code class=3D"yaml smalltalk"><span class=3D"method">git://gi=
t.yoctoproject.org/poky.git</span></code></span><span></span> <span class=
=3D"method">branches:</span> - dunfell <span class=3D"method">start_path:<=
/span> </code></code><code class=3D"yaml smalltalk"><code class=3D"yaml sma=
lltalk"><code class=3D"yaml smalltalk"></code><code class=3D"yaml smalltalk=
"><code class=3D"yaml smalltalk"><code class=3D"yaml smalltalk"><span class=
=
=3D"method">documentation/</span></code></code></code><code class=3D"yaml =
smalltalk"><a class=3D"ls-dir" href=3D"http://git.yoctoproject.org/cgit/cgi=
t.cgi/poky/tree/documentation/brief-yoctoprojectqs?h=3Ddunfell">toaster-man=
ual</a>
</code></code></code><code class=3D"yaml smalltalk"><code class=3D"yaml sm=
alltalk"><code class=3D"yaml smalltalk">  - <span class=3D"method">url:</sp=
an> <span class=3D"method"></span></code></code></code><code class=3D"yaml =
smalltalk"><code class=3D"yaml smalltalk"><code class=3D"yaml smalltalk"><s=
pan class=3D"method"><code class=3D"yaml smalltalk"><span class=3D"method">=
git://git.yoctoproject.org/poky.git</span></code></span><span></span> <span=
 class=3D"method">branches:</span> - dunfell <span class=3D"method">start_p=
ath:</span> </code></code></code><code class=3D"yaml smalltalk"><code class=
=
=3D"yaml smalltalk"><code class=3D"yaml smalltalk"><code class=3D"yaml sma=
lltalk"></code><code class=3D"yaml smalltalk"><code class=3D"yaml smalltalk=
"><code class=3D"yaml smalltalk"><span class=3D"method">documentation/</spa=
n></code></code></code><code class=3D"yaml smalltalk"><a class=3D"ls-dir" h=
ref=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/br=
ief-yoctoprojectqs?h=3Ddunfell">sdk-manual</a>
</code></code></code> <span class=3D"method">output:</span> <span class=3D=
"method">clean:</span> <span class=3D"keyword">true</span> <span class=3D"m=
ethod">dir:</span> public </code></pre>
<br />Take a second concrete example: <br />http://git.yoctoproject.org/cg=
it/cgit.cgi/meta-raspberrypi<br /><br />The proverbial 12-14yo with a board=
 now has three sets of documentation to contend with (following the README.=
md): <br />1. <a href=3D"https://meta-raspberrypi.readthedocs.io" target=3D=
"_blank" rel=3D"noopener">https://meta-raspberrypi.readthedocs.io</a><br />=
2. Yocto/OE <br />3. raspberrypi.org<br /><br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">* Corollary: Allow any repo=
 outside of <a href=3D"http://openembedded.org" target=3D"_blank" rel=3D"no=
opener">openembedded.org</a> or <a href=3D"http://yoctoproject.org" target=
=3D"_blank" rel=3D"noopener">yoctoproject.org</a> to incorporate whichever=
 of the tools/repos they need (git cloning &amp; forking model allows/encou=
rages that) and present documentation that is integrated and targeted (Anto=
ra could - eventually - allow/encourage that).</blockquote>
<div>&nbsp;</div>
<div>The YP documentation 'project' is about publishing documentation for =
what makes up the Yocto Project (OE-core, bitbake, ..).</div>
</div>
</div>
</blockquote>
Agreed. I suppose I'm arguing the project specific elements of the documen=
tation (i.e not reusable by/of interest to a repo/layer) could (ideally) be=
 limited to page header, footer and brand image detail - everything else co=
uld be reusable by layers as they think best fits their userbase/audience.<=
br /><br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>The current Docbook structure is probably too complex (learning curve=
) to be adopted in other layers. So anything we could improve to make it si=
mpler for other layers to benefit from doc infrastructure would be a nice b=
onus.&nbsp;</div>
<div>&nbsp;&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">* Give the Yocto-project fl=
exibility in how to organize itself going forward - documentation is not an=
 impediment.<br /><br />Of course there is a learning curve and the docs ne=
ed to be refactored back to their home tool/repo.<br />To my mind there is =
a categorical distinction that can be made between the DocBook alternatives=
.</blockquote>
<div>&nbsp;</div>
<div>Can you provide more information about what Antora vs Asciidoc/asciid=
octor?&nbsp;</div>
<div>&nbsp;</div>
</div>
</div>
</blockquote>
Personally I've never encountered the need use asciidoc. Until now - I'll =
likely refactor the github.com/jlenv org documents so that each repo's docu=
mentation is pulled into a whole under jlenv.github.io/. <br />My understan=
ding Antora builds on asciidoctor.js.<br />I'd argue for whichever tool is =
used: Project and layer docs should limit themselves to that tools built-in=
 functionality - patching a doc tool detracts dev cycles.<br />I'd argue to=
 limit documentation to what is effectively the markdown level of functiona=
lity - but layer/repo maintainers are best placed to make this call.<br /><=
br />Kind regards<br />Mark<br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; bord=
er-left: 1px solid #cccccc; padding-left: 1ex;">The questions is whether an=
y of the above conjectures are of value or attractive?<br /><br />HTH?<br /=
>-- <br />
<div>Kind regards</div>
<div>Mark</div>
<div>&nbsp;</div>
<div>Mark Van de Vyver, B.Bus(Hons), PhD(Dist)</div>
</blockquote>
</div>
</div>
</blockquote>
<br />&nbsp;<br />-- <br />
<div>Kind regards</div>
<div>Mark</div>
<div>&nbsp;</div>
<div>Mark Van de Vyver, B.Bus(Hons), PhD(Dist)</div>

--pk06m2jLuaGKBCNI8dzk--
