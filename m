Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web09.3806.1604168640955533927
 for <docs@lists.yoctoproject.org>;
 Sat, 31 Oct 2020 11:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oqmsx79T;
 spf=pass (domain: linaro.org, ip: 209.85.219.175, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f175.google.com with SMTP id b138so8043505yba.5
        for <docs@lists.yoctoproject.org>; Sat, 31 Oct 2020 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=06pWB6ONFgCfmdizcRYaCFuDL6/MemAsUPQbz2S7eP8=;
        b=oqmsx79TMc94vT21Ndlmge//2ntokqE7V3RpHve7iXWLcf5jUPhKV4p09yuPASvN4A
         fC5apqOVIC2QtMIk6F9x0tczhumi6S51K6ehch1kQayhHXWhXYPKB2gbDV1jtP6203t+
         Ai3oZ8mzzPkyd+XOY+BTJjw2wDUmyZ0p0zuDp7FqDZZgTf032JuR+tsdWnld8JFlxCCx
         AyX6UGtgR1Ul8RzzhnoeH1+Sw8udZuija3vPSX779RXbO2z0A8q3Zi7whYBkrI5ylOuf
         xkFWiS1VNKTulO9Gk7pUvxxxjVvCfQyqPXmr6LhDsOOoqbTZ0d01l74N5yMQFDpW8v2+
         774g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=06pWB6ONFgCfmdizcRYaCFuDL6/MemAsUPQbz2S7eP8=;
        b=Cw/23HAr3nLLzIYWTk0D8Dv5exiRinYs5UAL8OHO/dg7DL+HUL2AbCBoBMJx6VaozX
         pygoVO3+I51L0v2KfPxs0f88yz8Wh9QYQU9jdtQqGEmGAb4CfyCNbc9k1HNU7AbVN4HR
         JnLXKkgujvpDmAQVdq6zMYoF5gX29N5XlRTqsvc8OKnP+JNxb/eSZcH/sALJKZRPEec5
         ftm3rIiltkDw9nGEVEOoaiiLqViVY/zv6a4sja9MH9KOn0FXAS1pngr5GRTfOxEajHrX
         cUC49em5EZjLXXLkRykRY+6xz3wSNfaxjCe1j43Yfg9l0tqxOTkKC6an+TmpMMmLS9vH
         URhA==
X-Gm-Message-State: AOAM533uteQADlu+8s4DEZJYxkFobTnPVsP4niR53RKhAkQEG+n/76c7
	PMGysGZx0sQnwUZIADefekxkb6bSUoY/uTEWVw+4HHSv1IGLcA==
X-Google-Smtp-Source: ABdhPJwn/ed6NcRN1KzfprXP29TFHpmqfBNOozPf/EWmrOrTHTP03PSd9wl4itUH5ijFOI0MQqkLw2Qq6CFuAu3R/8k=
X-Received: by 2002:a25:8752:: with SMTP id e18mr11349007ybn.133.1604168639853;
 Sat, 31 Oct 2020 11:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <28aabb6-01-4ca8-2c64-f76b7ecf5a8f@crashcourse.ca>
In-Reply-To: <28aabb6-01-4ca8-2c64-f76b7ecf5a8f@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Sat, 31 Oct 2020 19:23:48 +0100
Message-ID: <CAP71WjzgFV3tfuPJVcgHsqH=6pn9DrEsp49uKOrQEZiCbETFdQ@mail.gmail.com>
Subject: Re: [docs] any reason for relative "../" in :doc:`../<manual-name>/...`?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f051e605b2fb9dbb"

--000000000000f051e605b2fb9dbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 31 oct. 2020 =C3=A0 18:22, Robert P. J. Day <rpjday@crashcourse.ca>=
 a
=C3=A9crit :

>
>   just noticed numerous :doc: items in, for example, ref-manual/
> directory that use "../" as a relative location, as in:
>
> resources.rst:-  :doc:`../sdk-manual/sdk-manual` *manual :* This
> resources.rst:-  :doc:`../bsp-guide/bsp` *:* This guide defines the
> structure
> resources.rst:-  :doc:`../kernel-dev/kernel-dev` *:* This manual describ=
es
> resources.rst:-  :doc:`../ref-manual/ref-manual` *:* This
>
> i'm fairly sure you can write those with absolute pathnames, as in:
>
> resources.rst:-  :doc:`/sdk-manual/sdk-manual` *manual :*
>
> this would seem to be more stable just in case some .rst files are
> moved around. thoughts? it appears that the underlying HTML generated
> in either case is identical, unless i screwed something up.


That would be much better! I don=E2=80=99t know why i didn=E2=80=99t do th=
at in the first
place... but if it works then please send a patch!


>
> rday
>
>=20
>
>

--000000000000f051e605b2fb9dbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0sam. 31 oct. 2020 =C3=A0 18:22, Robert P. J. Day &=
lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; a=
 =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)"><br>
=C2=A0 just noticed numerous :doc: items in, for example, ref-manual/<br>
directory that use &quot;../&quot; as a relative location, as in:<br>
<br>
resources.rst:-=C2=A0 :doc:`../sdk-manual/sdk-manual` *manual :* This<br>
resources.rst:-=C2=A0 :doc:`../bsp-guide/bsp` *:* This guide defines the s=
tructure<br>
resources.rst:-=C2=A0 :doc:`../kernel-dev/kernel-dev` *:* This manual desc=
ribes<br>
resources.rst:-=C2=A0 :doc:`../ref-manual/ref-manual` *:* This<br>
<br>
i&#39;m fairly sure you can write those with absolute pathnames, as in:<br=
>
<br>
resources.rst:-=C2=A0 :doc:`/sdk-manual/sdk-manual` *manual :*<br>
<br>
this would seem to be more stable just in case some .rst files are<br>
moved around. thoughts? it appears that the underlying HTML generated<br>
in either case is identical, unless i screwed something up.</blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">That would be much better! I do=
n=E2=80=99t know why i didn=E2=80=99t do that in the first place... but if =
it works then please send a patch!</div><div dir=3D"auto"><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)" dir=3D"auto"><br>
<br>
rday<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000f051e605b2fb9dbb--
