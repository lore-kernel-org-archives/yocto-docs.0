Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64AAC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:50:15 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.53126.1669920610734365654
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 10:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TRUPz3eW;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 21DE2240003;
	Thu,  1 Dec 2022 18:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669920608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGS9egl0miWosRiXpI4b7O2+QCiCgpWlMKLo4r6UvRQ=;
	b=TRUPz3eWWEVpBvfcmYLJ9vpYCeN1AJcaq90cRCDOLXeuY4WDsx59ahb4ZKfXs3VnCZVRq6
	nhvy3919lwl8GuGF4Vx1KgSqnD7fSRp/ygcR7KMn4aooyYZSAY2Q729Wo1uaI3ANNUO7os
	Kw4YHFwE2Pqpu6SJ0lEBMUCL5FIhOIqFQibAvNNX+D2SH83CW529BmIGWJBdDt9ZHP8Gs0
	yEsQEDvqaP2KEgVJSTOvwjh6mPxUwAf3DJrJFYJj5nJuJVqrXEHPZ40kxDpKOCAF2u6MHw
	3MlMCZjYdRpPZ2f47uQyLZ76ixDaeeOLgml0/+6BbmnWHBk1lql9AkG+jom/yQ==
Message-ID: <d0f1db51-0430-1d3c-3ab1-dc82ec16aa5b@bootlin.com>
Date: Thu, 1 Dec 2022 19:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH][master][langdale][kirkstone] common-tasks.rst: fix
 oeqa runtime test path
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20221130151516.2845493-1-mikko.rapeli@linaro.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221130151516.2845493-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Dec 2022 18:50:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3514

Hi Mikko

On 11/30/22 16:15, Mikko Rapeli wrote:
> It's "runtime/cases" in master and kirkstone.
> If layer specific tests are in "runtime" directory,
> they will not be found.
>
> Signed-off-by: Mikko Rapeli<mikko.rapeli@linaro.org>

Thanks for the corrections.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next", "langdale" and "kirkstone".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


