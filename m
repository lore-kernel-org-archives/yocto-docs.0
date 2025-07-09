Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3523C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:34:55 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.1589.1752078894231941334
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 09:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BvcOzkON;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so203860a12.0
        for <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752078893; x=1752683693; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqSKdNFXTnvOeofWzYMjRhocyuaqwBMCSQLGWBuWG7s=;
        b=BvcOzkONjG2GtMjHshNWpiJYbOvC/V87O85CdKJhWZopVWI8ifr6BYupFbydcSbOtW
         XXp7GSzaHXRfus3zPg4KNi8BJ0EXkwpHxh3Jj/iU/5aLjaPl2X+Z0qK48iPHL4m1+X8D
         dNQCGsMrdmdmdvtrqLLTeOzPyR+zz/N2nCzrEPPM+cvjlWSYWV68hzx42ax+SujdwDhn
         eKX3ABHBnsIyYaf4gJz1cQrFo9uqFfpiUsWZRyoUNO93Y5H8oG5dcktIdIZPHB/vUBaF
         jAEFG5EQnRdQJuFmK/pysGhLi3zPFcSCkfGMZjv7T5YrqGyIUSd76dRL27plHhsmfe/Q
         nqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752078893; x=1752683693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqSKdNFXTnvOeofWzYMjRhocyuaqwBMCSQLGWBuWG7s=;
        b=CPwU8XaOAgxusD9ITiNPKkh6OPQtfujJbnqim63BcdsqnwcYjyRGGW5Hzn7JzuhOK9
         aynDsGFmt9ed6C2hYT83yNBR2+3gzobNUO5qtVqwW3cEtR8vLBnKvn5bHpRZyVUpXnfI
         O8o6NMw8ZcyPfbiIQGWaMPlKlxznbGl9LgbZmPlWme3mASDYaCmP6mYoIFfUNmLlciyy
         KmKSC33tUIykNQW49KBu3zDJ6WCPbcFRLJ/ZhnAtfEn778o9MtZGxbKXTe+MH1U+RYgV
         qsPaK/6BrftHaeSmFcbNDI7dDQibcKJVvClrTxITpwDUUFVUco7i6nylqUtGFSNjA9LK
         7OXA==
X-Forwarded-Encrypted: i=1; AJvYcCWIR+IeiJwe3G+iJO6CRx4RMe9Et1XxrMlL9G2JmogX5JGBl6/yx74HtvRfLoxLNAPF8Sdc@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyAT6aImWCBrnVSsW36cOihYO/27D+QEnTijHc9lKL38YQssWOg
	SXbcH0zT6NkXvgUu5EyXcnC/gVX1dKMgVSy5svc/JLEt4yCBJXlp90ptHIYW7UuP
X-Gm-Gg: ASbGnctLrJ24rFDL52rQdJYPmo4F5MD7tHOAxZz8Et47rF88PkefoGODQ+Szbsvpe9P
	5oT/GsemSu2VS9lY1muLd45Q/aidqwMonMVoT1BGEGqT9F3Kbdb2avooni7F6oWFIWicvu3+8K0
	Rgqre+1pztXS1uaANq4A1LWOm58nx72OSs1igMmO+EZd+IT4aj+walvwkyiPLBnagoBqVsS0osF
	5xnQyODGIHAEyJ7Z1GlVC7mch9tW11OucHqiGT8vNwXITzZpzYKtvHHNDkKNgauA+SXLdZCaP6S
	LVCTBxuHWQXsF0RQyhv7JZXJG7twj8lNLIlKABbxq313pDCIPLlcUeai9vXlIryuLuWpE8RGtsB
	aozIuPUnzz7pSf/JUeMbpC+KQwGvWiSABdrj1FDqU5nlnWDEiUg==
X-Google-Smtp-Source: AGHT+IE/5ZJ0elXKVQyE+Gr2w4/5MF7JJdMIld6oZxhWfPp3kHCsaKpqzTm7KRIyp4cBbsRthJZJ1g==
X-Received: by 2002:a17:90b:1b10:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-31c3c3084f4mr751194a91.29.1752078893432;
        Wed, 09 Jul 2025 09:34:53 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d1b7:aad6:2c95:a1d8? ([2601:646:8201:fd20:d1b7:aad6:2c95:a1d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c30037b4csm2542465a91.5.2025.07.09.09.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 09:34:53 -0700 (PDT)
Message-ID: <85161775-f95d-4de8-8241-414c4281e48f@gmail.com>
Date: Wed, 9 Jul 2025 09:34:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] now i'm confused about OVERRIDES
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <164f071c-7019-7d77-c49a-f0ba3e87c502@crashcourse.ca>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <164f071c-7019-7d77-c49a-f0ba3e87c502@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 16:34:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7301



On 7/9/25 5:42 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i'm reading the BB manual here:
> 
> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#examples
> 
> and, first, i think OVERRIDES are complex enough to need an entire
> section all to themselves, to be explained in detail with actual
> examples ripped from the OE code base. but here's the confusion.
> 
>    i distinctly recall a while back that i asked about the (possibly
> misleading) differences between these two statements:
> 
>    A:foo:append
>    A:append:foo
> 
> and i was sure that the consensus was that the "proper" syntax was:
> 
>    A:append:foo
> 
> that is, it was extremely unlikely that the developer really meant to
> use:
> 
>    A:foo:append
> 
> even though, in most cases, those statements would have the same
> ultimate effect, they could potentially behave differently.
> 
>    so the "proper" form seems to be the preferred form, except for this
> pile of assignments to RDEPENDS in the meta-raspberrypi layer:
> 
> https://git.yoctoproject.org/meta-raspberrypi/tree/recipes-kernel/linux/linux-raspberrypi_6.12.bb
> 
> is that syntax deliberate in the sense that it *had* to be done that
> way?

this is seemingly a bug there.

> 
>    and don't get me started on the complexity one finds in the
> meta-xilinx layer:
> 
> EXTRA_OECONF:append:xilinx-standalone:arm:class-target:baremetal-multilib-tc = " \
> 
>    like i said, i think OVERRIDES needs a more thorough explanation in
> the docs to cover some of this stuff.
> 
> rday
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7294): https://lists.yoctoproject.org/g/docs/message/7294
> Mute This Topic: https://lists.yoctoproject.org/mt/114063523/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


