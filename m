Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30402C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 15:30:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.34308.1698939057697692967
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 08:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kUWs90w+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2610EC0009;
	Thu,  2 Nov 2023 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698939055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HW10yRKL/rs4K98fNrbF47WY3u6/CpFV3iMc0blqw5A=;
	b=kUWs90w+3/BlwckOD7ITOO+1Ry5xHKQVs9paz/93lVcQaoR13FEdNakRfZVsP8F3WQuAbY
	gz9IeE/P662CJkLkjDFtfgFytX8ArCkOJOjetXM7bpC0gmht22stCjcIMX1Rx0zp8pI8rl
	z5L8Z1saYmu3L97inB/E2WsxsYg1Pbohgks7R93QAZn0c125DLwW27OdKE9ThGB+gx1zKY
	Y3wDHNf6XediwtBoZ2ZcqEjxCd5PGE8sfP7n+Cn3NK7MFNxXARF9uAxEztSN/4YwmtUBFO
	gjlGWekAm2SmC+9xeKYEyWm0oFvSXQfux5NDWMZUIXKYy57jj9ElukWnwxjx3w==
Message-ID: <af39da37-cf58-43f3-bdfd-6ffd5c9ac095@bootlin.com>
Date: Thu, 2 Nov 2023 16:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org, nd@arm.com
Subject: Re: [docs] [PATCH 09/14] sdpx is poky, not global default
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Ross Burton <ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
 <20231101172706.81576-10-ross.burton@arm.com>
 <9097745-6a19-e7cf-cd76-7a74581d51b1@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <9097745-6a19-e7cf-cd76-7a74581d51b1@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 15:30:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4577


On 02.11.23 at 16:23, Robert P. J. Day wrote:
>    "sdpx"?


Ouch. I actually fixed that without realizing, by capitalizing the word :D
Thanks for the review
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


