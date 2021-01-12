Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.8431.1610455907129872819
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 04:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GED8zr2r;
 spf=pass (domain: konsulko.com, ip: 209.85.208.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f42.google.com with SMTP id i24so2155519edj.8
        for <docs@lists.yoctoproject.org>; Tue, 12 Jan 2021 04:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0BrgwFcD3LjiCXZFcHptc15AhT8aukmjgJvs2Zqtv2M=;
        b=GED8zr2rF19f8wjaOjnuG65AGCfBTL4g8KqLcd/1a0f/ATXcxXsz/quTBEIVJbeirX
         F2+SMzGrd4HHKgLZ2m9+OIHy0hTArP3xln8vua6aR7oC0sVwlIdoKTTgSkRMqeK2ftB1
         pNcvdnMQrx5mo2SytIeW9edvHBwXS+GnLDjp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0BrgwFcD3LjiCXZFcHptc15AhT8aukmjgJvs2Zqtv2M=;
        b=H7DgtC1f/B10e6JkDl8o2J5jUO4qc24Hp7Zd/26mUVm/uz2ftFh+FlP9U6CNIXkVW6
         Rh8wdYMahLiXEnwU/AfzQhzhJd6bJor45D92pfG3ZC9owkKApT97la26Y47eKVvrU4vu
         xwVZTO6xx4X8jI5BTQoACBL1dC8xt0fGzxHfx/nx/5c9KWE+w/FmXpCiuqsrZkU80D1Q
         bw+FY2pAR/DKCdVs71BDx7gAK4ewTOMy7xcUPqUbz7CcaIQVQBNnskXYTJBFJr+a45D8
         vHBgtdkooNZn60DZRRI/YDWINjv00tbAReXoMlPPpltwjDtL7eKBJyV/pr7Z/yEaGgbg
         dOIA==
X-Gm-Message-State: AOAM531IDxTM7ON66Bdvkw6zuH423aRz73GfvESZupSOKZtwfitu8V04
	ccMKAQ7j9QQuS8ubaABc9jbqC288Fe4Y0A==
X-Google-Smtp-Source: ABdhPJxCJETgeEjBZ3chqIQIob2GWpV90G0xGwdfThAmMSnZGPyRkJQ6pplfz2s+Ta4UDRRuzHW0fw==
X-Received: by 2002:a50:e80c:: with SMTP id e12mr3186865edn.288.1610455905110;
        Tue, 12 Jan 2021 04:51:45 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id b7sm1180289ejz.4.2021.01.12.04.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 04:51:44 -0800 (PST)
Subject: Re: [docs] [PATCH] common-tasks.rst: Fix GNU_HASH in hello.bb
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: docs@lists.yoctoproject.org
References: <20210111191655.23792-1-leon.anavi@konsulko.com>
 <20210112091623.4puwnclbtw4nixno@qschulz>
 <a1d67e85-fa8b-dfd9-2bf0-b5efe9eca5de@konsulko.com>
 <3eb6f61ff31061ffd357a8d592710144b29ecbc7.camel@linuxfoundation.org>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <e63813ef-26e8-72f0-34fd-f75d8011f4df@konsulko.com>
Date: Tue, 12 Jan 2021 14:51:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3eb6f61ff31061ffd357a8d592710144b29ecbc7.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 12.01.21 г. 13:56 ч., Richard Purdie wrote:
> Adding LDFLAGS is definltey the better way to fix this, we should be
> encouraging people to use LDFLAGS in makefiles and scripts.
OK, regarding these circumstances I will update accordingly my patch and 
submit it again.
>
> I suspect 24.10.8 might be better saying that LDFLAGS is the preferred
> fix, failing that the CC tweak is a second option.
OK, sounds good. Should I try editing the text and submit a patch for 
this too?

Best regards,
Leon

-- 
Leon Anavi
Software Engineer
konsulko.com

