Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3328AECAAA1
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 20:52:08 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.3672.1662151926971785031
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 13:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WxYKm6EV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id u18so3706590wrq.10
        for <docs@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 13:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=rdKJT8x7VYUB1RhCOgW/pMU/DlvZMs7hnM5N6q6C24Q=;
        b=WxYKm6EVtbZzqb6ekErixgnQiatfGVj34qnQjq0vFuYnyLN/oG8LrDUxjzGDq/T2iy
         7hxBy8g4k2Atq5TJAqH6AWONpf7+OFE7hp+A5oHsuUPvAmmODDn5cIlfuLrLJMpBEe1z
         ccDpSGABxEXKBu3T9lgwZ+Zw7V1gkwUWZVQIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=rdKJT8x7VYUB1RhCOgW/pMU/DlvZMs7hnM5N6q6C24Q=;
        b=t9Sw36FOoZp1rMRi2nlAJZq0W4/e1cSs/mlgLTexrbzBNmYN32i9PAd9H9w2K9uPBS
         m9CRzSuqR0wgvUvTuW9UI2vh8BRbAQp27o4G2JUqycvdmfITqJ0zKM3/ZFncnLBl0ZYS
         e8Dv6KZl58VNao5dIA+s7mSw0V+uqRYKEAw6bnbCut2YhC13wk1+zQGW6KAVmlSLKwWE
         n7YfbqTb/w0lrH2Co5Prb04eY104KBgVb4D/6N2RlH1Ma0xsS+Fn6NZJXEpo+XO4GtXz
         W4gCtdgU09rjKUMidOAkGzTyuNjREtM4Si4u13Sn/TASZqOqXw+nxFqvd3/A1SuVj78G
         OBRQ==
X-Gm-Message-State: ACgBeo0KtNiLisbsJqdP8/1CLpYYqmTUjoTxaGN1ZweQsOogImAcI6Wg
	VUFBlWR71gU47Vmf6T/7jbvovg==
X-Google-Smtp-Source: 
 AA6agR5LaKZzMNlQffGyK7EaGrt4LB8UrURQxCZMlRMxPSrbXMuR3gp5YVeERny5QNYRpBds4qW0WQ==
X-Received: by 2002:a5d:64e5:0:b0:220:7859:7bc with SMTP id
 g5-20020a5d64e5000000b00220785907bcmr17375124wri.669.1662151925114;
        Fri, 02 Sep 2022 13:52:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e9de:2226:6ccb:4c53?
 ([2001:8b0:aba:5f3c:e9de:2226:6ccb:4c53])
        by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c3b0800b003a35ec4bf4fsm3369709wms.20.2022.09.02.13.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 13:52:04 -0700 (PDT)
Message-ID: 
 <de6258ac6f23d5beb7be13f1518d39ec601a2edd.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual: remove obsolete product listing from
 FAQ
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, "yocto-advocacy@lists.yoctoproject.org"
	 <yocto-advocacy@lists.yoctoproject.org>
Cc: docs@lists.yoctoproject.org
Date: Fri, 02 Sep 2022 21:52:02 +0100
In-Reply-To: <1d26f4ca-372f-bc45-6baa-873a024bbd0c@bootlin.com>
References: <1711247857DEC2A1.15579@lists.yoctoproject.org>
	 <1d26f4ca-372f-bc45-6baa-873a024bbd0c@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Sep 2022 20:52:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3138

On Fri, 2022-09-02 at 22:31 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Greetings advocacy group,
>=20
> On 9/2/22 22:17, Michael Opdenacker via lists.yoctoproject.org wrote:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >=20
> > This removes the single reference to a product built with OE.
> > The URL for this product doesn't refer to OE any more
> > and this FAQ is problably not the best place to highlight
> > products built with OE.
> >=20
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >   documentation/ref-manual/faq.rst | 10 ----------
> >   1 file changed, 10 deletions(-)
> >=20
> > diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manua=
l/faq.rst
> > index 61049523a0..9e489991fd 100644
> > --- a/documentation/ref-manual/faq.rst
> > +++ b/documentation/ref-manual/faq.rst
> > @@ -52,16 +52,6 @@ section in the Yocto Project Development Tasks Manua=
l and the
> >   Usually, if the board is not completely exotic, adding support in the
> >   Yocto Project is fairly straightforward.
> >  =20
> > -**Q:** Are there any products built using the OpenEmbedded build syste=
m?
> > -
> > -**A:** The software running on the `Vernier
> > -LabQuest <https://vernier.com/labquest/>`__ is built using the
> > -OpenEmbedded build system. See the `Vernier
> > -LabQuest <https://www.vernier.com/products/interfaces/labq/>`__ websit=
e
> > -for more information. There are a number of pre-production devices usi=
ng
> > -the OpenEmbedded build system and the Yocto Project team announces the=
m
> > -as soon as they are released.
> > -
> >   **Q:** What does the OpenEmbedded build system produce as output?
> >  =20
> >   **A:** Because you can use the same set of recipes to create output o=
f
>=20
>=20
> Following this proposed update to the manual, removing an obsolete=20
> reference, I'm surprised not to find any page listing success stories of=
=20
> products built using the OpenEmbedded build system. Don't we have this=
=20
> anywhere?
>=20
> I guess this can be sensitive information for some product or platforms=
=20
> vendors, but I guess some others could be proud to put forward their use=
=20
> of OE / Yocto to build their products.
>=20
> Of course, I guess it's complicated to promote some users / contributors=
=20
> and not some others. Maybe an informal page on the wiki would work=20
> better than an official list on the project website.
>=20
> Any thoughts?

You mean like:

https://wiki.yoctoproject.org/wiki/Project_Users#Products_that_use_the_Yoct=
o_Project

? :)

Cheers,

Richard


