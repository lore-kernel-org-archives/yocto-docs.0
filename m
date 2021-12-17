Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AC8C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 06:08:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.3170.1639721283311633849
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 22:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SlIORdJp;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so3326333wmb.0
        for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 22:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=JUsh0D64+wZj1ypHAVAbBaHk2/xSxyr9ea7kqCTGOF4=;
        b=SlIORdJpUlER4kL9SJRbN6S5sctDnJAUx5FyH2fc8P1aiYpW2xjSjX6gkXaN35NOuZ
         FYHYUkewXK3fX8y12it2D7yFwJ6J5+4kOtd/mOg1HW/UOXkMxWiOdiBs2fSA/L5vYXDK
         ZT1U/fDcquN/+pouVxiob4ndlS/E6hwtEiX5QZBTBOU1VGc07Q2FFzv/d8YCP+H+0X6D
         KrfqGIp83vYwoBbSYSq7Unl+hZ0DvDBywP23DoQ0uBO90SviwpSNpSydDCEqvLg7dktd
         SX59cA4tpNH+bRauPdZiVMUy2vwvLn2vRv/sa1lCsTSjjM8iivvHXvOFrZIGNVYiIM3V
         x5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JUsh0D64+wZj1ypHAVAbBaHk2/xSxyr9ea7kqCTGOF4=;
        b=1CSk/GPXK1ugoB4INjjX/7P1+hDO7pGUH3H/HCXsr50wHCbkKFVjFqfoDaZh8NtVM+
         9ENHT8llcinYVgvPeGTaIZUQ/vD0fL2iKn9Yw+ej4C9F7XPF8F+vQosRICY8Ya866tqf
         95zzjz1jUTnvgydS8AdefYq0CVWhA94yg43UpFWjyVMk/8Bf2oHsKWhlJPkituXxu+jh
         o4ivnveg1tn7fwtcMPguJCSAWDVf7bQj0ThEblAXyRNratuPgKT4KGKlxTgF0Xr9ydp6
         KjIVN2ZMXFZAV0cq9k9ZmrOOErRltaBoT0eozV0vRFAvyLSlvj+Jb32BHZsS3sG2Hl3D
         Js8Q==
X-Gm-Message-State: AOAM532IoEASATTC3Bh23Pfku7V42CQ74wNJx1bJ//1d4iG5LmCwnI2B
	arlGHRMC9GnQbXnx/dvrH3c=
X-Google-Smtp-Source: 
 ABdhPJyAsfHcDqmOLW/UEBrRaihqmtBSTh+uWg8LeHq2sEDJGTAkXUjTqNnAs79PRDsn9ffZy7fRxQ==
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr8187227wmq.21.1639721281471;
        Thu, 16 Dec 2021 22:08:01 -0800 (PST)
Received: from [10.133.223.13] ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id
 r62sm6166963wmr.35.2021.12.16.22.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 22:08:00 -0800 (PST)
Message-ID: <0f073e9e-8b94-86d3-bdb6-4ab2b25e3249@gmail.com>
Date: Fri, 17 Dec 2021 07:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH v2 2/2] ref-manual: document overlayfs-etc image
 feature
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20211216112235.129737-1-uvv.mail@gmail.com>
 <20211216112235.129737-2-uvv.mail@gmail.com>
 <daf0e23e-60f5-6716-5137-c64b4d4442a1@bootlin.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <daf0e23e-60f5-6716-5137-c64b4d4442a1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 06:08:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2299

Hi Michael,
Thanks for the review and updates.

I assume it might be easier to send an update patch separately if 
needed. Or you can do fix-ups in master-next? :)

Cheers,
Slava

On 16.12.2021 17:52, Michael Opdenacker wrote:
> Hi Slava,
>
> Many thanks for the updates!
>
> On 12/16/21 12:22 PM, Vyacheslav Yurkov wrote:
>
> For both patches: Reviewed-by: Michael Opdenacker
> <michael.opdenacker@bootlin.com>
> There were a few remaining punctuation and missing article issues (that
> I probably failed to report), but I was happy to fix them!
>
> Merged in "master-next".
>
> Thanks again.
> Michael.


