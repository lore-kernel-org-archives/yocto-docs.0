Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076B3C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 21:29:46 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.1547.1704749376514267808
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 13:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mr9HjfZf;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: bhstalel@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cd1ca52f31so24973671fa.3
        for <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 13:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704749375; x=1705354175; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKitg6zNdz8uaWURe1XAlBZorbubXu74dw97t9cfM4c=;
        b=mr9HjfZfjslL0lXLKqhSS2isJclZnv+OMZ1Zxx7KoJPVYNq/l/Z6YrMOF5OSrzrC17
         +9O480jm2v/Jpryzf4J5WCgKD1x30Ko2+UN39RO6axwAGqlR5feg1Wl6VXp3FRyR9Ghx
         T3YJagJjNSqGhCEKHQ0XQMdiZnhOgQpKOT3Ww57U9AbftcRvpVlA7mp6RlFr3Jb4dfdS
         anCg9gUHJLrUXrdifGqo82OrBeWZ9kHmXjvAEg/MguoNibxVOq7LPIluIyrOZFukulFs
         dDIOQtEBbknSRRGENe1aqp5iI42wyusaaKlj5mImFw8PmYhGu3PZjUKslG5gMUqvspib
         9Tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704749375; x=1705354175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKitg6zNdz8uaWURe1XAlBZorbubXu74dw97t9cfM4c=;
        b=oYxHFEuwbCmlODONTRm1VwwBUAHnAphGOv3SM8WSux5tK5nfPKXOJ8Z0FIJgUk8jSR
         te4UFyOLkV13rdNnKvG3q5QHKi62p8G0QOkppPOMwo8gPRMGQZmPfSnwwaObOHiIItWF
         PXoctFSJYkCQYMT63iB7kUunN0I9gw+wontMqEgJHg/wFhnvnSlXONo1jdHBcdqV4jjr
         IHutJGOBIm359Y4FNFt/T/MG93AQoGI4yVlF4586OYaSBuUngEk7aJIIwjZdOMQL7ZrT
         YTl7EOoKJTS1YA7HNlhhnXNcu19yA8ZyZgn9ctoH5X065DDuOOMCveDYuJ2qGL6LI016
         D+dA==
X-Gm-Message-State: AOJu0YyEDeyAD5pEjS0enRxVsWZLy22Q2EMWF4JY0EgzeJnFr9qX/ake
	+1PtGtYOXVlMoVFNKhFVGdXGYh2Ul8C6S3SDjCM=
X-Google-Smtp-Source: AGHT+IFVGr608o01O21/v7Gk2Q/aS/Et4J9Sqk97ZT4JPE/9NAK1KvwI/hB2usf4AAhrew+HMi+5YMy26Xe8uWDzO/g=
X-Received: by 2002:a05:651c:2002:b0:2cd:27b0:bf6 with SMTP id
 s2-20020a05651c200200b002cd27b00bf6mr1617357ljo.39.1704749374403; Mon, 08 Jan
 2024 13:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20231223170808.873741-1-simone.p.weiss@posteo.com> <94a2c456-a490-4b0a-86b8-22c9b3fdaed0@bootlin.com>
In-Reply-To: <94a2c456-a490-4b0a-86b8-22c9b3fdaed0@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Mon, 8 Jan 2024 22:29:23 +0100
Message-ID: <CAOgG7m1orsxLu0CoN9ZsmzjZj2H4Jc9Mui_um09a3jEgBScq8A@mail.gmail.com>
Subject: Re: [docs] [PATCH] overview-manual: Fix bitbake taskmap example
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: simone.p.weiss@posteo.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e47b8e060e75e4bc"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 21:29:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4751

--000000000000e47b8e060e75e4bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael, Simone,

Thanks for the patch.

Shouldn't ${AUTOREV} be in double quotes ? "${AUTOREV}"

Also regarding `SRCREV`, I think we just say:

    SRCREV =3D "<commit>"

because this is a generic example and not specific to any particular Git
repository.

Also I think fixing the recipe version to 0.1 is easier because we need to
change also $(LIB).1 to be $(LIB).0

I did not figure out what you, exactly, changed in the Task map, can you
point to me the exact changes ?

Kind regards
Talel

On Mon, Jan 8, 2024 at 7:22=E2=80=AFPM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Simone,
>
> Thanks for the update!
>
> On 23.12.23 at 18:08, simone.p.weiss@posteo.com wrote:
> > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> >
> > Fix the shared library example, as it currently will throw errors durin=
g
> > `bitbake sayhello`.
> >
> > 1) Add `SRCREV =3D ${AUTOREV}` to both recipes to fix the FetchError
> >     complaining about missing valid `SRCREV`.
> > 2) Ensure the libhello is build as libhello.so.0.1 instead of
> libhello.so.1.0.
> >     This causes otherwhise issues in do_install of libhello_0.1.bb
> >
> > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Merged in master-next.
>
> Copied Talel BELHADJ SALEM for a last minute review of your changes to
> the BitBake taskmap.
> Thanks again!
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000e47b8e060e75e4bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Michael, Simone,<div><br></div><div>Thanks for the=
 patch.</div><div><br></div><div>Shouldn&#39;t ${AUTOREV} be in double quot=
es ? &quot;${AUTOREV}&quot;</div><div><br></div><div>Also regarding `SRCREV=
`, I think we just say:</div><div><br></div><div>=C2=A0 =C2=A0 SRCREV =3D &=
quot;&lt;commit&gt;&quot;</div><div><br></div><div>because this is a generi=
c example and not specific to any particular=C2=A0Git repository.</div><div=
><br></div><div>Also I think fixing the recipe version to 0.1 is easier bec=
ause we need to change also $(LIB).1 to be $(LIB).0</div><div><br></div><di=
v>I did not figure out what you, exactly, changed in the Task map, can you =
point to me the exact changes ?</div><div><br></div><div>Kind=C2=A0regards<=
/div><div>Talel</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jan 8, 2024 at 7:22=E2=80=AFPM Michael Opdenac=
ker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenacke=
r@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Simone,<br>
<br>
Thanks for the update!<br>
<br>
On 23.12.23 at 18:08, <a href=3D"mailto:simone.p.weiss@posteo.com" target=
=3D"_blank">simone.p.weiss@posteo.com</a> wrote:<br>
&gt; From: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo.com=
" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br>
&gt;<br>
&gt; Fix the shared library example, as it currently will throw errors duri=
ng<br>
&gt; `bitbake sayhello`.<br>
&gt;<br>
&gt; 1) Add `SRCREV =3D ${AUTOREV}` to both recipes to fix the FetchError<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0complaining about missing valid `SRCREV`.<br>
&gt; 2) Ensure the libhello is build as libhello.so.0.1 instead of libhello=
.so.1.0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0This causes otherwhise issues in do_install of <a h=
ref=3D"http://libhello_0.1.bb" rel=3D"noreferrer" target=3D"_blank">libhell=
o_0.1.bb</a><br>
&gt;<br>
&gt; Signed-off-by: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@p=
osteo.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br>
<br>
Reviewed-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bo=
otlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
Merged in master-next.<br>
<br>
Copied Talel BELHADJ SALEM for a last minute review of your changes to <br>
the BitBake taskmap.<br>
Thanks again!<br>
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

--000000000000e47b8e060e75e4bc--

