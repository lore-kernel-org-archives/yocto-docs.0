Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83031C46467
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 10:31:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.32930.1672655453622360741
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jan 2023 02:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KM6dJebW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F1B1D1C0007;
	Mon,  2 Jan 2023 10:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672655451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MNfsaM3O+nrMfNcOVJs38mTffAG3BdzRUGHjvRkx0Zc=;
	b=KM6dJebWbXi73zXUax+QSQLo7Q+SswlUTPxAGMqJrmWMux6eDFluUwdPk0MR/1n3Dj+xHk
	2RHj+ZAtRKnypz7zGSNQVRFR+a79HaQutvp3MD3rFzfuJw2qhBFdGxzPQeaumK0gNuvnxz
	kEkcG4WLypBsjRfjKZHahIJDRxaXiy9aXRhxyuGMPHMt5TkctqEu3VaxK2/Uk8eev9dvtw
	wGByylHhCz2Lk7NB+ZQxqjVIMO0HxocZb09fyUxE22NH0xoEiK6iHVhad5Pub8H4oDvVqa
	unUhVEUmA8EUabn6xyYj3FknUfSjjb/T6vOl0Xan4CZ+G1wRpCvd/kktufWu8A==
Message-ID: <d3110d81-b0fa-de4a-965a-0c775485e7dd@bootlin.com>
Date: Mon, 2 Jan 2023 11:30:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 quentin.schulz@theobroma-systems.com
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: support Arch
 Linux
Content-Language: en-US
To: Vincent Davis Jr <vince@underview.tech>
References: <20221227194932.3783-1-vince@underview.tech>
 <456184cf-b08c-9eeb-c261-840552bcb5dc@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <456184cf-b08c-9eeb-c261-840552bcb5dc@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jan 2023 10:31:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3565

Hi Vincent

Thanks for the patch anyway! I was also going to check whether Arch was 
tested by our Autobuilder.

Am 02.01.23 um 11:19 schrieb Quentin Schulz via lists.yoctoproject.org:
> Hi Vincent,
>
> Thanks for your patch.
>
> I'm afraid this will not be accepted. We usually refuse to advertise 
> support for rolling release distributions.
>
> The advertised supported distributions are tested on our autobuilder 
> and we don't run ArchLinux there. I would expect we also don't have 
> the bandwidth to debug when things break in ArchLinux. Note that we 
> also do not specify support for derivatives of Debian or Ubuntu 
> distributions, we have seen issues with Pop_OS! in the past for example.
>
> For this to be accepted in the documentation, I believe we'd need 
> patches for the autobuilder so that some builds run on an ArchLinux 
> server. This probably needs to be discussed (and financially 
> supported?) with Michael Halstead our sysadmin. But first and 
> foremost, we would need this support to be agreed by maintainer(s), 
> hence why I'm Cc'ing Richard on this, who I hope can raise this to the 
> proper board if he doesn't veto this.
>
> Considering it's holiday season, please expect some delay, but don't 
> hesitate to ping us in a week or two were you to not receive an answer 
> meanwhile.


Another idea would be to create a page on our wiki 
(https://wiki.yoctoproject.org/), for people trying to use Yocto on 
distributions which are currently not supported. We could then refer to 
such a page from the documentation, reminding people that there is no 
support commitment. Or something specific to Arch would be to update 
https://wiki.archlinux.org/title/Yocto

Just my two cents.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


