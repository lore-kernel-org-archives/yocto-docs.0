Return-Path: <aatrapps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DC4C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 18:16:46 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web12.415.1656008198900176566
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 11:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IW8lJvRE;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: aatrapps@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id a10so225966ioe.9
        for <docs@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aF98v78xNGWvv7a6UH+iUBISnlRegGwoNH8u5rjiEw0=;
        b=IW8lJvRE9LiJFmNezqRXH08iKfHOdvQXc+yIomRlblMUbOyGCC43tiEgEpyLSvnVdL
         tcQeLTNYiAdzGSW/wm7WotE7U3Pq7FLLl9ksrpggzcvM3wyl1O6DksRVUD4ZmrO1LJS3
         ltEVwLxHIK1rCWOdEm2UE5gfRbRgHRYiXFTpNummBJ5+WiSA1gkL4PIII1erSOzOdNbm
         NoIhWpiaa/ACbacWWv1jla3TblfT8Nfl1BP6jd1kd+qMTInBfKEHaSaY6dXvn4Iqf4lK
         afSHCdUFBwiHCwJzMqiKYEXOqo5vyZJIRvjPPZLMbptlWij4WFFmOqlpb81u32GjL0dJ
         xrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aF98v78xNGWvv7a6UH+iUBISnlRegGwoNH8u5rjiEw0=;
        b=L4WSBMp/obn29HVLBjnVcIv8s8ELaX4D6+4Ek/hMz778Nzaoa+t/YxxTSw0MKWe3We
         IfbG77ghaVambo6vUkTCp7l3VGm80X71PHH1EQTqEmJnW7PIRhAgWhCjnxhS1vK2eHKV
         UxiItyUlOisgHXHycdhn6H2gYfWflTEGESNjPhQAGFMYsyjr7Qy7ukxjtAJxrSdE2S61
         Hhk1vZBjbRxWBU4318xN6zxWtEs11HgKEqL7ny/WdneqAU1PhaH/wLgjGsCGp2GDdl3h
         IkHSU1YdZ4eNZKO8iP8Egnyl3pJ1OsUkHxq5lj55l4nGG9Q7mkiUc1+4x5ImJraSv2Jj
         iEUw==
X-Gm-Message-State: AJIora9ddswdwUHSXXGrkZHipiuOfw4Fie/R3g3Yd7VpUB1IQInAj/Ec
	t142ij0EQaExgMhYGP8te/1MAoEyoEvSfZtKBes=
X-Google-Smtp-Source: 
 AGRyM1v92hYbABNJdHT3N3vQLBsgsWllS/j1T3lv71eU5DFb8RalBC5lfBUzXPoltCmHHD9sPNhPuEM+4qWByeXt3C4=
X-Received: by 2002:a05:6638:1483:b0:333:ea5c:f500 with SMTP id
 j3-20020a056638148300b00333ea5cf500mr6207215jak.61.1656008198324; Thu, 23 Jun
 2022 11:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220623173710.12957-1-aatrapps@gmail.com>
 <17a18728-24c8-555c-3f4e-cdc65952204f@bootlin.com>
In-Reply-To: <17a18728-24c8-555c-3f4e-cdc65952204f@bootlin.com>
From: Aatir Manzur <aatrapps@gmail.com>
Date: Thu, 23 Jun 2022 14:16:27 -0400
Message-ID: 
 <CAJ1z=zz0YERnz0KQsOn94LiT48Lqye906mhOhRyfhHeqVL-hcA@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: make DISTRO_FEATURES description more
 explicit
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000068060105e221743b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jun 2022 18:16:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3030

--00000000000068060105e221743b
Content-Type: text/plain; charset="UTF-8"

Great, thanks!

On Thu, Jun 23, 2022 at 2:08 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Aatir,
>
> Thanks for the update!
>
> On 6/23/22 19:37, aatir wrote:
> > +      enabled. Note: just enabling :term: `DISTRO_FEATURES` alone
> doesn't
>
> Oops, you forgot to remove the space here. I fixed that by myself.
>
> > +      enable feature support for packages, mechanisms such as making
> > +      :term:`PACKAGECONFIG` track :term:`DISTRO_FEATURES` are used
> > +      to enable/disbale package features.
>
>
> s/disbale/disable/
> I fixed that by myself
>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> I leave a little of time for further reviews, but it looks good to me.
> Thanks again, and don't hesitate to send us more improvements!
>
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000068060105e221743b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Great, thanks!=C2=A0<br></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 23, 2=
022 at 2:08 PM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Aatir,<br>
<br>
Thanks for the update!<br>
<br>
On 6/23/22 19:37, aatir wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 enabled. Note: just enabling :term: `DISTRO_FEAT=
URES` alone doesn&#39;t<br>
<br>
Oops, you forgot to remove the space here. I fixed that by myself.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 enable feature support for packages, mechanisms =
such as making<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :term:`PACKAGECONFIG` track :term:`DISTRO_FEATUR=
ES` are used<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 to enable/disbale package features.<br>
<br>
<br>
s/disbale/disable/<br>
I fixed that by myself<br>
<br>
Reviewed-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bo=
otlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
<br>
I leave a little of time for further reviews, but it looks good to me.<br>
Thanks again, and don&#39;t hesitate to send us more improvements!<br>
<br>
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--00000000000068060105e221743b--

