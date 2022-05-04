Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1492C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:32:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.150.1651674752175295159
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zfqb3On6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 77C391BF208
	for <docs@lists.yoctoproject.org>; Wed,  4 May 2022 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651674750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jc/8XZiUuDRo9M88UJnqeb9Zuj/2Ex4aca2kfTaqvgw=;
	b=Zfqb3On6Ee90yj8fGpNr0sSDsSPhindpKDpisc9LyQGjhhpGW4ZrVJ8fXNn9Xgwo/+Op+q
	SAqxxBXPKhFe/hpZGZaMb3mpgyhtVt+NVN5kvlGSW30qWBMlKYy3UDa4hO9RbGfKXD+gUP
	nh2STSDHGkn2NRiHH0kmU5jGaJwm3ThYsDYnGMnyYHMjUVARsCRc5n3J0NacB02XvimV3W
	sc84i18jHQ878qjPD9Pz1mq3aA+o+ytzKAivFuYhuusBvgbtplG/syZ11wTYL9S6Am4cJK
	xMW+Jq4wT19U3g9QHkV6DjqDraxYWRcKcx5rP6P9HYkK7+fObTSzxgUdXLnk+w==
Message-ID: <40d22fb1-a73b-c675-2bef-5b2f4482c515@bootlin.com>
Date: Wed, 4 May 2022 16:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [docs] [PATCH] manuals: fix name capitalization issues
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <16EBED43B28C13DE.11553@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16EBED43B28C13DE.11553@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 14:32:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2908


On 5/4/22 16:29, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> - Using "BitBake" instead of "Bitbake" or "bitbake", aligning with the
>   title of the "BitBake User Manual".
> - Using "OpenEmbedded" instead of "Openembedded"
> - Using "Python" instead of "python"

Apologies for the 3 changes in a single commit.
I was preparing 3 different commits, but a mistake in my git branches
merged them all. I could have fixed that but I preferred to spend my
time in a more productive way...
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


