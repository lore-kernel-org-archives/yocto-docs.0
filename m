Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422A8C54E41
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 21:34:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4908.1709588044136659340
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 13:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=nN6uuB09;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412e7fe3fa5so7718615e9.3
        for <docs@lists.yoctoproject.org>; Mon, 04 Mar 2024 13:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709588042; x=1710192842; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Di8LEVN+Fzdp1becZ8sNprLZ/IOOm8BWOHr0p9eXXDU=;
        b=nN6uuB091fNTMtxXNzlvYceNzTb1RKJtSmAuvnfPOGnAkDrta1/NuJm3eq9R9lFEI+
         8uX3JsD2VU9sQ6sE5j87qeVPSVR57fwnnCCCOZJeJUCSWpmDNHvFL2Ha9UT/YOWGO5dU
         fX+3MGSBdJAGRr+SnZAvIH815usbN8Txwkrmr/FQ3upkWQ8qncpVqenmhB/U5v7SjevZ
         Opx79+oD06JxCZH/Rr2/soNpsKj+FLzVBzNjber7Y5UMoKYBGyFoW+n9zonbqdS3Klem
         6nuIsemnMN6Se65T3N0n/8gYiJcdf82ruuQhJucjAXXlxyIuXwOZSa1eBvMZHgbGXiRb
         uQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709588042; x=1710192842;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Di8LEVN+Fzdp1becZ8sNprLZ/IOOm8BWOHr0p9eXXDU=;
        b=jrE07u6JnYcv6PpjSFPpqghEZeDnCbriEGvVD+y1bYKHW1NtA6Z+WEmQhhvfbjGjzu
         AokHTQZLmc2778AuoLjTdhNTD2ZNEOf+eXUd0i4El5/U/wuaoJOJ+2jppaLsF5gIkp/W
         n2r2LVHyzMKOYHbUiVcyvqItVVTEd9QMOvrRLgEa+Yb+BDmez3uJgKgIPrAfx5fmnFz6
         LZg1Xt6AVKo/iEHx7wzjZOirFXi3lulrWkeENeb4nmhaBOu8OHQrCWd1tY/1sY3RuNeP
         0iyVMez5Vmu8Ue0lt64EUlSFjagooK+2E2d85qe83OxWuogN/n01/daSne62VRkLbyuv
         mfQg==
X-Forwarded-Encrypted: i=1; AJvYcCVSRtck7udp7AS5p/yiL/a+ycJDWwUszFVyuahkg7wPetq8MJj/CwmRTlktkdo47Q98LZtUUw+pZIMJReL/W5yOSti8gOrHSJ6GhUM=
X-Gm-Message-State: AOJu0YwRWv8tbuvg1lBX8WdMzrvMCmWphpnvlbI23c9ntHFQUlry5/zu
	J644XFk+wmoqRMuthgT+DayuJYgIyQbD7dNHOZLF4kXAmGEzeEFmG52pYXZ8D5w=
X-Google-Smtp-Source: AGHT+IF0rb8UZmpzMWAUtKkTRLbIlTMfWmU/Wink30fwHsdso3kRYesF5bhhpvlha2Z5UGXG6kSRZw==
X-Received: by 2002:a05:600c:a01c:b0:412:e297:85e0 with SMTP id jg28-20020a05600ca01c00b00412e29785e0mr2879883wmb.38.1709588042412;
        Mon, 04 Mar 2024 13:34:02 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id f8-20020a7bc8c8000000b004104bc8d841sm18303879wml.13.2024.03.04.13.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 13:34:02 -0800 (PST)
Message-ID: <4da826f8-c2bd-4cf6-9e8d-ae8d126be84c@smile.fr>
Date: Mon, 4 Mar 2024 22:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] contributor-guide: Add notes for tests
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>,
 docs@lists.yoctoproject.org
References: <20240304205038.9060-1-simone.p.weiss@posteo.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240304205038.9060-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Mar 2024 21:34:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4929

Hi!

Le 04/03/2024 à 21:50, Simone Weiß a écrit :
> From: Simone Weiß <simone.p.weiss@posteo.com>
> 
> This adds some hints that and how chnages should be tested when contributing.
> 
> Fixes [YOCTO #15412]
> 
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>  .../contributor-guide/submit-changes.rst      | 37 ++++++++++++++++++-
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 61f3157d6..d2167a2f3 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -221,6 +221,38 @@ to add the upgraded version.
>     <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>`__
>     in the Linux kernel documentation.
>  
> +Test your changes
> +-----------------
> +
> +For each contributions you make, you should test your changes as well.
> +For this the Yocto Project offers several types of tests. Those tests cover
> +different areas and it depends on your changes which are feasible. For example run:
> +
> +   -  For changes that affect the build environment:
> +
> +      -  ``bitbake-selftest``: for changes within BitBake
> +
> +      -  ``oe-selftest``: to test combinations of BitBake runs
> +
> +      -  ``oe-build-perf-test``: to test the performance of common build scenarios
> +
> +   -  For changes in a recipe:
> +
> +      - ``ptest``: of the package, if it exists
> +
> +      - ``testimage``: build an image, boot it and run testcases on it
> +
> +      - If applicable, ensure also the ``native`` and ``nativesdk`` variants builds
> +
> +   -  For changes relating to the SDK:
> +
> +      - ``testsdk``: to build, install and run tests against a SDK
> +
> +      - ``testsdk_ext``: to build, install and run tests against an extended SDK
> +
> +Note that this list just gives suggestions and is not exhaustive. More details can
> +be found here: :ref:`test-manual/intro:Yocto Project Tests --- Types of Testing Overview`.
> +
>  Creating Patches
>  ================
>  
> @@ -285,8 +317,9 @@ Validating Patches with Patchtest
>  ``patchtest`` is available in ``openembedded-core`` as a tool for making
>  sure that your patches are well-formatted and contain important info for
>  maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
> -tags. Currently, it only supports testing patches for
> -``openembedded-core`` branches. To setup, perform the following::
> +tags. Note that no functional testing of the changes will be performed by ``patchtesti``.

There is an extra 'i' : patchtesti -> patchtest

> +Currently, it only supports testing patches for ``openembedded-core`` branches.
> +To setup, perform the following::
>  
>      pip install -r meta/lib/patchtest/requirements.txt
>      source oe-init-build-env
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4928): https://lists.yoctoproject.org/g/docs/message/4928
> Mute This Topic: https://lists.yoctoproject.org/mt/104731180/4316185
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

