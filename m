Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F670C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:29:35 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.1430.1752078571943877416
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 09:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lYqMRKDp;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23694cec0feso866945ad.2
        for <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 09:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752078571; x=1752683371; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pgBEi4IxFuBVqVZXuwGXaWWTXGqZ/VpRRhhSLWPfaq8=;
        b=lYqMRKDpv9pOg3INUOYzjcrQwjFUv6uDAl+dJjFRtlrq/pQbMCGmM28WnAjTaTjIfu
         ARltcuzeM3gRU0MSC6K7/a7W/ZpPXFfZ3cBCFmLQkEakclTpENR/mqEPijgaO7VY/7p2
         EMSkWOio4PcqLbuVL1cUO30cBiOB4OYYAMQQjRY2deLBVG0cog61QCOfz9wdQXdmsPDb
         9LMESvdTi7SBXCKSH6qPhPiBo+rOXRrv+1rsWqH/L2s51LMKZX4WMoCVNVH4CSUmSizh
         VMMQvHC/PN2zrPAvwQza3MMf80A57NoG32KB843KqIAHfnDQxU6L+vQ0s+v5NxW/rwaj
         BHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752078571; x=1752683371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgBEi4IxFuBVqVZXuwGXaWWTXGqZ/VpRRhhSLWPfaq8=;
        b=MLoGc2ldDoR4ogTwywH6mxxvqK7wTktsvjW5u0vj6nF9itrhnBxG8dKdHRVJRopBPu
         54/50uH0Mhg18NT4INOovdQJlHFG2ll+CYo814tW26qf2XwjODFnM/DIi931z98IQzzh
         pJZc8Xi+B/FeIR6UE3tAcqQB6YNEJ/X0jhxO+uhuofylXx85hAB8kZbpdlvDKLsByv4K
         6tVBDTikRUTySEPwIxAXn/SvGvVbRntpbPqCmUrsVIuocmxOLRyc4m8AXtlCX/Uyh1Sn
         v6p9lAl1SWCLYBXoeJyHRR5giy85N2qG8jpDnj8EWGMLQXN2hx8htqYFzVc7C0ZPb+T5
         SCUA==
X-Forwarded-Encrypted: i=1; AJvYcCVKN33hnfp2hJ+hSrIYvi75SzGXxqDnsGlaHyFYRklEM/pfDMj+bh4ynrBqLJrO6QelSr0B@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywa+ujy6Yuqqk0U6KdLnH4EXpNBRIf2jpERW5OY/J0qiex0hWpj
	TvAH4ga7anh/uGnDWD6anp/SWUXu1H2wHYBaq9cZa8eaPCgRIFm91JyD
X-Gm-Gg: ASbGncsfa5IpAwcXZnJkdfyjYalThISvUi2SYT3+O4H0cEdqmH82ajofjKcDCizs0xf
	jbpjbrRd3c6lFgIntyy5Be5+VAEeOl2UXUJnEcbfJD2GhDlWnPCECWus5UoWdWErcN6WaEaSLDl
	AIxkcQGCsAyMBbmz5pPci9ttg2xmVVEV+snut4ojG0M2Z8id/qTzV7IP42eD3vSMC0ahaGGxNkj
	afRl6a6m+9Ms1hX/3CEQoLmzpbs+INRsqJwKRe2MTs3uyjTFW1j8RqskuyCI7UXZh01m2o8/u1o
	+6O+C3IIw5ToQBI/3rzXKs/Gu97kPBKPmGCpr8T/OkakvexJWASKZCYDo1+PYBHw9TofZQmwbBc
	7htUKaTwrOAhhWJW9yv6E8B+IHhBPFlGq4JB51lli+DVFe4QGgg==
X-Google-Smtp-Source: AGHT+IHP0//OG36aEKXmD7SExyA4ZfDDXbFhJRfRNo3jr6eI+c76rT632EpqregQ789i80hx7MXOIA==
X-Received: by 2002:a17:903:6c8:b0:226:38ff:1d6a with SMTP id d9443c01a7336-23ddb1a0471mr30762635ad.7.1752078570850;
        Wed, 09 Jul 2025 09:29:30 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d1b7:aad6:2c95:a1d8? ([2601:646:8201:fd20:d1b7:aad6:2c95:a1d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455d27asm153669695ad.129.2025.07.09.09.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 09:29:30 -0700 (PDT)
Message-ID: <8674860c-6276-4e48-b486-0eed9f46d802@gmail.com>
Date: Wed, 9 Jul 2025 09:29:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] more nitpickery: "include_all" should be described as
 really specialized
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <d0caadc1-6923-4114-8798-89ecf3e8e494@crashcourse.ca>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <d0caadc1-6923-4114-8798-89ecf3e8e494@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 16:29:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7300



On 7/9/25 8:35 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    (yes, i'm still being pedantic and i'm keeping track of all the
> previous feedback, i'll get to it at some point.)
> 
>    here:
> 
> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#include-all-directive
> 
> the explanation for "include_all" correctly describes it, sure, and it
> also uses maintainers.inc as the perfect example. but it's not clear
> from the explanation that (at least for now) that is the *only* usage
> of it in all of the layers i have checked out.
> 
>    a reader might get the idea that, hey, this is a useful feature, i
> wonder where i should use it, without truly appreciating that it
> should be considered a *rarity*, to be used only in well-defined
> situations. *then* the example of maintainers.inc can be introduced,
> again emphasizing how this is really infrequent and needs to be used
> only in clearly appropriate circumstances. or something to that
> effect.
> 
>    thoughts?

some guidelines around its usage will certainly help users. Care to cook 
a patch ?

> 
> rday
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7299): https://lists.yoctoproject.org/g/docs/message/7299
> Mute This Topic: https://lists.yoctoproject.org/mt/114066590/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


