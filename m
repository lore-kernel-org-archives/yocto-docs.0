Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41379C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 18:21:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.903.1654712487350043522
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 11:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NUTLslLZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so2255954wms.5
        for <docs@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 11:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=jicSA5P93o5WRRalJ7rraXGr/90lYkgciEv4Rj/vqpg=;
        b=NUTLslLZHEGV+bJaQwGDowH3CMRW6/dhKm52fPKItgucRBLAJX1/S0sS3Yrdbb3AkM
         ssHTzzydK5g/h8bHHb7iijixrdI6SIUVatV20CulJkk1DkmvfLR9sVL7zhSwS/+EGf28
         TKMMg8EtLPzxzcGXG7iUQxQ64zqVsMLHDjL98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=jicSA5P93o5WRRalJ7rraXGr/90lYkgciEv4Rj/vqpg=;
        b=04zKa9v6eXQXiuhEvWidXdb2fZt6SkOCFD/+e3anap6ztV989KWVQv++AFZYV4v5tK
         S+nSxQrkT/aG7TeHxOlLssiA2v7iHmtROABkwr8F+1ioGwEaddAUgQ0yjmRnRBY0kcce
         c+Yy6pre1QTo5CCOz7+oMPwC+mhPVLC3wWCghnJGma9bkGmed+abJeh+HF+N7LXO2iAk
         xIb41qvJxHWvTFl1qHx2voElF7P9hiTktH3FdRxcS1IwS8wMqVaYoniAC6CXF9QzC1B9
         6InG9P5XyW6xEhknXht8racawMtcZL13X+ICSefnN3jq4amZz/NvD73nDDKc4TgncBbt
         ta5A==
X-Gm-Message-State: AOAM532oFXh5GePhNa8Ss6CMZQw7au2Jyaz+Cv5VfAkIIICeIMS9ivWF
	eGfN672ohxhVjGtuaDW7mj4+2A==
X-Google-Smtp-Source: 
 ABdhPJzBOB6UctBn09TNE3G9qPv71CP8OXLgHKImwQFnZbv9I8HYSZBOJSABAn7cEJMTmNQfhvjQ+w==
X-Received: by 2002:a05:600c:cf:b0:39c:325d:5a99 with SMTP id
 u15-20020a05600c00cf00b0039c325d5a99mr511621wmm.124.1654712485801;
        Wed, 08 Jun 2022 11:21:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2793:ec22:da5d:8e52?
 ([2001:8b0:aba:5f3c:2793:ec22:da5d:8e52])
        by smtp.gmail.com with ESMTPSA id
 a13-20020a5d456d000000b0021024f82e01sm21678345wrc.16.2022.06.08.11.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 11:21:25 -0700 (PDT)
Message-ID: 
 <8c002352015dd096ee9711742a84b2bf169c2971.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] docs: releases: move hardknott and honister to
 outdated section
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
 <quentin.schulz@theobroma-systems.com>, Quentin Schulz
 <foss+yocto@0leil.net>,  YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 08 Jun 2022 19:21:24 +0100
In-Reply-To: 
 <CADfgfoZ5uP_mCCdXFscxnE16Ozrs+aVmvrK_87v-5nToX8LcQQ@mail.gmail.com>
References: <20220603133353.506482-1-foss+yocto@0leil.net>
	 <a67c00b5-20a9-fd64-66ed-fc0e040f2999@theobroma-systems.com>
	 <a0058bb37f8f05cc7b9775c40c44dceee3bcb15a.camel@linuxfoundation.org>
	 <23a1213a-0753-6b13-e0af-360bf695eb57@bootlin.com>
	 <188ce60d87bc5adc5bbadd53aee44f306b7da45c.camel@linuxfoundation.org>
	 <CADfgfoZ5uP_mCCdXFscxnE16Ozrs+aVmvrK_87v-5nToX8LcQQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jun 2022 18:21:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2974

On Wed, 2022-06-08 at 11:03 -0700, Michael Halstead wrote:
> With this guide I can track these down. Some are easy like with 2.5.3
> it is just=C2=A026c5549580e108c40aa7c95860d12c675596820c (origin/sumo).
> Others take a little reading.
>=20
> Almost all of the tags from this era were made by the docs maintainer
> without any signing by release engineering. Should we backdate these
> when we create them? Should they be created in the name of the person
> who would have made them at the time? If not, whose name is the most
> appropriate?=C2=A0

Backdating to the time of the commit probably makes most sense. I think
they're fine to be made by you, the name isn't too important.

I can pick off a few of these if you want to work out the commits,
share the work.

Cheers,

Richard

