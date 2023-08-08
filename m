Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3854FC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 09:56:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.58023.1691488608484875135
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 02:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dvyqJhYB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fe5c0e587eso17717245e9.0
        for <docs@lists.yoctoproject.org>; Tue, 08 Aug 2023 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691488607; x=1692093407;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rTQSyR4udjEVqJ4s4V/NrtlpJwrOWeCM1R11WfwfAN8=;
        b=dvyqJhYB+zEF5inuS3Vw5oDDuknMzb2GTLit2RVe5Ke4Cou6EvR8BKUB/durFu2PE3
         MkON5iLIIBbE4+KtOGXXYF9Enal3k5UG1oIFqrHdr7ZZfAuGX58LxColZbr1cEf3v+rS
         2snwx9qA6cvIuSl+tqTivOiG5Rz6KE8tnIEpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691488607; x=1692093407;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTQSyR4udjEVqJ4s4V/NrtlpJwrOWeCM1R11WfwfAN8=;
        b=JVDDIzt6DWxSh2HCWIvKjS875eroHS1Xl+ahZcUDCP7VbMtvTd9hnb1MuV+yUm1fI2
         CuOxIE3Yshbx3vupr/oqPliYaxwDsGlN7TIN8yeKtcUQcfvkueHqY4BmocgEQoeLS5Uh
         IcIeRnh3IDIpCDjvi8iIziVMB0GK4hrpKDk4tQLnDAEIM5DJv+jFjzzrlKZWt75KLz5f
         FutToa1zFo0Kpr8rOYF/0SJCWOM8GEjjJljFKau+fPYDBAOLUnslWdfttyiUrVBxECSb
         WA9kQgl9uUMZqWbS9Qh6Kgc2h12zg4mEVV+SoswFwCGV8iYxsdrf6w50+NaF19DUB2Ej
         EOmg==
X-Gm-Message-State: AOJu0YxqMDLKyG2oo+9qie8FHYyeFBj/uf8Sf39eIUuhIdvx6pSyp+TO
	e7RY9R3RCVO8rX3r+iWfjVLEYg==
X-Google-Smtp-Source: AGHT+IF1iTRnKsH/8taDaB0q37YzrqAmKJ+VzUvq9zgsev9Tt1b9TxXiyabBaf/PhlNjRFlb7ZL1eg==
X-Received: by 2002:a1c:6a16:0:b0:3fe:2606:84a4 with SMTP id f22-20020a1c6a16000000b003fe260684a4mr9778195wmc.34.1691488606831;
        Tue, 08 Aug 2023 02:56:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c9a:4256:d8e9:42e2? ([2001:8b0:aba:5f3c:8c9a:4256:d8e9:42e2])
        by smtp.gmail.com with ESMTPSA id l26-20020a1c791a000000b003fbb06af219sm13246180wme.32.2023.08.08.02.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:56:46 -0700 (PDT)
Message-ID: <8eafcde8e0abd24543149f0feafeb117c920531c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] [dunfell] ref-manual: ref-system-requirements:
 update supported distros
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Steve Sakoman <steve@sakoman.com>
Date: Tue, 08 Aug 2023 10:56:45 +0100
In-Reply-To: <149547d8-bb0b-2569-31d4-1c0eab6c8941@bootlin.com>
References: <17795DC4E16ECCFB.9264@lists.yoctoproject.org>
	 <149547d8-bb0b-2569-31d4-1c0eab6c8941@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Aug 2023 09:56:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4114

On Tue, 2023-08-08 at 11:22 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Greetings,
>=20
> On 08.08.23 at 11:17, Michael Opdenacker via lists.yoctoproject.org wrote=
:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >=20
> > - Update according to changes in SANITY_TESTED_DISTROS
> >    (meta-poky/conf/distro/poky.conf)
> >=20
> > - No longer declare as "Supported" the distributions versions
> >    which are End of Life for their vendors, as some of them
> >    (Ubuntu for example) ship updates to subscribers only,
> >    which the Yocto Project has no access to.
> >=20
> > - List distribution versions which were previously tested
> >    for the branch of the Yocto Project being considered.
> >=20
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >   .../ref-manual/ref-system-requirements.rst    | 34 ++++++++++++------=
-
> >   1 file changed, 22 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/documentation/ref-manual/ref-system-requirements.rst b/doc=
umentation/ref-manual/ref-system-requirements.rst
> > index ac963dcdb9..d45a88efa5 100644
> > --- a/documentation/ref-manual/ref-system-requirements.rst
> > +++ b/documentation/ref-manual/ref-system-requirements.rst
> > @@ -34,22 +34,27 @@ and conceptual information in the :doc:`../overview=
-manual/overview-manual`.
> >   Supported Linux Distributions
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >  =20
> > -Currently, the Yocto Project is supported on the following
> > -distributions:
> > +Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project=
 is
> > +supported on the following distributions:
> >  =20
> > --  Ubuntu 16.04 (LTS)
> > -
> > --  Ubuntu 18.04 (LTS)
> > -
> > --  Ubuntu 19.04
> >  =20
> >   -  Ubuntu 20.04
> >  =20
> >   -  Ubuntu 22.04
> >  =20
> > --  Fedora 28
> > +-  CentOS 7.x
> >  =20
> > --  Fedora 29
> > +-  Debian GNU/Linux 11.x (Bullseye)
> > +
> > +The following distribution versions are still tested (being listed
> > +in :term:`SANITY_TESTED_DISTROS`), even though the organizations
> > +publishing them no longer make updates publicly available:
> > +
> > +-  Ubuntu 16.04 (LTS)
> > +
> > +-  Ubuntu 18.04 (LTS)
> > +
> > +-  Ubuntu 19.04
> >  =20
> >   -  Fedora 30
> >  =20
> > @@ -65,7 +70,7 @@ distributions:
> >  =20
> >   -  Fedora 36
> >  =20
> > --  CentOS 7.x
> > +-  CentOS 8.x
> >  =20
> >   -  Debian GNU/Linux 8.x (Jessie)
> >  =20
> > @@ -73,8 +78,6 @@ distributions:
> >  =20
> >   -  Debian GNU/Linux 10.x (Buster)
> >  =20
> > --  Debian GNU/Linux 11.x (Bullseye)
> > -
> >   -  OpenSUSE Leap 15.1
> >  =20
> >   -  OpenSUSE Leap 15.2
> > @@ -85,6 +88,13 @@ distributions:
> >  =20
> >   -  AlmaLinux 8.7
> >  =20
> > +Finally, here are the distribution versions which were previously
> > +tested by the &DISTRO; release ("&DISTRO_NAME;"), but no longer are:
> > +
> > +-  Fedora 28
> > +
> > +-  Fedora 29
> > +
> >   .. note::
> >  =20
> >      -  While the Yocto Project Team attempts to ensure all Yocto Proje=
ct
>=20
>=20
> Here too, I suspect that SANITY_TESTED_DISTROS is no longer up to date.
> Do we really continue to test Fedora 30 (for example)? Any more recent=
=20
> ones which we are testing Dunfell on?

See my previous answer. You can see here:

https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py#n166

that dunfell is being tested on anything up to fedora37.

The autobuilder list of workers:

https://autobuilder.yoctoproject.org/typhoon/#/workers

shows we have f37 and f38 workers so we only test dunfell on fedora37
at this time.

Cheers,

Richard


