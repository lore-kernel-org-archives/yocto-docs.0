Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8090C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:33:09 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.10309.1677159181152647923
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 05:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WWDPkxu7;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 51D5B100003;
	Thu, 23 Feb 2023 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677159178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1KOV+bSuvCCZw/j4CS6YZlYeK5Ej7ksDKkUsRYumjWc=;
	b=WWDPkxu7LYzrDdlPz8CIK5tDzWDb0lyVmQKJT76bWUVrQS+WbgkitfzSMmoz8DDKZRWdhz
	H1jqo2R3vfUu0rT1+CDRdQgmi0m54QRRgUsN5Xr035xWCqgjpeMlyfWmVkLB0jSgEXTuh9
	fX9RLLL8I25s9eLSXHqev4v2xge82MNbiZmMLAVDqBjw2CNgnc0ABnC4n7sx6LB5Gy18k+
	tJ14XUzh1ALP4S937DQnaQOwGdm4pZevyCp4euxl6mKNqroM3W1ZLtxJ9i0RaXf6DRE0Qw
	jwBS94oi9DsU4l1xDyWdpINNv733upoTH0VjVzlEmmMOQCIrN5ZmcbZyn7I+8Q==
Message-ID: <55a60eb8-31f9-94f8-2751-56593bf26e46@bootlin.com>
Date: Thu, 23 Feb 2023 14:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] manuals: document
 COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <3891ece8-e2e3-1e37-a372-dd88a7bbabf7@theobroma-systems.com>
 <20230221184156.65816-1-michael.opdenacker@bootlin.com>
 <9a2b7892-fdd6-362b-3950-5c216dd3ed66@theobroma-systems.com>
 <54b9159e-3549-8593-9bc7-11f327baf09b@bootlin.com>
 <e252edd0-7c9c-0072-5af6-d36c4fb55400@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <e252edd0-7c9c-0072-5af6-d36c4fb55400@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 13:33:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3725

Hi Quentin,

On 23.02.23 at 11:27, Quentin Schulz via lists.yoctoproject.org wrote:
> What would be the use for the autogeneration of sphinx targets from 
> sphinx sections if we have some sections with additional manual targets?
>
> What I wanted to use manual targets for is for pointing at content 
> **within** a Sphinx section. e.g. 
> https://docs.yoctoproject.org/3.1.23/ref-manual/faq.html. We could 
> have had a target for each Q: line for example instead of migrating to 
> sections and subsections like we did recently (c.f. what's in langdale).
>
> Hope I explained myself a bit better this time :)


Good idea. It think I got it this time :-D
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


