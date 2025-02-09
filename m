Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14C3C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:00:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.39090.1739141997917615631
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 14:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OwvBo2Lw;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43690d4605dso25113545e9.0
        for <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 14:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739141996; x=1739746796; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YMlEPPOFsljTBBEIz+ephBw1s2UBnf3F/yPp6rzWjIQ=;
        b=OwvBo2LwXvbkqbfIUq9GJgc6rUYBRrj3/QR3yi2Nt/BsIrr1k6jMpU4xdKtBGpwvjJ
         7uqdteA3cszL3xTdZUJP1V2RHBE94/g1UwiJR++pXdc2X01won9nSa6h2JtnGBr+3IOu
         pASBspBU1SMNQ64b+b9fZt5at0oNWVZ1iB5+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739141996; x=1739746796;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMlEPPOFsljTBBEIz+ephBw1s2UBnf3F/yPp6rzWjIQ=;
        b=oK0sS+BFssW9wvo1fUzhWNx1All5TXm7endCobRXnu6rLf+S9HlU+5MYTF0IHvZw1H
         EMpl8VUi2m5cZnKaKoqdBCb/tLAa1LLguzio/chyX1NYtUI/9mUWevban1/LMDUE3wU/
         6LreCxM4+ExxlNg6W4qTOkKIzp+2ZoURkJYuSGad+Kt4e7aqge5vVqBXagshZpPGDq34
         ALQIXZjwAhqG5IMWe/GiKXDEio/Izf7RETxGi2dXPQWQN57LHWc5W1lc7qu6Fp09KiGr
         lfYB/RKgXme7jQt/ozpNzwfuLk0vRKpvCFONDVNZEtpqY7WDWAmwo3FSM7MiiPv43HKV
         IYLw==
X-Forwarded-Encrypted: i=1; AJvYcCXQnWZIfojtExZVm9aZQznmuCQIz0/LzY7lm3+i8rtoS8EG364SPWf2tlabca6sq0QcPRRe@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxuPJkbMx50tFJweRuSqPYv3CetjjdUp/VNw7X2SDqe8q3Tiwpt
	JM7FwhoC4/6pcyX2dN9Lt3RwuJku+DjVZW5A2RTLwWR84CntIsfCOIx+5cHLEjo=
X-Gm-Gg: ASbGncvg18kCVSIQg2aC9UNQMsEbpPgP3DSA2Lrr2SkuOBGP/1uzaN0PtIP1qBVaS1x
	2oBpgGt59nNSWSjPjS7RuxNdMLqDbmbRSZxPXqFc/u0M6HUiaTLn4X2FG1q2p6LCkXv94IqBIAZ
	JO7Gz3V1fF02Un8jMlbOGvrxmYpDZMB6DLHExySTSnGYLVP36c2MOWzwwIp/1OL08EMIkYMrZ7z
	TL7xtNvcmDFA8SyZgO1qfQzOlyGSvjKVORolcC7L+D4uTznC8uBxKH1F2tcPOd56ci5yiCis4Ek
	RrD0xhfwS8kgvaAUQy48QiKjjSUWUzPxjiIfOOY1sEDXTcjeEM1suaaEeqn0tdmsY+C593SACPd
	KLn/Qz5Zk8e92+NyBDQLmn70X9Dfc1ypThoXUjGynzRkk+LtwhdYh
X-Google-Smtp-Source: AGHT+IHURy60a5DSn4uV5cOEmtIYivuEN0V2SZemDbOLJoe9pJ0f6Y8BP1IbTWMUCSpIMR7n7Htnug==
X-Received: by 2002:a05:600c:1911:b0:439:34d3:63c0 with SMTP id 5b1f17b1804b1-43934d365ebmr54839535e9.16.1739141996342;
        Sun, 09 Feb 2025 14:59:56 -0800 (PST)
Received: from ?IPV6:2a01:cb00:dee:f000:367a:1a7f:22ad:d27b? (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm163474095e9.3.2025.02.09.14.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 14:59:56 -0800 (PST)
Message-ID: <a2830266-2376-4d22-9660-73445b7902a8@smile.fr>
Date: Sun, 9 Feb 2025 23:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/3] ref-manual/variables: document
 OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206215711.154194-1-yoann.congal@smile.fr>
 <6aa53e6c-a08e-4021-8da2-a14cf47afc28@cherry.de>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <6aa53e6c-a08e-4021-8da2-a14cf47afc28@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 23:00:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6311



Le 07/02/2025 à 09:53, Quentin Schulz a écrit :
> Hi Yoann,
> 
> On 2/6/25 10:57 PM, Yoann Congal via lists.yoctoproject.org wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> This documents the variable used in the "automate testing a single
>> recipe's reproducibility" feature [YOCTO #15701]
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>> ---
>>   documentation/ref-manual/variables.rst | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/
>> ref-manual/variables.rst
>> index 47d4e814f..32e91b6db 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -5802,6 +5802,11 @@ system and gives an overview of their function
>> and contents.
>>         For additional information on how this variable is used, see the
>>         initialization script.
>>   +   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
>> +      Set build target for build reproducibility testing but activate
> 
> s/target/target(s)/
> 
> based on the code that uses it in OE-Core and also the name which is in
> plural :)
> 
> Is this correct?

That is correct. Thanks! I'll fix in v3.

> Cheers,
> Quentin

-- 
Yoann Congal
Smile ECS - Tech Expert


