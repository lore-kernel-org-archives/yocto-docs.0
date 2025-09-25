Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E49CAC5BA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 18:04:14 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.3886.1758823445815445852
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 11:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FJbkiUI0;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso1773511a12.2
        for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 11:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758823444; x=1759428244; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7v6KHNsfkilIWxnvGwa4X8XG6BE4rp0+87RhTqE5TOU=;
        b=FJbkiUI0Vx4u5KrjoPBzTw1plXZA9AvOD/w8XIre2qRqd9umxTH5UzSUazPWMlHnIQ
         nMcYIpMYrb1Xn3X1ZGzsOKiq3tPrib0mT5Ebetm5gGxARqRJkHrjo7MBCQYauMSC3O6u
         bmYXaat0KJZzfP24AaAPeogqSk/trZQqk+ZSYtZSzxvRnoxfijlfh7plbIEg8g9TAGU2
         iRURViU13Uo8/NyI+j34rAi8Up2PDjHjqf2jChVrzksc8TfA2g/9oJ/nRX/AlII3CGrC
         tVf7zXsL6sj/vAA3VKu+AyfMYXIesWmGrII1Sxsq8eFTxGqxPSD3biCo1rWaye4Drp46
         t7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758823444; x=1759428244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7v6KHNsfkilIWxnvGwa4X8XG6BE4rp0+87RhTqE5TOU=;
        b=ci0OspWy1EM+5I6vAQOuxKzu+idXL7JZ4WVwVZ9n86Ujj0//P+tL7UyamwX3Xt4GIL
         ZkR/6h+VFGjA5pq2ApmcvMSEwbRHSiDrgh+Tp1bCMPA0zs6w4Oev/nExsnoWhxFxaQmC
         J+m7kV8KC8SgzIlVUE8D1JryRkHhtjF4Q4+KmnO06VH4JRa+TnSzpkfm8x5nBifvnuTX
         AsNIQQOde2yVDTIoF47WppQ47etmsGZEESqgZeskbh0OpyImOogrlQP0GDC6pGEUiLfe
         gzKke7V5vfqevrsBbXvhAxt4nY3qfxkDpjKHGoHSKm4rccnngU8xLlGaQCTGHLasI4uq
         vQ8Q==
X-Gm-Message-State: AOJu0YzxvGWLlPiShn9sO5Nlznh29887B5uw9FXtIXCXCSqH6y5jx8SE
	gmiZXJcR7J0nNdqZ0DkD4kRatJyAZlsVQHbARNRVP52f882x9Cc/m68S1K3+wPA8
X-Gm-Gg: ASbGnctxtfEcB3raKI8Q2BMW16Rzp4kkesyO/PMHWtUW8rRm1lQZ06hOopL3S9JjZ+Y
	DjBCcd9EIacTBVi3sAd8eBPrb+oXVGHn1qcMH+b+US8Jz8eiZrAU5+LRwiKVHR2r9Nae8VdPrxB
	QHexxNJeePfQIaCJnXNKzLlQ8bpiCqTAujpsnps/orSNCpzTAty243Qg7GpOrqwnhRsDEO7M4Rw
	vA6PC2i84J7c57BI3Q0OYVTve2cqU3vETng4glZTf1BPEAvgDq078TQLoPyPEDsNLpRoJDueTpp
	9YZLTLtEIpN55ec3rQD6Fu0jB/nZqakfU4QOpPvoLGKfwbQOB8zxYDkorPKjbwrPEK57HbKMQ/F
	3nYvQhQ5iLgvT1j+obRiIArqEvDyM064=
X-Google-Smtp-Source: AGHT+IGnk2cDg5TjyusYw8uk7vv7M5VX3ZEf6lMrW2GVo7DZoOiWVZdyDcBvnViOs9LqbwzFfFugmQ==
X-Received: by 2002:a05:6402:1ecc:b0:634:ab34:ed40 with SMTP id 4fb4d7f45d1cf-634ab34f486mr1872258a12.0.1758823443905;
        Thu, 25 Sep 2025 11:04:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae3080sm1597477a12.34.2025.09.25.11.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 11:04:03 -0700 (PDT)
Message-ID: <af870a11-20e5-4cf8-ad01-9ac2de61c11d@gmail.com>
Date: Thu, 25 Sep 2025 20:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [RFC][PATCH v2] brief-yoctoprojectqs: add bitbake-setup
 info
To: Paul Barker <paul@pbarker.dev>
Cc: docs@lists.yoctoproject.org
References: <20250819213530.3616042-1-tim.orling@konsulko.com>
 <0696dfc6-fb46-43b0-bf2b-776e56ddc8e3@gmail.com>
 <201149f2ca63a54ae38a34cedccc9c3267d1eacd.camel@pbarker.dev>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <201149f2ca63a54ae38a34cedccc9c3267d1eacd.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 18:04:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7605

On 9/24/25 18:20, Paul Barker wrote:
> On Thu, 2025-08-21 at 22:17 +0200, Gyorgy Sarvari wrote:
>> On 8/19/25 23:34, Tim Orling via lists.yoctoproject.org wrote:
>>> +      To use such mirrors, ``bitbake-setup`` includes the following in your
>>> +	  ``conf/auto.conf`` file (or you can add it to ``conf/local.conf``) in
>>> +	  the :term:`Build Directory`::
>>>  
>>> -         BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
>>> -         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
>>> -         BB_HASHSERVE = "auto"
>>> -         BB_SIGNATURE_HANDLER = "OEEquivHash"
>>> +            OE_FRAGMENTS += "core/yocto/sstate-mirror-cdn"
>>>  
>>>        The hash equivalence server needs the websockets python module version 9.1
>>>        or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS Stream
>>>
>> Random note: today was the first time I tried the official Yocto
>> SSTATE_MIRRORS, since it is enabled by default with bitbake-setup. Until
>> now I only used SSTATE_MIRRORS only on my local network, using direct IP
>> addresses.
>>
>> One thing I noticed was that it absolutely hammers the DNS: it sends
>> hundreds of requests/second over and over again, resolving the
>> SSTATE_MIRRORS url for each request. My PiHole kept stopping resolving
>> queries just after a few seconds when I started the build - it turns out
>> that by default it rate-limits clients with more than 1000
>> requests/minute, didn't even know that it does that.
>>
>> I don't know if this is something that should be documented here (as
>> long as it exists), or somewhere else, or maybe nowhere. But anyway, I
>> thought I share while the memories are fresh.
> I spotted this email while reading the more recent replies in the thread.
>
> If everything is working as intended, DNS responses will be cached by the
> client for a sensible amount of time and you won't see hundreds of requests per
> second.
>
> I've seen a similar issue before with pi-hole though. Pi-hole uses dnsmasq
> which gives replies with a TTL of zero when the DNS entry is locally set or
> automatically added by the DHCP server - this tells the client not to cache the
> result at all. The dnsmasq docs say that the default local-ttl of zero "is the
> correct thing to do in almost all situations" but I strongly disagree!
>
> To fix this I created a config file at `/etc/dnsmasq.d/99-local.conf` on my
> pi-hole server with the following contents so that local records will be cached
> by clients for a minute:
>
>     local-ttl=60
>     dhcp-ttl=60
>
> (if you're running pi-hole in docker then setting this inside the docker
> container is left as an exercise for the reader)
>
> I saw this while using an sstate mirror on an internal Minio instance, so the
> DNS records were local to my pi-hole instance. You may need to look into other
> dnsmasq TTL settings or the TTL values being set by your upstream DNS server if
> you're seeing external DNS entries not being cached.
>
>

Thanks a lot! Will definitely set this up and give it a go.

