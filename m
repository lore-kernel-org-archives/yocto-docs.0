Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.9304.1619078347932049321
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 00:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jsGKIRXC;
 spf=pass (domain: linaro.org, ip: 209.85.208.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f43.google.com with SMTP id i3so26612576edt.1
        for <docs@lists.yoctoproject.org>; Thu, 22 Apr 2021 00:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bRpTVfkB7TBfUo1uWR4l+FjF9fdvztrlug0VlVFagS4=;
        b=jsGKIRXCU+EvNVlKJ5CZ1kt1nbM7B2Mvj/FI7T3osbnXnv56zS0wZ804mNQ4b0aL5o
         iT2s42FY7OeQUxGHPJsDQ/RboTwqnN+cAj5QItuWg2txxcpY1QpSizjaqh2qYnWxhFKK
         1FwNGZZgdRq6FR0wmnvoFiZeCgR443fCRsDacizRsd4hwMsE3U95R8iQEewOYo9RdmC7
         cjwLsUg3SzLg/jLe2PhsroSlww21trtZk2NgTsJwt80PsklViHeTSTVKgQMD9hR5FzE3
         dIM1XHBltAG79A7333WeIPkJixtB8PI5MagT/LdRaTt1Qp71GfCaH1TkNzO7CXshdnTr
         /nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bRpTVfkB7TBfUo1uWR4l+FjF9fdvztrlug0VlVFagS4=;
        b=t5DcMVEaNEXlQY0R1P4xk5wFwEOP81VTP0A1+wayiLUP4d1kD6TqMy9ynv74nwthen
         WkM+5XW1JK2ntKSLgc4UOMMi9fhU5C/WwSc6/tLzVlLn4HjQA2Pz+ZbyN4/Mz9GSRm3n
         pOd3b6tpx7wi8InoJU/xTzgjMOtcu/b2qdZEuEXmOpY/wwZXld7RZHfBWxC3DwuEpFdl
         YhR7WmPLRS2G/oI/sxZZNk44vbrLDrFjo3xNL3anmTquKpWefWXTvBiP5/0NeFVq10s9
         s6lhHw3xcVKQsFfk+935ofkqq9AfTl+x+5wcFzSctVOQB1wGarMYd0BgTdhhaJZSyfYC
         4WlA==
X-Gm-Message-State: AOAM533mINbjFRpNEu065pjZ287Zq8UPiq8gorlBTb/tY8fk/dr5+wAT
	Bu4PbzssFb2bnxoeftyUZrt8Kr3H4VVGC9rzJhbSdYh6+HA=
X-Google-Smtp-Source: ABdhPJxeUDiRDDKl6O5mMjxltFmXp/Xc8XgD81d/9S0/XzXpHb474V62hz9mxB4Q2svhu/VcgOqmvWo1a3rZrX5HIaU=
X-Received: by 2002:a50:c44f:: with SMTP id w15mr2193550edf.79.1619078346317;
 Thu, 22 Apr 2021 00:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <7f2f05a5-7492-ff74-e756-09937f59643f@bootlin.com>
In-Reply-To: <7f2f05a5-7492-ff74-e756-09937f59643f@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 22 Apr 2021 09:58:55 +0200
Message-ID: <CAP71WjxRhwcrzjKh8gKTiuby1HBtMn0C-ikkHXM2WrRt=Qm75A@mail.gmail.com>
Subject: Re: [docs] Vector sources for the manual figures ?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000b250ca05c08b0d7b"

--000000000000b250ca05c08b0d7b
Content-Type: text/plain; charset="UTF-8"

hey Michael,

On Tue, Apr 20, 2021 at 6:10 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Greetings,
>
> In the YP manual sources, all the figures are in PNG format. Except for
> screenshots, that's far from ideal for high resolution printing and
> viewing!
>
> Don't we have vector sources of such diagrams anywhere, so that I can
> export them to SVG? Don't tell me they were lost during the migration to
> Egypt. I mean the migration to Sphinx ;-P
>

Nothing was lost/destroyed as part of the migration for sure. And we use
git, so nothing can be lost anyways.
I've used the .png files since they were used in the docbook docs, and
available in yocto-docs, but I am not aware if the 'sources' for these PNG
were some actual SVG.


>
> In particular, I'm asking because I managed to find a way to see the
> figures in full-width in the epub output (using my KOBO reader to read
> the manuals when I'm not in front of my computer, but the figures are
> always too small and therefore unreadable). You just need to add
> ":width: 100%" to each image insertion, and this doesn't seem to disturb
> the HTML output which already looks correct.
>
> I'll propose a patch soon, but the results would be even better with
> vector figures :)
>
> Thanks in advance,
>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> 
>
>

--000000000000b250ca05c08b0d7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">hey Michael,</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 20, 2021 at 6:10 =
PM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com"=
>michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Greetings,<br>
<br>
In the YP manual sources, all the figures are in PNG format. Except for<br=
>
screenshots, that&#39;s far from ideal for high resolution printing and vi=
ewing!<br>
<br>
Don&#39;t we have vector sources of such diagrams anywhere, so that I can<=
br>
export them to SVG? Don&#39;t tell me they were lost during the migration =
to<br>
Egypt. I mean the migration to Sphinx ;-P<br></blockquote><div><br></div><=
div>Nothing was lost/destroyed as part of the migration for sure. And we us=
e git, so nothing can be lost anyways.=C2=A0</div><div>I&#39;ve used the .p=
ng files since they were used in the docbook docs, and available in yocto-d=
ocs, but I am not aware if the &#39;sources&#39; for these PNG were some ac=
tual SVG.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
In particular, I&#39;m asking because I managed to find a way to see the<b=
r>
figures in full-width in the epub output (using my KOBO reader to read<br>
the manuals when I&#39;m not in front of my computer, but the figures are<=
br>
always too small and therefore unreadable). You just need to add<br>
&quot;:width: 100%&quot; to each image insertion, and this doesn&#39;t see=
m to disturb<br>
the HTML output which already looks correct.<br>
<br>
I&#39;ll propose a patch soon, but the results would be even better with<b=
r>
vector figures :)<br>
<br>
Thanks in advance,<br>
<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https=
://bootlin.com</a><br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000b250ca05c08b0d7b--
