Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76911C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:33:06 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.273.1636738385373403040
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:33:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C41gNgr8;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso7761596pji.0
        for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=qy3dfhKohl4bGNKgluDdUj+Qi2el+AgXisO3fpXXf2I=;
        b=C41gNgr8bDIzSYzNW0pYBau8OX5ELoOoJ7bLBc7+2vx8C+9zF5LJ8LRk42Xf/TW3E0
         6iIVjB/XM7vHik+sms0jaasVz/y373ni5CtYdhzVAljMsmsfe3G/885iiVQJHynS24ze
         Pyq/RKAwii09lKAe1WxB5lVbt1QHYW2Pp3OVu6/CBQgxKwYyfDOujoxTY8zYh9/aB5F3
         O1lHV5Ztl/t/vD3Fo8PrFvI9fBISwgj0EEHXcAjghveSX3Nvm7NM4CbgDqgCze7HqyNt
         +OpVSoJp4MQMmY4zy7Td0wdKknlu4wWexp0EM1WTsjW/YlSP8BpJi5K5bQhdwdQB/ngi
         Hhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=qy3dfhKohl4bGNKgluDdUj+Qi2el+AgXisO3fpXXf2I=;
        b=Mmvt54Y7xeTuB/L/tSJB2upPbnPlmxspw05BnYt1zYwZhmv5VipSgUxUuZdvwWPrMZ
         IM7SdhM4JjYVg81b08EzY8rPQ/PfBdI+NKbZrngb0H8B+wleUkLqe9TSrRk7/nYOvbDF
         fD/pBuaeAQKA1UDWY8/Zj28H6D05zefGB/W7svXEEGWAW4Qkb/OqkVguqdYTyknTSYF1
         FT2DodtuHnY3LTYfrcg/LNMCRBdi8HGlj9KsL8jRPdOGfbMkmWdeElahaAwNxBQZLg8U
         QfNXe71aeTun3GzL6TApZB/n1VgI32TZU1sqU41m+Jv6YEw37rSJ8lWzvIfxVTr36lGk
         SAQw==
X-Gm-Message-State: AOAM533gW1P/XxsM/W/OSHvkqJKC8Y2CzLHKOHHu//UURGfLRjjQ8vID
	jJNwcIBe9F01qJHyon9plpA=
X-Google-Smtp-Source: 
 ABdhPJwXI86K9qwnUG1DACnx3hcMQkb9Gk+/2Tx7F9nBaEkD/VSleJhpDmPXdPIaz/KLLs7yKcUJKw==
X-Received: by 2002:a17:903:2283:b0:141:f858:f9af with SMTP id
 b3-20020a170903228300b00141f858f9afmr9940771plh.80.1636738384603;
        Fri, 12 Nov 2021 09:33:04 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:dc93:918f:8a6f:d7c9?
 ([2601:646:9200:a0f0:dc93:918f:8a6f:d7c9])
        by smtp.gmail.com with ESMTPSA id
 u9sm7147443pfi.23.2021.11.12.09.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 09:33:04 -0800 (PST)
Message-ID: <bebd3578-f723-8574-93f7-061454b57c8f@gmail.com>
Date: Fri, 12 Nov 2021 09:33:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [docs] Continue to support Ubuntu 16.04?
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <e215954c-7898-a9c5-1df1-0d876ce30a86@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <e215954c-7898-a9c5-1df1-0d876ce30a86@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 17:33:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2148



On 11/12/21 5:39 AM, Michael Opdenacker wrote:
> Greetings
> 
> Ubuntu 16.04 is no longer maintained for free by Canonical
> (https://ubuntu.com/16-04)
> 
> I guess our builders don't have a subscription to get updates until
> 2026, so can we really keep Ubuntu 16.04 in our list of supported distros?
> 

Good question, I think we would not be able to keep testing the latest 
of 16.04 so perhaps it should be dropped.

> Thanks in advance
> Michael.
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2129): https://lists.yoctoproject.org/g/docs/message/2129
> Mute This Topic: https://lists.yoctoproject.org/mt/87006018/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

