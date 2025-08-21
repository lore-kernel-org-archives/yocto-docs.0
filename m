Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B648FCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 20:17:17 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.578.1755807431747260567
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 13:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KSDztoLL;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78fb04cso190687366b.1
        for <docs@lists.yoctoproject.org>; Thu, 21 Aug 2025 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755807430; x=1756412230; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EuN8cCo4iMmDcv+QU5F2RYMl36j9aV4BBwErpP+OIEU=;
        b=KSDztoLLqoAyObHHDC8Tz57Gr1nFBXWe8h2jZrXJ2LNpzJLkM2TeIWrUTlGEtmwE2P
         IZDLBWzp26/1Zk0x1ICX3mYva5BTQ5QppftQ0ePbGUgd4R59S8AqR+pomIQ8bvGiiCVj
         1W2jbQMYKoA3L9TQfCLaWFwrVa8BthUfnef10aQWyg2V0xiym0GIzl7aAyOeEr34wiiU
         STz8GP4vFWGqJ7iLKEzptyCN8CkitEXjL/dLV1Lheoqun6aOSaguo8xV46bY8KzqOCSc
         mSAgzEuVejJuLnX22ec1cwaThBZ7bnjBS2dZgqUlNwHDbMHl/8MYrx5sNJZf0PRPtXT7
         vnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755807430; x=1756412230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuN8cCo4iMmDcv+QU5F2RYMl36j9aV4BBwErpP+OIEU=;
        b=HBIOX75yae+oEyuoDR6+pvXgJhLUzTKOz0jJ/VLoCEKbK9x4KOPDUbcCAyqrmG2+3C
         uUh6lXtQHdkFo0+UYUAZRHtM9FAbtl2El9fNuUdoy5orE0ofdmIpJTOKidaYZhFGBvph
         w7MdL4XJIkT/TAHtRkEf+duEArFWZGmCIWSYDAkWxsPTBBO3GaFw6Hb9WSt4Ke/dgo17
         KE2B7Ha20PQbShjV2F/kWNfED0bVjBGpCdw7r5zY3YwFbDZ2XOw/vHZtzbQ+bgjimB2L
         5YGO9grwgWbUo7vq2WWpmEoNRz3pMHWIYOM9zD1IB5AbTYQTey1+63FdVQ+3RBFuDK+Q
         g9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqNucICKZLTAm26l/G0mndJSxtGuUA8wM8GHEmFTqGvDljXKBTIeNcirrL8eoEY7d38DYs@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwQJbg/JXzOA8M4NQDtpaEhcYan/Ifp00zwTmXe+3OeaDmgPjR9
	040LdXqMkpw93OcXtPsLz4bhTL/orfZp3cRHF7STYoWfLfOuOHbkNyYC
X-Gm-Gg: ASbGnct2iaP5aL58V8Vi6Dg91vHYLXbEUn5mvwkOO0xFqy8LxBHmSy3bsuq4Y4BWwZE
	xbpxTQM5WS10KPYEPx1YAPM/rGL6jDC26cl25XM6VDX5xs07tCc5lVlHsp2tKYtMJrH0Kubg25r
	eGOnHHOy4aBi/4m/JzNDIrQW5a983zn9Pnuyv/rxXXEm0/O3uxSA7UYSCWMQKAwpS0K9vWqgwB3
	Zwqsu88HflR4mTPse9DMKetROjFXvcbngnU84iY0RFTyoCFPlZdGUf/sXO/3AYTgTy95kJcWTSg
	2mW6IWJzCOwMivxFY/vANTdi25jeCqVlrqU9Y5Sm4W/oKPNCF4FA1xuAA4RclLiF2RvYAUUDO4A
	T2flJHhFd3wvqWSvu2kTNEJSRdO2lHHxfu4XvRDLaww==
X-Google-Smtp-Source: AGHT+IE1/n6JB7cQ5CYSLb7Y8YM1Jkyld6T62ivV6HOi/VVNQm8ypvxaSbLwhDQchbqou8mAoxRNIA==
X-Received: by 2002:a17:907:d17:b0:af9:3ad2:6923 with SMTP id a640c23a62f3a-afe295c068bmr38986866b.38.1755807428112;
        Thu, 21 Aug 2025 13:17:08 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4c9befsm447133566b.97.2025.08.21.13.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:17:07 -0700 (PDT)
Message-ID: <0696dfc6-fb46-43b0-bf2b-776e56ddc8e3@gmail.com>
Date: Thu, 21 Aug 2025 22:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [RFC][PATCH v2] brief-yoctoprojectqs: add bitbake-setup
 info
To: tim.orling@konsulko.com, docs@lists.yoctoproject.org
References: <20250819213530.3616042-1-tim.orling@konsulko.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250819213530.3616042-1-tim.orling@konsulko.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Aug 2025 20:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7460

On 8/19/25 23:34, Tim Orling via lists.yoctoproject.org wrote:
> +      To use such mirrors, ``bitbake-setup`` includes the following in your
> +	  ``conf/auto.conf`` file (or you can add it to ``conf/local.conf``) in
> +	  the :term:`Build Directory`::
>  
> -         BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
> -         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
> -         BB_HASHSERVE = "auto"
> -         BB_SIGNATURE_HANDLER = "OEEquivHash"
> +            OE_FRAGMENTS += "core/yocto/sstate-mirror-cdn"
>  
>        The hash equivalence server needs the websockets python module version 9.1
>        or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS Stream
>

Random note: today was the first time I tried the official Yocto
SSTATE_MIRRORS, since it is enabled by default with bitbake-setup. Until
now I only used SSTATE_MIRRORS only on my local network, using direct IP
addresses.

One thing I noticed was that it absolutely hammers the DNS: it sends
hundreds of requests/second over and over again, resolving the
SSTATE_MIRRORS url for each request. My PiHole kept stopping resolving
queries just after a few seconds when I started the build - it turns out
that by default it rate-limits clients with more than 1000
requests/minute, didn't even know that it does that.

I don't know if this is something that should be documented here (as
long as it exists), or somewhere else, or maybe nowhere. But anyway, I
thought I share while the memories are fresh.

