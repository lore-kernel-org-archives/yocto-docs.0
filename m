Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.3694.1596227802565958681
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 13:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oO99l3Bd;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id p191so647141ybg.0
        for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2020 13:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B9Gxfifh2y+Kj73pD8m6pkTAnhRNxGmFd+7V2Pb/1qk=;
        b=oO99l3Bd86DQPaeJrBMjB7uqNbyuaEyxBWnQpZ9pDsdNqQhH7ELnwkgT3Oe91zzaUr
         UwyDHSZjQPbCwLn79DomETRxPLbNtoWS1h+fY6WGhFTaCp49OtyeaPu5+VGaf4CzvWA7
         Q1QCMB1DaFlOGiDHNC+58oT3gM/5hZ26rdnFGPXq+W/Qhz3tFWzRhDLVYArcVOvB2PZZ
         hCwKpHKR0YnSSokSPg0bg+NFKe/NtbiQNZQxs0rSUCF70lQsH85t+5x/b50ujVvUz3vL
         pxrftH8mo8n3r7pV44usROFAaUko5m1nuGzyWmX2zvfo6JkNydQ8a54Z+gdVbEzKTuCM
         XosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B9Gxfifh2y+Kj73pD8m6pkTAnhRNxGmFd+7V2Pb/1qk=;
        b=LBjxKf3ImQf/YOEBZNHyMT2KfqsRmzCFGjSTq0f8JvCFrNZhyAUvCePRxXCWaZlrEL
         V57BlzRrJjfC3LTJNGev1DB4ffJHoihRkvEx846Juk2v8Qw05VvtGuJmP5EjkwC5wqpc
         zHyVCc1JCKdcrnYInAYWeNjnoZaHxUSVqahWqgkQ6+YQ4aPFTMeKQ5HdKECkif7lgvSU
         BykI8qbUfzMb/sdQ1fYM5GVc7ETQePoNs2XyY8+SB7aWHEgPk2t9l9H7RK866eoyzE7g
         hmh8BSwbAVRUjoWQCv7jI8qhxfks7BhtfLZw+FbgHuhPfHDIvovEB6kiZHCiCqnCzkfe
         NmGg==
X-Gm-Message-State: AOAM5304jdoQkbipa+lk0T3xPtFwD/PNcg5DMFwZyTFt2PwslDoJy4K+
	5bVxEotuunrMRCyw/rbyOCajG9Wrk9xtLOlbZMZ6gQ==
X-Google-Smtp-Source: ABdhPJxOTMeNyksfYfTwbjKJ9Q9rO8EXMekPIbhcHhJn8Mt2BKMTfnLEghkNopze1exxw3RmB/kFqM88lagTMt5hHPM=
X-Received: by 2002:a25:32c8:: with SMTP id y191mr8961441yby.273.1596227801534;
 Fri, 31 Jul 2020 13:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200728224149.GA22506@linux-uys3> <CAP71WjybyNTcZVFp0KbtvoY2nr5wOBxEvA2HNYPZzobouRn+XQ@mail.gmail.com>
 <DM6PR11MB36767F98217D328FA7814DA8E54E0@DM6PR11MB3676.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB36767F98217D328FA7814DA8E54E0@DM6PR11MB3676.namprd11.prod.outlook.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 31 Jul 2020 22:36:30 +0200
Message-ID: <CAP71Wjx1f-y88jjE-uCaOv6x+cH0A=s=mHXna+N68B=5x100AQ@mail.gmail.com>
Subject: Re: [docs] [yocto] Yocto Technical Team Minutes, Engineering Sync, for July 28 2020
To: "Morton, Mark" <Mark.Morton@windriver.com>
Cc: Trevor Woerner <twoerner@gmail.com>, 
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000176fdb05abc2bf0c"

--000000000000176fdb05abc2bf0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 31 juil. 2020 =C3=A0 22:06, Morton, Mark <Mark.Morton@windriver.com=
> a
=C3=A9crit :

>
>
> > -----Original Message-----
> > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On
> Behalf
> > Of Nicolas Dechesne
> > Sent: Wednesday, July 29, 2020 12:37 AM
> > To: Trevor Woerner <twoerner@gmail.com>
> > Cc: docs@lists.yoctoproject.org; Morton, Mark
> > <Mark.Morton@windriver.com>
> > Subject: Re: [docs] [yocto] Yocto Technical Team Minutes, Engineering
> Sync,
> > for July 28 2020
> >
> > On Wed, Jul 29, 2020 at 12:42 AM Trevor Woerner <twoerner@gmail.com>
> > wrote:
> > >
> > > Yocto Technical Team Minutes, Engineering Sync, for July 28 2020
> > > archive:
> > >
> > https://docs.google.com/document/d/1ly8nyhO14kDNnFcW2QskANXW3ZT7
> > QwKC5w
> > > WVDg9dDH4/edit
> > >
> > > =3D=3D disclaimer =3D=3D
> > > Best efforts are made to ensure the below is accurate and valid.
> > > However, errors sometimes happen. If any errors or omissions are
> > > found, please feel free to reply to this email with any corrections.
> > >
> > > =3D=3D attendees =3D=3D
> > > Trevor Woerner, Stephen Jolly, Armin Kuster, Josef Holzmayr, Richard
> > > Purdie, Trevor Gamblin, Joshua Watt, Mark Morton, Ross Burton, Bruce
> > > Ashfield, Steve Sakoman, (phone-in ??), Jon Mason, Randy MacLeod,
> > > Scott Murray, Denys Dmytriyenko
> > >
> > > =3D=3D notes =3D=3D
> > > - fixed a race on AB wrt perl
> > > - 3.1.2 into QA
> > > - 3.2-m2 to QA once they=E2=80=99re done with 3.1.2
> > >
> > > =3D=3D general =3D=3D
> > > RP: load of perl issues over the weekend, believe to have found issue
> > > RP: lots of qemumips issues, not sure why, perhaps a timeouts issue?
> (no
> > ping
> > >     within 30 seconds)
> > > RP: some infrastructure issues (one worker has become corrupted)
> > >
> > > RP: curious to know what people think about 3.1.2: there is a bitbake
> issue
> > >     with toaster, should we release then fix or wait for fix before
> release?
> > > SS: maybe we should get feedback from people using toaster
> > > RP: the fix is simple, maybe release 3.1.2 (with release note) then
> > > fix
> > >
> > > RP: merged re-arrangement of package manager code, this puts more of
> > our code
> > >     into python libraries instead of bbclass files, which is the
> direction i
> > >     want to take going forward
> > > RP: i need to start a conversation on oe-architecture for future
> > > directions
> > > RP: e.g. binary package feeds, we want to capture these use-cases int=
o
> the
> > >     wiki
> > >
> > > [NB: done! see https://wiki.yoctoproject.org/wiki/Future_Directions]
> > >
> > > RP: we also posted the current agreement on =E2=80=9Cinclusive langua=
ge=E2=80=9D as
> agreed
> > >     on by various groups (oe board, oe-tsc, yp-tsc)
> > >
> > > TW: what=E2=80=99s the thinking behind moving code to libraries vs bb=
class?
> > > RP: pro: parsing speed con: variable dependency tracking is lost
> > > RP: lots of python code gets written to logs etc, which slows it down
> > > JPEW: does bitbake automatically detect variable dependencies in
> library
> > code?
> > > RP: no. maybe we just need to do the scan once?
> > > TW: do we lose flexibility? (e.g. it=E2=80=99s easy to copy+paste+mod=
ify a
> bbclass,
> > >     will that be possible?)
> > > RP: there will still be all the same entry points, so it should be
> > > possible
> > > RP: i=E2=80=99m worried about the size of the datastore in memory and=
 it is a
> > >     bottleneck
> > >
> > > RP: i wonder why qemumips is so slow?
> > > Randy: i think Cisco are the only ones caring about mips
> > > RP: yes, and Comcast too i think
> > >
> > > MM: have been wrapped up in $WORK stuff, but will be working on docs
> > >     conversion soon
> > > RP: MH has been putting infrastructure in place and Nico is looking
> forward
> > to
> > >     getting this going
> > > MM: do we want to try to reproduce our current colours/formatting or
> try
> > >     something new
> > > RP: i like what we have, the project does have an existing scheme, bu=
t
> we
> > can
> > >     change if something else makes sense
> >
> > I have some updates on Sphinx..
> > I recall that the work in progress can be found here:
> > https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=3Dsphinx
> >
> > The automated conversion from DocBook to Sphinx is managing 'internal'
> > links quite badly, so it results in a significant amount of work to
> fixup links. Also
> > since I wanted to use the Sphinx builtin 'glossary'
> > for terms and variables in the reference manual, that also required me =
to
> > update how links work for terms and variables. That's why it's taking
> more
> > time than I would like. I manage to use some automation/regexp, and do =
a
> bit
> > of manual fix up as well.
> >
> > I also started to experiment with customization in the CSS theme, to
> change
> > some color/formatting. It's not done yet, but it has got
> > better:
> > https://people.linaro.org/~nicolas.dechesne/yp-docs/html/ref-manual/ref=
-
> > manual.html
>
> I see you got rid of some of the more obvius "funny colors" - the Notes
> look much better, for example.
> I cloned the new sphinx branch and started looking at the implementation
> some. To make these changes, are you updating the
> repoDir/documentation/sphinx-static/theme_overrides.css file, or is there
> somewhere else you're making the changes?


Yes. All CSS customization is done in this file. It overrides the css
coming from the base theme template that we use.

Thanks for your help! I definitely need some help!


>
> Thanks,
> -Mark M
>
> >
> > For now we generate a single large documentation 'website' that include=
s
> all
> > existing docs, instead of publishing each document separately. I think
> it's an
> > important change compared to how our documentation was published so far=
.
> I
> > personally like that quite a bit, and think it's 'better' this way, but
> I would really
> > want to hear from you and that we agree this is what we want for the
> project.
> > We still need to look at how we want to generate PDF/offline
> documentation
> > though. And we need to decide how to manage the bitbake manual which si=
ts
> > in the bitbake git tree, so right now it's published separately.
> >
> > Side note: the VSCode extension for reST is quite good
> > (https://docs.restructuredtext.net/index.html)
> >
> > >
> > > TW: i do lots of builds, never seen issues, why are there so many
> failures on
> > >     AB?
> > > RP: do you do oe-selftest or testsdk builds?
> > > TW: no
> > > RP: do you do mips builds?
> > > TW: no
> > > RP: so these are the areas where we see these failures, =E2=80=9Cregu=
lar=E2=80=9D
> builds
> > >     are okay
> > > SS: i don=E2=80=99t see issues on my builds but that=E2=80=99s probab=
ly because of
> working
> > >     these issues out on the AB
> > > RP: infrastructure issues are low, it=E2=80=99s mostly race issues th=
at come
> out of
> > >     the extreme load of the AB or intermittent architecture issues
> that are
> > >     rarely tested
> > >
>

--000000000000176fdb05abc2bf0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0ven. 31 juil. 2020 =C3=A0 22:06, Morton, Mark &lt;<=
a href=3D"mailto:Mark.Morton@windriver.com">Mark.Morton@windriver.com</a>&g=
t; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank"=
>docs@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:docs@lists.yoctoproj=
ect.org" target=3D"_blank">docs@lists.yoctoproject.org</a>&gt; On Behalf<br=
>
&gt; Of Nicolas Dechesne<br>
&gt; Sent: Wednesday, July 29, 2020 12:37 AM<br>
&gt; To: Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com" target=3D=
"_blank">twoerner@gmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank">d=
ocs@lists.yoctoproject.org</a>; Morton, Mark<br>
&gt; &lt;<a href=3D"mailto:Mark.Morton@windriver.com" target=3D"_blank">Mar=
k.Morton@windriver.com</a>&gt;<br>
&gt; Subject: Re: [docs] [yocto] Yocto Technical Team Minutes, Engineering =
Sync,<br>
&gt; for July 28 2020<br>
&gt; <br>
&gt; On Wed, Jul 29, 2020 at 12:42 AM Trevor Woerner &lt;<a href=3D"mailto:=
twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Yocto Technical Team Minutes, Engineering Sync, for July 28 2020<=
br>
&gt; &gt; archive:<br>
&gt; &gt;<br>
&gt; <a href=3D"https://docs.google.com/document/d/1ly8nyhO14kDNnFcW2QskANX=
W3ZT7" rel=3D"noreferrer" target=3D"_blank">https://docs.google.com/documen=
t/d/1ly8nyhO14kDNnFcW2QskANXW3ZT7</a><br>
&gt; QwKC5w<br>
&gt; &gt; WVDg9dDH4/edit<br>
&gt; &gt;<br>
&gt; &gt; =3D=3D disclaimer =3D=3D<br>
&gt; &gt; Best efforts are made to ensure the below is accurate and valid.<=
br>
&gt; &gt; However, errors sometimes happen. If any errors or omissions are<=
br>
&gt; &gt; found, please feel free to reply to this email with any correctio=
ns.<br>
&gt; &gt;<br>
&gt; &gt; =3D=3D attendees =3D=3D<br>
&gt; &gt; Trevor Woerner, Stephen Jolly, Armin Kuster, Josef Holzmayr, Rich=
ard<br>
&gt; &gt; Purdie, Trevor Gamblin, Joshua Watt, Mark Morton, Ross Burton, Br=
uce<br>
&gt; &gt; Ashfield, Steve Sakoman, (phone-in ??), Jon Mason, Randy MacLeod,=
<br>
&gt; &gt; Scott Murray, Denys Dmytriyenko<br>
&gt; &gt;<br>
&gt; &gt; =3D=3D notes =3D=3D<br>
&gt; &gt; - fixed a race on AB wrt perl<br>
&gt; &gt; - 3.1.2 into QA<br>
&gt; &gt; - 3.2-m2 to QA once they=E2=80=99re done with 3.1.2<br>
&gt; &gt;<br>
&gt; &gt; =3D=3D general =3D=3D<br>
&gt; &gt; RP: load of perl issues over the weekend, believe to have found i=
ssue<br>
&gt; &gt; RP: lots of qemumips issues, not sure why, perhaps a timeouts iss=
ue? (no<br>
&gt; ping<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0within 30 seconds)<br>
&gt; &gt; RP: some infrastructure issues (one worker has become corrupted)<=
br>
&gt; &gt;<br>
&gt; &gt; RP: curious to know what people think about 3.1.2: there is a bit=
bake issue<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0with toaster, should we release then fix or wa=
it for fix before release?<br>
&gt; &gt; SS: maybe we should get feedback from people using toaster<br>
&gt; &gt; RP: the fix is simple, maybe release 3.1.2 (with release note) th=
en<br>
&gt; &gt; fix<br>
&gt; &gt;<br>
&gt; &gt; RP: merged re-arrangement of package manager code, this puts more=
 of<br>
&gt; our code<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0into python libraries instead of bbclass files=
, which is the direction i<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0want to take going forward<br>
&gt; &gt; RP: i need to start a conversation on oe-architecture for future<=
br>
&gt; &gt; directions<br>
&gt; &gt; RP: e.g. binary package feeds, we want to capture these use-cases=
 into the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0wiki<br>
&gt; &gt;<br>
&gt; &gt; [NB: done! see <a href=3D"https://wiki.yoctoproject.org/wiki/Futu=
re_Directions" rel=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproje=
ct.org/wiki/Future_Directions</a>]<br>
&gt; &gt;<br>
&gt; &gt; RP: we also posted the current agreement on =E2=80=9Cinclusive la=
nguage=E2=80=9D as agreed<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0on by various groups (oe board, oe-tsc, yp-tsc=
)<br>
&gt; &gt;<br>
&gt; &gt; TW: what=E2=80=99s the thinking behind moving code to libraries v=
s bbclass?<br>
&gt; &gt; RP: pro: parsing speed con: variable dependency tracking is lost<=
br>
&gt; &gt; RP: lots of python code gets written to logs etc, which slows it =
down<br>
&gt; &gt; JPEW: does bitbake automatically detect variable dependencies in =
library<br>
&gt; code?<br>
&gt; &gt; RP: no. maybe we just need to do the scan once?<br>
&gt; &gt; TW: do we lose flexibility? (e.g. it=E2=80=99s easy to copy+paste=
+modify a bbclass,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0will that be possible?)<br>
&gt; &gt; RP: there will still be all the same entry points, so it should b=
e<br>
&gt; &gt; possible<br>
&gt; &gt; RP: i=E2=80=99m worried about the size of the datastore in memory=
 and it is a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0bottleneck<br>
&gt; &gt;<br>
&gt; &gt; RP: i wonder why qemumips is so slow?<br>
&gt; &gt; Randy: i think Cisco are the only ones caring about mips<br>
&gt; &gt; RP: yes, and Comcast too i think<br>
&gt; &gt;<br>
&gt; &gt; MM: have been wrapped up in $WORK stuff, but will be working on d=
ocs<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0conversion soon<br>
&gt; &gt; RP: MH has been putting infrastructure in place and Nico is looki=
ng forward<br>
&gt; to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0getting this going<br>
&gt; &gt; MM: do we want to try to reproduce our current colours/formatting=
 or try<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0something new<br>
&gt; &gt; RP: i like what we have, the project does have an existing scheme=
, but we<br>
&gt; can<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0change if something else makes sense<br>
&gt; <br>
&gt; I have some updates on Sphinx..<br>
&gt; I recall that the work in progress can be found here:<br>
&gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?=
h=3Dsphinx" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.o=
rg/cgit/cgit.cgi/yocto-docs/log/?h=3Dsphinx</a><br>
&gt; <br>
&gt; The automated conversion from DocBook to Sphinx is managing &#39;inter=
nal&#39;<br>
&gt; links quite badly, so it results in a significant amount of work to fi=
xup links. Also<br>
&gt; since I wanted to use the Sphinx builtin &#39;glossary&#39;<br>
&gt; for terms and variables in the reference manual, that also required me=
 to<br>
&gt; update how links work for terms and variables. That&#39;s why it&#39;s=
 taking more<br>
&gt; time than I would like. I manage to use some automation/regexp, and do=
 a bit<br>
&gt; of manual fix up as well.<br>
&gt; <br>
&gt; I also started to experiment with customization in the CSS theme, to c=
hange<br>
&gt; some color/formatting. It&#39;s not done yet, but it has got<br>
&gt; better:<br>
&gt; <a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/html/re=
f-manual/ref-" rel=3D"noreferrer" target=3D"_blank">https://people.linaro.o=
rg/~nicolas.dechesne/yp-docs/html/ref-manual/ref-</a><br>
&gt; manual.html<br>
<br>
I see you got rid of some of the more obvius &quot;funny colors&quot; - the=
 Notes look much better, for example.<br>
I cloned the new sphinx branch and started looking at the implementation so=
me. To make these changes, are you updating the repoDir/documentation/sphin=
x-static/theme_overrides.css file, or is there somewhere else you&#39;re ma=
king the changes?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Yes. All CSS customization is done in this file. It overrides the css comi=
ng from the base theme template that we use.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Thanks for your help! I definitely need some help!</di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddin=
g-left:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
Thanks,<br>
-Mark M<br>
<br>
&gt; <br>
&gt; For now we generate a single large documentation &#39;website&#39; tha=
t includes all<br>
&gt; existing docs, instead of publishing each document separately. I think=
 it&#39;s an<br>
&gt; important change compared to how our documentation was published so fa=
r. I<br>
&gt; personally like that quite a bit, and think it&#39;s &#39;better&#39; =
this way, but I would really<br>
&gt; want to hear from you and that we agree this is what we want for the p=
roject.<br>
&gt; We still need to look at how we want to generate PDF/offline documenta=
tion<br>
&gt; though. And we need to decide how to manage the bitbake manual which s=
its<br>
&gt; in the bitbake git tree, so right now it&#39;s published separately.<b=
r>
&gt; <br>
&gt; Side note: the VSCode extension for reST is quite good<br>
&gt; (<a href=3D"https://docs.restructuredtext.net/index.html" rel=3D"noref=
errer" target=3D"_blank">https://docs.restructuredtext.net/index.html</a>)<=
br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; TW: i do lots of builds, never seen issues, why are there so many=
 failures on<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0AB?<br>
&gt; &gt; RP: do you do oe-selftest or testsdk builds?<br>
&gt; &gt; TW: no<br>
&gt; &gt; RP: do you do mips builds?<br>
&gt; &gt; TW: no<br>
&gt; &gt; RP: so these are the areas where we see these failures, =E2=80=9C=
regular=E2=80=9D builds<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0are okay<br>
&gt; &gt; SS: i don=E2=80=99t see issues on my builds but that=E2=80=99s pr=
obably because of working<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0these issues out on the AB<br>
&gt; &gt; RP: infrastructure issues are low, it=E2=80=99s mostly race issue=
s that come out of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the extreme load of the AB or intermittent arc=
hitecture issues that are<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0rarely tested<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000176fdb05abc2bf0c--
