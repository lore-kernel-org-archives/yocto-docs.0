Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0607BCF31A7
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 08:57:33 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.2818.1727859450358498851
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 01:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CUlFwrpw;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37cfff59d04so179662f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727859449; x=1728464249; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DQXvZRMZzvojEo8Qoxt0IdhENWfDvd1ePzFA2TlC2Tc=;
        b=CUlFwrpw5+MyiNKWqSmLBwIrwIUdK5XPQglMT/Wo2mMNBI3oOlntIjiMl4sGLND5js
         E7/SU66wbawsPaMdh+knAKsr+awg8Tqy9R9VNkOrvekghMsuypFPK26EPeXdrhdTvHg4
         ickKdgLR1RvNbiGNS5q9a3YQADrHp+1TnPUr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727859449; x=1728464249;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQXvZRMZzvojEo8Qoxt0IdhENWfDvd1ePzFA2TlC2Tc=;
        b=Eh1yYRUBd7S6P9feaa54deKMxVJ5KNnOZgj2qkyl7pqh8/1eDmi9lOwq4GV375LjZM
         92ykKo2i+xdq5MtGacCyGd2zmlpP53Nr9nILCqemzAlKcrsl6C+tsBlZnFpyOKjyQCg5
         DDsytW1OCEs3f4EK7i+KSyPxBi6EnTjRnyxEzKZf6hqg8idDa24ZkW8VUSHFpVV7tyst
         XUNFEbzwF1xiKa64wdbxGN7MlaTtwSe9BP4sNayRv3diGLRVLBx0H4g0HrFPU39pTdLX
         Ay+Cxchvwe5LbgdgY9IlWtnNmgi2pTB/eJiI7/hRySbJRPIwfZpLtSxulVasV2wXVDd6
         95Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVCRebGFjRynWhwvGI+os4MZWmHG0Gw7vShEpCVQxrEbrdEVr7WaxZikyQbjCDfQc/evuxP@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yyb5upn49Wm3AntJyvxvBpQ9Yx85zGjZa5i6T4TRH/FrB9wSUxn
	U0NCbNco/mQglC4QngAcQax2PSnKUZj7YiAjC5YEG3NItabwOQeg8ILYopeN9TA=
X-Google-Smtp-Source: AGHT+IEDbjl11MoeY0bQugK3Dh1aC034AJVQuFh9Vxv8bEjdriMCtqdtk3jWKXzGGVHeRub/q/gE/g==
X-Received: by 2002:a5d:47ad:0:b0:374:c692:42e2 with SMTP id ffacd0b85a97d-37cf28a4902mr4621846f8f.9.1727859448587;
        Wed, 02 Oct 2024 01:57:28 -0700 (PDT)
Received: from [10.1.9.111] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ec0722sm12788085e9.15.2024.10.02.01.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 01:57:28 -0700 (PDT)
Message-ID: <3ca3c382-0c45-41e1-87a2-03fde24627b7@smile.fr>
Date: Wed, 2 Oct 2024 10:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
 <20240927220033.3941455-2-yoann.congal@smile.fr>
 <f71bb041-ad48-4294-aaf6-ab8d86b32a28@cherry.de>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <f71bb041-ad48-4294-aaf6-ab8d86b32a28@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 08:57:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5400



Le 01/10/2024 à 11:40, Quentin Schulz a écrit :
> Hi Yoann,
> 
> On 9/28/24 12:00 AM, Yoann Congal via lists.yoctoproject.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> This covers the Poky commit:
>> 61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>> v1->v2: Reviews from Quentin Schulz:
>> * environnement -> environment
>> * oeqa/selftest now only rewrite*s*
>> * Add exemples for the selftest change
>> ---
>>   documentation/migration-guides/migration-5.1.rst  | 15 +++++++++++++++
>>   .../migration-guides/release-notes-5.1.rst        |  2 ++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
>> index b43fecc2d..4625ff0e1 100644
>> --- a/documentation/migration-guides/migration-5.1.rst
>> +++ b/documentation/migration-guides/migration-5.1.rst
>> @@ -141,3 +141,18 @@ QEMU changes
>>   Miscellaneous changes
>>   ~~~~~~~~~~~~~~~~~~~~~
>>   +-  oeqa/selftest now only rewrites environment variable paths that absolutely
>> +   point to builddir (i.e ``X=$BUILDDIR/conf/`` is still rewritten to point to
>> +   the selftest ``conf/`` directory but not ``Y=$BUILDDIR/../bitbake/`` which
>> +   still point to the ``bitbake/`` directory)
>> +
>> +   For example (taken from autobuilder environment): ``BB_LOGCONFIG`` is an
> 
> nit: could use :term:`BB_LOGCONFIG` here since we have it defined in the reference manual? We could probably even avoid explaining what it means here (not necessarily though).
> 
>> +   environment variable containing a path that configures bitbake logs. In
>> +   autobuilder, it is set as:
>> +   ``BB_LOGCONFIG="${BUILDDIR}/../bitbake/contrib/autobuilderlog.json"``.
>> +   Note the relative path starting from the build directory to outside of it.
>> +   This path is not changed by selftest anymore.
>> +
>> +   Environment variables containing relative paths from tested build directory
>> +   to outside of the original build directory may need to be updated as they
>> +   won't be changed by selftest.
> 
> selftest should be single-tick-quoted as defined as standard in the git repo, c.f. https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md
> 
> This was done by Michael but he's not the maintainer anymore so I guess whoever replaces him may have a different opinion, in which case extending or replacing it would be most welcome, is that you Antonin?


> On a side note,
I've tried to make it clearer, I'll answer your questions inline maybe we'll find a better wording?

> I still wouldn't really know which variables I need to look after

That can be any environment variable containing the build directory path but relatively pointing to outside of the build dir (like $BUILD_DIR/../bitbake)

> or what happens if I don't (is there an explicit error, are there side effects, if so, how do they show up?).

It depends on how this variable is used.

Ultimately, there was a bug (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15241 but the bug is more global than just BB_LOGCONFIG) and the workarounds that users may have been used are not needed anymore or broken.

> But admittedly, I have zero experience with oeqa or selftest so people in the know probably know what this is talking about? In any case, I guess we can revisit this later on, it's not written in stone, and better have something than nothing :)

-- 
Yoann Congal
Smile ECS - Tech Expert

