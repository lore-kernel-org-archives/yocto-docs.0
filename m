Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E631C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 15:58:59 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.17579.1752249538813459139
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 08:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lt6JZ/T0;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so2016752a91.1
        for <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752249538; x=1752854338; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lB44zxLYQS51VoIM1/oookqo2WbgkSAwnfJDceFF00=;
        b=lt6JZ/T0Rh4C1Ktgbt5VzRcwmB9pUYe/F8ZGCD76qYQ9teIzx3HVE6+5vcwGdeMyLk
         BsDVEK7aASRzev9aC/0O6uFp5YI0edceRITFi3wboA5EUw4mQOQ2mXj85YveuK8zFFW9
         JvT+DIef9+gZtEC17gGOphGkSELSS3r/o8lY8gMNf1Eml0EfULDtsHrcPZOU/tvZv7UI
         2mYE20taZboXWfv9HFSS+DD8tEuH4cY+1tTyfypBtjXyL+Kexksjd3P8xCL1D5bZTU1N
         47w9DQqxhDTOeb1YQRQMAYK9VdxWG01XbEGaTg+Na8p7G31JETEaxTduPREFoUh9zZop
         1mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752249538; x=1752854338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lB44zxLYQS51VoIM1/oookqo2WbgkSAwnfJDceFF00=;
        b=Yr/GjGcRSN43URb2Xp+nQoGbEXH/anhbuMJrKm0pIUMn82qDpHWhrStIbFiJEPhGNF
         ffP7bLrWXGgcVwfvbVNGme7lHsBA7YfjSLFyimBDQPZxN5uIiccSvXVif9kiLuQ4froK
         ylsA5ECwvgszlcwhH59Zw/6uJj5/1LAmXC1cX1+lfA/uC1qTzNnxaXTJ1axFQWJr2MOw
         cbdOJpjjcNzrP1wmWREiyMoI92dM4IBqIhb3m0m9zlp5o6/hv9VSqo/mjgSCjx9LKYrU
         CqMnzIApbxd0oT3w8GiVYHdK8AtB0x6dgb+B99+h9dySr2dQkYyGnUraN4ij2kyu4VHz
         j69g==
X-Forwarded-Encrypted: i=1; AJvYcCXD60BEA/sZW0pI3bMP3vYZBkG1GeSRss569LZCldPhC9uUjNB9etwu/zoD2t9UheMbLNKh@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxVQTkQfGFpmS6szW6avU3c5i4RdLM3GAJadGwUGuvQ9AlU+ZKI
	neCN0yYvAJLu4pjD9SCIDpdWyY1z9dAskNiIeKAez5sZe+z2Flezyd34
X-Gm-Gg: ASbGncuhcyS7j/uo/kh7MSZMdBja9gMOWF7VHsu7wHbpeuYsmrfRjlIWThyQcTsp3We
	Ym8BuRHzR1gCv1cgo7DbYkEFoNuMm2loyzK/2ldtbM6Jh0nQKIHg8kGMlSNYeu5PWsxcoiWAssY
	gMmDSKwJw+/xS5nnCIbnYHuYCLKm3AJqOrgkNpw4DQzuW4iVoSKfUedVoV25w6D1B7PNXPlEgti
	2mJ0zd1hTjC/vFr8+WOOUt9x+PdOozQ6CdAVh2oMoGcvbu0W0n0MgZFxURmpU+FkxvfoleY9a9e
	mO5UnNBOlSb8fZoOKaQir77hg364poLG1YNBXD1psnm/TfB/Anux/x7cgxKvLgitpxjEHe3oAz6
	MskasS+vsz6iCBFD+XbiW4ct90TLAxftRDV4wE+Ji26oK6U366QEJmJxV8fQY4OPF9Sl4pl55g7
	4sLscUUK6gcw==
X-Google-Smtp-Source: AGHT+IEXGsfXfwzMc8MnDvntkS9lopkWbBDmeuHarTI1YLTGiedagKfe18RUlTZw5ih8Qx7UcfS3hQ==
X-Received: by 2002:a17:90b:53cf:b0:316:d69d:49fb with SMTP id 98e67ed59e1d1-31c50d7d8f1mr4488419a91.14.1752249537895;
        Fri, 11 Jul 2025 08:58:57 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f056:4b03:1ef9:9958? ([2601:646:8201:fd20:f056:4b03:1ef9:9958])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3eb62e55sm5494089a91.35.2025.07.11.08.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 08:58:57 -0700 (PDT)
Message-ID: <5b095559-94b5-4f1b-b8ae-54d7acbca16a@gmail.com>
Date: Fri, 11 Jul 2025 08:58:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] poky.yaml.in: increase minimum RAM from 8 to 32
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250711-increase-minimum-ram-v1-1-2287f499498a@bootlin.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250711-increase-minimum-ram-v1-1-2287f499498a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 15:58:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7315



On 7/11/25 1:08 AM, Antonin Godard via lists.yoctoproject.org wrote:
> In the light of the recent LLVM addition, and other such heavier
> recipes, increase the minimum RAM requirement from 8Gb to 32Gb.
> 

I wonder if disk space requirements will need revising too.

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/poky.yaml.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 39ece05e9..cdd78d2e5 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -32,4 +32,4 @@ MIN_DISK_SPACE : "90"
>   # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) with "rm_work", rounded up from 38
>   MIN_DISK_SPACE_RM_WORK : "40"
>   # RAM (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) on a 4 core system
> -MIN_RAM : "8"
> +MIN_RAM : "32"
> 
> ---
> base-commit: 161a8549441e8c38791ab7f63001b2a15a39d2f2
> change-id: 20250710-increase-minimum-ram-4c4f8e2015ab
> 
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7308): https://lists.yoctoproject.org/g/docs/message/7308
> Mute This Topic: https://lists.yoctoproject.org/mt/114097099/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


