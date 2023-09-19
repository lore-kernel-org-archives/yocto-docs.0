Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF22CD5BC6
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 14:06:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.9349.1695132401829006844
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 07:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YNtwjKel;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6D42FF80E;
	Tue, 19 Sep 2023 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695132400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2Rhkz0h1NYDW+hc54BNHQEbBeVPr+T10tM+M46UbHU=;
	b=YNtwjKelFftOMVZIA6O2ZykiqmqSn86eN6g9YUkt8QGcA/rDpaH5X1POIk+RkZUrRPzuJy
	9k3B4bYPVqqaGSZTkVYp6Uz0OCiYqANj4vLd1JceNIzNBscL+LKOm7eRlLtUNkr+7r/p4E
	y0nDr+1M+NTOLY8b2plr/LI94T82E689mJzzeW8MazZrwnyW/xSmcB/tKGrH7n0ctG9gZO
	VA+/Jxw12yQGk51wLtE+wce7Es9iRZc9uiXqLzzFydxJFZ9QaYaZGELKyqzVlqAlXuzO3g
	q16gYo+YppBJBkRj/5foPV6Sfk6tQpceTwcYlGR/7ATwWDPpUede8meKxoE/yA==
Message-ID: <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com>
Date: Tue, 19 Sep 2023 16:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RESEND] [PATCH] contributor-guide: add docs for
 Upstream-Status patch headers
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
 <20230919125757.1571746-2-rhi@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230919125757.1571746-2-rhi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Sep 2023 14:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4233

Hi again Roland

On 19.09.23 at 14:57, Roland Hieber wrote:
> Port and update the text from the OpenEmbedded wiki page [1], which has
> since been deleted and replaced by a link to the Contributor Guide
> (where not everything is available yet). The original text was available
> under Creative Commons Attribution-ShareAlike 3.0, and the original
> authors were wiki users Mhatle, Mariano, Benjamin, and McFrisk.
>
>    [1]: https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935
>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>   .../contributor-guide/recipe-style-guide.rst       | 119 +++++++++++++++++++++
>   1 file changed, 119 insertions(+)


Thanks for this update, but I told, I couldn't find your original 
submissions, and since then, I already merged such documentation into 
master-next.

However, I see that the version on master-next 
(https://docs.yoctoproject.org/next/) doesn't cover CVE tags yet, and 
your patch did. Would you be interested in sending an update against 
master-next if necessary, knowing that there is also documentation on 
https://docs.yoctoproject.org/dev-manual/vulnerabilities.html#fixing-vulnerabilities-in-recipes?

I'd also like to more details about the "Inappropriate" reasons. For 
example, I don't have a clue what "native" would mean. Why would be 
patch be rejected upstream because it only applies to the x86 host platform?

Last but not least, we'd need to deprecate the "Accepted" reason and 
recommend "Backport" instead (see 
https://docs.yoctoproject.org/migration-guides/migration-3.2.html#miscellaneous-changes).

I can work on this but your help would be much appreciated. Let me know :)

Thanks
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


