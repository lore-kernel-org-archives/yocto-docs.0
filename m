Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D811CC43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 17:42:40 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.29781.1654882951830834747
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 10:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WtSVbtT/;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5DA9D240003;
	Fri, 10 Jun 2022 17:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654882949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=368j7C6TB5OX5Epcb8tXrof4h2UCk0H2bWzS/rbKT8c=;
	b=WtSVbtT/Tg171Ojsuh7Yuc5WcptGKAZU6XsffAbxS2ojoJsGLu8EL2O5+5CZinLKR+zBO0
	3Pp2t4qguzWQQ5ZVUtOxEuTUoySMAsac3G8Rb2dINl/iuptR8qPdrnhAZ+hyZdD9YSKI3p
	B3ce8abzzPcrKvDYn6at79RE0QkMHX9/QgnxYFlHDB9iOLz923RJe7V8H91Vj4znvT5GEt
	dP5FW/VSgsx8czbFpNFWE9cOqy+cm/qIDHicnJ7kyhDrXzK3XMDBoihaYlMQBv1NjB/lwT
	X2fsCiofWE6tBZZr8F1mlb0NZ5LNeGywkV43HYFSfWpFI3iPHJZHYYriQtmxRQ==
Message-ID: <d67b1d84-86e5-c784-5965-9fce2c7e1666@bootlin.com>
Date: Fri, 10 Jun 2022 19:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] ref/dev-manual: Update multiconfig documentation
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220609094044.41131-1-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220609094044.41131-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jun 2022 17:42:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2982

Hi Richard,

Thanks a lot for the update!

On 6/9/22 11:40, Richard Purdie wrote:
> +   The configuration definitions are implmentation dependency but often

Did you mean "are implementation dependent"?
I'll be happy to fix this by myself.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


