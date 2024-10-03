Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0405CF34A2
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 12:23:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10040.1727958228855597817
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Oct 2024 05:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WoD3qY/V;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cae4eb026so8777035e9.0
        for <docs@lists.yoctoproject.org>; Thu, 03 Oct 2024 05:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727958227; x=1728563027; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ezGFlKNRKEW4VMXIDusnwNxN/UFoxUnREaArUZtz580=;
        b=WoD3qY/V/ENkhYD/kKXyITJZsPya558C1WoyVZY1nr+vh17yETKwontE2WXo3HLjWy
         Yrw/3lwRUtC7IhET5V/0MeUccmNgEopRS5Id239jfyjOTyrctbVJJ5KdEIwwwx8C0ERE
         Cs9Tmq4Ex9Ygao+4JqMcJBhEbgbIjqJXU/M2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727958227; x=1728563027;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezGFlKNRKEW4VMXIDusnwNxN/UFoxUnREaArUZtz580=;
        b=f5N05hLj/uKr6jST1PT2sveVH38CPMaLorlE/oU1SrlbSXaX7utsTd1G86gXUoEtUS
         5/BO2RJ6C1+v5K9q47zx77SgtFbnmoWnTrM25iG8SaQaOjFw0N35/aAvZ+EYggX/M9TF
         ApRrzEtqaw16DF63VlMdEzGd6tgk9P9IuUBx2+KNfbHqMbxWs85AYFVoHKbQM2IsxXp0
         dJKtLqSdt9jLKjfEo3gs/ODYdggzx+YUKsYvX9VTcW0gBPVlymRmputJQTnTicttRo6C
         acaGCWSg27Nwnbxz1+vNVkq/VHxWKJkH+oRhsa0Qs/ZqpZKJWFznF5YIa02nXKBzKE//
         pUxg==
X-Forwarded-Encrypted: i=1; AJvYcCWW80c1BtbDQfetawrEbFGHFzXhXIaFC2qAM59u6nOlO5xu3f8eSmOGsbIf0kbXb9lAX50e@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwKJYh2Gj/NA3h2DpBOxdT6XdG7ngLJi4Gwnqqb9aiOMlpwqbDD
	wIZwvrhUjDutt1EvRHNyCPJ1zV8dBp1g/7MOc8X2+CLwFxcVp8YDPbvAlwTRX4U=
X-Google-Smtp-Source: AGHT+IGzrxjN9SSaZLQMpHIwj0Vj1LQksZpRErq49M+vpy7YIcLoB+eS+gBxVNYccGMcpdaCgR2QCA==
X-Received: by 2002:a5d:4b81:0:b0:37c:d4ec:aaab with SMTP id ffacd0b85a97d-37cfb9d13afmr3821355f8f.32.1727958226750;
        Thu, 03 Oct 2024 05:23:46 -0700 (PDT)
Received: from [10.1.9.111] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d0820a684sm1166977f8f.26.2024.10.03.05.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 05:23:46 -0700 (PDT)
Message-ID: <e26eee7d-84e8-4ef2-9e69-f9b160d3354b@smile.fr>
Date: Thu, 3 Oct 2024 14:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Improvement of the oeqa/selftest environment variable rewrite change
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
 <20240927220033.3941455-2-yoann.congal@smile.fr>
 <f71bb041-ad48-4294-aaf6-ab8d86b32a28@cherry.de>
 <3ca3c382-0c45-41e1-87a2-03fde24627b7@smile.fr>
 <ba6aa464-764f-4cfa-b5d3-56df3af76dcf@cherry.de>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <ba6aa464-764f-4cfa-b5d3-56df3af76dcf@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Oct 2024 12:23:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5403


Hi,

Le 02/10/2024 à 11:35, Quentin Schulz a écrit :
> On 10/2/24 10:57 AM, Yoann Congal wrote:
>> Le 01/10/2024 à 11:40, Quentin Schulz a écrit :
>>> On 9/28/24 12:00 AM, Yoann Congal via lists.yoctoproject.org wrote:
>>>> This covers the Poky commit:
>>>> 61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)
>>>>
>>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>>> ---
>>>> v1->v2: Reviews from Quentin Schulz:
>>>> * environnement -> environment
>>>> * oeqa/selftest now only rewrite*s*
>>>> * Add exemples for the selftest change
>>>> ---
>>>>    documentation/migration-guides/migration-5.1.rst  | 15 +++++++++++++++
>>>>    .../migration-guides/release-notes-5.1.rst        |  2 ++
>>>>    2 files changed, 17 insertions(+)
>>>>
>>>> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
>>>> index b43fecc2d..4625ff0e1 100644
>>>> --- a/documentation/migration-guides/migration-5.1.rst
>>>> +++ b/documentation/migration-guides/migration-5.1.rst
>>>> @@ -141,3 +141,18 @@ QEMU changes
>>>>    Miscellaneous changes
>>>>    ~~~~~~~~~~~~~~~~~~~~~
>>>>    +-  oeqa/selftest now only rewrites environment variable paths that absolutely
>>>> +   point to builddir (i.e ``X=$BUILDDIR/conf/`` is still rewritten to point to
>>>> +   the selftest ``conf/`` directory but not ``Y=$BUILDDIR/../bitbake/`` which
>>>> +   still point to the ``bitbake/`` directory)
>>>> +
>>>> +   For example (taken from autobuilder environment): ``BB_LOGCONFIG`` is an
>>>> +   environment variable containing a path that configures bitbake logs. In
>>>> +   autobuilder, it is set as:
>>>> +   ``BB_LOGCONFIG="${BUILDDIR}/../bitbake/contrib/autobuilderlog.json"``.
>>>> +   Note the relative path starting from the build directory to outside of it.
>>>> +   This path is not changed by selftest anymore.
>>>> +
>>>> +   Environment variables containing relative paths from tested build directory
>>>> +   to outside of the original build directory may need to be updated as they
>>>> +   won't be changed by selftest.
>>> On a side note,
>> I've tried to make it clearer, I'll answer your questions inline maybe we'll find a better wording?
>>
>>> I still wouldn't really know which variables I need to look after
>>
>> That can be any environment variable containing the build directory path but relatively pointing to outside of the build dir (like $BUILD_DIR/../bitbake)
>>
>>> or what happens if I don't (is there an explicit error, are there side effects, if so, how do they show up?).
>>
>> It depends on how this variable is used.
>>
>> Ultimately, there was a bug (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15241 but the bug is more global than just BB_LOGCONFIG) and the workarounds that users may have been used are not needed anymore or broken.
>>
> 
> Note: I don't want this discussion to prevent merging this patch in time for Styhead release, we can always improve later.

I've changed the subject hopefully, this will break the thread.

> Are those environment variables necessarily in the **shell** environment or are we also talking about variables that could be defined in bitbake conf files for example?

The change only impact the shell environment variables (No bitbake variables)

> If they are shell environment variables, I believe (hope?) selftest/oeqa can only access them if they are part of the BB_ENV_PASSTHROUGH and BB_ENV_PASSTHROUGH_ADDITIONS variables?

Good idea but I just tested and every environment variables are rewritten if needed, no BB_ENV_PASSTHROUGH* filter here.

oe-selftest is its own application. BB_ENV_PASSTHROUGH* only impacts environment variables in bitbake recipes.

> If that is the case, then we can simply tell people to look for relative paths in all variables listed in BB_ENV_PASSTHROUGH (via bitbake-getvar for example)?
So, that is sadly not the case.

I can't see how to make
> "Environment variables containing relative paths from tested build directory to outside of the original build directory may need to be updated as they won't be changed by selftest."
more precise/efficient/comfortable for the reader. Maybe explaining what "tested build" and "original build directory" are?

-- 
Yoann Congal
Smile ECS - Tech Expert

