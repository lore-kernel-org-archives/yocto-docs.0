Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A10C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 15:20:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.7755.1667316019405222724
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 08:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q4eDclwr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8B3E240005;
	Tue,  1 Nov 2022 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667316017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4R/rxzEz7zuBOf+/eqY7kLNZuSm6ImuIr6hiAPsS8Ug=;
	b=Q4eDclwr4pA5r65BedUs3mdqw5pMADyA3Bx8E6eGKgA0UeOEHTWuKJX0vIh7edIWrsQ4mu
	A/LHzsG0Dq5EbHOzeUshB4tMsX1Y5XFj4pXtCKB46KOBUG/vej5QL3TOLmqHUMn8WkdXeS
	wnvOQMij3TEoJSX/QOVBautJ/Vlb695day12IOFZHfYtKwsycQMbpmaGZuqQuOrURMUv4/
	rFVUoAUg9TCGm+8bce8qx23zI8zWbAjyH2F0EZLu/mJttwhf9yZAz+uKOdJj4qUaBT7LRc
	aRVMQifqwx5mPlnIRmSF1eHkJepBEKYO9f/kOXpRu6f2vHfb0/8qoFOVxQzikw==
Message-ID: <ef643a2f-5c08-2a6c-4d80-7e889769ef8e@bootlin.com>
Date: Tue, 1 Nov 2022 16:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [docs] [PATCH] dev-manual: common-tasks.rst: fix typos
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 Yocto Project Documentation <docs@lists.yoctoproject.org>
References: <20221101133330.2958821-1-u.oelmann@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221101133330.2958821-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Nov 2022 15:20:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3451

Hi Ulrich

On 11/1/22 14:33, Ulrich Ölmann wrote:
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>


Agreeing with all of these. Many thanks for these fixes!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


