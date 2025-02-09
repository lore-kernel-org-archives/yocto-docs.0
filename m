Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220F1C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:27:33 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.39830.1739143648021783784
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 15:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S248RM5a;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dd006a4e1so1588828f8f.1
        for <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 15:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739143646; x=1739748446; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5WKHhCC+YEuwPrfDNn98NYC1bUKnbsVctreBLD6jzj4=;
        b=S248RM5a3XqfGUkZGmmbLDIAFsY9z8NKN0RXNryOiVuCafaPAnmuxm2Xz/0w5dzsND
         /1E/RD1IHgfqND612Y4LopSHmRR/3Wj9UvT8yPCFDuIbM9+2lXtixHGJNlCXCpHkNgq+
         GJ52/k1iPIMyGoAEzluwzUrYhnDgiI/xHVp+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739143646; x=1739748446;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WKHhCC+YEuwPrfDNn98NYC1bUKnbsVctreBLD6jzj4=;
        b=Chs9MRXTKOSCn70oEjxY1g/V9Wff1SUQdRrMTYbr+TnFe9F89GR1fatTSrCPtFR/f9
         Nji6sp5ClGdBxgO99vA7B143gzIHlNjWUR/dc80dIVO4wiPRKo6+6eODpZT2BFR9u/i2
         1sXyJZ2af0NRvmPShi80Gcdas652h4DXuVs/8/6MqXRE0PSd3w1pywvGv+NdzijaOMkT
         20yV5rsKdYbV510vGRvaaYipfkhhMS4puoJOqmC/fo3L7E09j3ZTiXjek/wybq0RS7WX
         6r8TitLSK0Kcah7hpHxzhrJl51vMWgwf3hPEi9NzKostjn6qSKVIwnjqHGe58IbM7oaZ
         6AlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC5WVlb8NCqnQuGr/3tcWOj2Of5pbMgccfnLv3nYmRfj7DolbOEPcXCzC7FpGo5Nzwafkb@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxEVCBcTyPugUzn51m87bxhzgdb1ByIiBbb3GsjNqPWt9+r0akc
	aUeJ2xtBo02SxhyedQe7VL9alU9pZKIGtldjx3PefY0ygoh2ABCdg0YiV6DDNWQ=
X-Gm-Gg: ASbGnctulA8icI5T8OFuUj5p9td4yHC/6LTD404ezSq7PLa0w35ZB0oV3TC58ud2vR2
	5f60WuNcVI2K/tEtBUiYuFGyiyYaHSwrJWZeRSCamrHO/kTfuhZh4vVyBP6Iu3v2xDvh6S4VHom
	jLtu64NaAhjD7YpY4iy5QNgasHeIn9Ywl1R6xJPSteO4dYQPL27E0b+CaD77rafDuZGpk9o8/bm
	o7Lvs+wEF16uS/KhLqCgOaEMFCqx38m8rTaed+UT4CT53EDfbv7ySY9dSGQDKBKmJrJdWM8YGf5
	a1FeZQZ3IwIvTWDCYbjH/JT6fhrR4ZgfVle467FuRfKuqbbgSw6RhB3mDsSJGwytV0mV5rUWOzV
	VRwZPNdWNOL5YwWJ4rp5ohgjjLlQpTxOen/BgLDPYzkN1fyb1BcBJ
X-Google-Smtp-Source: AGHT+IG6Xm9LLo58qI2sBrDYl6fN8dRfhp/abFRL6LATTWeYKK8TUL6khRzXo91aLrca9Dqwf2q6eQ==
X-Received: by 2002:a05:6000:4010:b0:385:faf5:eba6 with SMTP id ffacd0b85a97d-38dc8d9b92dmr7402429f8f.1.1739143646451;
        Sun, 09 Feb 2025 15:27:26 -0800 (PST)
Received: from ?IPV6:2a01:cb00:dee:f000:367a:1a7f:22ad:d27b? (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd150eed5sm5940598f8f.28.2025.02.09.15.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 15:27:26 -0800 (PST)
Message-ID: <1a42e393-f6e9-4035-94c5-cb46afb705eb@smile.fr>
Date: Mon, 10 Feb 2025 00:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/3] ref-manual/variables: document
 OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206215711.154194-1-yoann.congal@smile.fr>
 <D7M3TSUJOIGB.2BRVP84IG8GLH@bootlin.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <D7M3TSUJOIGB.2BRVP84IG8GLH@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 23:27:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6312



Le 07/02/2025 à 10:26, Antonin Godard a écrit :
> Hi Yoann,
> 
> On Thu Feb 6, 2025 at 10:57 PM CET, Yoann Congal via lists.yoctoproject.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> This documents the variable used in the "automate testing a single
>> recipe's reproducibility" feature [YOCTO #15701]
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>> ---
>>  documentation/ref-manual/variables.rst | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index 47d4e814f..32e91b6db 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -5802,6 +5802,11 @@ system and gives an overview of their function and contents.
>>        For additional information on how this variable is used, see the
>>        initialization script.
>>  
>> +   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
>> +      Set build target for build reproducibility testing but activate
>> +      :ref:`shared state <overview-manual/concepts:shared state cache>` build
>> +      for most dependencies. See :doc:`/test-manual/reproducible-builds`.
>> +
>>     :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
>>        Set the package manager(s) for build reproducibility testing.
>>        See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`
> 
> This is nice to see :)
> 
> My suggestion on top of Quentin's: you can add this to
> documentation/migration-guides/release-notes-5.2.rst's "New variables:" bullet
> list.

Added in v3 :)

Thanks!

> Antonin
-- 
Yoann Congal
Smile ECS - Tech Expert


