Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web12.12450.1587059767164598743
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 10:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yS0NkwRb;
 spf=pass (domain: linaro.org, ip: 209.85.219.173, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f173.google.com with SMTP id f14so2498334ybr.13
        for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2020 10:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=M/e2jKDRzKA5f6Qb+tAKTLiss17hhqpVxDB3jie8jtI=;
        b=yS0NkwRbQGaVafcD2YgUNJ5mcNGW8U6pr0tMQc2iY27+JdsO0GogSAnWOvjUt5EIlO
         mTjLSukbr8NTpUX2tl/+w6NDn2lwvPD5JrmtOYt/5fB0VJb5MR/dfrMBHqzZaZWjcAD7
         cdYDaFEuXsP6HVPIJ5K52Elf+G+TrnYFvsy9fFr4Feiiis2SzArlGuE8Rd5fNi08S/w9
         OLRl4uBRhJAxaqUwzvR94rmECf8fRG7wlrrTXBGbv/mGlPB01IND/ATuvoiQ4y+wDy5X
         b/9LDrydLDO1A3WQ6R51q7qltIfZxf80Sc4/Xo0DmmAsF4qfWCtxd5V4qNXCJtSaX3Cx
         NOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=M/e2jKDRzKA5f6Qb+tAKTLiss17hhqpVxDB3jie8jtI=;
        b=a/BuAcjoxDI3z3zf1Aa5iZNzgxPnWUZedGSFkDEJgHpy0SgxFtFdy4R0CLQIF3vVzC
         LZcuLobbfqTQdt0CmbtECc0M8q98wX3M7BWmYkm2VyWp6vgkN8Eh44m73CUyqeY5DdIY
         rKbTw2X/8cER/GwzbcVOq6r8quMEzU18Lp0yHBX1KLD3Z5dfGeOlE7s7unjNiUATQd+3
         vFYHRZQoLbfjSgSTdtv+AiC2zGBJ3BU+7uXUCv8Oo6w/Yh/Gns7hxnQKPnase14aNagJ
         wveZFLQpXe98TNfafmW4pDT39U8PzdxZ9B5AdmBhQj/EgGziWMCnQ3UixCaZ9UxBOks3
         Qqrg==
X-Gm-Message-State: AGi0PubVyFInABsePQEcY5SUqoraO9MGLt+EsWg+Qx3caOzdk7ypqX2N
	ab6ZCgVtXGaxxlu50syZgK346ZYxtVEiLyxBLC/C8ZRJxiikjg==
X-Google-Smtp-Source: APiQypJ+e3imp66ORe9LN7+G6msnNr32nkhM168ryYR+VNqPk+LIy/xJ+pD/Ri2BJa7wpZovAElV/UrN6Lwe+zRt7c0=
X-Received: by 2002:a25:ec1:: with SMTP id 184mr18960893ybo.373.1587059765939;
 Thu, 16 Apr 2020 10:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
 <20200415152105.GA11838@linux-uys3> <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain>
 <CAP71WjxP3VE8YQo5sS43rOxWzhqhz40Zd2gkX2AGVYxNEdD8oQ@mail.gmail.com> <alpine.LFD.2.21.2004161345410.53638@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004161345410.53638@localhost.localdomain>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 16 Apr 2020 19:55:53 +0200
Message-ID: <CAP71WjwPdXB36essZJ62sogNq+Qpf1wx3cEGpjKQ3MTDmgFY7w@mail.gmail.com>
Subject: Re: [docs] Possible changes to the project docs
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000962d2305a36c25f6"

--000000000000962d2305a36c25f6
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 16, 2020 at 7:46 PM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Thu, 16 Apr 2020, Nicolas Dechesne wrote:
>
> > As I put in one of my emails before you can use my dev branch:
> >
> > https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx
> >
> > then it's just
> > pip3 install sphinx
> > # to use the non default theme
> > pip3 install sphinx_rtd_theme
> >
> > cd documentation make html
> >
> > and it should generate exactly that on your local folder
> > https://people.linaro.org/~nicolas.dechesne/yp-docs/
> >
> > I am happy to take patches in this branch (or create/maintain a
> > contrib branch if more folks want to play/experiment and send
> > patches).
>
>   definitely need some mechanism to handle docbook entities and basic
> tags like <filename> ... i'm still poring over pandoc, can it be
> configured to deal with that?
>
>   will go read more ...
>

It does 'most of the time'. See:
https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml.html#bsp-layers

where the docbook source is:
       Each repository is a BSP layer supported by the Yocto Project



        (e.g. <filename>meta-raspberrypi</filename> and



        <filename>meta-intel</filename>).




I am not sure if it always does the *right* thing though.. and I have seen
occurrences where it failed. I am wondering if we should 'fix' pandoc , or
just spend some time fixing the output of pandoc. I don't think we will
avoid reading/checking each manual, anyways.. I was thinking we could use
pandoc for 80% of the work, some regex for 15% and then manually finish the
work.. it might be a bit optimistic ;)


rday
> 
>

--000000000000962d2305a36c25f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 16, 2020 at 7:46 PM Rober=
t P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse=
.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thu, 16 Apr 2020, Nicolas Dechesne wrote:<br>
<br>
&gt; As I put in one of my emails before you can use my dev branch:<br>
&gt;<br>
&gt; <a href=3D"https://git.linaro.org/people/nicolas.dechesne/poky.git/lo=
g/?h=3Dsphinx" rel=3D"noreferrer" target=3D"_blank">https://git.linaro.org/=
people/nicolas.dechesne/poky.git/log/?h=3Dsphinx</a><br>
&gt;<br>
&gt; then it&#39;s just<br>
&gt; pip3 install sphinx<br>
&gt; # to use the non default theme<br>
&gt; pip3 install sphinx_rtd_theme<br>
&gt;<br>
&gt; cd documentation make html<br>
&gt;<br>
&gt; and it should generate exactly that on your local folder<br>
&gt; <a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/" rel=
=3D"noreferrer" target=3D"_blank">https://people.linaro.org/~nicolas.deche=
sne/yp-docs/</a><br>
&gt;<br>
&gt; I am happy to take patches in this branch (or create/maintain a<br>
&gt; contrib branch if more folks want to play/experiment and send<br>
&gt; patches).<br>
<br>
=C2=A0 definitely need some mechanism to handle docbook entities and basic=
<br>
tags like &lt;filename&gt; ... i&#39;m still poring over pandoc, can it be=
<br>
configured to deal with that?<br>
<br>
=C2=A0 will go read more ...<br></blockquote><div><br></div><div>It does &=
#39;most of the time&#39;. See:</div><div><a href=3D"https://people.linaro.=
org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml.html#bsp-layers">https://pe=
ople.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml.html#bsp-layers=
</a></div><div><br></div><div>where the docbook source is:</div><div>=C2=A0=
 =C2=A0 =C2=A0=C2=A0 Each repository is a BSP layer supported by the Yocto =
Project =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (e.g. &lt;filename&gt;meta-raspberrypi&lt;/filename&gt; =
and =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filenam=
e&gt;meta-intel&lt;/filename&gt;). =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0</div><div>I am not sure i=
f it always does the *right* thing though.. and I have seen occurrences whe=
re it failed. I am wondering if we should &#39;fix&#39; pandoc , or just sp=
end some time fixing the output of pandoc. I don&#39;t think we will avoid =
reading/checking each manual, anyways.. I was thinking we could use pandoc =
for 80% of the work, some regex for 15% and then manually finish the work..=
 it might be a bit optimistic ;) <br></div><div><br></div><br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
rday<br>
<br>
</blockquote></div></div>

--000000000000962d2305a36c25f6--
