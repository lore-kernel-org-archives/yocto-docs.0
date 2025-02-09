Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBDAC0219D
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 22:59:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.39300.1739141953867518222
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 14:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u9xjKcHZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4368a293339so42414275e9.3
        for <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 14:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739141952; x=1739746752; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=obUvah8fQ7OAVdUBdznR0NaBe7AJgbgIrvs5b8yIA6U=;
        b=u9xjKcHZcJKWxbccjsJTTQYiLMOibxqv+WsAYglDToFCEmUFoNROEJg3qM0AT/L8tl
         FcK+CCFjVM6ofHZ/diUnMrue0ACOXKxT2oBai6hRNc7XS5jKOw+gQnjepoH9da3jiCfH
         ro+JbqJNdaxryn04rlS4niJ2Edn4NIWCVfa/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739141952; x=1739746752;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obUvah8fQ7OAVdUBdznR0NaBe7AJgbgIrvs5b8yIA6U=;
        b=ssyaEQx0Lvp+SvwZfPuBCJz1fA+QAD6/iEMys8HL3/PnHc8KSUDKaDnga4RqyxB9//
         A8LuVRVFPzMatM9vXCyn3p8etbpBw6aeI6sBtOmLrCnqM0UiS6q4xqG6CHMqf4SjnbNb
         dLTPNgYODKcLwWJws5r90yc9BjLNriDLwpm5bh5U4+dWdXjssJbfeRa310OVcTdPQ2oC
         iBXZce9SM8JCAVCaFKgWJKscfNrH35ZhfTixD5QzKFibFpFPbg+NPNAcvw7qUs9WIvI9
         /H2BxUECec0xBNVRXTEdxCMu1cvQs2WRMpRtdy0r03JGqZ4YnWZfAjMtNoa70dJsqYKE
         npmA==
X-Forwarded-Encrypted: i=1; AJvYcCVI2ZMD3lBKGhUNOkNGT8Wy4nnFH/EqcCR2HsmYuTu6HfFqaQUDKHOztwcPsl22vFHKkspb@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy5Xpjxw20jsY5WzwDt8Nc3X0QKBzAyL/RW/NoyLLEtGcDmR3wo
	Rrya5MRUOtVy7OS/M8Nu3W6K/6AHgRO/TZJoGNbwNE85//wBV+yLKHJBpEIi9qU=
X-Gm-Gg: ASbGncsDJeVzSOIsMTpRADE6i2/5ZOp90utSO4GXYk7302hISGBnJjxKIMuNaPYvvHi
	goqvqQY99StKutRSC4baUC1RbpNSZ/YjG6S/Divrz6t8RlmOWX2Os2xdTE+3F5YR/0ixdsHkd2G
	AC4XADMeBpRfmFXxKViDulIczeQgjHBH91FNdNllRyD3IGqvXn4BdHoQBflxAwJ1u73ZQfbTg2U
	ko1eTlwXr9IcyzhmLh6YSQHRWNHhuD/pw9zaitBW4UclGllmKtIn7Xz4ETdvipxBLeCvr8jMt1g
	rq9l1jeU9W1rE1RZj1rv+EOyPQtR9LzG3pLhsGvz/B5Zslta+L6W43af6cHl8yUO6AIQ13LmvWx
	upSd3trLwVwg0BE00jU6vWgLCziLEKQssWgbKmG0N2GXVJqQ6RnRi
X-Google-Smtp-Source: AGHT+IEgqnNjMgUkrd9q9FP3OfR4UsxvrWyh40UppYxwaxPc3fvKlieM2NG23s9m6oCroe4SUrCBcA==
X-Received: by 2002:a05:600c:1388:b0:434:a781:f5d5 with SMTP id 5b1f17b1804b1-43930662c98mr53404705e9.30.1739141952209;
        Sun, 09 Feb 2025 14:59:12 -0800 (PST)
Received: from ?IPV6:2a01:cb00:dee:f000:367a:1a7f:22ad:d27b? (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm161754995e9.0.2025.02.09.14.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 14:59:11 -0800 (PST)
Message-ID: <4508019a-f5b8-4a55-abc9-b757045ecdea@smile.fr>
Date: Sun, 9 Feb 2025 23:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206215711.154194-1-yoann.congal@smile.fr>
 <20250206215711.154194-3-yoann.congal@smile.fr>
 <52281efc-eeae-4b9a-a0a8-6b42f83a9d7a@cherry.de>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <52281efc-eeae-4b9a-a0a8-6b42f83a9d7a@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 22:59:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6310



Le 07/02/2025 à 10:13, Quentin Schulz a écrit :
> Hi Yoann,
> 
> On 2/6/25 10:57 PM, Yoann Congal via lists.yoctoproject.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
>> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
>> shown earlier.
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>> ---
>> v1->v2: Quentin's review
>> * tick-quote variable in title
>> * a set of recipeS
>> * 3 spaces to align a code block (not 4)
>> ---
>>   .../test-manual/reproducible-builds.rst        | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/documentation/test-manual/reproducible-builds.rst b/
>> documentation/test-manual/reproducible-builds.rst
>> index b9f671d68..77c15d6e2 100644
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
>> +Using `OEQA_REPRODUCIBLE_TEST_*` variables
> 
> Sorry, I meant double-tick quoting, the same way we do for the classes
> in documentation/ref-manual/classes.rst, c.f.

I'll fix in v3.

> ``allarch``
> ===========
> 
> My grep-fu didn't return anything with :term: in titles, so I guess
> that's why we're going with double-quotes typically?

That does ring a bell:
https://git.yoctoproject.org/yocto-docs/commit/?id=b9e19a00a3aac05a2cdd35b61dfae6d5a1a9c648
...but in this case the linkage works (but the link is rendered as black
wheras the rest of the title is blue, looks a bit weird IMHO).
Also, since I don't point a single variable but the whole
OEQA_REPRODUCIBLE_TEST_* group, I'd rather leave it with double quotes.


> Looks good otherwise (see comments on v1 I just sent for the end of the
> diff in v2).
> 
> Cheers,
> Quentin

Thanks!
-- 
Yoann Congal
Smile ECS - Tech Expert


