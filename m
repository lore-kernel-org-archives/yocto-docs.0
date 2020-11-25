Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.5184.1606301732086628733
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 02:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zGIRHQGy;
 spf=pass (domain: linaro.org, ip: 209.85.222.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-qk1-f181.google.com with SMTP id z188so3551643qke.9
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2020 02:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T+VYo687fjhRqP+DfNiImM/rBxARQi5QXKkCF5dUG54=;
        b=zGIRHQGyU/+vlzwAkJ871d2iIt1zo7yzedNsm6t+ILLOvClPeUIbe//dczt503YJ6C
         r66km+2N/kA3wBBblStfr/7acKfVnLrwy2B6svRePemsEpuCNBjdHHwMPn64DkY8yQPl
         DbE1Un2fmtNu+fyw50YmvKF7aNCJTyAn/8gksqHbBCxUbOhsjZ/pip5+m/3rwxkasTqy
         YKuu6h6h+NJpAktW4hPe3LT+v5tXT7Jgn8xOlnYNHP5ogXG4sZMnfmu4I6nCCXTcD1Ge
         O4XClgeUhH6wXiD1ZuVx1shOCF6+kSw/r7J1wWMBudi77X4HQntvfJFdYPHMm0Di7fok
         J+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T+VYo687fjhRqP+DfNiImM/rBxARQi5QXKkCF5dUG54=;
        b=DSQbEMiAe4VhvPzFP/wP6mWN3EtQNY6kyl44z32aeW1pJ5QOuOwhj23wJ727V7kaUx
         jv5jCCttsDLdrnvcJqbELmyFSMQ2VRPfrQvykWYa+T0NGikg7cNMrES2V5z9D21tgbtq
         hxSmyENsxOeNIDQjAUxishZJDkDUABKcclClfN44rP4QgfqSSSb5H3ZGcdgaAz0ZI3Kr
         KrwTvSUqen8wl+UPoy2MLeGOJunXp0SuRlQNsxaYMIBGcK257/UXStsLd2f+bZyhjShm
         /Nk2JgI6L6orraqeTABKp9EG9ca5Rr418LeErxSGP3WdS6Z+0FZPqM2I/ZkDMTqFcc3u
         JkVA==
X-Gm-Message-State: AOAM531ZIxoV8Oo6Ehvado/HGfgf1XSmpMu7CV1NVdRwuiuae42wUgiS
	DSjkPH136V9eUCwqVVYVAXlnnyl5lb+LhSBghtYhhER4r5hoyQ==
X-Google-Smtp-Source: ABdhPJy/y61fUaH0nnfazWhsSzrjwwPdxwL3grb+6R1vTZdFml1jYwmKBW6HR1HkVGzbyf29PNes1ZD9IQBglU2wzL4=
X-Received: by 2002:a25:287:: with SMTP id 129mr3491640ybc.454.1606301730898;
 Wed, 25 Nov 2020 02:55:30 -0800 (PST)
MIME-Version: 1.0
References: <20201125091526.46021-1-nicolas.dechesne@linaro.org> <20201125101647.jzde6uprwod3cvpd@qschulz>
In-Reply-To: <20201125101647.jzde6uprwod3cvpd@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 25 Nov 2020 11:55:20 +0100
Message-ID: <CAP71WjzvhNnYo5EP+QoN-NprZwyLOqA-cLQ1skkES2hsG53MhA@mail.gmail.com>
Subject: Re: [docs] [PATCH] {dev,kernel,sdk}-manual: replace hardcoded release version with &DISTRO;
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000129c6905b4ec4466"

--000000000000129c6905b4ec4466
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 25 nov. 2020 =C3=A0 11:16, Quentin Schulz <
quentin.schulz@streamunlimited.com> a =C3=A9crit :

> Hi Nicolas,
>
> On Wed, Nov 25, 2020 at 10:15:26AM +0100, Nicolas Dechesne wrote:
> > In the Docbook files we had DISTRO, but somehow it was lost during the
> > migration to Sphinx.
> >
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> >  documentation/dev-manual/dev-manual-qemu.rst   |  2 +-
> >  documentation/kernel-dev/kernel-dev-common.rst |  4 ++--
> >  .../sdk-manual/sdk-appendix-obtain.rst         |  8 ++++----
> >  documentation/sdk-manual/sdk-extensible.rst    |  4 ++--
> >  documentation/sdk-manual/sdk-intro.rst         |  4 ++--
> >  documentation/sdk-manual/sdk-using.rst         | 18 +++++++++---------
> >  .../sdk-manual/sdk-working-projects.rst        | 10 +++++-----
> >  7 files changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/documentation/dev-manual/dev-manual-qemu.rst
> b/documentation/dev-manual/dev-manual-qemu.rst
> > index c91e8b538..63640411d 100644
> > --- a/documentation/dev-manual/dev-manual-qemu.rst
> > +++ b/documentation/dev-manual/dev-manual-qemu.rst
> > @@ -81,7 +81,7 @@ available. Follow these general steps to run QEMU:
> >        your :term:`Build Directory`.
> >
> >     -  If you have not built an image, you can go to the
> > -      :yocto_dl:`machines/qemu
> </releases/yocto/yocto-3.1.2/machines/qemu/>` area and download a
> > +      :yocto_dl:`machines/qemu
> </releases/yocto/yocto-&DISTRO;/machines/qemu/>` area and download a
>
> The only remark I have is that DISTRO is 3.2 now. My question is, can
> all places where 3.1.2 is used have a non-dot version instead (i.e. 3.2
> instead of 3.2.0)?
>
> If yes, we're good. If not, we probably need to add a DISTRO_DOT or
> something, that is 3.2.0 when DISTRO is 3.2 but then have them equal
> when 3.2.1 is released.
>
> I don't know how the version numbers are picked and how much they are
> used as is, hence the question :)


I think 3.2 is right. This is what we use when we publish on the website,
not 3.2.0. If we use 3.2.0 in the docs many http links won=E2=80=99t work.

When 3.2.1 is released we will use 3.2.1. So yes, we have something
asymmetric here..



>
> Quentin
>

--000000000000129c6905b4ec4466
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mer. 25 nov. 2020 =C3=A0 11:16, Quentin Schulz &lt;=
<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.schulz@stream=
unlimited.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Hi Nico=
las,<br>
<br>
On Wed, Nov 25, 2020 at 10:15:26AM +0100, Nicolas Dechesne wrote:<br>
&gt; In the Docbook files we had DISTRO, but somehow it was lost during the=
<br>
&gt; migration to Sphinx.<br>
&gt; <br>
&gt; Signed-off-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne=
@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/dev-manual/dev-manual-qemu.rst=C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
&gt;=C2=A0 documentation/kernel-dev/kernel-dev-common.rst |=C2=A0 4 ++--<br=
>
&gt;=C2=A0 .../sdk-manual/sdk-appendix-obtain.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt;=C2=A0 documentation/sdk-manual/sdk-extensible.rst=C2=A0 =C2=A0 |=C2=A0=
 4 ++--<br>
&gt;=C2=A0 documentation/sdk-manual/sdk-intro.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt;=C2=A0 documentation/sdk-manual/sdk-using.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 18 +++++++++---------<br>
&gt;=C2=A0 .../sdk-manual/sdk-working-projects.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 10 +++++-----<br>
&gt;=C2=A0 7 files changed, 25 insertions(+), 25 deletions(-)<br>
&gt; <br>
&gt; diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentat=
ion/dev-manual/dev-manual-qemu.rst<br>
&gt; index c91e8b538..63640411d 100644<br>
&gt; --- a/documentation/dev-manual/dev-manual-qemu.rst<br>
&gt; +++ b/documentation/dev-manual/dev-manual-qemu.rst<br>
&gt; @@ -81,7 +81,7 @@ available. Follow these general steps to run QEMU:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 your :term:`Build Directory`.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 If you have not built an image, you can go =
to the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 :yocto_dl:`machines/qemu &lt;/releases/yocto/yoc=
to-3.1.2/machines/qemu/&gt;` area and download a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :yocto_dl:`machines/qemu &lt;/releases/yocto/yoc=
to-&amp;DISTRO;/machines/qemu/&gt;` area and download a<br>
<br>
The only remark I have is that DISTRO is 3.2 now. My question is, can<br>
all places where 3.1.2 is used have a non-dot version instead (i.e. 3.2<br>
instead of 3.2.0)?<br>
<br>
If yes, we&#39;re good. If not, we probably need to add a DISTRO_DOT or<br>
something, that is 3.2.0 when DISTRO is 3.2 but then have them equal<br>
when 3.2.1 is released.<br>
<br>
I don&#39;t know how the version numbers are picked and how much they are<b=
r>
used as is, hence the question :)</blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto">I think 3.2 is right. This is what we use when we publish =
on the website, not 3.2.0. If we use 3.2.0 in the docs many http links won=
=E2=80=99t work.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">W=
hen 3.2.1 is released we will use 3.2.1. So yes, we have something asymmetr=
ic here..</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)" dir=3D"auto"><br>
<br>
Quentin<br>
</blockquote></div></div>

--000000000000129c6905b4ec4466--
