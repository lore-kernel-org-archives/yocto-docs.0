Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAFAC0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:49:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3069.1739317765246785694
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lxVDIEQg;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43934d6b155so1633385e9.1
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739317764; x=1739922564; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vXPqrd1KYQOgUjMZjZ3OWsIvDmNG+VIA6v4Y979AZqQ=;
        b=lxVDIEQgh/pYPk4Qa6cwCJwEKzxdy4MquSgdzq3buWaMWaXEe3Ni1MICKGNT3OEGir
         2arpXz8fykw2f3nehFR8/2G6OuXxSZCU8sOwOJhI26B4l4lrRqdhoTxDWxZS0YEI1ehA
         g5mhRWsR9IceEUHmuPK8yKWTk3twE13jmYTC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317764; x=1739922564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXPqrd1KYQOgUjMZjZ3OWsIvDmNG+VIA6v4Y979AZqQ=;
        b=LWmMJgSqmdfn6E93ciRSBGupq6L24n3UtGjT9Tm/6P2yYbpcRGv3P9ErDqdsBYYja1
         SQRuEt01W+ztn22F07AateDI0O6+5ftDtCjb7Dl8FJ5nL49Qjbqoa/5gjF5KMUYco3Cv
         95I7707aGDQvIUEYDmO6hrFL1WjHaTKSITsNqUPpBm6eylXNQYbigPXKjV0HNAbQ6gpk
         cbeF1EE/yiYcP/5tq9M5w07lFf5+DVYBYthPlGwEQJYdMDnD3fJV1G7mvS7LubBFhm0N
         Bme46G0aDjw33GrcsADLG2iewUUVpqHZydUmbnWlHG3k7jp542Nu+Bre9h1AERsfzMTp
         jFyA==
X-Gm-Message-State: AOJu0Yx9wG6bf5SpsGBPovzYWoa4ZTcmVwx8ECsTTND5ieR+8rT3grTZ
	0FGteBzR7+D/Qty71elwinhLzC89M17VfAUtBTXhQcc5jlJP8CoST3Xs9JIBqL1dGY24QSPKEKn
	77L/IjzpZvSk7SpuPFaE/gEjc//4W28fg9z5w3Q==
X-Gm-Gg: ASbGncuNbTmQe3ogyByjANsfaUWviklYUhh7YDPTKXYXJ64E1rB6yo4eVI9hSkg3+Lw
	Wgnb97FoFZr18v0znETfEwXnbblkJdYVVOid8chyxplFfG9eM4J2s52ko8NzunJ22HxnbxkfI
X-Google-Smtp-Source: AGHT+IGTWst9vjzR6ZchRE6IfFHP4d4nXmkbALwlQ/kM7Kg0hrkJ9xcyQpeD+A/jUVXFXRdfQzASS7g13ZIojNe2ME4=
X-Received: by 2002:a05:600c:198c:b0:434:ffb2:f9cf with SMTP id
 5b1f17b1804b1-439583d1484mr6044795e9.14.1739317763489; Tue, 11 Feb 2025
 15:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20250206215711.154194-1-yoann.congal@smile.fr>
 <20250206215711.154194-3-yoann.congal@smile.fr> <52281efc-eeae-4b9a-a0a8-6b42f83a9d7a@cherry.de>
 <4508019a-f5b8-4a55-abc9-b757045ecdea@smile.fr> <b6b28fff-bcdf-4694-91e0-117f9b9ff957@cherry.de>
In-Reply-To: <b6b28fff-bcdf-4694-91e0-117f9b9ff957@cherry.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 12 Feb 2025 00:48:56 +0100
X-Gm-Features: AWEUYZneqRVjnaiJ9HrH4vRaxrxAz_ty8i7AWVB0LHe_OZaJuT-cwxcN1vaxvow
Message-ID: <CAMSfU+4fKoVMZ7ouvRLbib280ueOv9uW9wDvJYS9yZ0naf0DiQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org, 
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Content-Type: multipart/alternative; boundary="00000000000071d6d9062de6799c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:49:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6349

--00000000000071d6d9062de6799c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 10 f=C3=A9vr. 2025 =C3=A0 17:39, Quentin Schulz <quentin.schulz@che=
rry.de> a
=C3=A9crit :

> Hi Yoann,
>
> On 2/9/25 11:59 PM, Yoann Congal wrote:
> >
> >
> > Le 07/02/2025 =C3=A0 10:13, Quentin Schulz a =C3=A9crit :
> >> Hi Yoann,
> >>
> >> On 2/6/25 10:57 PM, Yoann Congal via lists.yoctoproject.org wrote:
> >>> From: Yoann Congal <yoann.congal@smile.fr>
> >>>
> >>> Shows an example of the new variable
> OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
> >>> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that
> were
> >>> shown earlier.
> >>>
> >>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> >>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> >>> ---
> >>> v1->v2: Quentin's review
> >>> * tick-quote variable in title
> >>> * a set of recipeS
> >>> * 3 spaces to align a code block (not 4)
> >>> ---
> >>>    .../test-manual/reproducible-builds.rst        | 18
> ++++++++++++++++++
> >>>    1 file changed, 18 insertions(+)
> >>>
> >>> diff --git a/documentation/test-manual/reproducible-builds.rst b/
> >>> documentation/test-manual/reproducible-builds.rst
> >>> index b9f671d68..77c15d6e2 100644
> >>> --- a/documentation/test-manual/reproducible-builds.rst
> >>> +++ b/documentation/test-manual/reproducible-builds.rst
> >>> @@ -145,3 +145,21 @@ set of recipes before the test, meaning they are
> >>> excluded from reproducibility
> >>>    testing. As a practical example, you could set ``sstate_targets`` =
to
> >>>    ``core-image-sato``, then setting ``targets`` to ``core-image-sato=
-
> >>> sdk`` would
> >>>    run reproducibility tests only on the targets belonging only to
> >>> ``core-image-sato-sdk``.
> >>> +
> >>> +Using `OEQA_REPRODUCIBLE_TEST_*` variables
> >>
> >> Sorry, I meant double-tick quoting, the same way we do for the classes
> >> in documentation/ref-manual/classes.rst, c.f.
> >
> > I'll fix in v3.
> >
> >> ``allarch``
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> My grep-fu didn't return anything with :term: in titles, so I guess
> >> that's why we're going with double-quotes typically?
> >
> > That does ring a bell:
> >
> https://git.yoctoproject.org/yocto-docs/commit/?id=3Db9e19a00a3aac05a2cdd=
35b61dfae6d5a1a9c648
> > ...but in this case the linkage works (but the link is rendered as blac=
k
>
> Ahah! Thanks for the pointer :)
>
> > wheras the rest of the title is blue, looks a bit weird IMHO).
> > Also, since I don't point a single variable but the whole
> > OEQA_REPRODUCIBLE_TEST_* group, I'd rather leave it with double quotes.
> >
>
> We actually do have a bunch of those already:
>
> :term:`SYSROOT_DIRS* <SYSROOT_DIRS>` variables.
> See the :term:`SYSROOT_* <SYSROOT_DESTDIR>` variables
> :term:`module_conf_* <module_conf>` variable.
>
> etc.
>

I've missed this review for v4, I've sent v5 with it.

Thanks!


> Cheers,
> Quentin
>


--=20
Yoann Congal
Smile ECS - Tech expert

--00000000000071d6d9062de6799c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 10=
 f=C3=A9vr. 2025 =C3=A0=C2=A017:39, Quentin Schulz &lt;<a href=3D"mailto:qu=
entin.schulz@cherry.de">quentin.schulz@cherry.de</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
On 2/9/25 11:59 PM, Yoann Congal wrote:<br>
&gt; <br>
&gt; <br>
&gt; Le 07/02/2025 =C3=A0 10:13, Quentin Schulz a =C3=A9crit=C2=A0:<br>
&gt;&gt; Hi Yoann,<br>
&gt;&gt;<br>
&gt;&gt; On 2/6/25 10:57 PM, Yoann Congal via <a href=3D"http://lists.yocto=
project.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a=
> wrote:<br>
&gt;&gt;&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr=
" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LE=
AF_TARGETS<br>
&gt;&gt;&gt; and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS=
 that were<br>
&gt;&gt;&gt; shown earlier.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal=
@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt;&gt; Reviewed-by: Guillaume Swaenepoel &lt;<a href=3D"mailto:guilla=
ume.swaenepoel@smile.fr" target=3D"_blank">guillaume.swaenepoel@smile.fr</a=
>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; v1-&gt;v2: Quentin&#39;s review<br>
&gt;&gt;&gt; * tick-quote variable in title<br>
&gt;&gt;&gt; * a set of recipeS<br>
&gt;&gt;&gt; * 3 spaces to align a code block (not 4)<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 .../test-manual/reproducible-builds.rst=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 ++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 18 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/documentation/test-manual/reproducible-builds.rst=
 b/<br>
&gt;&gt;&gt; documentation/test-manual/reproducible-builds.rst<br>
&gt;&gt;&gt; index b9f671d68..77c15d6e2 100644<br>
&gt;&gt;&gt; --- a/documentation/test-manual/reproducible-builds.rst<br>
&gt;&gt;&gt; +++ b/documentation/test-manual/reproducible-builds.rst<br>
&gt;&gt;&gt; @@ -145,3 +145,21 @@ set of recipes before the test, meaning t=
hey are<br>
&gt;&gt;&gt; excluded from reproducibility<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 testing. As a practical example, you could set ``=
sstate_targets`` to<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 ``core-image-sato``, then setting ``targets`` to =
``core-image-sato-<br>
&gt;&gt;&gt; sdk`` would<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 run reproducibility tests only on the targets bel=
onging only to<br>
&gt;&gt;&gt; ``core-image-sato-sdk``.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +Using `OEQA_REPRODUCIBLE_TEST_*` variables<br>
&gt;&gt;<br>
&gt;&gt; Sorry, I meant double-tick quoting, the same way we do for the cla=
sses<br>
&gt;&gt; in documentation/ref-manual/classes.rst, c.f.<br>
&gt; <br>
&gt; I&#39;ll fix in v3.<br>
&gt; <br>
&gt;&gt; ``allarch``<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; My grep-fu didn&#39;t return anything with :term: in titles, so I =
guess<br>
&gt;&gt; that&#39;s why we&#39;re going with double-quotes typically?<br>
&gt; <br>
&gt; That does ring a bell:<br>
&gt; <a href=3D"https://git.yoctoproject.org/yocto-docs/commit/?id=3Db9e19a=
00a3aac05a2cdd35b61dfae6d5a1a9c648" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.yoctoproject.org/yocto-docs/commit/?id=3Db9e19a00a3aac05a2cdd35b6=
1dfae6d5a1a9c648</a><br>
&gt; ...but in this case the linkage works (but the link is rendered as bla=
ck<br>
<br>
Ahah! Thanks for the pointer :)<br>
<br>
&gt; wheras the rest of the title is blue, looks a bit weird IMHO).<br>
&gt; Also, since I don&#39;t point a single variable but the whole<br>
&gt; OEQA_REPRODUCIBLE_TEST_* group, I&#39;d rather leave it with double qu=
otes.<br>
&gt; <br>
<br>
We actually do have a bunch of those already:<br>
<br>
:term:`SYSROOT_DIRS* &lt;SYSROOT_DIRS&gt;` variables.<br>
See the :term:`SYSROOT_* &lt;SYSROOT_DESTDIR&gt;` variables<br>
:term:`module_conf_* &lt;module_conf&gt;` variable.<br>
<br>
etc.<br></blockquote><div><br></div><div>I&#39;ve missed this review for v4=
, I&#39;ve sent v5 with it.</div><div><br></div><div>Thanks!</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
Quentin<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--00000000000071d6d9062de6799c--

