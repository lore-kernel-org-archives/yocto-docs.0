Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167FCCCF9FE
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 03:11:36 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2819.1761966693812281408
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 20:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mn4NSaGZ;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63f9beb27b9so1168367d50.1
        for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 20:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761966693; x=1762571493; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2QUwDuIOuaRUv41SzLcc2Rza7HOplH4xxYDoiGOB6hU=;
        b=mn4NSaGZyQdpFjaqLtkSW4vTpz7TjAO2UWz0O0d/eKNCdE8VnN92vP1UpNqvtHyJq0
         fEDc2U/5+JskDIOZNGRUG+4Sc1m/ur+tLqwmo43MDkC9sL1udtVRlvsHNwJWXq+Vhmfw
         9yyW7Db04lk8M5krnJ02uwoCoWI47yoINTJ2PWKzurWLMEKlAzAHxcaEKF/ocgQgaLs2
         8hTgMHcsycsU5Lm4cuu4ZwD6zJo//sLI25JCi+wX2s2hjj+G0pOKZ1Rl4bKzFfIfXX/B
         sDtdwQS89IelRCn+HbST9vRY/q74mX6WVPyDyrBULjQ7HA6kkgHgAOFer50Kgz5lg4+x
         XUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761966693; x=1762571493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QUwDuIOuaRUv41SzLcc2Rza7HOplH4xxYDoiGOB6hU=;
        b=gisjhqVg8Ha5sWUFKHBjfYYbFpeOdd0+GngdUC/BVF9uZTglwy6zmLS8ntCWbZrzkv
         WYbahWzKZYF0h21wXMdVz8YdOOB572gdIYgVvjzBgwSQ7NBF3bRE1ZuoTwVG3VENjAFE
         J+4PmVOBCjSs+b5HK5sr4LL38hw8XaDXZpP7y6phbXIuvkkQCzHzov4lV2xVMe1gT4Hx
         hmnJQNpSD6cNN1v1vyHA/fw+tAl+/Qv0PVY9DdMarO5Av5TZ/KtdMk8I9e3Mmj8WX8PT
         /kFBaAF7si5Scv4wyRNRae/EjsTzZ6oUitQk3JiFDT1Arnhg/lHDSAv0dEPJQg5k9b+f
         C5uQ==
X-Gm-Message-State: AOJu0Yzbd4gCE1464IyzFlEZ5WaGLt5/dJmoY6lRgF8Tyf6V+gC1tGgW
	wcT7uaJlRdMICA5tN7cESsyMToN70imbM5zlWC0BBBb97u9F0cnOoitYlwzQ1XDYAphn802cCgI
	tV++JPDwtPaZQWvt8o/+7DsLjdb4udeA=
X-Gm-Gg: ASbGncvK3mEAcusSG0SKYOlUUQx2pfxDwRCU0cbNRmf0OcVVhKdZALKhQc5QI+OWeiV
	fyyH6xiyd5vTpqJGimyD33PjYnp/dZmTo2hwzj4WYrI9G5mGpLF2tmGh2F3Lfx8kjga755qfsRz
	dBZX+6j7PbfUrmMKkPDSXBqzrFcRUfnKEYjHjiwZ7+pcRAE8shn+mX3wfmFk1shZglvuZfgaTzN
	/UFXjYC+BMIILazvnWL4SJ/9rd6W5xOHIGJPt15y/J4wWQwTnTulyP76j0pESBkA6NSBTofSAvS
	PGi2MbAiAKsmk9pov6ph7jHTbkp673p8zNxlCZzBlu99ZbFgShCf2ehZqtV7hnKTIggvyxYUVeU
	vLJRy3JusmTGwww==
X-Google-Smtp-Source: AGHT+IFe++BfmUIA4bbhV8eFLIYEEY/xjxjNSM82WjHiGozDRh5sts9eMqdZDY1wLkdQYUVju4tpsDoKdqkTze+fwu4=
X-Received: by 2002:a05:690e:1552:10b0:63e:30e1:1792 with SMTP id
 956f58d0204a3-63f92271f0bmr3834476d50.7.1761966692720; Fri, 31 Oct 2025
 20:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <c9484193-1798-8f94-97d9-71294d9700a0@crashcourse.ca>
In-Reply-To: <c9484193-1798-8f94-97d9-71294d9700a0@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Oct 2025 20:11:21 -0700
X-Gm-Features: AWmQ_bnWal7Xrn7ILwAaZsM8bYgOQTdXl1K9_JaTaDbrWMIoWK60viTqpVVfQ7I
Message-ID: <CAMKF1sp7u5vQzdqvk5+3uoxndbr2ga7RSBTGOEiEj_aVNJOXfQ@mail.gmail.com>
Subject: Re: [docs] has anyone documented how RISC-V was added to YP?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d364a606427fd604"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 01 Nov 2025 03:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7960

--000000000000d364a606427fd604
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 12:09=E2=80=AFPM Robert P. J. Day via lists.yoctopr=
oject.org
<rpjday=3Dcrashcourse.ca@lists.yoctoproject.org> wrote:

>
> here:
>
> https://docs.yoctoproject.org/dev-manual/new-machine.html
>
> we read: "Although well within the capabilities of the Yocto Project,
> adding a totally new architecture might require changes to gcc/glibc
> and to the site information, which is beyond the scope of this
> manual."
>
> but perhaps it would be cool to, for interested readers, point to
> something that documents how the RISC-V architecture was added to YP
> so they can see what was involved.
>
>   has anyone written such a thing?



Not written but done it :) perhaps history is in commit messages now . It
was certainly piecemealled in

>
>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7958):
> https://lists.yoctoproject.org/g/docs/message/7958
> Mute This Topic: https://lists.yoctoproject.org/mt/116054043/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d364a606427fd604
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 12:09=E2=80=AFP=
M Robert P. J. Day via <a href=3D"http://lists.yoctoproject.org">lists.yoct=
oproject.org</a> &lt;rpjday=3D<a href=3D"mailto:crashcourse.ca@lists.yoctop=
roject.org">crashcourse.ca@lists.yoctoproject.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)"><br>
here:<br>
<br>
<a href=3D"https://docs.yoctoproject.org/dev-manual/new-machine.html" rel=
=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev-manual/=
new-machine.html</a><br>
<br>
we read: &quot;Although well within the capabilities of the Yocto Project,<=
br>
adding a totally new architecture might require changes to gcc/glibc<br>
and to the site information, which is beyond the scope of this<br>
manual.&quot;<br>
<br>
but perhaps it would be cool to, for interested readers, point to<br>
something that documents how the RISC-V architecture was added to YP<br>
so they can see what was involved.<br>
<br>
=C2=A0 has anyone written such a thing?</blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Not written but done it =
:) perhaps history is in commit messages now . It was certainly piecemealle=
d in=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
rday<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7958): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/7958" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/7958</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/116054043/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/116054043/1997914</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d364a606427fd604--

