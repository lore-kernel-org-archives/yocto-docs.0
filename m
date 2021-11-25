Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C09C433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 08:42:21 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.9714.1637829740011609628
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 00:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vRLFlKxA;
 spf=pass (domain: linaro.org, ip: 209.85.208.48,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f48.google.com with SMTP id x15so22254534edv.1
        for <docs@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 00:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IFgQalZePzUnm8ENHLw07bxgrppVjrpLcLpXmGUKLfE=;
        b=vRLFlKxACQOOZxeSATKUNLAh3J3PFG7tKH1vzip+2xhsS/Zeu3yGyo2yVyBv3rlQtm
         /d8bIop5YobKEJndPmCQ/gyL3vbPPGlrlZV2QHVw7jn1LCHpfvBrSeTxNcUJ0qu/BquQ
         iuP4cBKvLX/LdAC0/sxKqEn4awkMrI+CYJTDoX24JLYJ7pxo9Zw+xObJCdWJcH8Ju1eI
         js+azGQmxm1pGOzseUXl/VUaBoxAcerVOK0Fnmu+d4w/aiZguHBpukSnQV3Uj5aEWBCH
         IHvrkQOit2ifwzu+Jf42+U+jEseLUVA8RM+SQUd90cjziA4PzBnP7HNJFANT5LGyzpSU
         lN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IFgQalZePzUnm8ENHLw07bxgrppVjrpLcLpXmGUKLfE=;
        b=vtAC/s1g6XwrVKNwEqvvTDeMvafp3eyu2FWeUHMAdXtmyPB2+lAAmo1j1hSvvVjF34
         1WKggtpMJVx7sho4f4QR0IYspSASXIZGN5btYbflq5hIhHrNfzkcS589yrF/jtn+0avn
         V0KuqtcQYET7ib9pgdXO61k7qj2jD4ST0p7yzDfVXG6xRw9X3zeqTcnb09dPPJIhPLhw
         GLsm9HtvR99UtiRqXU36NzyJH4kWSPIQ0jJ5bG2E3kZrs+QnHDcb2HZi7au4R4dGi+iG
         CF9d+edc99vHsyoloeH2bGOQchJEcol6ZRfgkMWhbATMunC5kLRIBiWov38WvImop8iV
         KbiA==
X-Gm-Message-State: AOAM533vuHWHKEOyo8k3Z7cbO7pkegXxuQ+Qtirh1rnWqFSul2PLBaC6
	HbvR2ODLklR0U31mBiYX5HGA/ItPnKe4m5+IjzzBBw==
X-Google-Smtp-Source: 
 ABdhPJzYqu6JNcGhGj4K+q3m59Uw+mPlHLZbd0hhK0MW0R1LhkXiT3wcVbsHzFlp+o2U4Fgcg2ASTAU/I7V0y76TgK0=
X-Received: by 2002:a17:906:b00c:: with SMTP id
 v12mr28040453ejy.523.1637829738017;
 Thu, 25 Nov 2021 00:42:18 -0800 (PST)
MIME-Version: 1.0
References: <20211124171617.2088604-1-michael.opdenacker@bootlin.com>
 <98664c40610ee3163638a373f105f29c9c70a912.camel@linuxfoundation.org>
 <20211124184706.xtqteak2yy6cv7sf@fedora>
 <b44b4004-09c7-033b-e67b-20a95b907479@bootlin.com>
In-Reply-To: <b44b4004-09c7-033b-e67b-20a95b907479@bootlin.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 25 Nov 2021 09:42:08 +0100
Message-ID: 
 <CAP71WjznnZ12G0vmiKZcx6xUeqSiYOhNo9XvX-Qay48gt+_sMw@mail.gmail.com>
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 remove gatesgarth
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000bcd59905d198f3da"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Nov 2021 08:42:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2201

--000000000000bcd59905d198f3da
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 24, 2021 at 7:50 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Quentin,
>
> On 11/24/21 7:47 PM, Quentin Schulz wrote:
> > Hi Michael, Richard,
> >
> > On Wed, Nov 24, 2021 at 06:10:56PM +0000, Richard Purdie wrote:
> >> On Wed, 2021-11-24 at 18:16 +0100, Michael Opdenacker wrote:
> >>> Together with the corresponding Bitbake version, which are no
> >>> longer supported.
> >>>
> >>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >>> ---
> >>>  scripts/run-docs-build | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/scripts/run-docs-build b/scripts/run-docs-build
> >>> index 3db4a97..5e1d649 100755
> >>> --- a/scripts/run-docs-build
> >>> +++ b/scripts/run-docs-build
> >>> @@ -35,7 +35,7 @@ mkdir $outputdir/bitbake/next
> >>>  cp -r ./_build/final/* $outputdir/bitbake/next
> >>>
> >>>  # stable branches
> >>> -for branch in 1.46 1.48 1.50 1.52; do
> >>> +for branch in 1.46 1.50 1.52; do
> >>>      git checkout $branch
> >>>      make clean
> >>>      make publish
> >>> @@ -68,7 +68,7 @@ mkdir $outputdir/next
> >>>  cp -r ./_build/final/* $outputdir/next
> >>>
> >>>  # stable branches
> >>> -for branch in dunfell gatesgarth hardknott honister; do
> >>> +for branch in dunfell hardknott honister; do
> >>>      cd $ypdocs
> >>>      git checkout $branch
> >>>      make clean
> >> I'm a bit torn on this. They are no longer officially supported
> releases now but
> >> it may make sense to rebuild all the sphinx docs in this script rather
> than some
> >> subset?
> >>
> > I think we want to make sure we have all docs up-to-date, even for the
> > branches that aren't maintained anymore. Especially since it's not
> > taking a lot of CPU time to build them, it's fine IMO. We could always
> > make minor changes to old docs. E.g. the releases.rst might get updates
> > until we figure something out.
>
> Thanks for casting your vote. It makes sense. I'll send another patch
> with this decision in the comments.
>

I agree with Quentin here. Until we have a better mechanism (to rebuild
only modified branches not all of them each time, ..) I think we should
continue to build them all.


> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2196):
> https://lists.yoctoproject.org/g/docs/message/2196
> Mute This Topic: https://lists.yoctoproject.org/mt/87285736/1279857
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000bcd59905d198f3da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 24, 2021 at 7:50 PM Micha=
el Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael=
.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Quentin,<br>
<br>
On 11/24/21 7:47 PM, Quentin Schulz wrote:<br>
&gt; Hi Michael, Richard,<br>
&gt;<br>
&gt; On Wed, Nov 24, 2021 at 06:10:56PM +0000, Richard Purdie wrote:<br>
&gt;&gt; On Wed, 2021-11-24 at 18:16 +0100, Michael Opdenacker wrote:<br>
&gt;&gt;&gt; Together with the corresponding Bitbake version, which are no<=
br>
&gt;&gt;&gt; longer supported.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michae=
l.opdenacker@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com<=
/a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 scripts/run-docs-build | 4 ++--<br>
&gt;&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/scripts/run-docs-build b/scripts/run-docs-build<b=
r>
&gt;&gt;&gt; index 3db4a97..5e1d649 100755<br>
&gt;&gt;&gt; --- a/scripts/run-docs-build<br>
&gt;&gt;&gt; +++ b/scripts/run-docs-build<br>
&gt;&gt;&gt; @@ -35,7 +35,7 @@ mkdir $outputdir/bitbake/next<br>
&gt;&gt;&gt;=C2=A0 cp -r ./_build/final/* $outputdir/bitbake/next<br>
&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt;=C2=A0 # stable branches<br>
&gt;&gt;&gt; -for branch in 1.46 1.48 1.50 1.52; do<br>
&gt;&gt;&gt; +for branch in 1.46 1.50 1.52; do<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 git checkout $branch<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 make clean<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 make publish<br>
&gt;&gt;&gt; @@ -68,7 +68,7 @@ mkdir $outputdir/next<br>
&gt;&gt;&gt;=C2=A0 cp -r ./_build/final/* $outputdir/next<br>
&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt;=C2=A0 # stable branches<br>
&gt;&gt;&gt; -for branch in dunfell gatesgarth hardknott honister; do<br>
&gt;&gt;&gt; +for branch in dunfell hardknott honister; do<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cd $ypdocs<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 git checkout $branch<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 make clean<br>
&gt;&gt; I&#39;m a bit torn on this. They are no longer officially supporte=
d releases now but<br>
&gt;&gt; it may make sense to rebuild all the sphinx docs in this script ra=
ther than some<br>
&gt;&gt; subset?<br>
&gt;&gt;<br>
&gt; I think we want to make sure we have all docs up-to-date, even for the=
<br>
&gt; branches that aren&#39;t maintained anymore. Especially since it&#39;s=
 not<br>
&gt; taking a lot of CPU time to build them, it&#39;s fine IMO. We could al=
ways<br>
&gt; make minor changes to old docs. E.g. the releases.rst might get update=
s<br>
&gt; until we figure something out.<br>
<br>
Thanks for casting your vote. It makes sense. I&#39;ll send another patch<b=
r>
with this decision in the comments.<br></blockquote><div><br></div><div>I a=
gree with Quentin here. Until we have a better mechanism (to rebuild only m=
odified branches not all of them each time, ..) I think we should continue =
to build them all.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2196): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2196" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2196</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87285736/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87285736/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000bcd59905d198f3da--

