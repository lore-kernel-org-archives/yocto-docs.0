Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04387C04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 07:56:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.15083.1714377380543208349
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 00:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l0gQYa4m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62B311C0008;
	Mon, 29 Apr 2024 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714377378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7557fR5b4Daralm1iWssYlNQKtqCTchSKAJTFXtvCXw=;
	b=l0gQYa4mSswcFKn2x8p6seZxBgpPM8eZjXctKQ1Jj2/M6NMK9iRkPP7SPdoQy8/lc3tJ6s
	S3rC+t/7poSz9/YYQzx43KWWBqDH+uAhsqFQmy1XiZtgq2UfjxJefA8HwCnpOH0QIi6+o/
	q1vUanjYKLibkzSYBa90e6V0J5h/5b53u3bhuMa+yREcfLj7MBjLBUqcflMmaDJNMtNYIB
	T+Bk5o1gEjRvRNAMZNN3kV8eD/tVyeMWi7MziVvz0uF02f3EHHKtwDfB3Tx6C1YzUCLXnQ
	3WVJyCmRnDAEEjrbnaC1njTdl8KrKvD8JYBJnviDOEwgrJCsqLXME5XhBDPc3A==
Message-ID: <a20d2e85-c344-4788-864c-619568ffe83e@bootlin.com>
Date: Mon, 29 Apr 2024 09:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com,
 YP docs mailing list <docs@lists.yoctoproject.org>, ticotimo@gmail.com
Subject: Re: [docs] libegl1-mesa not available in Ubuntu 24.04
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 richard.purdie@linuxfoundation.org
References: <CANx9H-CA+5VbUfPkqTSi_PygfXdGxOG577HQwaod=c=M_ismqw@mail.gmail.com>
 <5ecc01b083d12df9b24faec4ce01b0c856aa1c6b.camel@linuxfoundation.org>
 <CANNYZj8SaL_m4oPM+P6mZmHVWGEciC4_SU4PCbDw35xO+Lc1uw@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj8SaL_m4oPM+P6mZmHVWGEciC4_SU4PCbDw35xO+Lc1uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Apr 2024 07:56:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5178


On 4/27/24 at 08:32, Alexander Kanavin wrote:
> I believe this used to be but is no longer the case as qemu is now 
> using 100% mesa-native without deferring to host. I’ll double check 
> this later. We can likely drop this from the docs.
>
> Alex
>
> On Sat 27. Apr 2024 at 7.19, Richard Purdie via lists.yoctoproject.org 
> <http://lists.yoctoproject.org> 
> <richard.purdie=linuxfoundation.org@lists.yoctoproject.org> wrote:
>
>     On Fri, 2024-04-26 at 16:05 -0700, Tim Orling via
>     lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
>     > In the docs, we currently tell users to install libegl1-mesa:
>     >
>     https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian
>     >
>     > But this is no longer available on Ubuntu 24.04 (there is a libegl1-
>     > mesa-dev package).
>     >
>     > I came across this while trying to create the crops/yocto-
>     > dockerfiles:ubuntu-24.04 containers.
>     >
>     > https://github.com/crops/yocto-dockerfiles/pull/103
>     >
>     https://github.com/crops/yocto-dockerfiles/actions/runs/8853986259/job/24316025556#step:3:128
>     >
>     > I'm not sure what the original need was for libegl1-mesa. It has
>     been
>     > in the docs since before the Sphinx refactor.
>
>     The need is to have GL to build qemu against. Not sure what the new
>     dependency would be?
>

I'm lacking time to test this week, but I'll be happy to take patches 
indeed.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


