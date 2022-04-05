Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBECC47094
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.9149.1649178196162786197
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 10:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SYVYNvfc;
 spf=pass (domain: gmail.com, ip: 209.85.160.51,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-df02f7e2c9so748fac.10
        for <docs@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cdXjKAjNzi2MZJgiNFQe4yf9zhIb8oJOs6bAOgp8IBY=;
        b=SYVYNvfcgHpFOlkf+Cvt0/zrthoxFJfxDLm7cCKB1lHkWrhBRleJc+z+s1NU0T/GW5
         TtlHEs+FGI7ySvSGhu8/zfPctQfCgCmWuMHWbt6AAuj+L856hlLxGzUAOyNpOfhjZq65
         +OcVxwxY+KVn1ELz18we7iWN1IhKaSEok6tYSeketAMf3uoxf0iClk4iiXQDyt6RSims
         7+pjF5fXHOk+yGDDmOt7Nc0a6B03MTQLElQTeJRxQRfW0jEInRU9HtXZHb63aIqirfZD
         HIKHJyrNTWnqpQWrWcFY+SHr08heHF0dodh+GzUGDTrS3kEy2syhKi+XbukQzmZZHhkB
         srqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdXjKAjNzi2MZJgiNFQe4yf9zhIb8oJOs6bAOgp8IBY=;
        b=4hZ/sOMlV75Bj8mUAf6NQ4ECW1Z/zyk01fjSg+IWNlypIuZIIncf7x94wAHehYk9WG
         yQntIpnIdWwDGQ8iaQVgGCXes1/IivwuSeg1EyqP02/T1IHTwInyhwjR7GQISYjlfYzW
         Bi/wFJrhU7ZbI2bAMwqPm0mwUdljxprF6CM9ZcT8MsORVWkzBbZ93sivAeLBKO6oQhos
         Tvgyw7QB4jTcSXnk74dwN8ujuk7Gw+WTAhchjfIUxIskjTHKAznrc8YdtAM/HTo6WzB4
         mqPQjeEDosUCRmz4Pov4Gmzd96nO4AnV9fLUGKoQ312M6CHtpRvnC8EL7ZQTjvKBuuy+
         wdlg==
X-Gm-Message-State: AOAM532cWokExIZwnc23mLHIRRJ3Apyjb1Vrln1GJfiqZgj9lHUx+Q4R
	bZb7+OASsLVNJDRoyQFSvBQRhMIXdgS+hfqoiZQ=
X-Google-Smtp-Source: 
 ABdhPJzjAVFlyBWdEY1esdTg22lwF23J6j7UWPYNIjhJrXMOGuPS8NWr9iHvIC5Oaa2k7ebgEBYoLWmQXHGGIYOTdEw=
X-Received: by 2002:a05:6870:a189:b0:da:b3f:2b83 with SMTP id
 a9-20020a056870a18900b000da0b3f2b83mr2077548oaf.290.1649178195489; Tue, 05
 Apr 2022 10:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220405085316.40154-1-abongwabonalais@gmail.com>
 <1b32a2df-5733-dc48-a3e1-7e991b329377@bootlin.com>
In-Reply-To: <1b32a2df-5733-dc48-a3e1-7e991b329377@bootlin.com>
From: Abongwa Bonalais <abongwabonalais@gmail.com>
Date: Tue, 5 Apr 2022 18:03:04 +0100
Message-ID: 
 <CAKP8fJGxp5f_9PrY36-AfCOoy1n45K2f-prKrqFWz3JXom22ew@mail.gmail.com>
Subject: Re: [docs] [PATCH] Added quotes around variables to prevent word
 splitting.
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000083766c05dbeb3860"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2757

--00000000000083766c05dbeb3860
Content-Type: text/plain; charset="UTF-8"

Will do that , thanks!

On Tue, Apr 5, 2022 at 12:30 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Abongwa,
>
> On 4/5/22 10:53, Abongwa Amahnui Bonalais wrote:
> > Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
> > ---
> >  oe-init-build-env         | 4 ++--
> >  scripts/oe-setup-builddir | 8 ++++----
> >  2 files changed, 6 insertions(+), 6 deletions(-)
>
> This is not a documentation patch!
> You should send it to the openembedded-core@lists.openembedded.org
> mailing list.
> A more explicit title would help too, typically "
> oe-init-build-env/oe-setup-builddir"  or "scripts" .
>
> Thanks anyway
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000083766c05dbeb3860
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will do that , thanks!=C2=A0<br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 5, 2022 at 12:=
30 PM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.c=
om">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi Abongwa,<br>
<br>
On 4/5/22 10:53, Abongwa Amahnui Bonalais wrote:<br>
&gt; Signed-off-by: Abongwa Bonalais Amahnui &lt;<a href=3D"mailto:abongwab=
onalais@gmail.com" target=3D"_blank">abongwabonalais@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 oe-init-build-env=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 scripts/oe-setup-builddir | 8 ++++----<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
This is not a documentation patch!<br>
You should send it to the <a href=3D"mailto:openembedded-core@lists.openemb=
edded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><b=
r>
mailing list.<br>
A more explicit title would help too, typically &quot;<br>
oe-init-build-env/oe-setup-builddir&quot;=C2=A0 or &quot;scripts&quot; .<br=
>
<br>
Thanks anyway<br>
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--00000000000083766c05dbeb3860--

