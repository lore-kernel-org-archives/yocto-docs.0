Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.541.1630176509535497473
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Aug 2021 11:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uexv1HAc;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id u6so8107795pfi.0
        for <docs@lists.yoctoproject.org>; Sat, 28 Aug 2021 11:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=qjjHnw+NwkwpTikYXhfCwKIx1jy9YjY/0EBv9/UCI0g=;
        b=Uexv1HAch4VGhkZvodZyjw7jQnbq1k/PHvxI5ovQm856waoiz/wkMoV80Az+MyoKB1
         S4dwndhiNb4z5ZINywvWZlcX6mlCg4Jc4PBM2qzoKhguXhPIrnOyli7T41Uwh/H9Oa7H
         UKU9nJYjrzVMX5QXKb1J5/HAX33nS0YRddQ22Hh3m//sxtHh3y8TVmnrIq9IEagW98FX
         xG924Hoi8CiJy7CiD3ZUcYwhsZShhWNY1r4EihDBT+3LnT/lsdZCjXrMR0TbvvS694GP
         YvqzHAXO4gvtshlXq4ZHAm8NaMawjR2dwIti4W4ZYl9I6RhjVxuVoBKtxjt+L2qxvjA4
         v75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=qjjHnw+NwkwpTikYXhfCwKIx1jy9YjY/0EBv9/UCI0g=;
        b=lJzLA2U0547+1tRvtjrZLt9vJmuwZWGswJoahSebL8qulteziys21z7CDFQnxRrt/g
         X+nLEmrCGEU8tPNmROtIplHyELxXI3BQqv0P8V3A935cMW9CCncGbN2gkAj5efWcLy1n
         VHez2LEui/FxNtjLI/J5QQgFnDWTX3XhMXYmXklGfWsTJioBnohqA5txkiuBh/T8piAq
         KeU/NYWOGg/zT+QPqEjq0uAj5k//90lbHFpK0KjdothlO9U/UHoPi7RIL5WM90ekpoSm
         xREcNGQ0q/kiCwHCJzNfzXo5WC1p+R4SDqBahqQ+BpL2wlaj0FOXgAwcXlYMw5PcvNc4
         Dg7Q==
X-Gm-Message-State: AOAM532tcAEKxh/w1M45RrDINp0pDxkURgH8XK5Av1dy+z4iZSha455g
	hkmtfN0sj6Tll5IRw0WgtnQ=
X-Google-Smtp-Source: ABdhPJzEVyha+tu1XOi/iMPL7RBUDKnt+HxO+JJarH/mnP0RHiV9jeCrVgVqfFbzw+Goh4LOcenPzQ==
X-Received: by 2002:a63:841:: with SMTP id 62mr2983837pgi.354.1630176509129;
        Sat, 28 Aug 2021 11:48:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:718a:f86b:7e24:3a01? ([2601:646:9200:a0f0:718a:f86b:7e24:3a01])
        by smtp.gmail.com with ESMTPSA id k4sm7666760pga.92.2021.08.28.11.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 11:48:28 -0700 (PDT)
Message-ID: <ab901f8b-57d1-e91b-9ec5-ce030e9c1137@gmail.com>
Date: Sat, 28 Aug 2021 11:48:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [docs] are autobuilder links in dev manual correct?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <692113e0-4e26-d978-2d4d-d158ce9d3a@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <692113e0-4e26-d978-2d4d-d158ce9d3a@crashcourse.ca>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/21 11:33 AM, Robert P. J. Day wrote:
> 
>    here:
> 
> file:///home/rpjday/oe/dist/layers/yocto-docs/documentation/_build/html/dev-manual/start.html#accessing-nightly-builds
> 
> the autobuilder links in that section don't work for me, what should
> they be?
> 

https://docs.yoctoproject.org/dev-manual/start.html#accessing-nightly-builds

> rday
> 
> 
> 
> 
> 
