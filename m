Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567DBC4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 14:08:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.32099.1698934090964152884
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 07:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pgSP/vNW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0377F20005;
	Thu,  2 Nov 2023 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698934089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o7KQj9tOY9kl5/29qiX7OrxdFp8ZWpVKHHDcynPS76g=;
	b=pgSP/vNWndPlqwEnqWu+hZIETLWgvNiBhjghs2toJThdLWjujSnFspZ8QNiMOumOnZ7TEi
	UFV3bJbtoVyrEk2pzFguJyyL6MvdgsvfqSU7VyRUDcOHwd/ueZi48u/FtAJUza95Yx47MX
	UuZ8iqig7LHRoLr9af9Xks4IOua+eJ9jXEjTWtlWW9HvzQmNR03+j4Uqy8k1p2TzttgGJl
	YwVXq0NzP9eBiiDItJm3IMc76Lva/DPyQYu76I/2zr5TcvJ6pKKpcBSlv3LLlN7aiQ/whg
	um2ld0mM4Di4YoIIddhBuQzPITSDMx7XFrSWl6yKbYhLAmt1+OzLDgSfTbiHyw==
Message-ID: <022a606f-6046-4a5b-94a2-14da9005548c@bootlin.com>
Date: Thu, 2 Nov 2023 15:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: extend the description of CVE patch
 preparation
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>
References: <20231101062614.8357-1-marta.rybczynska@syslinbit.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231101062614.8357-1-marta.rybczynska@syslinbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 14:08:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4572

Hi Marta

Many thanks for the patch!

On 01.11.23 at 07:26, Marta Rybczynska wrote:
> Extend the description on how to prepare a patch for a CVE issue.
> Add a more illustrative and current example of how to modify
> the patch file. Add an example of how to use CVE_STATUS.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>

Everything looks good to me, thanks!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


