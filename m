Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98708C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 12:48:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.44232.1636375694391702856
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 04:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L6kVWSiv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id z200so12909746wmc.1
        for <docs@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 04:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:references:user-agent:mime-version;
        bh=Sfm+gJb43jfHIuDq2fbn2SKddeZAzbaBmXT+YkSUqG8=;
        b=L6kVWSiva7qaBe8hRjnesUvUxT8t8iMyfW6tIQNxN2HZRyI2UNPJ8QGwz5eUTGfRMi
         b0zz0Yifv06KztH/IQNewAbRtab6GM6mu9iljBlFBi2ATCIbeRK/OlTPNKb00o48Mofg
         2aB9+oogWZkj7oa7A0rY74Aq85f4Dw1LAn75c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:references
         :user-agent:mime-version;
        bh=Sfm+gJb43jfHIuDq2fbn2SKddeZAzbaBmXT+YkSUqG8=;
        b=Bj7ghMknDl1gXPZW4EXboqBCCUd2bX3Uh5mvHoSFI+lisVxGzhtEnLn0ywC9WM7o8U
         7ExlolR9K/L7xydDLchiRj//wm1rdwNVj5pDGugWINElbntYQXt+xnxbe1ouzaJj1SlF
         uKVr4+z2I3K9UAxrH6T0cvTbPReI1gBFEPQHRDm07fbrxVi74xxJMa5iPVqwmrytu+kB
         a7y1NrzY5CFNcQXWaq27Xp3FFkRXbQjoCDZAy6Jp+fjoHDtnLAKrAvZLcoB6RjW4Dze/
         9i/b9Tjsxh+BdbInwBRqx9IjHNeS0LMMaez36UN7G7VzOFxGNLq7bd6jqHYZdOK69xbT
         Wa+w==
X-Gm-Message-State: AOAM530XWhA5qO/IBdftNKNzuzYgLhtFKKJbMjvFLM3WeesfD7X/h7rA
	2i8S61cMj5TydExSNkVJWyLc3NG1ZGJrAQ==
X-Google-Smtp-Source: 
 ABdhPJwqjNDxiK3zxJecOvCdnX00bghdcwtCTYyy14QFTVTFWnS65aAzSomRJm9KoZvxXKXnLIdwcg==
X-Received: by 2002:a1c:f31a:: with SMTP id
 q26mr51675676wmq.148.1636375692640;
        Mon, 08 Nov 2021 04:48:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c39:dba0:779a:3673?
 ([2001:8b0:aba:5f3c:5c39:dba0:779a:3673])
        by smtp.gmail.com with ESMTPSA id
 d11sm16350266wrs.38.2021.11.08.04.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 04:48:12 -0800 (PST)
Message-ID: 
 <45438478b288da1880e92bb1ccc246732a24abc9.camel@linuxfoundation.org>
Subject: Fwd: Re: [bitbake-devel] [oe-core][PATCH 1/2] devtools: Initial
 recipe for repo 2.17.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Mon, 08 Nov 2021 12:48:08 +0000
References: 
	<a82b048c5f9f164696b1dd1e3e6c4997ede4f5ad.camel@iris-sensing.com>
Content-Type: multipart/mixed; boundary="=-rxv+JNk9CHFBNtNx7KGP"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Nov 2021 12:48:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2105


--=-rxv+JNk9CHFBNtNx7KGP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Michael and Michael,

This sounds like something we should prioritise fixing?

Cheers,

Richard

--=-rxv+JNk9CHFBNtNx7KGP
Content-Disposition: inline
Content-Description: Forwarded message =?UTF-8?Q?=E2=80=94?= Re:
 [bitbake-devel] [oe-core][PATCH 1/2] devtools: Initial recipe for repo
 2.17.3
Content-Type: message/rfc822

Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on dan.rpsys.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46]) by dan.rpsys.net (8.15.2/8.15.2/Debian-18) with ESMTPS id
 1A8Bu4uw2767910 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128
 verify=NOT) for <rpurdie@rpsys.net>; Mon, 8 Nov 2021 11:56:06 GMT
Received: by mail-wr1-f46.google.com with SMTP id d24so26418635wra.0
        for <rpurdie@rpsys.net>; Mon, 08 Nov 2021 03:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20210112;
 h=x-original-authentication-results:x-gm-message-state:delivered-to
 :from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language:content-id
 :content-transfer-encoding:mime-version;
 bh=eUokTri9sxcPnrWaIrpVdCJJOiomOLCodgiESlzHuO4=;
 b=RhO566a5CsXPc0XBfe9jRvf3AYsoJacsjS9sWmZQ+baDLxTnDhPJtYC/RORFNqzjqi
 C0oi0jjdNE8lV2FBKXQMM25/GikPNkuyTCHcSNRp3zGZbRolk+0ps2iX4J+chmleBIUN
 r8QTHp+4QzzegPWoydkirTXoDlkfBOdY+9f+8VyEPl4ko8vkOqoh3ebR3E17NqWC+gAJ
 1DEc7Db1jAROQ1gh4MWtx0WaRh6YRxeIEPR5yczSMipB6ksOFgGlzad9aRcwDhAHhM+e
 a1oeQLEr2QfIPffGdDOfKFdTo3tJzcO3extRKgpnkOm4EvldVaFOnwNn3wS0oKlU8Zla WV0Q==
X-Original-Authentication-Results: mx.google.com;       spf=neutral
 (google.com: 81.169.172.79 is neither permitted nor denied by best guess
 record for domain of jasper.orschulko@iris-sensing.com)
 smtp.mailfrom=Jasper.Orschulko@iris-sensing.com
X-Gm-Message-State: 
 AOAM531qrp2ZbIkT5naDq3XayNH7Hpv53nRVVIZQ/IdKwH+xbxs1RJ4X
 Fwa0eWXGMLPguYZYrYeA1fqpnOua5kNX9QJX5pXfKszIZlWxNhvEhC+f
X-Received: by 2002:a5d:6785:: with SMTP id
 v5mr57291927wru.380.1636372559802; Mon, 08 Nov 2021 03:55:59 -0800 (PST)
X-Forwarded-To: rpurdie@rpsys.net
X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
Delivered-To: richard.purdie@linuxfoundation.org
Received: by 2002:adf:d0d0:0:0:0:0:0 with SMTP id z16csp6701006wrh;
        Mon, 8 Nov 2021 03:55:58 -0800 (PST)
X-Google-Smtp-Source: 
 ABdhPJy9aWbfhjxHNwI4lOX5ity92GpsGZwlEgPa1z5/t8sK9QfvYgWLseDcZZFnCvu+Qdk2RcfB
X-Received: by 2002:a05:6402:289f:: with SMTP id
 eg31mr76756890edb.192.1636372558139; Mon, 08 Nov 2021 03:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636372558; cv=none; d=google.com;
 s=arc-20160816;
 b=K1pzIg1YvvwXAKNsVvRkx29lBeAZ7aUhAg2trQuKiJccl8UD3Zw+AKst4z8c7b85q2
 rxBKGlrfUA9xuhFvu1mS1SWYPAKdZKuL+ofPAQXZfajwhdq0HhwGyoF0sMFOuc+FaNZx
 uynfZBOeyjj6rcenVtO2Ly/CT4t4Ru9rfrgvcXBtQhE+BJr8YtoD6vK4CzGHtYEyE2lG
 xdSN9P2ih0r72sNvaaXhmjpe/i9jiaZGlqb2gcBwFHKWWtcGMWV4jazDP9hQ9ROaPiML
 KHaqQ4LUdRn1KKZf/WC90ezWcvsbosUrhuEaIxq6ldIHOlXB7XNCZ3cregw6SoNVoSp8 SVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816;
 h=mime-version:content-transfer-encoding:content-id:content-language
 :accept-language:in-reply-to:references:message-id:date:thread-index
 :thread-topic:subject:cc:to:from;
 bh=eUokTri9sxcPnrWaIrpVdCJJOiomOLCodgiESlzHuO4=;
 b=K8kU8QDtoR7qMR0SjkpoF902KVvlC8Ay6fBscH8ij/m44p713Q1JHCcOJT9pE6VzPc
 tanmMrsNGuzVmKM+deGcMEZZoNWJW0UDFrX4IHbdOFWbw3Pa91TlcAEOcml2SBujeawM
 zzOdS7XgtR3oj69XjSQ7gf+X/vOiqV++PIsuxUrHaWwxYbsxOKrTKhF/yKiux9jIW4XS
 az4R1sNsFOBO0kXBZ4VV2X52+5XmM2BRcCFEAO6tfkaKZNzzrvq+YmCVXagdY7APznbq
 hS6K1GdqsWGSHlufcn2CXSG4VGh5a7D9AWwAbztzkyW6SJEBFdfleqGViQwNyCTMDljV iQ4w==
ARC-Authentication-Results: i=1; mx.google.com; spf=neutral (google.com:
 81.169.172.79 is neither permitted nor denied by best guess record for
 domain of jasper.orschulko@iris-sensing.com)
 smtp.mailfrom=Jasper.Orschulko@iris-sensing.com
Received: from mail.irisgmbh.de (mail.irisgmbh.de. [81.169.172.79]) by
 mx.google.com with ESMTPS id 18si18787792ejc.318.2021.11.08.03.55.58 for
 <richard.purdie@linuxfoundation.org> (version=TLS1_2
 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128); Mon, 08 Nov 2021
 03:55:58 -0800 (PST)
Received-SPF: neutral (google.com: 81.169.172.79 is neither permitted nor
 denied by best guess record for domain of
 jasper.orschulko@iris-sensing.com) client-ip=81.169.172.79;
Authentication-Results: mx.google.com; spf=neutral (google.com:
 81.169.172.79 is neither permitted nor denied by best guess record for
 domain of jasper.orschulko@iris-sensing.com)
 smtp.mailfrom=Jasper.Orschulko@iris-sensing.com
Received: from localhost (localhost [127.0.0.1])
	by mail.irisgmbh.de (Postfix) with ESMTP id C32AB31E0348;
	Mon,  8 Nov 2021 12:55:57 +0100 (CET)
X-Virus-Scanned: clamav-milter 0.103.2 at dan
Received: from mail.irisgmbh.de ([127.0.0.1]) by localhost
 (s15324379.rootmaster.info [127.0.0.1]) (amavisd-new, port 10027) with
 ESMTP; Mon,  8 Nov 2021 12:55:57 +0100 (CET)
Received: from ERDE.irisgmbh.local (unknown [213.61.209.158])
	by mail.irisgmbh.de (Postfix) with ESMTPS id A991431E02EB;
	Mon,  8 Nov 2021 12:55:57 +0100 (CET)
Received: from ERDE.irisgmbh.local ([172.30.10.11]) by ERDE.irisgmbh.local
 ([172.30.10.11]) with mapi id 14.03.0513.000; Mon, 8 Nov 2021 12:55:56 +0100
From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
To: "richard.purdie@linuxfoundation.org"
 <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "peter.kjellerstedt@axis.com"
 <peter.kjellerstedt@axis.com>, "jasper@fancydomain.eu"
 <jasper@fancydomain.eu>
CC: "martin@mko.dev" <martin@mko.dev>,
        "Daniel.Baumgart@iris-sensing.net"
	<Daniel.Baumgart@iris-sensing.net>,
        "bitbake-devel@lists.openembedded.org"
	<bitbake-devel@lists.openembedded.org>
Subject: Re: [bitbake-devel] [oe-core][PATCH 1/2] devtools: Initial recipe
 for repo 2.17.3
Thread-Topic: [bitbake-devel] [oe-core][PATCH 1/2] devtools: Initial recipe
 for repo 2.17.3
Thread-Index: AQHX0klmUmLVPFJtF0Ob3PuHG3t8+6v3t8YAgAHCD4A=
Date: Mon, 8 Nov 2021 11:55:56 +0000
Message-ID: <a82b048c5f9f164696b1dd1e3e6c4997ede4f5ad.camel@iris-sensing.com>
References: <20211105133104.19895-1-jasper@fancydomain.eu>
	 <4d9824a6a12bbdb28cd3d898b82118356712959b.camel@linuxfoundation.org>
In-Reply-To: 
 <4d9824a6a12bbdb28cd3d898b82118356712959b.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.10.1]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D55776A68133B045A37E210ED0AAAF4C@irisgmbh.local>
MIME-Version: 1.0
X-Virus-Status: Clean
X-MIME-Autoconverted: from base64 to 8bit by dan.rpsys.net id
 1A8Bu4uw2767910
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Richard and Peter,

I've addressed your comments and will post the v3 patches momentarily.

Quick comment regarding the new overrides syntax, or rather the
documentation. I just noticed that my go-to page for the mega-manual is
outdated
(https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html)
and that the new location now seems to be
https://docs.yoctoproject.org/3.4/singleindex.html.

There is a redirect in place, e.g. when trying to call a 3.4 version of
the mega manual like this
https://www.yoctoproject.org/docs/3.4/mega-manual/mega-manual.html.
However, this does not extend to the "latest" page, which is just a
source for confusion. Is there any chance we could change that?

- --=20
With best regards

Jasper Orschulko
DevOps Engineer

Tel. +49 30 58 58 14 265
Fax +49 30 58 58 14 999
Jasper.Orschulko@iris-sensing.com

=E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=
=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=
=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =
=E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2

iris-GmbH
infrared & intelligent sensors
Schnellerstra=C3=9Fe 1-5 | 12439 Berlin

https://iris-sensing.com/





On Sun, 2021-11-07 at 09:05 +0000, Richard Purdie wrote:
> On Fri, 2021-11-05 at 14:31 +0100, Jasper Orschulko via
> lists.openembedded.org
> wrote:
> > From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> >=20
> > Add a recipe for repo, prerequisite for the repo fetcher.
> >=20
> > Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> > ---
> > =C2=A0.../repo/files/0001-python3-shebang.patch=C2=A0=C2=A0=C2=A0=C2=A0=
 | 21 ++++++++++++
> > =C2=A0.../0001-Set-REPO_REV-to-v2.17.3.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 33
> > +++++++++++++++++++
> > =C2=A0meta/recipes-devtools/repo/repo.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 ++++++++++++++
> > =C2=A0meta/recipes-devtools/repo/repo_2.17.3.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 7 ++++
> > =C2=A04 files changed, 86 insertions(+)
> > =C2=A0create mode 100644 meta/recipes-devtools/repo/files/0001-python3-
> > shebang.patch
> > =C2=A0create mode 100644 meta/recipes-devtools/repo/repo-2.17.3/0001-Se=
t-
> > REPO_REV-to-v2.17.3.patch
> > =C2=A0create mode 100644 meta/recipes-devtools/repo/repo.inc
> > =C2=A0create mode 100644 meta/recipes-devtools/repo/repo_2.17.3.bb
>=20
> This basically looks ok to me, I've some minor comments below.
>=20
> The patch is missing adding an entry to:
>=20
> meta/conf/distro/include/maintainers.inc
>=20
> which is required for OE-Core recipes and will trip up automated
> testing if we
> don't.
>=20
> >=20
> > diff --git a/meta/recipes-devtools/repo/files/0001-python3-
> > shebang.patch b/meta/recipes-devtools/repo/files/0001-python3-
> > shebang.patch
> > new file mode 100644
> > index 0000000000..09ccf58264
> > --- /dev/null
> > +++ b/meta/recipes-devtools/repo/files/0001-python3-shebang.patch
>=20
>=20
> I'd put this in a folder called "repo" rather than files.
>=20
> > @@ -0,0 +1,21 @@
> > +From b8e84b202cd302a7c99288d3835dc9c63071f8f2 Mon Sep 17 00:00:00
> > 2001
> > +From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> > +Date: Tue, 14 Sep 2021 16:46:51 +0200
> > +Subject: [PATCH] python3 shebang
> > +
> > +---
> > + repo | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
>=20
> Missing Upstream-Status: (you got the second one ok though! :)
>=20
> > +diff --git a/repo b/repo
> > +index b13e34c..205e0e5 100755
> > +--- a/repo
> > ++++ b/repo
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > + # -*- coding:utf-8 -*-
> > + #
> > + # Copyright (C) 2008 The Android Open Source Project
> > +--
> > +2.33.0
> > diff --git a/meta/recipes-devtools/repo/repo-2.17.3/0001-Set-
> > REPO_REV-to-v2.17.3.patch b/meta/recipes-devtools/repo/repo-
> > 2.17.3/0001-Set-REPO_REV-to-v2.17.3.patch
> > new file mode 100644
> > index 0000000000..294a3af53a
> > --- /dev/null
> > +++ b/meta/recipes-devtools/repo/repo-2.17.3/0001-Set-REPO_REV-to-
> > v2.17.3.patch
> > @@ -0,0 +1,33 @@
> > +From bdd2a528da59c28db8ae2986834926de7cebf3ab Mon Sep 17 00:00:00
> > 2001
> > +From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> > +Date: Thu, 4 Nov 2021 16:55:12 +0100
> > +Subject: [PATCH] Set REPO_REV to v2.17.3
> > +
> > +repo is an unusual tool because it downloads all of its own Python
> > modules
> > +using GPG-signed git tags, and stores those files as part of the
> > project
> > +that it is working with.
> > +
> > +So in order to have a reproducible repo installation within the
> > project
> > +folders, we hardcode the REPO_REV variable to this recipes PV.
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> > +---
> > + repo | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/repo b/repo
> > +index 4cddbf1..cf5f6b1 100755
> > +--- a/repo
> > ++++ b/repo
> > +@@ -142,7 +142,7 @@ if __name__ =3D=3D '__main__':
> > + REPO_URL =3D os.environ.get('REPO_URL', None)
> > + if not REPO_URL:
> > +=C2=A0=C2=A0 REPO_URL =3D 'https://gerrit.googlesource.com/git-repo'
> > +-REPO_REV =3D os.environ.get('REPO_REV')
> > ++REPO_REV =3D 'v2.17.3'
> > + if not REPO_REV:
> > +=C2=A0=C2=A0 REPO_REV =3D 'stable'
> > + # URL to file bug reports for repo tool issues.
> > +--
> > +2.33.1
> > diff --git a/meta/recipes-devtools/repo/repo.inc b/meta/recipes-
> > devtools/repo/repo.inc
> > new file mode 100644
> > index 0000000000..60b32e4d74
> > --- /dev/null
> > +++ b/meta/recipes-devtools/repo/repo.inc
> > @@ -0,0 +1,25 @@
> > +# SPDX-License-Identifier: MIT
> > +# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors
> > +
> > +SUMMARY =3D "Tool for managing many Git repositories"
> > +DESCRIPTION =3D "Repo is a tool built on top of Git. Repo helps manage
> > many Git repositories, does the uploads to revision control systems,
> > and automates parts of the development workflow."
> > +HOMEPAGE =3D "https://android.googlesource.com/tools/repo"
> > +SECTION =3D "console/utils"
> > +
> > +LICENSE =3D "Apache-2.0"
> > +
> > +SRC_URI =3D "git://git@gerrit.googlesource.com/git-
> > repo.git;protocol=3Dhttps;branch=3Dmain"
> > +MIRRORS =3D "git://git@gerrit.googlesource.com/git-repo.git
> > git://github.com/GerritCodeReview/git-repo.git \n"
>=20
> You shouldn't be clearing MIRRORS with "=3D" as the user may have
> something set in
> there the system needs to work, you probably want +=3D here.
>=20
> > +
> > +SRC_URI +=3D "file://0001-python3-shebang.patch"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +RDEPENDS_${PN} =3D "python3"
>=20
> This is old overrides syntax, it is RDEPENDS:${PN} now as others have
> mentioned.
>=20
> > +
> > +do_install() {
> > +=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
> > +=C2=A0=C2=A0=C2=A0 install -m 755 ${WORKDIR}/git/repo ${D}${bindir}
> > +}
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta/recipes-devtools/repo/repo_2.17.3.bb
> > b/meta/recipes-devtools/repo/repo_2.17.3.bb
> > new file mode 100644
> > index 0000000000..c26264b9e9
> > --- /dev/null
> > +++ b/meta/recipes-devtools/repo/repo_2.17.3.bb
> > @@ -0,0 +1,7 @@
> > +# SPDX-License-Identifier: MIT
> > +# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors
> > +
> > +require recipes-devtools/repo/repo.inc
> > +
> > +SRCREV =3D "11b30b91df1f0e03b53da970ec2588e85817bacc"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
>=20
>=20
-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE4WyPMIC5Ap4+Ooo1Ygqew07VMNUFAmGJEEsACgkQYgqew07V
MNUO0Qf/Rxt9hZHWTmDX6eGjEEbMxxSGyJ2You7H421dZZH9WMQxnXVHsl2n2C6B
2gzMqyRZJdnR/60tfPr97wuQbeyxlHjsxaYa5F8p23bYAyGVYaSm/uDXmLnqDmXQ
qDmliY1XYkh+UhP/FkzmjCyCrEMPul1CLEZemY++RQZhBj5ge8W0G2JMsm7GAoa1
1dRghiclvvi5aHB2caSPsz9RlDHsSAdMZ78LheULVxAXBy4tE4h7p6JFMrK/pUy5
1wCLLQGSeqqlFbmRs3W3FKavlrPIvw80lq5DaxNJauMhhKGTPMKp6yu6V+Lr0BmX
LkduXEmbmJRQ5oKxA5FFFzwXCiUe3g=3D=3D
=3D48qv
-----END PGP SIGNATURE-----


--=-rxv+JNk9CHFBNtNx7KGP--


