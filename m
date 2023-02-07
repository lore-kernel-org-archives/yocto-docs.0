Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2DFC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 17:53:33 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.90277.1675792403372193295
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 09:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b8IXwUGP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ED1C6E000D;
	Tue,  7 Feb 2023 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675792401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dVN+g6G/52hmL+iSpv+G0gPA8fuy6BUCO1H1sDaBOq0=;
	b=b8IXwUGPmB0BeNm5KUfuUWIdzhZuKvtdk3TBDy4HjcjOXdBRVsMIyikEot9jypDoTKfBuJ
	ekSfm+sO0LPKKigKKGPvTiUlLjMwsx0/WRFoKbNcYGPFNbp+dAU5XZFUFcq4p7FWaNWiEK
	JPSAS7aPR75vobSgFISMUNOqnBttXZoF7aAnF7Lv/FCd4nxTIOjVkfAw6cpUxWBNmYbn9M
	vNN8AcCOv0WF4wWOfM7nKAZ4ow5fU3GPWYJvbLlXJ5VcOMvvLJP2g87dkyD9UumPLHwWzD
	IlPVXs0stiT82lHg7j70A3vj7VgLDm7i5xluKuovLIajsfrQjXiLlw3zL7qeLA==
Message-ID: <e4acbbae-7122-00d3-1927-c1aedc83d1e5@bootlin.com>
Date: Tue, 7 Feb 2023 18:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: Yocto Project Documentation <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: fix old override syntax
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com,
 =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>
References: <20230207121901.911003-1-u.oelmann@pengutronix.de>
 <86ed9cea-ea3b-824b-e762-1d26547deeb5@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <86ed9cea-ea3b-824b-e762-1d26547deeb5@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Feb 2023 17:53:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3642

Ulrich, good catch, thanks for the patch!
Quentin, thanks for the review.

On 07.02.23 at 14:34, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Ulrich,
>
> On 2/7/23 13:19, Ulrich Ölmann wrote:
>> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Merged into "master-next", thanks!

>
> Michael, please backport to kirkstone too.


Sure, and langdale too.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


