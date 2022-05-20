Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501BBC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 16:13:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.811.1653063185240084046
 for <docs@lists.yoctoproject.org>;
 Fri, 20 May 2022 09:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K6UQzoFG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D4019E0006;
	Fri, 20 May 2022 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653063183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Blp3VhRO7VkiPIGh6pRZc5uTSCWBxV3tU10VQOQLhHE=;
	b=K6UQzoFGipAmYuCVXld1AI7kyNuCLr47nvMjfreSleT4swLfRgULhflsztXYlDsnon5sVc
	H3yhHeyzMwLbKzxTMCTSccrN7jX76qaqY3dE8n+V80PX6vyAn+XtGU8k/IoaGvZcIXqiq3
	ACM1QbdjtSGFQ/rRmPl8kkrQJnpFFMsS/ipv6NaIqwzxdmwCmrHPwdq5xixsJw7rDctEmE
	nZ8w/x54arapYgrgdA48QdUcMVTBcYn9ow1m0oWodpV6EWg8IyKiG80OS42rr+Jz0QWSWq
	ZUM17mmwsD10RvTL70F2ZSO2K0VlxvjQXyzCgG4FNY0Cr9u7SW1nw7TbLSd6GA==
Message-ID: <0d3dc5e6-78fd-037b-8805-d689cdf70dd8@bootlin.com>
Date: Fri, 20 May 2022 18:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [docs] PATCH for bmaptool examples
Content-Language: en-US
To: tepperson@briskheat.com, docs@lists.yoctoproject.org
References: <6jIv.1653060874347710359.h4zY@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6jIv.1653060874347710359.h4zY@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 May 2022 16:13:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2939

Hi Thomas,

Thank you for your contribution!

On 5/20/22 17:34, tepperson@briskheat.com wrote:
> This patch updates one of the examples for calling bmaptool to the
> newer bmaptools-native command.

Good catch!

It would actually be better if you send the patch through git
send-email. This makes it easier to review patches because we can reply
to specific lines in our e-mail client.

I believe there's a typo in your patch though. You should replace
"oe-run-native bmaptools-native bmaptool" by "oe-run-native
bmap-tools-native bmaptool".

Another thing, we needed your "Signed-off-by" on your patch. You get it
by adding "-s" to git commit.

Thanks in advance for the new submission.
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


