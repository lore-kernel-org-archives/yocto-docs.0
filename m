Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AC5C7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:35:21 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.4290.1750930516010310111
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 02:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h0yIeqZ3;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade33027bcfso128572166b.1
        for <docs@lists.yoctoproject.org>; Thu, 26 Jun 2025 02:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750930514; x=1751535314; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apcap+FV0TYE/lBdq8IVYgk0ry1ugyZEdzAIa0yLzYs=;
        b=h0yIeqZ3TQdB8V28WnrHZbD+2SQM4mBkoClQhJksVQ3oRtc8wVkuOGw0b7IrofXaWe
         dK6Dy2swsSDRH+ElcH436NWz4zVAY/1oSmZleEQMeeY5BkB2RGu/2hPq5NkBnMEwpvbI
         pnXDrE+VVe83rVs3RfHMaXyADv+GQFuFvt+VxOAdWQEZpFDG3qKLCpPKZV5lxDjBjONH
         AOKSue66+mM6wD5hTYvYQYUOaYRgj215fgeAlPCDC8vplkGUHltoGs7ihabjAVFhW91z
         TL95lLVdCv2GNrkwx+xupDlJQoE5r0EbD1TMr96e9Yd3BIJ4XfdD5MAJtcjDS48OSrH9
         omwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930514; x=1751535314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apcap+FV0TYE/lBdq8IVYgk0ry1ugyZEdzAIa0yLzYs=;
        b=R7h35MewZqWVXl5idgq4M2nEHND9WYj87YVduJ1l0FwF1ZBjAmx+pjyC1zzwfadPPL
         Jcg7CzKuXwBN07felcZ+atoNMJVTJPtu/9je68DIow/3+idjJVu3CbsmIMchLCk/1bsf
         8uHLBKL8CvXNumZh/C0pRrIUeX705m8iWmi69nesliM9b2sNXi9Ufw534RuImKkYLR3U
         2Izlo5FAp1ftF+6Ak/TySEY1s7aw8yTNo666cAXQUUh28MTscopcfRp6W1fY2QmSpJpL
         R4up1xwhsyKKFdSkma+ITL8vPhQsMOK7FOUQclnNHp/cbqotwUjqJ2fYeEzkr1uFgf+S
         +nVg==
X-Gm-Message-State: AOJu0YwxZIfAD6N3yl1kPo1IQhUh5pVYSCTs74O+mpKIZJoWnYS14+nF
	jJSWhMkqpssgiLpfvBP8hUwzKfV6L+AHaJAy4zt/TXNZzdaxP5v1f2Og
X-Gm-Gg: ASbGnctycog/DrkhrMd5nDMwKcntMU1qi7k938uqTUQ8uKYbvpbcK91qbtcDdRrlffn
	DnB0pXguLz3373LKt4rCViDhju32+1wcinC9h/LyZo2f1erilKmjqiQbKZXz0H+FNuLymKHDMH7
	qkC3qYPUU4HtrTWQ1mHLsnGDRpOTvAB/mkY+dquuTbaKHt/4Qup3fmUMBO+aDgEbYM9f51wfNOA
	hiCkarsYs71LUUrnlBJGidw55d1L+ADfrF9lsJCv9bFXqxsZWKO20cwHg817h2hEqRPwg0r96Jf
	5vE7UYmC5eELGmkzLU1fEPHR6iL0RRH/U182VeQojorK0RU6v4CivnbZ4fckLQ8kAGnwYA==
X-Google-Smtp-Source: AGHT+IF+eJ/vmQ6OTPleNNfEk5yPBe/IlpvlB1q66oIj97b67C/4SrhK1bWv4w6eweWFoxdFON/VPQ==
X-Received: by 2002:a17:906:4fc5:b0:ad8:85df:865b with SMTP id a640c23a62f3a-ae0bee4f81bmr608848566b.33.1750930513985;
        Thu, 26 Jun 2025 02:35:13 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0d817697fsm87877366b.27.2025.06.26.02.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 02:35:13 -0700 (PDT)
Message-ID: <ea42c45f-b4a5-4a70-952f-6440ea2a2b66@gmail.com>
Date: Thu, 26 Jun 2025 11:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [OT] trying to build kas docs, "No module named
 'sphinxarg'"
To: rpjday@crashcourse.ca, Antonin Godard <antonin.godard@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <edad802f-c9fb-a11a-e729-bc505ac97112@crashcourse.ca>
 <DAWBUTM7CWGG.3S2D24JNNJ89G@bootlin.com>
 <00c8a2e4-6b90-86b9-b424-f581fffd934e@crashcourse.ca>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <00c8a2e4-6b90-86b9-b424-f581fffd934e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Jun 2025 09:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7228

On 6/26/25 11:14, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Thu, 26 Jun 2025, Antonin Godard wrote:
>
>> On Wed Jun 25, 2025 at 8:34 PM CEST, Robert P. J. Day wrote:
>>> Given the abudance of Sphinx expertise here, I'm hoping people will
>>> forgive me for a little off-topic querying ... I checked out kas:
>>>
>>>   https://github.com/siemens/kas.git
>>>
>>> and tried to build the Sphinx docs with:
>>>
>>>   $ make html
>>>
>>> and got:
>>>
>>> Generate kas-container usage documentation
>>> sphinx-build -b html -d _build/doctrees   . _build/html
>>> Running Sphinx v7.4.7
>>> loading translations [en]... done
>>>
>>> Extension error:
>>> Could not import extension sphinxarg.ext (exception: No module named
>>> 'sphinxarg')
>>> make: *** [Makefile:53: html] Error 2
>>>
>>>
>>> I've installed python3-configargparse, but no change. Can anyone
>>> suggest what I need to fetch and install? Thank you kindly.
>> You probably just need to install sphinx-argparse.
>> https://sphinx-argparse.readthedocs.io/en/latest/
>   that's one of the first things i tried yesterday, failed, try it
> again this morning, worked just fine. *sigh*.

FWIW there is a requirements.txt in the docs folder that should help
with the dependencies when used like "pip install -r requirements.txt"
(I guess it's too late now, but maybe next time)

> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7227): https://lists.yoctoproject.org/g/docs/message/7227
> Mute This Topic: https://lists.yoctoproject.org/mt/113830450/6084445
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


