Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ACCC77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 14:09:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.22803.1684246169116965658
 for <docs@lists.yoctoproject.org>;
 Tue, 16 May 2023 07:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o3aBMBby;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 09CFCC001A;
	Tue, 16 May 2023 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684246166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2NdkC5VjM1LWQtYq8/+5+bbsBS9WywlwB1kAZHndBI=;
	b=o3aBMBbyDCYjt4r1xrzPGzMF5pk3Z67dmX2Em0305CjHv9b8EH4cJJ+koK9zD9PiKS73cR
	dWhshdqk+VtpcqB+kCd07F7Gum1cvLlMArPUkAVp0GoRyUb+sx1HWNQ/0Knz7rXxsfB7cp
	bwDD24klPw4FVk5a8ny7PA12Dy/PGv1cuHdSc1gzGREaPaTfwzUz9CXAouF0EXhtH4KgZO
	pVkNVhNhkkCCD+MP6iplWftcO7PqCf3IdU5KTL0vl6IRK8lV4w6nYwXZQWk+rno+yDKkOQ
	2WwvOpg5dzyPFf2agn64OkZc7lhJ5QOkBuC3hrjAgV/woExmPUUrSFtVhCA5qg==
Message-ID: <ab7fe8f9-f870-112d-96dd-524b387926ac@bootlin.com>
Date: Tue, 16 May 2023 16:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: Takayasu Ito <ito@lineo.co.jp>
Subject: Re: [docs] [PATCH] releases.svg: fix and explain duration of
 Hardknott 3.3
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <175FA34E4B6A4672.20583@lists.yoctoproject.org>
 <175FA4D2BE259C19.20583@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <175FA4D2BE259C19.20583@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 May 2023 14:09:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3948


On 16.05.23 at 16:06, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Takayasu Ito <ito@lineo.co.jp>
> ---
>   documentation/ref-manual/svg/releases.svg | 61 +++++++++++++++--------
>   1 file changed, 41 insertions(+), 20 deletions(-)


To make the update easier to review (!), a copy is available here:
https://docs.yoctoproject.org/next/_images/releases.svg

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


