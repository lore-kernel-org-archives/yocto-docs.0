Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.8277.1618835952500827561
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 05:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jgjIzYwK;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id q24so409530vkd.1
        for <docs@lists.yoctoproject.org>; Mon, 19 Apr 2021 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l0TjAA7Gw2035aaHmRpWSkHv2r+cdZTJd/nOQ9FkCVk=;
        b=jgjIzYwKTib1P+b2SnvQo167pxYXJko8ep4gSLhiiG/ECLh4nXUOFjVOi397K6wimz
         er5XGW0d0fWiuWFWqMJzIDvK6QTKDTqYp1Srzlawm18Drwz6sdmnfVKrxDm5IrBP5IWb
         FQhbTpqwgg5+0BcL7mzioXanUVwvQzlYc3ytVwlrYWhw1RH77b4poEQGjU15Irppcm+M
         wvAsQewAAjFWptLC/Qmg/oFqtJjQO8UZP7K0vF3YKcuiNc1cnJzYZ59kL+y6iNHahkAm
         fVkFjn1N2uKdOOYNPXdjwh2926FZJQimIRCG53FRxloulU/epx11TxKV6pgAbn/TptZG
         evaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l0TjAA7Gw2035aaHmRpWSkHv2r+cdZTJd/nOQ9FkCVk=;
        b=UPEj8iUXIYKEJfVXcs8jukPMhKy/iPl3v33xJ+AmHQZ2T7TU6zJesXq17ctXbcR/fw
         KjUl0OJHYFI5QblPv3igbi8FM6qDb3HCQoTxdLy3pXzancSv6E88tqabtKfzZisD7VhN
         61NH72aZbTW/D8uIGzVQ2OIUVyU3LuW9jNFvyubhO4YY4ARZcvSxSSe1rixBnO1TkQOK
         h6ocDjxYa8C/RJLXtg6nh5IxdAG8PLZXR6p5W0PbWdtkg5XtjWL30z1bZmsUxdX6zIEr
         AYHeO3OFnSfFsPMMRds74txhoxcN6jh2O7JbyK91qk8Hi7NCvuNqoqKqC3Bu+UW6131v
         SFHg==
X-Gm-Message-State: AOAM531KWM2qu6tZNtwGC54cfOK0B9ahYGKC6wOh6jY7QbzyG5yIb4ye
	j9puKjpEiQ0f+8ho76/NLmGq0lI5ZQndH44PeM8=
X-Google-Smtp-Source: ABdhPJxyQB2ZJHSiNspdYY0gd0PwYJpdqGHM4rz8k9B8/3w83sqGRfe5TU6lSlYwsfaChX9yd2edp5GU7zKZUzd5HmQ=
X-Received: by 2002:a1f:5506:: with SMTP id j6mr2736172vkb.7.1618835951621;
 Mon, 19 Apr 2021 05:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210419090044.582453-4-alex.kanavin@gmail.com>
 <8b2212544d8f565c7343a88d837c8c6f390e82e8.camel@linuxfoundation.org> <20210419103354.3gq6dn2c2tw7f3k2@qschulz>
In-Reply-To: <20210419103354.3gq6dn2c2tw7f3k2@qschulz>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 19 Apr 2021 14:39:00 +0200
Message-ID: <CANNYZj9DDzJfoAzXwz+yJbHfsDfbBHdhZvewCZXXsELP9B_uEQ@mail.gmail.com>
Subject: Re: [docs] [OE-core] [PATCH 4/4] dev-manual/common-tasks.rst: correct the documentation for debuginfod
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, docs <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d89b4d05c0529d9d"

--000000000000d89b4d05c0529d9d
Content-Type: text/plain; charset="UTF-8"

Thank you, I will fix these up and resend. Is docs@ the right destination
for patches to documentation/ ?

Alex

On Mon, 19 Apr 2021 at 12:33, Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> Hi all,
>
> On Mon, Apr 19, 2021 at 11:11:21AM +0100, Richard Purdie wrote:
> > Forwarded from OE-Core to ensure docs people see it.
> >
> > Cheers,
> >
> > Richard
>
> > Date: Mon, 19 Apr 2021 11:00:44 +0200
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > Subject: [OE-core] [PATCH 4/4] dev-manual/common-tasks.rst: correct the
> >  documentation for debuginfod
> >
> > Particularly,
> > - correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake
> variables
> > - all necessary component tweaks are enabled by default via
> DISTRO_FEATURES
> > - provide on-target examples of what to look for when things work
> properly
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  documentation/dev-manual/common-tasks.rst | 34 +++++++++++++++--------
> >  documentation/ref-manual/variables.rst    |  6 ----
> >  2 files changed, 22 insertions(+), 18 deletions(-)
> >
> > diff --git a/documentation/dev-manual/common-tasks.rst
> b/documentation/dev-manual/common-tasks.rst
> > index 176025f9e8..9f33b6b2c8 100644
> > --- a/documentation/dev-manual/common-tasks.rst
> > +++ b/documentation/dev-manual/common-tasks.rst
> > @@ -10005,34 +10005,44 @@ debug symbols from the server.
> >
> >  To run a debuginfod server, you need to do the following:
> >
> > --  Ensure that this variable is set in your ``local.conf`` file:
> > +-  Ensure that "debuginfod" is present in :term:`DISTRO_FEATURES
>
> Missing trailing `.
>
> > +   (it already is in oe-core defaults and poky reference distribution).
>
> s/oe-core/``OpenEmbedded-core/ ?
> s/poky/``poky``/ ?
>
> > +   If not, set:
> >     ::
> >
> > -      PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
> > +      DISTRO_FEATURES_append = " debuginfod"
> >
> > -   This :term:`PACKAGECONFIG` option enables debuginfod and
> libdebuginfod for
> > -   "elfutils-native".
> > +   This distro feature enables the server and client library in
> elfutils,
>
> s/elfutils/``elfutils``/ ?
>
> > +   and enables debuginfod support in clients (at the moment, gdb and
> binutils).
> >
>
> s/debuginfod/``debuginfod``/ ?
> s/gdb/``gdb``/ ?
> s/binutils/``binutils``/ ?
>
> > --  Run the following commands to set up the "debuginfod" server:
> > +-  Run the following commands to launch the "debuginfod" server on the
> host:
>
> s/"debuginfod"/``debuginfod``/ ?
>
> >     ::
> >
> >        $ oe-debuginfod
> >
> > +-  To use debuginfod on the target, you need to know the ip:port where
> > +   debuginfod is listening on the host (port defaults to 8002), and
> export
>
> s/debuginfod/``debuginfod``/ for both debuginfod?
>
> > +   that into the shell environment, for example in qemu:
>
> s/qemu/``qemu``/ ?
>
> > +   ::
> >
>
> It should be:
>
> that into the shell environment, for example in qemu::
>
> instead.
>
> > -To use debuginfod on the target, you need the following:
> > +      root@qemux86-64:~# export DEBUGINFOD_URLS="
> http://192.168.7.1:8002/"
> >
> > --  Ensure that this variable is set in your ``local.conf`` file:
> > +-  Then debug info fetching should simply work when running the target
> gdb,
>
> s/gdb/``gdb``/ ?
>
> > +   readelf or objdump, for example:
>
> s/readelf/``readelf``/ ?
> s/objdump/``objdump``/ ?
>
> >     ::
> >
>
> It should be:
>
> readelf or objdump, for example::
>
> instead.
>
> > -      DEBUGINFOD_URLS = "http://localhost:8002/"
> > -
> > -   This :term:`DEBUGINFOD_URLS` option does the client configuration.
> > +      root@qemux86-64:~# gdb /bin/cat
> > +      ...
> > +      Reading symbols from /bin/cat...
> > +      Downloading separate debug info for /bin/cat...
> > +      Reading symbols from
> /home/root/.cache/debuginfod_client/923dc4780cfbc545850c616bffa884b6b5eaf322/debuginfo...
> >
> > +-  It's also possible to use "debuginfod-find" to just query the server:
>
> s/"debuginfod-find"/``debuginfod-find``/ ?
>
> >     ::
> >
>
> It should be:
>
> It's also possible to use "debuginfod-find" to just query the server::
>
> instead.
>
> Cheers,
> Quentin
>

--000000000000d89b4d05c0529d9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you, I will fix these up and resend. Is docs@ t=
he right destination for patches to documentation/ ?</div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, 19 Apr 2021 at 12:33, Quentin Schulz &lt;<a href=
=3D"mailto:quentin.schulz@streamunlimited.com">quentin.schulz@streamunlimit=
ed.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi all,<br>
<br>
On Mon, Apr 19, 2021 at 11:11:21AM +0100, Richard Purdie wrote:<br>
&gt; Forwarded from OE-Core to ensure docs people see it.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
<br>
&gt; Date: Mon, 19 Apr 2021 11:00:44 +0200<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH 4/4] dev-manual/common-tasks.rst: correct th=
e<br>
&gt;=C2=A0 documentation for debuginfod<br>
&gt; <br>
&gt; Particularly,<br>
&gt; - correctly describe the use of DEBUGINFOD_URLS; drop it from bitbake =
variables<br>
&gt; - all necessary component tweaks are enabled by default via DISTRO_FEA=
TURES<br>
&gt; - provide on-target examples of what to look for when things work prop=
erly<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/dev-manual/common-tasks.rst | 34 +++++++++++++++--=
------<br>
&gt;=C2=A0 documentation/ref-manual/variables.rst=C2=A0 =C2=A0 |=C2=A0 6 --=
--<br>
&gt;=C2=A0 2 files changed, 22 insertions(+), 18 deletions(-)<br>
&gt; <br>
&gt; diff --git a/documentation/dev-manual/common-tasks.rst b/documentation=
/dev-manual/common-tasks.rst<br>
&gt; index 176025f9e8..9f33b6b2c8 100644<br>
&gt; --- a/documentation/dev-manual/common-tasks.rst<br>
&gt; +++ b/documentation/dev-manual/common-tasks.rst<br>
&gt; @@ -10005,34 +10005,44 @@ debug symbols from the server.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 To run a debuginfod server, you need to do the following:<br>
&gt;=C2=A0 <br>
&gt; --=C2=A0 Ensure that this variable is set in your ``local.conf`` file:=
<br>
&gt; +-=C2=A0 Ensure that &quot;debuginfod&quot; is present in :term:`DISTR=
O_FEATURES<br>
<br>
Missing trailing `.<br>
<br>
&gt; +=C2=A0 =C2=A0(it already is in oe-core defaults and poky reference di=
stribution).<br>
<br>
s/oe-core/``OpenEmbedded-core/ ?<br>
s/poky/``poky``/ ?<br>
<br>
&gt; +=C2=A0 =C2=A0If not, set:<br>
&gt;=C2=A0 =C2=A0 =C2=A0::<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG_pn-elfutils-native =3D &quot;debug=
infod libdebuginfod&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 DISTRO_FEATURES_append =3D &quot; debuginfod&quo=
t;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0This :term:`PACKAGECONFIG` option enables debuginfod and=
 libdebuginfod for<br>
&gt; -=C2=A0 =C2=A0&quot;elfutils-native&quot;.<br>
&gt; +=C2=A0 =C2=A0This distro feature enables the server and client librar=
y in elfutils,<br>
<br>
s/elfutils/``elfutils``/ ?<br>
<br>
&gt; +=C2=A0 =C2=A0and enables debuginfod support in clients (at the moment=
, gdb and binutils).<br>
&gt;=C2=A0 <br>
<br>
s/debuginfod/``debuginfod``/ ?<br>
s/gdb/``gdb``/ ?<br>
s/binutils/``binutils``/ ?<br>
<br>
&gt; --=C2=A0 Run the following commands to set up the &quot;debuginfod&quo=
t; server:<br>
&gt; +-=C2=A0 Run the following commands to launch the &quot;debuginfod&quo=
t; server on the host:<br>
<br>
s/&quot;debuginfod&quot;/``debuginfod``/ ?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ oe-debuginfod<br>
&gt;=C2=A0 <br>
&gt; +-=C2=A0 To use debuginfod on the target, you need to know the ip:port=
 where<br>
&gt; +=C2=A0 =C2=A0debuginfod is listening on the host (port defaults to 80=
02), and export<br>
<br>
s/debuginfod/``debuginfod``/ for both debuginfod?<br>
<br>
&gt; +=C2=A0 =C2=A0that into the shell environment, for example in qemu:<br=
>
<br>
s/qemu/``qemu``/ ?<br>
<br>
&gt; +=C2=A0 =C2=A0::<br>
&gt;=C2=A0 <br>
<br>
It should be:<br>
<br>
that into the shell environment, for example in qemu::<br>
<br>
instead.<br>
<br>
&gt; -To use debuginfod on the target, you need the following:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 root@qemux86-64:~# export DEBUGINFOD_URLS=3D&quo=
t;<a href=3D"http://192.168.7.1:8002/" rel=3D"noreferrer" target=3D"_blank"=
>http://192.168.7.1:8002/</a>&quot;<br>
&gt;=C2=A0 <br>
&gt; --=C2=A0 Ensure that this variable is set in your ``local.conf`` file:=
<br>
&gt; +-=C2=A0 Then debug info fetching should simply work when running the =
target gdb,<br>
<br>
s/gdb/``gdb``/ ?<br>
<br>
&gt; +=C2=A0 =C2=A0readelf or objdump, for example:<br>
<br>
s/readelf/``readelf``/ ?<br>
s/objdump/``objdump``/ ?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0::<br>
&gt;=C2=A0 <br>
<br>
It should be:<br>
<br>
readelf or objdump, for example::<br>
<br>
instead.<br>
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 DEBUGINFOD_URLS =3D &quot;<a href=3D"http://loca=
lhost:8002/" rel=3D"noreferrer" target=3D"_blank">http://localhost:8002/</a=
>&quot;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0This :term:`DEBUGINFOD_URLS` option does the client conf=
iguration.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 root@qemux86-64:~# gdb /bin/cat<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Reading symbols from /bin/cat...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Downloading separate debug info for /bin/cat...<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Reading symbols from /home/root/.cache/debuginfo=
d_client/923dc4780cfbc545850c616bffa884b6b5eaf322/debuginfo...<br>
&gt;=C2=A0 <br>
&gt; +-=C2=A0 It&#39;s also possible to use &quot;debuginfod-find&quot; to =
just query the server:<br>
<br>
s/&quot;debuginfod-find&quot;/``debuginfod-find``/ ?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0::<br>
&gt;=C2=A0 <br>
<br>
It should be:<br>
<br>
It&#39;s also possible to use &quot;debuginfod-find&quot; to just query the=
 server::<br>
<br>
instead.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>

--000000000000d89b4d05c0529d9d--
