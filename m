Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBDAC54E49
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 09:30:18 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.16967.1708939809263524622
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 01:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FK6Zf3/Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: uvv.mail@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c199237eaeso1300326b6e.0
        for <docs@lists.yoctoproject.org>; Mon, 26 Feb 2024 01:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708939808; x=1709544608; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJos8bzSl7fs4sL/zz2oxjTqlTWiNGs7qXtHicI5f88=;
        b=FK6Zf3/YBkFoDxl2q/jWeSabBU6xyOf4rwJtncaLeBQA+KVksnPh3TF8WEpW+ygQzW
         8R7BjK9778bScI8AW1216UU6ZPgHomW8yQZ9L6Ln78VWjRANAPrwUdT+llUvQgsFZpbB
         XnwzTTUshUbHU+ritrGU+QaROiTqqsW8hFECsCcUP/QKXCwkye/1GJ3rCyHuhkFbvUAq
         KVG3yelOCbWC6gdWvKLguFpV9pPW2vctiYuQ7C0R05WMgGUBGFbgP5PJbwTfEJMfNAeK
         9EpI9o812TVGkLcbreOMHhs51klmvFEC7yP6f1lVvtvBpEx0AoBurVWcnEZ1UD1hmPQp
         3Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708939808; x=1709544608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJos8bzSl7fs4sL/zz2oxjTqlTWiNGs7qXtHicI5f88=;
        b=gUurkOCI8nrMjDWxlOGy5gnJJdYikis9F+GtQyMJPmz37npsQKbqIX64yKphUnrXFF
         YS2B3M61bDYQkEzG7u9oYg86vqYai9wpVhJPv4AbslybfgKLY3xz4skF5BY4lDmXUaFH
         dyAkV8syyEKRwXbyz/rWdOcgt1jgE0/HBAfrsFrIXpFo2NnAwmk+h0GDZ3iLhPpGDn6z
         u09Mft9ty9twO3YkJjZDtZz/DFNOQA/A6V+kuVY/zDLwOsU1TSPrdjVq6lMposrUEsFH
         e7648K35gvDoeXzAGLugzib9bzpP0Vf1f0GymgT4XJzINMTP80gBkCvBd1VW6+nDk8QO
         Lqng==
X-Gm-Message-State: AOJu0YydTjOMJKmLErxJUhrsIYhROEvsF7n7SrRuymbxixgkO7rTWtST
	+h1w46y0W91qM96+85dzNFS3h3M2a97TxOwYewovSoxgRgBwrZYu
X-Google-Smtp-Source: AGHT+IFpF8L5qnuJgHoPVwsJugVW2QXJvmWyOPAzCNMWngLfSPfCIMneM16i+m+XCycozsMgKv+QjA==
X-Received: by 2002:a05:6808:1403:b0:3c1:4e89:f119 with SMTP id w3-20020a056808140300b003c14e89f119mr8161568oiv.0.1708939808558;
        Mon, 26 Feb 2024 01:30:08 -0800 (PST)
Received: from [10.139.121.62] ([149.40.58.132])
        by smtp.gmail.com with ESMTPSA id bl11-20020a056808308b00b003c1343a9c6csm1006057oib.52.2024.02.26.01.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 01:30:08 -0800 (PST)
Message-ID: <d830331b-f366-4a0b-b83d-8219c32a2e4f@gmail.com>
Date: Mon, 26 Feb 2024 10:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] manuals: kernel-dev: Fix BSP in recipe space
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: docs@lists.yoctoproject.org
References: <20240221072612.79402-1-uvv.mail@gmail.com>
 <CADkTA4NVhyHwRkjoodbxb6gvJM3y5UiW5WkyHha-dTuH2xs=wg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CADkTA4NVhyHwRkjoodbxb6gvJM3y5UiW5WkyHha-dTuH2xs=wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Feb 2024 09:30:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4872

On 23.02.2024 14:44, Bruce Ashfield wrote:
> On Wed, Feb 21, 2024 at 2:26 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> File fetcher doesn't have destsuffix parameter.
>>
> While the file fetcher doesn't have that option, it was the fact that
> it didn't have it that kept things working.
>
> If you use subdir, then in fact, a recipe space BSP doesn't work at
> all as the tools can't find the BSP definition.
>
> The kernel-yocto bbclass is what is using this to set up search paths
> for kernel features when it sees the type=kmeta.
>
> The option could have had a less confusing name (since it is
> effectively passthrough like "type=kmeta", but that's not something
> that I'm willing to change right now (I'll do it post release)
>
> But the documents are correct, you do need destsuffix or the
> recipe-space BSP will  not work.
>
> Bruce
>

Oh, interesting. Perhaps the recipe-space BSP works this way, but the 
recipe-space additions for other parts of 'kmeta' didn't work for me. 
Whenever I wanted to extend kernel features that yocto-kernel-cache 
didn't have, I had to use subdir.

Slava

