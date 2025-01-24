Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A42C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:28:54 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.16407.1737736132832966168
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 08:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50OGRmnL000908;
	Fri, 24 Jan 2025 10:27:49 -0600
Received: from [192.168.2.133] ([192.168.2.133])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 50OGRmqV015591;
	Fri, 24 Jan 2025 10:27:48 -0600
Message-ID: <a3a3cfdf-1cc4-4115-a87b-b888d20054da@kernel.crashing.org>
Date: Fri, 24 Jan 2025 10:27:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tsc] New FAQ entry
Content-Language: en-US
To: richard.purdie@linuxfoundation.org, docs <docs@lists.yoctoproject.org>
Cc: Yocto TSC <tsc@lists.yoctoproject.org>
References: <4d28594d59069ca0dc8c6a04db71b934acb572fa.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <4d28594d59069ca0dc8c6a04db71b934acb572fa.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jan 2025 16:28:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6170

This matches my memory of the decisions made over the past 10+ years.  I agree 
with what you wrote 100%.

--Mark

On 1/24/25 6:02 AM, Richard Purdie via lists.yoctoproject.org wrote:
> Hi,
> 
> Since I keep getting asked this and I'm weary of repeating msyelf, I
> have a new FAQ entry, probably a slightly controversial one.
> 
> """
> Q: Why isn't systemd the default init system for OpenEmbedded/Yocto
> Project or in Poky?
> 
> A: systemd is a desktop Linux init system with a specific focus that
> isn't entirely aligned with a customisable 'embedded' build
> system/environment.
> 
> It understandably mandates certain layouts and configurations which may
> or may not align with what the objectives and direction OE/YP want to
> take. It doesn't support all of our targets, for example musl support
> in systemd is problematic.
> 
> If it were our default, we would have to align with all their choices
> and this doesn't make sense. It is therefore a configuration option and
> available to anyone where the design goals align but we're clear it
> isn't the only way to handle init.
> 
> It is included in our automated testing through poky-altcfg and we
> don't really need it to be the default, it is tested, it works, people
> can choose to use it, it works fine.
> """
> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2177): https://lists.yoctoproject.org/g/tsc/message/2177
> Mute This Topic: https://lists.yoctoproject.org/mt/110788688/3616948
> Group Owner: tsc+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/tsc/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

