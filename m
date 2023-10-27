Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FE4C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:32:17 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.9863.1698420731932149070
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 08:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=htZ2dZ2J;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so3560937a12.0
        for <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698420730; x=1699025530; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Mbf8nh0+ydh+Q7kUS+F1BaShaThQLuMYz/HajILwZE=;
        b=htZ2dZ2JxJd++4sNujZNi3mfVOqr1PHn89OKNNlxBnW2iFg+oaclnbolV/4RVWgI1j
         OV8rQC+fB2FbK4wew7qDeOhEZ/S4u6PZZWSoz1Y+px54Q+Kaz6Xz2L/4HOVkwcmQtaa1
         83J/Q7Ho6gD53fZRiMsJofDp6+g2N79YtOFYaRLIcuQGg9C8FSNL8VWgqUEmdE7mqJAU
         6wMCc7cx0+M/3b+gBlOiGQA1ll3tr6L5nCpjMHeBRfsJQWFe0cwGZTDff5bmoQ70Akll
         lxar7qpbiqgC4898kGXnspzBlYgHMv9HAJuXE+vHKbjJ42kO8yDM5HZCDP/yGM1kSb9r
         5GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698420730; x=1699025530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Mbf8nh0+ydh+Q7kUS+F1BaShaThQLuMYz/HajILwZE=;
        b=rx8hRTb9CSMMD8CY9zyOk3arFuEOEUyCUrp98bUbIONdD4Fr29AIyvA1tOinTlowZh
         kJiXSq/0WWIxHs9/V5JN8tpAqD92NCGKmqlsdjYLUGN1cQpQdAAAT/qry/3rPnTcXCZR
         hUg5WyHNqo7t7623HH+2qu1RRm7XVhAb3jJ3TWwQV4Fa6ucWxItZKf9YprzALUzyOQxS
         tykCvPxM/9OW9nrn/YkG4lt1betX1XJsg/9fwKI9myHsO8t7gHeo8NvJlHzJlYuZdh1Y
         sVeAXh/Ax+i6UgTXIEMv0z+IzPzSIeiUULsMnMgP2j606Qk7hLRJEmoWCfvgZENagc8M
         z14A==
X-Gm-Message-State: AOJu0YwBs/X5H872YcDY1E9ivbHxCOGqFGtHgVJ6O6pddTAKH75855J4
	wwCBx6hveiDtjzkskEzDZcqDLgbCL/DE3bhxWI8=
X-Google-Smtp-Source: AGHT+IFWGFXqLwrItzBGJHGbE7yoo3ybKpjdzvsg3ukL9k0VmIsiAlmMfIMZwjsjgTHZ4fwPIE0VzS4UtZL+1QUR2kI=
X-Received: by 2002:a05:6402:12c2:b0:531:f4:57a8 with SMTP id
 k2-20020a05640212c200b0053100f457a8mr2680465edx.26.1698420729923; Fri, 27 Oct
 2023 08:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <18651.1687433672747999997@lists.yoctoproject.org>
 <29645.1697569015596670723@lists.yoctoproject.org> <5c668a44-d9e3-4ca2-ad1d-e42730c76530@bootlin.com>
 <CAOgG7m0eQPFhnrmXd8GhbZJJEf_0dDRAj6Vpthh-NOtVPbZAjg@mail.gmail.com>
 <acba70be-9670-4ff3-a0f0-bb13add4559a@bootlin.com> <CAOgG7m3DDDU56NX4=u=UzVbd6idkVMyvz7gyt0s3kkZBi7sZ1A@mail.gmail.com>
 <ff30c952-0a18-452f-853f-9011bad05133@bootlin.com>
In-Reply-To: <ff30c952-0a18-452f-853f-9011bad05133@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Fri, 27 Oct 2023 16:31:58 +0100
Message-ID: <CAOgG7m3i4RD-ho-Y5xydv5pfj4=r9BGWx2X4hmW1WMhqu=MsuA@mail.gmail.com>
Subject: Re: [docs] Yocto Tasks Detailed Diagram Proposal
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000494cde0608b464ec"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 15:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4516

--000000000000494cde0608b464ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

For now, I will put the content in the documentation, later if yoctoproject
repo is created then I will add it, otherwise if you see the content itself
is not necessary then I will remove it.

Thanks.
Kind regards
Talel

On Fri, Oct 27, 2023 at 4:02=E2=80=AFPM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hello Talel,
>
> On 27.10.23 at 14:18, BELHADJ SALEM Talel wrote:
> > Hello Michael,
> >
> > Thanks for the clarification,
> >
> > I have completed the map, and I think it is very perfect now.
> >
> > I have just another question regarding the recipe's themselves,
> >
> > Is it okay to create the recipes in my GitHub account and use that in
> > the documentation ?
> >
> > Or, I put the files contents in the documentation itself like:
> >
> > The following is the content of Makefile:
> >
> > ``content``
> >
> > and so on ...
> >
> > What do you think?
>
>
> Well, if you put all the sources in the documentation itself as you're
> suggesting, I believe it's fine to mention that they are also available
> in an external repository for convenience. Richard, you may disagree...
>
> If you are really using git commands in the documentation to fetch
> search sources, I guess we can ask for a new git.yoctoproject.org
> repository for tutorials. It's important that the Yocto Project "owns"
> the contents of its manuals, and if you are no longer available to make
> updates, other people can take over.
>
> Thanks!
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000494cde0608b464ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Michael,<div><br></div><div>For now, I will put=
 the content in the documentation, later if yoctoproject repo is created th=
en I will add it, otherwise if you see the content itself is not necessary =
then I will remove it.</div><div><br></div><div>Thanks.</div><div>Kind rega=
rds</div><div>Talel</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Oct 27, 2023 at 4:02=E2=80=AFPM Michael Op=
denacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.opde=
nacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hello Talel,<br>
<br>
On 27.10.23 at 14:18, BELHADJ SALEM Talel wrote:<br>
&gt; Hello=C2=A0Michael,<br>
&gt;<br>
&gt; Thanks for the clarification,<br>
&gt;<br>
&gt; I have completed the map, and I think it is very perfect now.<br>
&gt;<br>
&gt; I have just another=C2=A0question regarding the recipe&#39;s themselve=
s,<br>
&gt;<br>
&gt; Is it okay to create the recipes in my GitHub account and use that in =
<br>
&gt; the documentation ?<br>
&gt;<br>
&gt; Or, I put the files contents in the documentation itself like:<br>
&gt;<br>
&gt; The following is the content of Makefile:<br>
&gt;<br>
&gt; ``content``<br>
&gt;<br>
&gt; and so on ...<br>
&gt;<br>
&gt; What do=C2=A0you think?<br>
<br>
<br>
Well, if you put all the sources in the documentation itself as you&#39;re =
<br>
suggesting, I believe it&#39;s fine to mention that they are also available=
 <br>
in an external repository for convenience. Richard, you may disagree...<br>
<br>
If you are really using git commands in the documentation to fetch <br>
search sources, I guess we can ask for a new <a href=3D"http://git.yoctopro=
ject.org" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org</a> <br=
>
repository for tutorials. It&#39;s important that the Yocto Project &quot;o=
wns&quot; <br>
the contents of its manuals, and if you are no longer available to make <br=
>
updates, other people can take over.<br>
<br>
Thanks!<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000494cde0608b464ec--

