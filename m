Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43EBC001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 15:00:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.22573.1690297194886071007
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jul 2023 07:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DevSwmJ5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-307d58b3efbso4364393f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 25 Jul 2023 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690297193; x=1690901993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBvYKYg0McE8wIGT5w2TDyotgTItHd+WxKV0SoR6jNo=;
        b=DevSwmJ5xUbXzk/oxjCeET4j+ngPgZ5HlOQvHHELBeETOFk1hiIfBPxLe014HDIMO6
         DYWJrchnW4S4+1IYVk4HBA13PxXLod8nLPATr+jfn0Y7oxav9TMUxfnMuy0dMmrtRc63
         OhJ3bHtOlzKwXU7XI9roCu1XP0Zqznkqeqozg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690297193; x=1690901993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GBvYKYg0McE8wIGT5w2TDyotgTItHd+WxKV0SoR6jNo=;
        b=T8Sg4B/jfFFPr1PCTeHrNa/W+XAxaWrcviHtKtSdD38vAErqfgGU3oLfQDDss5t8CH
         iKcSgv4m2dvRGQ9EtjZ/hbAKwlM+G/nbLJpQi0svNL/jQymKh1gjR4ZLgScEQ03Sp6pN
         yrQAKX/h0ylI42b0z1sJENrD7ssgGovQZf6rVN1wEZrT6OpqG8gOTJ32yREnrjo/bUAM
         LfyaQYdDPQmUaZpgOa4WZ1bddRuIGkbnWVwzzk06rkh43KB/Ul1EgJFWrG59pwIsM5sR
         w82QuVkibTOY+1GatjF0psKqZk6x0V0ISJeoai1gO3WZCGNR/kLFrQ82nAEGOtBipgBB
         R0KA==
X-Gm-Message-State: ABy/qLbKYgaMXiYql53IrTi/Xhae0HJyjha7VMvLrLBchASwI4eYtzCo
	cocXDn/ShoTuU68S1KTqcxI8zg==
X-Google-Smtp-Source: APBJJlFkZPbsha2aWhNvlqkSK5qTYBMxivn+WK78bsIxhijEvpjcG86wHBziwNdHPCv+5k1zG+0iMQ==
X-Received: by 2002:adf:de91:0:b0:317:60f9:caa with SMTP id w17-20020adfde91000000b0031760f90caamr4054005wrl.59.1690297193117;
        Tue, 25 Jul 2023 07:59:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:42df:c474:f29d:a4f9? ([2001:8b0:aba:5f3c:42df:c474:f29d:a4f9])
        by smtp.gmail.com with ESMTPSA id q2-20020a05600000c200b003175fef2a32sm6408498wrx.55.2023.07.25.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:59:52 -0700 (PDT)
Message-ID: <6e0e712c7d9edbd0058a9d65db66dd97f670a5c2.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] [dunfell] ref-manual:
 ref-system-requirements.rst: align with poky.conf
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Date: Tue, 25 Jul 2023 15:59:51 +0100
In-Reply-To: <edd8ede4-f463-d6d1-02d7-d3cfb3939abb@bootlin.com>
References: <177516732202084A.7114@lists.yoctoproject.org>
	 <edd8ede4-f463-d6d1-02d7-d3cfb3939abb@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jul 2023 15:00:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4079

On Tue, 2023-07-25 at 12:48 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Hello,
>=20
> On 25.07.23 at 12:45, Michael Opdenacker via lists.yoctoproject.org wrote=
:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >=20
> > Align with the contents of meta-poky/conf/distro/poky.conf
> > which represent the distro versions currently tested.
> >=20
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >   documentation/ref-manual/ref-system-requirements.rst | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/documentation/ref-manual/ref-system-requirements.rst b/doc=
umentation/ref-manual/ref-system-requirements.rst
> > index ac963dcdb9..6e1ad8ee21 100644
> > --- a/documentation/ref-manual/ref-system-requirements.rst
> > +++ b/documentation/ref-manual/ref-system-requirements.rst
> > @@ -47,10 +47,6 @@ distributions:
> >  =20
> >   -  Ubuntu 22.04
> >  =20
> > --  Fedora 28
> > -
> > --  Fedora 29
> > -
> >   -  Fedora 30
> >  =20
> >   -  Fedora 31
> > @@ -67,6 +63,8 @@ distributions:
> >  =20
> >   -  CentOS 7.x
> >  =20
> > +-  CentOS 8.x
> > +
> >   -  Debian GNU/Linux 8.x (Jessie)
> >  =20
> >   -  Debian GNU/Linux 9.x (Stretch)
>=20
>=20
> I could further reduce the list by removing the distros that we are=20
> still supposed to test (such as Ubuntu 19.04), but that we obviously=20
> cannot support any more as they have reached their end of life.
> Any thoughts?

I think for the older releases, they should document what we tested
when they originally shipped. We could note that it was originally
tested with them but they're EOL?

Cheers,

Richard

