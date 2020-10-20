Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web08.1645.1603227953338034075
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 14:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ILhLSWD3;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: robert.berger.yocto.user@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id dg9so140964edb.12
        for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2020 14:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IXSre0hFmQO7uwq/xIZVkL9wSg1FsvhCm0ppdlOGKEQ=;
        b=ILhLSWD3nxWoaNCtInXZrfz3lg2NgmjAz7dJStXWUZK5kntV3ybjeSIJxA3gnmqBjG
         ulh+qWa74MjGG78ETBV3moWoiJJp51qVWQ7q3oD7HPw0Yaj0ZNiITK6xDEVbIvpklLg7
         np0N5xe1XGejOhGCuYOgbxKsTXT92J6Agu0WALckn7RXYf7lwvt2OI0uEpU0YmuvLNhl
         /wgvKBTkvgvz8P2rjyUd+SLx94OmifpUCnaLzO0okG41QO1LpOc+Tq+1mkaqUdD+Bkvz
         LcXMGsgxF3+sZnVbugAnHCdXpoRRFS30w8hfkc5eXJ5xZYdlmJVeFRsw6mpx1Qup5GNN
         yGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IXSre0hFmQO7uwq/xIZVkL9wSg1FsvhCm0ppdlOGKEQ=;
        b=hjho2ZPbGw+//sG0XMGoNns7wx9gXRz45Lhm++g9hcfnUiNjZz8+eEfctEogAFFUPz
         xNlcu3d1570KbWmrApULvwhb1kJP0ANBjLPgUOafoMmyGEWFpvwIc2bpzPbftba02SSx
         iN28Dy4f2Nf1KwdthR9GEQH6GZldeu3vfUbHKp9tLb+7e6uVuTNlxTRIVuLYNPDXpHoE
         vhQjgvXUmP8muPUHRRnzPXsXDQQvIqwXidaKPsswF80jRgTxWZV6oUDR87OxUGaEjL5M
         CBHsqzp5SpkiehYFgGHf4RM73u4pFAQJiu3gpJ5fuIZh7TCSWf5M2DLVlWkAQkXao6Ex
         42+Q==
X-Gm-Message-State: AOAM531RmpF+6FTfj4ESs/9KqEjJ0pzkTZYh7Co+suo9mtHN6LHJkdB/
	UAgYrFuXG6nmLM+QGrhfu74=
X-Google-Smtp-Source: ABdhPJw47XIIwQUWNgVo76rURfDAVGCduifpY15iR6HtGOmucrwJnSF915XKfU1PJijs9iM/c269tQ==
X-Received: by 2002:aa7:c3cf:: with SMTP id l15mr4855471edr.314.1603227951623;
        Tue, 20 Oct 2020 14:05:51 -0700 (PDT)
Return-Path: <robert.berger.yocto.user@gmail.com>
Received: from [128.90.148.179] ([128.90.148.179])
        by smtp.gmail.com with ESMTPSA id r24sm82849edm.95.2020.10.20.14.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 14:05:50 -0700 (PDT)
Subject: Re: [docs][PATCH] kernel-dev: Add FAQ for how to use a vanilla kernel
To: Joshua Watt <JPEWhacker@gmail.com>, docs@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Paul Barker <pbarker@konsulko.com>
References: <20201020170326.14313-1-JPEWhacker@gmail.com>
 <CAJdd5Gb0L4Yhwmsawp4K+muy92SW+Y3tLYA7sv9CnM108GWwFQ@mail.gmail.com>
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
Message-ID: <9c52a04c-7184-8dfc-44e6-83a4cb7db2d0@gmail.com>
Date: Wed, 21 Oct 2020 00:05:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJdd5Gb0L4Yhwmsawp4K+muy92SW+Y3tLYA7sv9CnM108GWwFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 20/10/2020 21:14, Joshua Watt wrote:
> On Tue, Oct 20, 2020 at 12:03 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>> +.. note::
>> +    You will notice that this is will still pull the kernel source from `the
>> +    Yocto Kernel git repo
>> +    <https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/>`_, however it is
>> +    using the default value for :term:`KBRANCH` (e.g. ``"v5.8/standard/base"``)
>> +    which is an exact mirror of the upstream kernel.
> 
> This is a lie. I thought it was the upstream mirror, but it's not.
> v5.8/base is the mirror and this one has a few extra patches.
> 

And exactly because only Bruce knows (most of the time) what is in all 
those funny branches why not use upstream (kernel.org) for a vanilla kernel?

Regards,

Robert
