Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82B8C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 18:17:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.48721.1738865843101585732
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 10:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wdnWZV4y;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38db570a639so732554f8f.1
        for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 10:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738865841; x=1739470641; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8H59OvmV3WHHi1i3tWwkMH30d/qcWXRYH1kaQGcdAdI=;
        b=wdnWZV4y2lBZHOaNZ2+enc+uxkbJ8X4oFQlAIiZWQkUvtRybOXr/8HSN6h9in65dVK
         mtkC00KahnTxu4u7rsETocRnLCCggqskXhORGESgr03ogYQSfHcoZ33X9VM9/EDhRiPj
         jhgsMUpG46IlYcYvnIHPDx/Cus4xg8ka7W884=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865841; x=1739470641;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8H59OvmV3WHHi1i3tWwkMH30d/qcWXRYH1kaQGcdAdI=;
        b=eoSLO6XQo6jMsNDy2kNCFb7nz8OdiaAIxT9Ux/KaNxV0dL3Og8s1aYq9Kny/HUAmMS
         +7eFGdCMkrq/6+URAJ06/ZlnZgS9EeUQ0OPntBwxgiOOUCg6kCOjbbBLRsiMO7kF1hkn
         Y2G2MKf8Us9kqpvgvQAQz46qNdj5cBHXNnAgnF6bujI7sMzCzA+z6BBSkJRmxmKCZn/p
         SNsKGA0hHyixg1wTIPME58XJPIjPQBg6Sfnsxg3Xntaolts8TKTQZNQ9j/IcGhVFKkq+
         xvAdfcz28e7fdpelJvS7SinqA2SLwCgAdTdfuVXNV6VoiXkfaZnyiLQNduP2rWLWKcXJ
         WNeg==
X-Forwarded-Encrypted: i=1; AJvYcCXJMyRAnBpyu0aqpONnPJ/1f/A+BTmyGfrwWqsnZ5g/+JWE0W90wuitJS1Llbq9TnVCl/13@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyH+mWq5yDcKogzbvH4bidQY9VAQCUrrAcKTHclBd4Us+JjiO/b
	NQ6T7kN+a901mepbessrKWdq8OZFi6IvwlPhNjykd+ADy7+vBtaxClaTz1p0Vj8=
X-Gm-Gg: ASbGnctt8bgxq6s3+oQOlAIny9h3t5YkZS0Pn5yMJkj0u+Q4oN0ZjzaPbbZiv22B3OJ
	e3EpN5gAEKe4zSzYRbQ6EJoKkRRtixwh7e/o8k7/4rDqZH2AoedIkHqM6mppCCPOiF+rciI2x9S
	mkHRqRziAYYUsGD++DHdyN4ZXBtz8c4TWxl5riWneVGm0S2LnhNAljePO8hSZ2TTz6FIOiWfFxx
	FzhsV490UolhTV67TZavnyLWd5hCl87AzCmASR4/z6dM5Dk8jh+X5WKOAgdk8pxfKjxOFayF9LI
	kJ6L58U/BcPmzYrQOiZAEmgvN6W30eFxn+FEFs9/aBuZ6Xbt4kew741L0O4NDanuMHeb3V/lfn0
	EiwG8yhQrM6PAocPeDzwGiT/6lcA4+QoBn8D40Eoa5NSATbMHQn0Ylg==
X-Google-Smtp-Source: AGHT+IG6YObNrZsSaYHHBvYlfeXyutRXbXTYdvQAf/XSMo5LgWaR/AJdxydS/vwYhRi49Kca/kXZLg==
X-Received: by 2002:a05:6000:154d:b0:38d:b916:800a with SMTP id ffacd0b85a97d-38dbb20b412mr3049461f8f.6.1738865841511;
        Thu, 06 Feb 2025 10:17:21 -0800 (PST)
Received: from ?IPV6:2a02:8440:b217:ccba:bcfa:4997:5400:e129? (2a02-8440-b217-ccba-bcfa-4997-5400-e129.rev.sfr.net. [2a02:8440:b217:ccba:bcfa:4997:5400:e129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d96548bsm62382265e9.21.2025.02.06.10.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:17:21 -0800 (PST)
Message-ID: <481d5eeb-7042-478c-b4cb-86b1981b5a8d@smile.fr>
Date: Thu, 6 Feb 2025 19:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206131811.86935-1-yoann.congal@smile.fr>
 <20250206131811.86935-3-yoann.congal@smile.fr>
 <6a34b601-8ddb-4101-9ae9-d0996202f79e@cherry.de>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <6a34b601-8ddb-4101-9ae9-d0996202f79e@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 18:17:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6266



Le 06/02/2025 à 17:08, Quentin Schulz a écrit :
> Hi Yoann,
> 
> On 2/6/25 2:18 PM, Yoann Congal via lists.yoctoproject.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
>> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
>> shown earlier.
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>> ---
>>   .../test-manual/reproducible-builds.rst        | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/documentation/test-manual/reproducible-builds.rst b/
>> documentation/test-manual/reproducible-builds.rst
>> index b9f671d68..909ac5216 100644
>> --- a/documentation/test-manual/reproducible-builds.rst
>> +++ b/documentation/test-manual/reproducible-builds.rst
>> @@ -145,3 +145,21 @@ set of recipes before the test, meaning they are
>> excluded from reproducibility
>>   testing. As a practical example, you could set ``sstate_targets`` to
>>   ``core-image-sato``, then setting ``targets`` to ``core-image-sato-
>> sdk`` would
>>   run reproducibility tests only on the targets belonging only to
>> ``core-image-sato-sdk``.
>> +
>> +Using OEQA_REPRODUCIBLE_TEST_* variables
> 
> I think it'd make sense here to tick-quote OEQA_REPRODUCIBLE_TEST_*?

I agree, I'll modify for v2. FYI, on my build, it renders as italics.


>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +If you want to test the reproducibility of a set of recipe, you can
>> define
> 
> s/recipe/recipes/

Right, I'll modify for v2.

> 
>> +:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf::
>> +
>> +    OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS = "my-recipe"
>> +
> 
> We align by three whitespaces, and I think it's four here if my eyes
> don't fail me?

Rhaa, nice catch, I did count these at some point. I'll modify for v2.

>> +This will test the reproducibility of ``my-recipe`` but will use the
>> +:ref:`Shared State <overview-manual/concepts:Shared State>` for most its
>> +dependencies.
>> +
>> +You can have finer control on the test with:
>> +
>> +- :term:`OEQA_REPRODUCIBLE_TEST_TARGET`: lists recipes to be built,
> 
> Reading this I'm wondering if this includes the recipes that will be
> built using sstate-cache as well, i.e. all recipes that will be built?

OEQA_REPRODUCIBLE_TEST_TARGET is the list of all recipes to build twice
(once with sstate globally enabled, once with sstate globally disabled)

Before the second build, the OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS set
of recipes will be built using sstate so that the second build (without
sstate) does not have to build them from scratch.

We usually want OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS to be a subset of
the dependencies of OEQA_REPRODUCIBLE_TEST_TARGET but it not enforced by
the test.

Thanks for your attention to detail (seriously)!

> Cheers,
> Quentin

-- 
Yoann Congal
Smile ECS - Tech Expert


