Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63259C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 10:44:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.15801.1683110677108293619
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 03:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=bP2jATQL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f173af665fso31738145e9.3
        for <docs@lists.yoctoproject.org>; Wed, 03 May 2023 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683110675; x=1685702675;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b7u/HmPHPwCa9D3fhbvmusPysTpiQO7RZbOtFMkGx+w=;
        b=bP2jATQL3+KUE/E7adH2Uf9ssf94CD+WSjeI2SvhAWHj5JgGq2bf4+l3E6HPUpWr8t
         wOa+UNkfJG+9HubMPegKuE6wT5IEIUuIjNTMEyrBK78SFCNk4/PXO06avRDcqQNIjCnQ
         D6abxwXCZBmZuW8n7lNEowYsOJM2tZx8vZtAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683110675; x=1685702675;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7u/HmPHPwCa9D3fhbvmusPysTpiQO7RZbOtFMkGx+w=;
        b=dG9gKePg97kKuNl83L9JgeuBy9U8RbnWw4GDow/etoYF/xXLkhPqgmL2xrRHeWpauJ
         8dExCfBg9Np16fUj1FXcfGGz0QJr5Kpo9jGFjz9UDy8FTjxZu4zqXZ9t2VEwv2GBOKjb
         KKBkPIN3L7yjOmR51Ji1++8T2EQfeqFDMvvAuEp2SvEUetyPxwb8UZQlzoRWvgjZUvqr
         1BA8GHFQxoYEPfKBhHj7CXUIEyqE2o4qOmCzhJDItVmj/zeh4YgwfDYBrDFE3RgGqx+T
         JKY5lL+zPj1adAe0LecEMxpdRezdNmNgMVo8Vzjv2GQJoT+LIj336VNZ1Pr40dZWwMYS
         mlUQ==
X-Gm-Message-State: AC+VfDyuiO/zyDPHPwhSZTMkbJVYIpxBAxj1Bj19ezETmQcVqb0Xq3Sk
	g36ryKHRVXizMihxj1L5DNGlAg==
X-Google-Smtp-Source: ACHHUZ5i9YuCQM241qbqGyShO9KhdSFiMx+oThiIwEv3Z34VIAHrV3v3LmhzJc5D6VSdzKQt0QFP7A==
X-Received: by 2002:adf:e2c6:0:b0:2ff:89d6:3561 with SMTP id d6-20020adfe2c6000000b002ff89d63561mr15044522wrj.64.1683110675420;
        Wed, 03 May 2023 03:44:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id w13-20020adff9cd000000b002cea9d931e6sm33597004wrr.78.2023.05.03.03.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:44:35 -0700 (PDT)
Message-ID: <222f54244c8ac90667615737d7886bc21ea46577.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] poky.yaml.in: simplify host package requirements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Wed, 03 May 2023 11:44:34 +0100
In-Reply-To: <65845df5-37a5-202f-f5ec-00d2199bc347@bootlin.com>
References: <20230503090136.2483595-1-michael.opdenacker@bootlin.com>
	 <cdaf1f42bc82c7a9146070925079ea0ceba3e98e.camel@linuxfoundation.org>
	 <65845df5-37a5-202f-f5ec-00d2199bc347@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 10:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3899

On Wed, 2023-05-03 at 11:37 +0200, Michael Opdenacker wrote:
> Hi Richard,
>=20
> Thank you for reviewing this patch!
>=20
> On 03.05.23 at 11:13, Richard Purdie wrote:
> > On Wed, 2023-05-03 at 11:01 +0200, Michael Opdenacker via
> > lists.yoctoproject.org wrote:
> > > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > >=20
> > > Some of the listed host packages were no longer necessary.
> > >=20
> > > [YOCTO #14873]
> > >=20
> > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > ---
> > >   documentation/poky.yaml.in | 28 ++++++++--------------------
> > >   1 file changed, 8 insertions(+), 20 deletions(-)
> > I think this is another "it depends" situation.
> >=20
> > The cut down lists you have below probably works fine if you just want
> > to build and image and hopefully let you run it under runqemu.
> >=20
> > Where things will start to get problematic is some of the testing
> > workflows such as "oe-selftest -j X" which definitely needs python3-
> > subunit, or resulttool which does need python3-jinja2 for some options
> > iirc.
> >=20
> > As such, which this change is right for some workflows, it isn't
> > correct for others.
>=20
>=20
> Right, I just tested for the use case advertised in the manual, that is=
=20
> running "bitbake core-image-minimal" and "runqemu qemux86-64". The=20
> latter command didn't need extra SDL host packages.
>=20
> >=20
> > Ideally there would be two levels of dependencies, those needed for the
> > basics and those needed to cover all the needs.
> >=20
> > Looking at the original bug, I think we did remove some of the
> > SDL/xterm/vnc requirements. Even then some vnc pieces are still needed
> > for some autobuilder setups though.
> >=20
> > We likely should define which workflows we expect to work with this
> > "essential" dependency list?
>=20
>=20
> Maybe we could document this elsewhere (in a section for developers /=20
> testers ?), to keep the list short for regular users.

I agree, I think we do likely need to have two different lists with
pointers to move the user to the appropriate one. Would you be able to
propose a change?

> The thing is it's easier to add new requirements than to remove the ones=
=20
> which are no longer needed.

Definitely, I understand the challenges here. I just don't want to lose
the completeness of the information either.

Cheers,

Richard

