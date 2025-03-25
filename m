Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85420C36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 10:14:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.62380.1742897688224058470
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 03:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CoDrNSJ9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394036c0efso33544995e9.2
        for <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 03:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742897686; x=1743502486; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u9426ZiFlxzwMy4ZOWhJMoDksptDGP1VPky3K+xtLZ8=;
        b=CoDrNSJ9RsubECsBK6QP7MUqs6CViuTuLVyka+RtG6/qUH9UJEudBLgQVkXLp8ORgp
         cJfR2Ehc3vuttInucyXjpRBiZj8+x6xJ4SCPR9qhEe8kDDbG2XGFAj9oCsOl/zrCUrp7
         8k627249PzUqSkLtawzj50HRyA+UdbEnJale4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742897686; x=1743502486;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9426ZiFlxzwMy4ZOWhJMoDksptDGP1VPky3K+xtLZ8=;
        b=fxNaywPk8g4cT8IgZ0WzYDxKsxvCjT852EIgHuFoCaON8yGfRj1uFxD9r8SKc8eobV
         KmozH1E7O1nGyfE6W3S8yxr4L/WgyprC0kbyOcsOryleDQSdHoubo4OEAkM9E8q3uRX1
         2/BgkImFAEdbGaH2Zg62k8QVkMsJ/Mh6P+7H4MLcQntfl9DL9e78kJTkvq5x8v+urY9p
         TgffuFhyx1nFREi9OQEW0PsPnpBmsenoEuNuboqaGNCDZHtKPqjplzre3MOesXWtdY0j
         CYaZCdovAAAW0kra6KJndluL4ARL1s9VuU6EEJ4wsXmHgPkjZBt3fBOJsfH4zD8tBfdC
         MBmQ==
X-Gm-Message-State: AOJu0YxbiBo2pn2C5QZ4Qqu3o42xxXL6C/YB4qrhNqF2qdlsDSi37i2s
	bAK/xZQhz5IjRXZ5BM4JYV2/cQuXwfXrG33f729sh0tiPXs9yoz+Jli9pXhzFcM=
X-Gm-Gg: ASbGncuFjY539dd/WFEKkAgdljFZDEigvkVaB/KD5WRveOuMQvGAWdjbiiyHakbscIL
	dzuprSpFWtR5/30yrZ8qunDbnXpAEges7JXtvWNr3fXFLg8y0rdEpqTio+Aj7u1D96a/fZ3hmkQ
	9c3dATDnCTiHqiPMMxta1yD69cW3yu51zCStDNeJ1+3+raPyyOBreqSdpjIJ3N/fswE7W2mdOCt
	iTkwQR8d8wGyv3ZF8Cnlc/BUuRSMlZ+U9eCfS71XzN2fzujLRVmdjnWDgiz76PSUALxp33QutZm
	CmddIu/u+jhGRY1KasnPHCYWvCpI6Cq0v8DsvskP0IQZUU0S1dAfRSNvtJz/SqVqwLoydihm7kI
	l+/tLTiAnslj0OVX9Iuyl1YQA9hPpDuRbOw==
X-Google-Smtp-Source: AGHT+IGH+gIzkU3vw9fYPXsJISeicn8zRoatMiUC6xLDsoSqE6aqBGwSArxmLB/KL80FX/WkGHhO/g==
X-Received: by 2002:a05:600c:1989:b0:43c:fc04:6d34 with SMTP id 5b1f17b1804b1-43d50a318aamr129964685e9.20.1742897686533;
        Tue, 25 Mar 2025 03:14:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd49:ef6e:5ada:f0b5? ([2001:8b0:aba:5f3c:bd49:ef6e:5ada:f0b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd187fasm148218085e9.14.2025.03.25.03.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 03:14:45 -0700 (PDT)
Message-ID: <7275d5d500666f6278ec7937ab15ceb10cdf4f58.camel@linuxfoundation.org>
Subject: Re: [docs] [bitbake-devel] [PATCH] doc: Mention `if [[
 somecondition ]]` is not supported
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, javier.tia@linaro.org, 
	bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 25 Mar 2025 10:14:43 +0000
In-Reply-To: <0531cca3-683c-4ec3-853c-59da9492c8b6@cherry.de>
References: <20250320003358.977774-1-javier.tia@linaro.org>
	 <0531cca3-683c-4ec3-853c-59da9492c8b6@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 10:14:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6626

On Tue, 2025-03-25 at 11:04 +0100, Quentin Schulz via lists.yoctoproject.or=
g wrote:
>=20
>=20
> On 3/20/25 1:33 AM, Javier Tia via lists.openembedded.org wrote:
> > I keep forgetting using `if [[ somecondition ]]` is not supported.
> >=20
> > Signed-off-by: Javier Tia <javier.tia@linaro.org>
> > ---
> > =C2=A0 doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 4 +++=
+
> > =C2=A0 1 file changed, 4 insertions(+)
> >=20
> > diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b=
/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > index 415fbf6d6..5474e154f 100644
> > --- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > +++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> > @@ -1381,6 +1381,10 @@ To make use of this technique, you need the foll=
owing things in place:
> > =C2=A0=C2=A0=C2=A0=C2=A0 To call your modified version of the function =
as defined in your recipe,
> > =C2=A0=C2=A0=C2=A0=C2=A0 call it as ``do_foo``.
> > =C2=A0=20
> > +=C2=A0=C2=A0 .. note::
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Conditional expression using ``[[ somec=
ondition ]]`` is not supported.
> > +
>=20
> Do you know what the reason is for that limitation?
>=20
> The example above this git context is not really implying `[[=20
> somecondition ]]` would be valid though.
>=20
> If I remember correctly, the shell functions are run by /bin/sh=20
> interpreter, so it depends on which shell you have configured by default=
=20
> in your system. Is it possible this is due to you being used to develop=
=20
> with bash where this is possible and having your Yocto build run with a=
=20
> different shell (e.g. dash, which doesn't seem to support that? c.f.=20
> https://manned.org/dash.1)?
>=20
> I think we should recommend people write POSIX-compliant shell functions=
=20
> and tasks rather no?

Bitbake parses the shell functions and our shell parser can't cope with
certain syntax unfortunately.

Cheers,

Richard

