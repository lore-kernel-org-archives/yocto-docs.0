Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F70DC04AB1
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 16:40:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.251.1695228001257024418
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 09:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bB0pKqEg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 114EA240004;
	Wed, 20 Sep 2023 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695227998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLj8WEZ0lwgBfU3K/KnIkCRYw1mrqp4g0gvjOpg2ic8=;
	b=bB0pKqEgwVer7gMUpFovwtCIt99bFyHQrd3/S+9NzpSb8u4KkR6wUpv8BleRwHIDEbInb0
	z8ZQ7FcqZi+8fFgkw9Kp+pipYbS1Fnq/Fr7c8w87hXPz9+xfxu39OqjWm7hoWi8tdRhkzN
	25RTWJLEYcqelcD1UNmfdBKbuSeKAh4CDx0Q60ww5bqFWjPt93kA3az17V+dc9Yod4yQPt
	x1U4cvGVMTxj+aOJip3aUhYJyHctFhyFrsjzkziGqUqctZLGyjf9ie2M2yZO2+y1StBwRE
	hGrozhITamXdQmh4qgJEk3zuLND+DZl0174lWu58OQd7NygZnU6S3P6RGTOpqA==
Message-ID: <156c5bca-bdf8-d1c6-a169-b1394474d474@bootlin.com>
Date: Wed, 20 Sep 2023 18:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] contributor-guide/style-guide: Refer to recipes,
 not packages
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230920145208.1054570-1-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230920145208.1054570-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 16:40:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4277

Hi Richard,
Thanks for the patch!

On 20.09.23 at 16:52, Richard Purdie wrote:
> Whilst often referred to as packages by people we should use the more
> accurate term in documentation, 'recipe' instead of 'packages'.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

I'll try to keep an eye on such an abuse of the "package" term.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


