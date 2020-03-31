Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.221.1585670737197636600
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 09:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a6C0/5td;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id g2so8287527plo.3
        for <docs@lists.yoctoproject.org>; Tue, 31 Mar 2020 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7YImQiPp/sVvk3PNPyHNNLnUf0sUQmJugHlmQA4fEo4=;
        b=a6C0/5tdIPSz3Gb6l0FCblGD0fSekeiuO7V4Y0MvfVk2yG8iu4+LIoAaYvd2xocDeW
         KYBYyjYMbLXzZw1c2hOlZ3dFAW/uKjgWr/fHGw7r3h01eXStER3H2CuYEKgwbZQ811zL
         D2GyGAmku2KiFlV/KiiQH2HPLVOGwHnv+b82NaV63uIHaCHeYOvd3K+QRq9biLCVhlgT
         7TnDXJKIACJBY6pUfIEwz3j8vbFEvUXbP39O5hYGySCPm59eHOZ0fGfg/5g1aKqQ23X2
         pPjSEMdc6ov5zrrw2OTOKEVaLg4H5y06fyAHtAVgKELDLbqb1w59NLK0MQocqlUiVNVD
         0GQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=7YImQiPp/sVvk3PNPyHNNLnUf0sUQmJugHlmQA4fEo4=;
        b=MTTbNzfyG6GWqggiMRMGdMWrPEMNyIEURkd+dhLDKchH78uRSBBbwulR2qSc6SX2g4
         NzyxTTYyfRA+hIuTMRUzLTDsiAoX0XtxzbsQ1PCINyNsszV+nz7vYApb6HTb/mPzop/+
         HyhCXxX9SpDHv1gYtmMTv46rL+qpT5QnLtbAJ4laBEVOPr1vBicxUbBAUpRDSslvYwsF
         qUN9rDQwmrurcFzMA3HHWFFLvBN05cS07jMkQ9Bx2Zm4S0pjcSyznG0tTFhhFZsnYZ/X
         aNezMiYY6McCcwED4Dra46xk127oktbWaKQjg66tF12r1sQ7fk8NmjOAlRfXZFrilKyQ
         UFaQ==
X-Gm-Message-State: AGi0PuZDgHhwBdoW4bDxS3Yn02nbAP6zwBZl9+lEOMEl1dWdBdWqKQPc
	0vlxqBBxEk4OzZNnW+pHZUdsspNIYx0=
X-Google-Smtp-Source: APiQypLOO2z+TrmhtUYdksVFCuXd2XqY+8BU5xemoWG7mpaG0U4OSLONSnnqg1KnC9/QYR/QyHYtGw==
X-Received: by 2002:a17:90a:326f:: with SMTP id k102mr4812249pjb.48.1585670736430;
        Tue, 31 Mar 2020 09:05:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:a8c0:f557:a490:54cc? ([2601:202:4180:a5c0:a8c0:f557:a490:54cc])
        by smtp.gmail.com with ESMTPSA id k20sm11782375pgn.62.2020.03.31.09.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:05:35 -0700 (PDT)
Subject: Re: [docs] [PATCH] yocto docs: change author info
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: docs@lists.yoctoproject.org
References: <20200331154715.15744-1-akuster808@gmail.com>
 <20200331155044.4zjhzawdgn4po5ew@qschulz>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a04b11d8-31c3-b1c8-6b6b-cddf9d6513c1@gmail.com>
Date: Tue, 31 Mar 2020 09:05:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200331155044.4zjhzawdgn4po5ew@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/31/20 8:50 AM, Quentin Schulz wrote:
> Hi Armin,
>
> On Tue, Mar 31, 2020 at 08:47:15AM -0700, akuster wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  documentation/bsp-guide/bsp-guide.xml             | 4 ++--
>>  documentation/dev-manual/dev-manual.xml           | 5 ++---
>>  documentation/kernel-dev/kernel-dev.xml           | 5 ++---
>>  documentation/mega-manual/mega-manual.xml         | 5 ++---
>>  documentation/overview-manual/overview-manual.xml | 5 ++---
>>  documentation/poky.ent                            | 2 +-
>>  documentation/profile-manual/profile-manual.xml   | 5 ++---
>>  documentation/ref-manual/ref-manual.xml           | 5 ++---
>>  documentation/sdk-manual/sdk-manual.xml           | 5 ++---
>>  documentation/toaster-manual/toaster-manual.xml   | 5 ++---
>>  10 files changed, 19 insertions(+), 27 deletions(-)
>>
>> diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
>> index ea4899b70..d2294a45c 100755
>> --- a/documentation/bsp-guide/bsp-guide.xml
>> +++ b/documentation/bsp-guide/bsp-guide.xml
>> @@ -24,9 +24,9 @@
>>              <author>
>>                  <firstname>Scott</firstname> <surname>Rifenbark</surname>
> According to all the other changes, I think you might have forgotten to
> remove the line above.
So I did. Thanks for the review. V2 shortly

Thanks,
Armin
> Quentin

