Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5311C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 22:46:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.39073.1739141196019834756
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 14:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0jGNteV9;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so37890685e9.1
        for <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 14:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739141194; x=1739745994; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uyZChRVVQIb/WfjjIWI4lxMnDn4+QeC71FBhjy4dn+Y=;
        b=0jGNteV9+0oggDVPZ8+r8X3pRr5PLSiEjsuWuaA6iswmcfFO5yi2NdGsITHAklp1zT
         KXZRmOWxWeYG27Ep0vIys7u0l5aEeACSYwRx/bFG2tu6TLCLJaRvxrEBxmOvAyD5linx
         djsofpI2vUTqFC9u5zSnHaA4Md+/qpCQvcNGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739141194; x=1739745994;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyZChRVVQIb/WfjjIWI4lxMnDn4+QeC71FBhjy4dn+Y=;
        b=CQVeq5WG6ahkYzJ2qnskss2YuYjpOyvZWc1rKGWEswEU9/an2VePq4hrrzx1XcQBP8
         CJBxbe8dKhkO9spoOQO9I0EudpEDVgBpg5wRtdjA80s+L1iEEpZDNlmbJGlQo4dq95F7
         W4jwMXT9UPXxW4Uy5kzNdMDVtMvgiglpzkFZtNj83kYbp4R/r8FYeQnK04HUWuEUTW8L
         nq/uQNbQn+wDj7HE0utxq7E9uBmAl+ZuIssNW7NXRB/Lg4lWDEGylu2VIne8aTJKCl8U
         SXOfpFE1P6DqHo/xNc1rx+miWtGfh2xRZKvaCLRaKOgctZ7ZQ0sbrP4bE1kmu5kpncCS
         NCcg==
X-Forwarded-Encrypted: i=1; AJvYcCXev9qVvAqpQEu//4v+X+llFvb0sWms1KK+KckbJnMGv8CVuoK8O+smgQovGo7euqOyJzje@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxceaqKLIWLPrT/PqmiUkPOM4cOWIfTvmaRnXrwPq1oUZ2NcI9C
	4fTD3ldL9e5PQK7SvnF9WwSK+H+aS0/hT7ualbFG04FS7pOxW1GrTbkN4QiXr6Y=
X-Gm-Gg: ASbGncvKzWtavMaT1JpNkMoCXkeIPYiNBdGRUm96FTcRqaaEC2UVptnGvwlgzmYgLz0
	gXaCSIMmO0qWw95GNjxV+DwAKCwtpswUh5OQ41MRCHRnFMF1/+GqvPkEm1PX2BCvcEaDh+sj3rq
	OdZfTiUyG+wXd6BI8TYgmRmuAKbMvE2ABh2CO9vE4tldJtdRyZpNF2ZzjJE7SeqJWMx1bj6mAmo
	/ABmcsmpzmMqoH712GTQX7ojZRXuzf32FZl5riXZdroQvr7eUPCvyN38CPYl6DPOJU8AcWw0ZLe
	KmbhrBg3BiDYSJt3T9CIYzNDHy4EnRRANcuSuKIvaYV5B+10g/ATfH5wkM8wy5tt8koqjTFncbV
	KMWQkPu6XZiIU/FD9AoHR919LbzypXBDXXcgBehHl3InhtVX6Fxx/
X-Google-Smtp-Source: AGHT+IEr9jH/TA+vhDh/3+19vb485k0HaJcISfC9lUsnYiETEP7v7EQ5Y+VZfVI5GjDizTpfXQ2S3w==
X-Received: by 2002:a05:600c:5026:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-439249c6eeamr75194925e9.26.1739141194277;
        Sun, 09 Feb 2025 14:46:34 -0800 (PST)
Received: from ?IPV6:2a01:cb00:dee:f000:367a:1a7f:22ad:d27b? (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd2ef7efesm5636589f8f.52.2025.02.09.14.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 14:46:33 -0800 (PST)
Message-ID: <2c8a8f6f-d545-44b7-a9d7-ab05ee90bb34@smile.fr>
Date: Sun, 9 Feb 2025 23:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206131811.86935-1-yoann.congal@smile.fr>
 <20250206131811.86935-3-yoann.congal@smile.fr>
 <6a34b601-8ddb-4101-9ae9-d0996202f79e@cherry.de>
 <481d5eeb-7042-478c-b4cb-86b1981b5a8d@smile.fr>
 <cdef73b7-8b73-447f-ba06-8256f5ac8f0c@cherry.de>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <cdef73b7-8b73-447f-ba06-8256f5ac8f0c@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 22:46:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6309

Le 07/02/2025 à 10:12, Quentin Schulz a écrit :
> Hi Yoann,

Hi,

> On 2/6/25 7:17 PM, Yoann Congal wrote:
>> Le 06/02/2025 à 17:08, Quentin Schulz a écrit :
>>> Hi Yoann,
>>>
>>> On 2/6/25 2:18 PM, Yoann Congal via lists.yoctoproject.org wrote:
>>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>>
>>>> Shows an example of the new variable
>>>> OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
>>>> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that
>>>> were
>>>> shown earlier.
>>>>
>>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> 
> Since this is your v1, I believe you're not allowed to provide Reviewed-
> by/Acked-by/Tested-by/etc... given privately. Guillaume should give
> their Reviewed-by on the mailing list before you can add it.

I did not know this was a thing.
I did private reviews (with my Reviewed-By) for my coworkers for more
than 2 years now and nobody told me.

I'll remove it for v3.

> [...]
>>>> +This will test the reproducibility of ``my-recipe`` but will use the
>>>> +:ref:`Shared State <overview-manual/concepts:Shared State>` for
>>>> most its
>>>> +dependencies.
>>>> +
>>>> +You can have finer control on the test with:
>>>> +
>>>> +- :term:`OEQA_REPRODUCIBLE_TEST_TARGET`: lists recipes to be built,
>>>
>>> Reading this I'm wondering if this includes the recipes that will be
>>> built using sstate-cache as well, i.e. all recipes that will be built?
>>
>> OEQA_REPRODUCIBLE_TEST_TARGET is the list of all recipes to build twice
>> (once with sstate globally enabled, once with sstate globally disabled)
>>
>> Before the second build, the OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS set
>> of recipes will be built using sstate so that the second build (without
>> sstate) does not have to build them from scratch.
>>
> 
> This is actually documented at the end of https://docs.yoctoproject.org/
> test-manual/reproducible-builds.html#can-we-prove-the-project-is-
> reproducible. I feel like a reminder wouldn't be too bad of an idea in
> this section even though it follows the one it's explained in, but not a
> requirement per-se, up to you.

My current ticket
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=15701#c3) include to
rework how the test is implemented. I will sent patch to the doc to
explain the new implementation when merged.

>> We usually want OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS to be a subset of
>> the dependencies of OEQA_REPRODUCIBLE_TEST_TARGET but it not enforced by
>> the test.
>>
> 
> If my understand is correct, OEQA_REPRODUCIBLE_TEST_TARGET could be a
> recipe A and OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS could be dependencies
> of that recipe A, so it's not necessarily a subset? But they should
> relate otherwise they are noop?

If OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS is not a subset of the whole
dependency tree of OEQA_REPRODUCIBLE_TEST_TARGET, they still will be
built using sstate during the prebuild phase of reproducibleB but that
won't decrease build time of reproducibleB, thus globally increasing
build time (ie worse than noop).


> Thanks for the explanation!
> 
> Cheers,
> Quentin

-- 
Yoann Congal
Smile ECS - Tech Expert
.

