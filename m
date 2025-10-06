Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC20CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:00:27 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.28472.1759737623854791156
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 01:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a64D3y+L;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b48d8deafaeso945019666b.1
        for <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759737622; x=1760342422; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SboqB3F71cw9dE6l7Y1W2dlDm0kUNySfQeo2qYODa3U=;
        b=a64D3y+LD2/NaFNblX7UovRuomxEjyDLeEvuq+GhPyOZPnwxfzfh7zXkxXifWp0a/+
         XbDRk3RbweG6Imk3LvSwe8XSVAJGezjHresjKZB0Ab8F+Hecnd9Bj/96ijCBZ6bsJNQG
         IFdbHUo13q6f9pJv6deEAjS6dktZMTPvdHIMGfOeHTEssYROiaDdUuKfxiqQODVqfQAq
         iosBGfJm1LMhTf9vIgrwqR8TspxCFZINI5yP5IIm2ZWqWZh+nvd5KMks1ep1epTKQ1BO
         CAaNLRy2flh/T7oG8C5Taf92VQv7FHcX471SyiJMtmXMcVb+kxk8cO4LAdLibxNIRScs
         hM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759737622; x=1760342422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SboqB3F71cw9dE6l7Y1W2dlDm0kUNySfQeo2qYODa3U=;
        b=mFqyY0zS6RWCosCsfzgx68ySglPhMxlWrcd3wLTJeo1YKvNqyk/CqEGNti0uunnSRD
         jgu8DF3y1Kg/4BBwjXduv5e7egQoj5W162uikaIgv+GUQp5c+Aq6Uz2oAcq1hbV5Z+nO
         Bp+bH4YIYVbfmbhL5IMO/AfdetgPXQtCDca8RwkYOL2MBAK7S4IVm5+KWdkfYir5a+G1
         UhdnhQK6MV+CJSyTAApBcvcCQxEb0DC43eye7RubNYeAkW25jp1J/mYbBeizfX6zQFIS
         mDDPNHYlJV4xSexLAQzOWVa9qsgM7CoVDakZeElzJpYJKy/zKdgXAfxfyte78D5mA+In
         +C3A==
X-Forwarded-Encrypted: i=1; AJvYcCU6lpVBcHdGv78/Ngb4CgfgUCsPokzzPs62FsdUQwXNMO9d2xDYg67VTsQWAuzOrYygpbNP@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyzGPjlXV5dwoVWDgciQUPa4nWm+0v9i5Sw4NMcgXvmfGAETZ9t
	4Lp/hQqlKfpIW+qJXxDEfxsN+QOXLW4OLWZxsbmG04YvqxpHhETdILEX
X-Gm-Gg: ASbGncuTupsQWBbJBOEBg8A5K+Eox2S5Awe+gUDKAMbVEwiJUfdGwhZz2vZfLD/1rcB
	Eu0zEVS5Lcv5iDRmQbTFd4iPGrUtLXg1TR5qrOKvdYfyc/W1j1u4gdV7wzcUMMOVGLGQIkLciwq
	BrDjTxTz1J2kGC9qvhVqx6c0woEYoHqDb91XtK3/SLKWmNDPep0BHaKO3m7/tNgQxoUbkpaklL7
	LdFGRQ8YYiRWTgKWad1+BFeR7wcjnsOdOdYYWJ/+0ArxT9+Cxym1ozBzvjhYaTnAAiEwshjUffY
	wcrLTM9xfIK7WxYZe77sNbgdk7zhP3F8e6CsHT21igPcmln/XPgOZdDVtsGlwZohOB1P4AoUESM
	PkgDhBYXoKJX0wsPSls9WRaWw7udvPEQgMdsP/9kZnnW3TCO28ioq3Xus/dkvWIMmuA==
X-Google-Smtp-Source: AGHT+IFo7PrwPDKXbInOwdzczK7Tw5rCgNW8oOsmPkuV/j3XoVd44sN8MPFDcwYiUKrDKKgQW/eL1Q==
X-Received: by 2002:a17:907:868f:b0:b46:52f2:5493 with SMTP id a640c23a62f3a-b49c4be73c4mr1405594266b.44.1759737621762;
        Mon, 06 Oct 2025 01:00:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4e613sm1072862666b.81.2025.10.06.01.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:00:21 -0700 (PDT)
Message-ID: <60a97c94-a585-4cc9-aebf-7195a69463c0@gmail.com>
Date: Mon, 6 Oct 2025 10:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 5/5] sphinx-static/switchers.js.in: do not refer to
 URL_ROOT anymore
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20241106-pdf-xetex-v1-5-044eab7e77d3@bootlin.com>
 <3495.1759732396707921762@lists.yoctoproject.org>
 <DDB2TABNCZJ2.FMULQF8IFNCQ@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DDB2TABNCZJ2.FMULQF8IFNCQ@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 08:00:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7646

On 10/6/25 09:55, Antonin Godard via lists.yoctoproject.org wrote:
> Hi Gyorgy,
>
> On Mon Oct 6, 2025 at 8:33 AM CEST, Gyorgy Sarvari via lists.yoctoproject.org wrote:
>> It looks like that this patch got merged a while ago, but it seems that it is
>> not online - at least not for Bitbake documentation. The top switcher is
>> complaining that ' can't access property "match", root is undefined' , and
>> when i inspect the issue, this commit seems to be missing from the js.
> BitBake's documentation is lacking its own proper switchers.js for now. I had a
> plan to fix it but I am lacking the time to finish the work.
>
> I just pushed my local work on bitbake-contrib if you want to take a look:
> https://git.openembedded.org/bitbake-contrib/log/?h=contrib/agodard/fix-switchers-js

Sure, will take a look.

> The idea is that bitbake should have its own menu with its own versions and
> switchers code. Help appreciated!
>
> Also from which version of bitbake did you get this issue? A link to BB's docs
> that reproduces the issue would help.

I got this error here:
https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-ref-variables.html
- I wanted to switch to the Kirkstone docs, but it disagreed with me.

>
> Thanks for the report,
> Antonin
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7645): https://lists.yoctoproject.org/g/docs/message/7645
> Mute This Topic: https://lists.yoctoproject.org/mt/109421245/6084445
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


