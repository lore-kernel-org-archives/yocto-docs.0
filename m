Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408D8CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 10:35:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.8153.1697106942218193470
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 03:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mPz3VVLF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB258E000E;
	Thu, 12 Oct 2023 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697106940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nDatgm02E6aMILSX1A9Xr7QOzl+fj3KoYhwMPe9At5o=;
	b=mPz3VVLF1e03JV6QWMApmbZU4U8fRZUCF2nBfMCHM9hkl56ZwrJieDZGhW5v6/ThFOVeQT
	qUeumc9U5VkYCLRM6QSkdpHbwTwNR51Z/1y+9ogJJ4qy0HMDCVyWDqgPqNDn0otN5mZeza
	SpRwCf8rpezzX5ao9GbyTCX2QUEm3JRSQ4gBb7JV+DFzTFJpq0SkJHWXXEJXXvxUQ3JXp3
	MOsD9alhRJIDuf5qcV5d1W2mXageW++mlC8W+m+vDmS5WpKXNa7Rs/QyMpw4ZQREA83ySj
	gkJ7wbYwXqlb4+PNjvGJFT0A4gw0hC52iADOY2mZNEA3YqTdDa6TpP+6L2kfiw==
Message-ID: <d39c0048-b1b5-4d3e-9694-a8c02fe27c6a@bootlin.com>
Date: Thu, 12 Oct 2023 12:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] BSP Guide: intel-quark not in meta-intel anymore,
 intel-skylake-64 is
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <e5a575c3-b75c-1289-6380-c5f73c8a154c@crashcourse.ca>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <e5a575c3-b75c-1289-6380-c5f73c8a154c@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Oct 2023 10:35:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4358

Hello Robert,

On 12.10.23 at 08:38, Robert P. J. Day wrote:
>    here:
>
> https://docs.yoctoproject.org/bsp-guide/bsp.html#developing-a-board-support-package-bsp
>
> the Note refers to (among other core intel BSPs) intel-quark. what is
> actually in that layer these days is intel-skylake-64, not sure what
> sort of rewriting that would involve.


Actually, I'd update this note to remove the "edgerouter" machine.

And why does it mention "meta-ti" as a part of the Yocto Project 
release? I don't see "meta-intel" in recent releases (except maybe for 
Dunfell). Maybe we could just remove the part of this note mentioning 
meta-intel.

Feel free to update this in the patches you are preparing. I could do it 
too.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


