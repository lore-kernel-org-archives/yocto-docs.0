Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C92BC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 10:48:43 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.10192.1638528522218487632
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 02:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YFmAK+PJ;
 spf=pass (domain: linaro.org, ip: 209.85.208.41,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f41.google.com with SMTP id x15so9904597edv.1
        for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 02:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QA/3XGUi2zF5i6NX+QBtztTLTYco3WMsNzcNjUiizQE=;
        b=YFmAK+PJGDN86ZRflZyLpdmkeWvOw+PkzbVoEIOS1P4E4E5bsjxVvv1fuFbR4fSIrd
         Iq+DrFsw5tplq5jWBa7Wky97zOpF5H/X56Gq+h8K6i887pi/aitnYLFmEv7DlttqyscG
         2smiYYJSHLsoKk6GT3Kxu9f+uE6kYi+jvrJoudIBNIuRe+peJcXuveFug859onsVlJ2T
         YNKdd4j1A6e5y9em5hrxxMTyq7aWENn71BEaJM6NrE/Gj9Zm9K5eDbEwKACNGrmSlLml
         iAMULaFwg3BhNzMVpCT1k5ESX2DoNpAzsW2tYjDBvspp8AvaMiC9u0fP623ftDeizElv
         lR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QA/3XGUi2zF5i6NX+QBtztTLTYco3WMsNzcNjUiizQE=;
        b=Fx21IyEkS8W9wEK8hiYMSUTljVNfgJM1poEQhpIaqVEAUfPST4bwWsblE3oXMZhpjX
         LTv9rmydPUdGnUkJa1QC3GJPJZoimiBajYYC1eG2+oUewqHPM6zQB+fVvbOE0wrsQXCU
         qzEZPDnRlrIcjQON1kjH37KWuaHIM3sNTNL1bW8Z7GkqiuRZsJd41A8yKMsWKIyUf8sN
         cfpISxMdx4sGL81zibBRnRI4L5OwcSCOtXHjvg9XFyQb1d7yM/K6TMMqC9sTcHVfJKu3
         /9eJPtoMZwuarmaLYqR4HyYNHB/e+mb7SemekkUTBG2fTXAdsybwXpPi4HWD6iCYkule
         2Kjw==
X-Gm-Message-State: AOAM533MUSVgKUsEVQpTKgYcBa5+VFTutVp1D3MUVVw4G74XXzdkfuLk
	mevOTxpesvQ5cCwv6fNGidipyGB3nJ5L2hq5fLb4/g==
X-Google-Smtp-Source: 
 ABdhPJwrN0tmMF6whvMensH/Itw6v71TcrebUuOcJv/dlfF/NG6EpLfd9Nque+qBGLXVKK95OhOhEyp5Ytxw9iNmloY=
X-Received: by 2002:a05:6402:12c1:: with SMTP id
 k1mr25403260edx.355.1638528520296;
 Fri, 03 Dec 2021 02:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
 <20211203093452.sk3e6ksnwmsbnjn2@fedora>
 <CAP71WjwoVHYOvLSKkW+fSSO2T5MupA-vEt1_cDfwdMjy8ZhP0g@mail.gmail.com>
 <20211203100259.54n7h7ghlqfr5tia@fedora>
In-Reply-To: <20211203100259.54n7h7ghlqfr5tia@fedora>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 3 Dec 2021 11:48:29 +0100
Message-ID: 
 <CAP71Wjxp04oP_YXX-em4OhRAvbjztATUEy9fozZ4+ves7NvVTw@mail.gmail.com>
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 stop using the "transition" branch
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000068351c05d23ba6bc"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 10:48:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2221

--00000000000068351c05d23ba6bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 3, 2021 at 11:03 AM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Nicolas,
>
> On Fri, Dec 03, 2021 at 10:49:40AM +0100, Nicolas Dechesne wrote:
> > On Fri, Dec 3, 2021 at 10:34 AM Quentin Schulz <
> > quentin.schulz@theobroma-systems.com> wrote:
> >
> > > On Wed, Dec 01, 2021 at 02:59:49PM +0100, Michael Opdenacker wrote:
> > > > No longer necessary now that the transition from DocBook to Sphinx =
is
> > > over
> > > >
> > > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > >
> > > Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
> > >
> >
> > I don't understand. With this change, we no longer build the pages we
> > reference here:
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.=
org_releases.html-23outdated-2Drelease-2Dmanuals&d=3DDwIBaQ&c=3D_sEr5x9kUWh=
uk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172=
IIy1t&m=3DnyCl21erajBNcx6SkCKI_BEntNgbh6114vcdWp_vB5yDzorVFjmzdqp0WXIIpQyK&=
s=3Drw5wG0nk_9KQ8RLvE1-sbSicy4NslWaeMwoyTSUuIyY&e=3D
> >
> > Or am I missing here?
> >
>
> Indeed. But this should be fixed, because we should handle this the same
> way documentation/releases.html is, with a common one across all
> releases. With the current implementation, only master has a list of all
> outdated releases. e.g.
> https://docs.yoctoproject.org/3.3/releases.html#outdated-release-manuals
> does not exist, but
> https://docs.yoctoproject.org/releases.html#outdated-release-manuals
> does (and weirdly enough 3.4 too).
>

Yes, this part is indeed poorly implemented. But I don't think we can
remove the transition branch until we fix it, so I don't think we can take
this patch now.

perhaps we should maintain the overall documentation (for all versions) in
the same branch.. all these branches are making everything much
complicated.. Or perhaps we should split the documentation 'content' and
the documentation config and scripts. I am wondering how other projects are
doing it to support such complex doc setup (multiple versions to support
and to publish)!


>
> I assume we want this in all branches. Therefore I think we should move
> documentation/transition from that branch to master and copy the whole
> directory for each non-master branch (with the git checkout master trick
> from an earlier patch from Michael). I think this makes more sense than
> keeping a transition branch? Especially since I assume we want to move
> every 6 months one release from "Supported release manuals" to "Outdated
> releae manuals" ?
>

I think we had the 'transition' pages in master initially, and we moved
that to its own branch. I believe it's something we discussed with
Richard.. but i forgot the details.


>
> Cheers,
> Quentin
> > >
>

--00000000000068351c05d23ba6bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 11:03 AM Quent=
in Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com">quent=
in.schulz@theobroma-systems.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Nicolas,<br>
<br>
On Fri, Dec 03, 2021 at 10:49:40AM +0100, Nicolas Dechesne wrote:<br>
&gt; On Fri, Dec 3, 2021 at 10:34 AM Quentin Schulz &lt;<br>
&gt; <a href=3D"mailto:quentin.schulz@theobroma-systems.com" target=3D"_bla=
nk">quentin.schulz@theobroma-systems.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Dec 01, 2021 at 02:59:49PM +0100, Michael Opdenacker wrot=
e:<br>
&gt; &gt; &gt; No longer necessary now that the transition from DocBook to =
Sphinx is<br>
&gt; &gt; over<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:mich=
ael.opdenacker@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.co=
m</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Quentin Schulz &lt;<a href=3D"mailto:foss%2Byocto@0l=
eil.net" target=3D"_blank">foss+yocto@0leil.net</a>&gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; I don&#39;t understand. With this change, we no longer build the pages=
 we<br>
&gt; reference here:<br>
&gt; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__docs=
.yoctoproject.org_releases.html-23outdated-2Drelease-2Dmanuals&amp;d=3DDwIB=
aQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8=
yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DnyCl21erajBNcx6SkCKI_BEntNgbh6114vc=
dWp_vB5yDzorVFjmzdqp0WXIIpQyK&amp;s=3Drw5wG0nk_9KQ8RLvE1-sbSicy4NslWaeMwoyT=
SUuIyY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__docs.yoctoproject.org_releases.html-23out=
dated-2Drelease-2Dmanuals&amp;d=3DDwIBaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp=
;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=
=3DnyCl21erajBNcx6SkCKI_BEntNgbh6114vcdWp_vB5yDzorVFjmzdqp0WXIIpQyK&amp;s=
=3Drw5wG0nk_9KQ8RLvE1-sbSicy4NslWaeMwoyTSUuIyY&amp;e=3D</a> <br>
&gt; <br>
&gt; Or am I missing here?<br>
&gt; <br>
<br>
Indeed. But this should be fixed, because we should handle this the same<br=
>
way documentation/releases.html is, with a common one across all<br>
releases. With the current implementation, only master has a list of all<br=
>
outdated releases. e.g.<br>
<a href=3D"https://docs.yoctoproject.org/3.3/releases.html#outdated-release=
-manuals" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.or=
g/3.3/releases.html#outdated-release-manuals</a><br>
does not exist, but<br>
<a href=3D"https://docs.yoctoproject.org/releases.html#outdated-release-man=
uals" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/re=
leases.html#outdated-release-manuals</a><br>
does (and weirdly enough 3.4 too).<br></blockquote><div><br></div><div>Yes,=
 this part is indeed poorly implemented. But I don&#39;t think we can remov=
e the transition branch until we fix it, so I don&#39;t think we can take t=
his patch now.=C2=A0</div><div><br></div><div>perhaps we should maintain th=
e overall documentation (for all versions) in the same branch.. all these b=
ranches are making everything much complicated.. Or perhaps we should split=
 the documentation &#39;content&#39; and the documentation config and scrip=
ts. I am wondering how other projects are doing it to support such complex =
doc setup (multiple versions to support and to publish)!</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I assume we want this in all branches. Therefore I think we should move<br>
documentation/transition from that branch to master and copy the whole<br>
directory for each non-master branch (with the git checkout master trick<br=
>
from an earlier patch from Michael). I think this makes more sense than<br>
keeping a transition branch? Especially since I assume we want to move<br>
every 6 months one release from &quot;Supported release manuals&quot; to &q=
uot;Outdated<br>
releae manuals&quot; ?<br></blockquote><div><br></div><div>I think we had t=
he &#39;transition&#39; pages in master initially, and we moved that to its=
 own branch. I believe it&#39;s something we discussed with Richard.. but i=
 forgot the details.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Cheers,<br>
Quentin<br>
&gt; &gt;<br>
</blockquote></div></div>

--00000000000068351c05d23ba6bc--

