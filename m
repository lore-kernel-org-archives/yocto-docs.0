Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303E9CF6488
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 22:03:10 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.2703.1727474585464582272
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 15:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S9kM28/P;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37cc4e718ecso1728835f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727474584; x=1728079384; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s+FIQmqR1rlDrdBOxJelY7ymnhnCzimitTxAItmJep8=;
        b=S9kM28/PLYkJD1EqD011ZA/UG8OBEUuJE1CYWjczHMD51+38bIkRDaJ4mWk3Me4j9L
         Qx6YYzNUJaoe8ggPvBDbT1gB6AzKjjGKc/uetPnY5FdwrjQ0SAwWTcgFCkhwiBPsFtqc
         gmYX0Ri51uJA0INjVjHlSi1DWMmv73RvnnQAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727474584; x=1728079384;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+FIQmqR1rlDrdBOxJelY7ymnhnCzimitTxAItmJep8=;
        b=pSPaDmwDRC6zN0ZSjK7Olc2ZFqwZEJHuEm9k05IGTJO3CSOcl/ejdyEAtEdCOU21Gb
         OghaWMOcTAJdoSyDoFNTH4h9xnMvi/b3dblMOSXor686b3hAA1bj8mvVRX213Ew7Voss
         kiwj3pgGbzyQS+WpsSFvxJODE4JtTe2Hgm79yVkjvGECc5JgfOhOg5B738T2DLgst0j1
         xVyoB0lYWhhc5hSmYlUzwD4RUTatXQ0E4oVFf/IQUHR6EMkIKpSxH4hRZg2bflwHoh+v
         FiUbBqAIRl49MyuHfHqDDQjQL3c89dPa7V1qGB15pM+wiziMFrsumTiFkpzKJLh7PG5z
         E2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCX9SdsViMso45vuAA93Gy8G5/LuQ80S5f88nC4LfJrDvJdJIyJ804p5xomhTHejw8YVXtje@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwWKW88brm37ulG35iKv080Lrh5vm6iykSOH6V0p8JhKYke4I48
	jI/LNMaaFiVovHm3Q+2iBzFTABglNPEQT5So9ZnyzzyZh6k0EIpM9PSKIslfm6c=
X-Google-Smtp-Source: AGHT+IGCGHSYkS10k5zjxHs0/Kg0juHCpyZ32fuMHKIT+smRR5xWR7VIxKtT4yoyOxvC52KoSLKYTQ==
X-Received: by 2002:adf:ed08:0:b0:37c:c802:888 with SMTP id ffacd0b85a97d-37cd5a6037amr2830136f8f.4.1727474583855;
        Fri, 27 Sep 2024 15:03:03 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6857sm3437716f8f.51.2024.09.27.15.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 15:03:03 -0700 (PDT)
Message-ID: <d33c3862-7445-48a8-ab61-00d975e8fbf3@smile.fr>
Date: Sat, 28 Sep 2024 00:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: Quentin Schulz <quentin.schulz@cherry.de>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <20240925132017.3427438-1-yoann.congal@smile.fr>
 <20240925132017.3427438-2-yoann.congal@smile.fr>
 <04e2ee7d-fafe-414a-9b06-83d93680a15f@cherry.de>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <04e2ee7d-fafe-414a-9b06-83d93680a15f@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 22:03:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5381



Le 26/09/2024 à 14:48, Quentin Schulz a écrit :
> Hi Yoann,
> 
> On 9/25/24 3:20 PM, Yoann Congal via lists.yoctoproject.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> This covers the Poky commit:
>> 61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>   documentation/migration-guides/migration-5.1.rst     | 5 +++++
>>   documentation/migration-guides/release-notes-5.1.rst | 2 ++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
>> index b43fecc2d..14329c6a8 100644
>> --- a/documentation/migration-guides/migration-5.1.rst
>> +++ b/documentation/migration-guides/migration-5.1.rst
>> @@ -141,3 +141,8 @@ QEMU changes
>>   Miscellaneous changes
>>   ~~~~~~~~~~~~~~~~~~~~~
>>   +   -  oeqa/selftest now only rewrite environnement variable paths that
> 
> Maybe it should be "rewrites" here? Not sure though.
> 
>> +     absolutely point to builddir. Environnement variables containing relative
>> +     paths from tested build directory to outside of the original build
>> +     directory may need update as they won't be changed by selftest.
> 
> s/environnement/environment/ for all matches in that paragraph.
> 
> I'm not sure what I'm supposed to do with this information, it's very vague. It's part of the migration manual so I think it would benefit from being a bit more explicit, are there some precise examples we can provide. If it's a finite list of variables to watch for, it's even better. Otherwise a few examples would be useful? What do you think?

You are right, it was not really clear... I've sent a v2 with more examples.

Thanks!

> 
> Cheers,
> Quentin

-- 
Yoann Congal
Smile ECS - Tech Expert

