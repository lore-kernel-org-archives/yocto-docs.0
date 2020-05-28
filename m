Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.8314.1590655633597216097
 for <docs@lists.yoctoproject.org>;
 Thu, 28 May 2020 01:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XTVO6iB8;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id b131so11220497ybg.13
        for <docs@lists.yoctoproject.org>; Thu, 28 May 2020 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3wf11BUcp7dwt/QmCbhPw3NAD0Uy+75eDFbl6N+TMLc=;
        b=XTVO6iB8WgQWFErEQf8FXbBEDKR9GVUivEhkjaPS1Ybv51G9wXohT8p1LmqmB3eDo/
         tFvUkdZPeTa2YvgUcJmCWxUFRAyyUnyFywEjglVg42+sG+E3QdEp/iyd905IZuObDGOA
         +tDNJ/P8TMY45nOd8rIdzqPSV+W82Onfnvhc0NoRuON4H3IIrfVnHTT+DiGgZMC0b6ph
         Gs+XroRS6k8mNIOl2hFjS8WngqEvoMYwvYEE9o4GTlPTv98h0IglndOCWgfEs1qK08jW
         0zMBy8mEnK/vt5obUcZW07ZMUaMYQrI6RvyTmIb0iPqp/kQv9zc9rAbZ/LK2O8iHYw2u
         zuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3wf11BUcp7dwt/QmCbhPw3NAD0Uy+75eDFbl6N+TMLc=;
        b=MvceX8b4ULFJyPHkbOE19Y0bhdiPcLueAH2tds5PxJ/FafLVOlbHc6AObicP3AYrdZ
         UAaIDdrxUOsGpv8bApquBIIXLozuSBsH9Q4dGvC0hIMzonMHwdvNPSRvHoT2xAvAtiet
         BuOCC5DWn0WO5+pei6c18FMujxnMqLDqrTZ+Sqhu/ez187H8txZkGI3X/n2fPs7QfJuj
         3/OhtBsjU0Fa1PTkfyP6601GCbkV9mAXX6/Rj8DjlMsfPTV/eDkHwQPvc7QAI1r3/Exv
         NcLVlrUs5D5E4S7Dbt1tAK/n7C7ijMTr1WvI3bAZ5VZYxJnxghDvXZQqmtDotpjulfCT
         7X5A==
X-Gm-Message-State: AOAM532idMyw/sjiqD3/qUW20KurrtTe0XxqdCiDrarLtFQESkIQN0wj
	NOiqRUILb0FuHNtZygY7WlTv8+I58kNHJFgEhwukQA==
X-Google-Smtp-Source: ABdhPJz9eEA7OgX0hf0BuB+SAId6KaUEjZss1/s8QYk0gbqwJ37wSMNxE26eh27R4U7MeA9BUXHhBpmMm84lgxl2Gu0=
X-Received: by 2002:a25:ec3:: with SMTP id 186mr3783913ybo.475.1590655632620;
 Thu, 28 May 2020 01:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjzD-AMauxpgbydY2fryU6+JU599UPRPXi_c582WvvfV6w@mail.gmail.com>
 <18306.1590644951892762393@lists.yoctoproject.org> <CAP71WjxpZAVr8VeGv3AiRiGFscTJsRGDT6KJBaP0TEDfzUHzNQ@mail.gmail.com>
 <alpine.LFD.2.21.2005280427160.515316@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2005280427160.515316@localhost.localdomain>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 28 May 2020 10:47:00 +0200
Message-ID: <CAP71WjzDb2kMV1J+t6vRVogqo+dZ=rr==SsAQcXzBoSZt9E5og@mail.gmail.com>
Subject: Re: [docs] Possible changes to the project docs
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Mark Van De Vyver <mark@taqtiqa.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f1526905a6b15ff5"

--000000000000f1526905a6b15ff5
Content-Type: text/plain; charset="UTF-8"

On Thu, May 28, 2020 at 10:29 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Thu, 28 May 2020, Nicolas Dechesne wrote:
>
> > hi Mark,
> >
> > thanks a lot for joining the discussion! This is very helpful and much
> appreciated.
>
>   ... snip ...
>
> >       Considering AsciiDoc, MkDoc-Materialize, Docusarus, Sphinx and
> Antora
> >
> >       * A switch from DocBook is a net benefit regardless of what you
> switch too.
>
>   the one aspect of docbook i will miss is actual semantic markup
> which can then be customized with stylesheets, but that benefit is
> outweighed by all the downsides of the complexity. and given that i'm
> poring over the sphinx docs right now and playing with it, yeah,
> sphinx is my choice. :-)
>

Ah, nice. If you have any patches that are relevant for the sphinx proof of
concept, please share them. I started a sphinx2 branch here:
https://git.linaro.org/people/nicolas.dechesne/yocto-docs.git/log/?h=sphinx2

with a 'better' commit log structure. I have also done the pandoc
conversion for all manuals.


>
> rday
>

--000000000000f1526905a6b15ff5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 28, 2020 at 10:29 AM Robe=
rt P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcours=
e.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Thu, 28 May 2020, Nicolas Dechesne wrote:<br>
<br>
&gt; hi Mark,<br>
&gt;<br>
&gt; thanks a lot for joining the discussion! This is very helpful and much=
 appreciated.<br>
<br>
=C2=A0 ... snip ...<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Considering AsciiDoc, MkDoc-Materialize, Doc=
usarus, Sphinx and Antora<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* A switch from DocBook is a net benefit reg=
ardless of what you switch too.<br>
<br>
=C2=A0 the one aspect of docbook i will miss is actual semantic markup<br>
which can then be customized with stylesheets, but that benefit is<br>
outweighed by all the downsides of the complexity. and given that i&#39;m<b=
r>
poring over the sphinx docs right now and playing with it, yeah,<br>
sphinx is my choice. :-)<br></blockquote><div><br></div><div>Ah, nice. If y=
ou have any patches that are relevant for the sphinx proof of concept, plea=
se share them. I started a sphinx2 branch here:</div><div><a href=3D"https:=
//git.linaro.org/people/nicolas.dechesne/yocto-docs.git/log/?h=3Dsphinx2">h=
ttps://git.linaro.org/people/nicolas.dechesne/yocto-docs.git/log/?h=3Dsphin=
x2</a></div><div><br></div><div>with a &#39;better&#39; commit log structur=
e. I have also done the pandoc conversion for all manuals.</div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
rday<br>
</blockquote></div></div>

--000000000000f1526905a6b15ff5--
