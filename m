Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D77CF648A
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 22:09:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.2775.1727474941574232304
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 15:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B/ub0sek;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so20548935e9.2
        for <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727474940; x=1728079740; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E3ODQ7ARs00iiPc8VwSGbORUF3WwCOHqaYdxD8yPw5s=;
        b=B/ub0sekpefbPpKa9o89S7m1z+FcVdq+U+NBsnQPAAsCSOdY8pxnoZi3dP5+07hxec
         k/XapEVCBo82ZQopox6RRTB/W+RebGQ/NDrzhLqxwLJvNxf4JKDtMGnq0UlgUrIAJT4a
         wNAMxb+1POPza4hpEiHMM9rZMoOGtqH9z6Vco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727474940; x=1728079740;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3ODQ7ARs00iiPc8VwSGbORUF3WwCOHqaYdxD8yPw5s=;
        b=cW9w7XqM/Wo8w6o7VJByVn3sU6GUGC2qAbbDm0vv5+CSpncqcVMnATOVV14SpI3RPc
         DmN0hDfGT5N38AjBuWgsze4l1lHV6vx1eZ2shrvnAC+RVnYt1V07Y95KaMX9cEbPqVGS
         KmcvOasiu+i12a82DrymdmwUvzoVovvH/qncJKa4fmxANx9o2MDeG/oaqf4FhynrP/Ez
         Cpv5Cf62VaSv+mP/csfZYgZj6dbCswsReFBFcmxMKWnsZBWbgMNZSsCX1M+F4Qzy00Yz
         06jyL7f+JJhYEYBiQjUU/5BfGiU/HNn0tRCD4LpJFFsd27Zc5RHRLifsicGG+I3P1me+
         lZlw==
X-Forwarded-Encrypted: i=1; AJvYcCXIEOHHi3j7f5eTKizmiGYPYyoLKb4w8nCKVkUzHuuwY7yve3mjlzuR4lC3ffcjldUlGDZm@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywp592H/R69lSUUprRDmja+78wowye38Ga3+qTZe2+ZFf/KAVdE
	CRoKz2Pbog/GobDhtiNjNzId8wxT7oMUzqrySPi8AiJtUTkI/E3w+6YiGjZXFW7e9+Yv6XFYk5V
	n
X-Google-Smtp-Source: AGHT+IGA8xL2igO0sMQPYr4Auy/BPm1HfYETcLy4utQ76Jb9tCjQNTGCqxK9TdOTynnee4W6LTdKEg==
X-Received: by 2002:a05:600c:17d1:b0:426:6158:962d with SMTP id 5b1f17b1804b1-42f5c33d132mr18488255e9.23.1727474939914;
        Fri, 27 Sep 2024 15:08:59 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ffa22sm84436465e9.25.2024.09.27.15.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 15:08:59 -0700 (PDT)
Message-ID: <067843b2-db37-48b2-b146-24401d541896@smile.fr>
Date: Sat, 28 Sep 2024 00:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/4] release-notes-5.1: document spirv-tools
 reproducibility
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
References: <20240925132017.3427438-1-yoann.congal@smile.fr>
 <20240925132017.3427438-5-yoann.congal@smile.fr>
 <541662d2-754b-4e0e-afd8-71bf41094f46@cherry.de>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <541662d2-754b-4e0e-afd8-71bf41094f46@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 22:09:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5382



Le 26/09/2024 à 14:53, Quentin Schulz a écrit :
> Hi Yoann,
> 
> On 9/25/24 3:20 PM, Yoann Congal via lists.yoctoproject.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> This covers Poky's commits
>> 47ed8ac83a6 (spirv-tools: Fix git-describe related reproducibility, 2024-08-03)
>> a19bb8c1d51 (spirv-tools: Update merged patch to backport status, 2024-09-05)
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>   documentation/migration-guides/release-notes-5.1.rst | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
>> index d6c72c5c4..8b51f5677 100644
>> --- a/documentation/migration-guides/release-notes-5.1.rst
>> +++ b/documentation/migration-guides/release-notes-5.1.rst
>> @@ -50,6 +50,8 @@ New Features / Enhancements in 5.1
>>     -  Miscellaneous changes:
>>   +   -  spriv-tools is now repeatably reproducible
>> +
> 
> Somehow my local dictionary doesn't highlight "repeatably" but my - non-native - brain is screaming it's incorrect.
> 
> I can suggest "repeatedly" instead.
> 
> Or even better... not have it at all? Doesn't "reproducible" mean the fact it can be reproduced, meaning "more than once", hence "repeatedly"?
> 
> Or maybe we thought it was reproducible and we fixed it, in which case "really" could be a good replacement for "repeatably"/"repeatedly"?

It was reproducible most of the time but not every time. Now, it is reproducible every time (famous last words ;) ).
... but now I think that this detail is not really interesting for the release note.
I've sent a simpler "fix reproducibility" v2.

Thanks!

> 
> Cheers,
> Quentin

-- 
Yoann Congal
Smile ECS - Tech Expert

