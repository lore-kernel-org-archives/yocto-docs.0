Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0BBC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 07:53:11 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.2848.1639986790398938243
 for <docs@lists.yoctoproject.org>;
 Sun, 19 Dec 2021 23:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=v+3e/IBF;
 spf=pass (domain: linaro.org, ip: 209.85.208.46,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f46.google.com with SMTP id j21so30318143edt.9
        for <docs@lists.yoctoproject.org>;
 Sun, 19 Dec 2021 23:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrGtkqdrsqalsSXNPt/ow3zy8jY2Tg+Jg4Jjxfhms4w=;
        b=v+3e/IBFuk9W+IZAqV8wIaHmlNBoaFkopNeG4eyvapBUgmgsGxR9KHrPnV7oFIXj37
         1KAH/E9EZIcSmk8LudC8GiswEWSZZXyCt21wZcm4yAbuzLVACTWRqkwcHYvJALbTckVM
         BgkWBbzKcZk5/DXlHFUpIoVhAP2lGDWBomfxjhXTewL/pV67NxnccDlZ7//Ts6ThVEzz
         TT6v5IMMbgnPFRT9k7h4OcTWajaHdEOPdygBt2wlWnwwffB5Esnb2tJK/rjFyPaw3Sua
         D4DDgeau6rvpRXxBgxH4sA6Drh7qaHuBUM8C6oSMIfVEPFKUjH8CZhfOL3na2Dl77z4z
         3lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrGtkqdrsqalsSXNPt/ow3zy8jY2Tg+Jg4Jjxfhms4w=;
        b=FV4dydmDQG6n5aTykhdvcI4mdnsntKuwqLFayYZXU3fMY1rhkbc+ciO4aXGySkTAWJ
         hkj7c3p10BI7kD5TUc8MhZlJ8sSKz1fyLyq9/Q2E+9ZhMG/NIHqCx3KdFOcj0KtBgHBr
         D97YD/A+Aggdy46cLZSmQTPfA+H3H9eBWG1BNKwPPLCDVwbI529lRVa+z2zZbPqI0VPz
         4KJEQL70eNLmBU/L1WD1UzlqJaSS7RUTjf9JHF9qWwRvsmqf53GaLZf3bujZDRcRdtNG
         5vWj2eGYTz+Tg68VntY4COSm43RMEXyt6+WvJ5lxP9Fb92kZ0Xd+QTTnKXkf7ScZweYF
         qW8g==
X-Gm-Message-State: AOAM530GHzUILMTP4H1+cbJPqNjbt7lTsCFlyDX36wazby/F6pB7bRRD
	1ki+kpH41ef8nEu5SLTjgGxL0GOt8MwHcvUeSwQa5g==
X-Google-Smtp-Source: 
 ABdhPJyJddxiWzySfH1Ft8xtubOV0t7QLwTZ2Xt++OHm1+yvCYq4NvXNLXc0IkowyTMlBNcdHWc2oYFkX4ck7iudRh0=
X-Received: by 2002:a17:906:685:: with SMTP id
 u5mr11801992ejb.543.1639986788351;
 Sun, 19 Dec 2021 23:53:08 -0800 (PST)
MIME-Version: 1.0
References: <16C24BBC17B627F4.6238@lists.yoctoproject.org>
 <20211219235023.GA31644@localhost>
In-Reply-To: <20211219235023.GA31644@localhost>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 20 Dec 2021 08:52:58 +0100
Message-ID: 
 <CAP71WjzoipCOwpPWLo6qfp72cr5zHmz-=fHK+XHjB8rMa1x6vw@mail.gmail.com>
Subject: Re: [docs] linking externally to the latest branch
To: Trevor Woerner <twoerner@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f4d9f605d38f2dd3"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Dec 2021 07:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2318

--000000000000f4d9f605d38f2dd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 12:50 AM Trevor Woerner <twoerner@gmail.com> wrote:

> On Sun 2021-12-19 @ 06:28:01 PM, Trevor Woerner via lists.yoctoproject.or=
g
> wrote:
> >
> https://docs.yoctoproject.org/3.1.12/singleindex.html#creating-a-read-onl=
y-root-filesystem
> >
> > Is there a way to replace the "3.1.12" in the above URL with something
> that
> > means "the latest 3.1.x"?
>
> =E2=80=A6should have done more research before posting, lol
>
>
>
> https://docs.yoctoproject.org/dunfell/singleindex.html#creating-a-read-on=
ly-root-filesystem


To be pedantic.. this isn't strictly what you asked. the link
https://docs.yoctoproject.org/<branch> does not correspond to the most
recent release (latest 3.1.x) but to the current <branch>, which typically
includes the content for the next stable release.

We also publish https://docs.yoctoproject.org/current which links to the
most recent YP release (tag), and of course https://docs.yoctoproject.org/
corresponds to the dev branch.


>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2317):
> https://lists.yoctoproject.org/g/docs/message/2317
> Mute This Topic: https://lists.yoctoproject.org/mt/87846495/1279857
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> nicolas.dechesne@linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f4d9f605d38f2dd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 20, 2021 at 12:50 AM Trev=
or Woerner &lt;<a href=3D"mailto:twoerner@gmail.com">twoerner@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On S=
un 2021-12-19 @ 06:28:01 PM, Trevor Woerner via <a href=3D"http://lists.yoc=
toproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org<=
/a> wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docs.yoctoproject.org/3.1=
.12/singleindex.html#creating-a-read-only-root-filesystem" rel=3D"noreferre=
r" target=3D"_blank">https://docs.yoctoproject.org/3.1.12/singleindex.html#=
creating-a-read-only-root-filesystem</a><br>
&gt; <br>
&gt; Is there a way to replace the &quot;3.1.12&quot; in the above URL with=
 something that<br>
&gt; means &quot;the latest 3.1.x&quot;?<br>
<br>
=E2=80=A6should have done more research before posting, lol<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://docs.yoctoproject.org/dunfel=
l/singleindex.html#creating-a-read-only-root-filesystem" rel=3D"noreferrer"=
 target=3D"_blank">https://docs.yoctoproject.org/dunfell/singleindex.html#c=
reating-a-read-only-root-filesystem</a></blockquote><div><br></div><div>To =
be pedantic.. this isn&#39;t strictly what you asked. the link=C2=A0<a href=
=3D"https://docs.yoctoproject.org/">https://docs.yoctoproject.org/</a>&lt;b=
ranch&gt; does not correspond to the most recent release (latest 3.1.x) but=
 to the current &lt;branch&gt;, which typically includes the content for th=
e next stable release.</div><div><br></div><div>We also publish=C2=A0<a hre=
f=3D"https://docs.yoctoproject.org/current">https://docs.yoctoproject.org/c=
urrent</a> which links to the most recent YP release (tag), and of course=
=C2=A0<a href=3D"https://docs.yoctoproject.org/">https://docs.yoctoproject.=
org/</a> corresponds to the dev branch.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2317): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2317" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2317</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87846495/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87846495/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f4d9f605d38f2dd3--

