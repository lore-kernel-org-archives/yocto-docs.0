Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C467CC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 16:32:32 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web09.8386.1639758751561671371
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 08:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WPW97Hjs;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id w23so5392892uao.5
        for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 08:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ArX+YRtGThvLitdD3g60JFQSuowbEaaYBBqAg+L3OY=;
        b=WPW97Hjs7FMNGPLbOFWj5cPDP2LUHC5XF7nYSHmJfsevddUM0nKd/MJtdBfHG+ydIv
         Be6lYhBu23Nd0d1yDUYd4km9mxmh9V33plOawGdU7LNuqZn6tpH6KKt8Zg7p0IX1urrr
         aFS2k4JXKeY2F5Gb2SyQm3cJ6KIIThXcbshXWEOTRVIN6cS8D4ewdFp+UxhYNqbQ+VIZ
         np4BwdbPW876JT4ZFLOhkN0l7jbLkmleudsRK0lGasJO57O+63OEzR71xjttHrLapfvU
         R+ABXnX3NuflTMLDnElxM+u+z/7wNSOYpzP1/EY6T8xmb/iumef2JhVcBxNudzRx8jXi
         UbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ArX+YRtGThvLitdD3g60JFQSuowbEaaYBBqAg+L3OY=;
        b=7+aTkpL+c75VCFTHaKN7Iag/YpfYSoPKgi+F9tJmfdPLtzlHXqckgjzFy+L+YfH4xx
         69XVYz3/BhYAtYDWsENpKLdhtcJYEAjDWwfQR+80mKJZmJHkdsek+jo1jd9bmp3Fdj1N
         aSpGEj6hLr8dIhq91XD6lJXQTGT/r8kwasW5q3/GpJxw9y+10quiZJuoyjTXGEugXja8
         GUNoKQy7C6HrVXJ0VwxvTvkNLNVFvyccLPF9xK6Vz+qAQPe4wtij8C2V1LOOi8UDCbYT
         Nq3FAOJxgBCpDWBWO9v+PVnhgkSqmNayyZKjvuPQvKNBq8bW6N2JKnOiCh/FqGCQFK7E
         gQOw==
X-Gm-Message-State: AOAM530uuunN9/QgItVf8SKh79oo3f+9YsignemN+4Q01vCr2/nAvdwr
	UiSSqanR7m1anN2VbI5YGMYmCM1xG1gXxTGsqjibdpNs
X-Google-Smtp-Source: 
 ABdhPJz9kYTvZpMzNnXhMfj0mbHeGvDb4qYbVYdXd13B8p5ooDIpN6glpqOjviVq+6GnRyN+9L5OTwk5mn7qY21q87M=
X-Received: by 2002:a05:6102:3708:: with SMTP id
 s8mr1391163vst.45.1639758750701;
 Fri, 17 Dec 2021 08:32:30 -0800 (PST)
MIME-Version: 1.0
References: <f63931-692c-7af-251c-6f6dfdb0451e@crashcourse.ca>
 <CANNYZj_3E3a1xqgMwcHsuWD30uqAk5o++uTuMbqeALoNiT5gZQ@mail.gmail.com>
 <16C19319C1030E42.10196@lists.yoctoproject.org>
 <b22aac2c-ee65-c3f6-ebfd-9c51f28a77f5@crashcourse.ca>
In-Reply-To: <b22aac2c-ee65-c3f6-ebfd-9c51f28a77f5@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Dec 2021 19:32:18 +0300
Message-ID: 
 <CANNYZj-wjG1sOv2cj1cEeP5M87V=bp85O=mKaZ_eE2OCwS_0ww@mail.gmail.com>
Subject: Re: [docs] trying (again) to clarify pkg_postinst[_ontarget]
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000da5bdc05d35a15f4"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 16:32:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2310

--000000000000da5bdc05d35a15f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The code is the canonical definition of behavior. If you see recipes or
docs disagreeing with the code, please show where and how. Note: recipes
directly using $D or explicitly calling defer to first boot helper are not
in disagreement, they're just not using the documented syntactic sugar.

Alex

On Fri, 17 Dec 2021 at 18:08, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Fri, 17 Dec 2021, Robert P. J. Day wrote:
>
> > On Fri, 17 Dec 2021, Alexander Kanavin wrote:
> >
> > > Hey Robert, may I make a suggestion? Rather than ask someone to
> > > explain the implementation of pkg_postinst to you, why don=E2=80=99t =
you
> > > read the implementation and ask questions about specific code where
> > > it=E2=80=99s unclear what or why.
> >
> >   i'm actually doing that, but i'm still not a python expert so i
> > struggle with some of the bbclass files trying to follow the logic.
>
>   there's one other complication -- even when i think i follow the
> code, i like to look at sample recipes to confirm my understanding,
> but that's when i run across stuff like this in
> sysvinit-inittab_2.88dsf.bb:
>
>   pkg_postinst:${PN} () {
>   # run this on host and on target
>   if [ "${SERIAL_CONSOLES_CHECK}" =3D "" ]; then
>        exit 0
>   fi
>
> so i have the docs, the code and the sample recipes all seeming to
> disagree with each other.
>
> rday

--000000000000da5bdc05d35a15f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The code is the canonical definition of behavior. If you s=
ee recipes or docs disagreeing with the code, please show where and how. No=
te: recipes directly using $D or explicitly calling defer to first boot hel=
per are not in disagreement, they&#39;re just not using the documented synt=
actic sugar.<div><br></div><div>Alex</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 17 Dec 2021 at 18:08, Rob=
ert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcour=
se.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Fri, 17 Dec 2021, Robert P. J. Day wrote:<br>
<br>
&gt; On Fri, 17 Dec 2021, Alexander Kanavin wrote:<br>
&gt;<br>
&gt; &gt; Hey Robert, may I make a suggestion? Rather than ask someone to<b=
r>
&gt; &gt; explain the implementation of pkg_postinst to you, why don=E2=80=
=99t you<br>
&gt; &gt; read the implementation and ask questions about specific code whe=
re<br>
&gt; &gt; it=E2=80=99s unclear what or why.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0i&#39;m actually doing that, but i&#39;m still not a pytho=
n expert so i<br>
&gt; struggle with some of the bbclass files trying to follow the logic.<br=
>
<br>
=C2=A0 there&#39;s one other complication -- even when i think i follow the=
<br>
code, i like to look at sample recipes to confirm my understanding,<br>
but that&#39;s when i run across stuff like this in<br>
<a href=3D"http://sysvinit-inittab_2.88dsf.bb" rel=3D"noreferrer" target=3D=
"_blank">sysvinit-inittab_2.88dsf.bb</a>:<br>
<br>
=C2=A0 pkg_postinst:${PN} () {<br>
=C2=A0 # run this on host and on target<br>
=C2=A0 if [ &quot;${SERIAL_CONSOLES_CHECK}&quot; =3D &quot;&quot; ]; then<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0<br>
=C2=A0 fi<br>
<br>
so i have the docs, the code and the sample recipes all seeming to<br>
disagree with each other.<br>
<br>
rday</blockquote></div>

--000000000000da5bdc05d35a15f4--

