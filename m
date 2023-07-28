Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEF8C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 17:50:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.38246.1690566601313789449
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jul 2023 10:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pEwxfNjy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 618E61C0002;
	Fri, 28 Jul 2023 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690566598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TTvw/wtjXXwMpHFu8pHdljNyovfF4JXVWlkKYsrQQzA=;
	b=pEwxfNjytHDOOqRtKeOBIPG8xyrYCJf57OE1Laj8fmGY/fNltvFxkQaGnoqKMbqg+WT/yh
	lgQ0Cimt9btTPFk7XvVYupA5j4Tjtt4gAga1YmFhcN1gkrx+Y/bizNxIB786pDC5xSjsv/
	N1RAw1q2QVg28btcCayuoFM+9p8icUmUq147bgvLj7alRzYe/BVrg8zae/zlGpEt1OjptG
	vJcoTOTAD71qheX+pomwAupg1In3vyqjf3fXrkKKbvjdZuS0qrXnF3Ds0Gqkin2ibELle9
	XOd06j6hH+AypYUZ+yNCNDuCownZnJOOIrgbAX9qvISMUApm8+d2oyVF+IAf2Q==
Message-ID: <837d9dd0-fbe5-8c8a-dfe9-6c0099833d18@bootlin.com>
Date: Fri, 28 Jul 2023 19:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document image-specific variant of
 INCOMPATIBLE_LICENSE
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20230728165026.862640-1-alex@linutronix.de>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230728165026.862640-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Jul 2023 17:50:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4083

Hi Alex,

On 28.07.23 at 18:50, Alexander Kanavin wrote:
> This has been around without being properly documented since 2019 (!!!),
> and is nowadays the preferred method for enforcing license restrictions,
> especially since meta-gplv2 is officially obsolete.


Many thanks for this update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... not too late for further comments though.

I will submit backports for at least Mickledore and Kirkstone on Monday.
Thanks again,
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


