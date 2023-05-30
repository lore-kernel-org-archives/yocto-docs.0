Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1446C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 08:01:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.4830.1685433686178133376
 for <docs@lists.yoctoproject.org>;
 Tue, 30 May 2023 01:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dyERvaq/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685433684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/rkHMJkb89zfNb8UX/jSMmrwVPJnDn529y8VfuxllKg=;
	b=dyERvaq/lI++w9b1n69bno/LVNC1/6zibgLRJgmxKs8p6L+uZo+xfkY3L051lF1JniGDxr
	KBWRaR4YFSycXGFiGLfEukFBt8XsdzcET3lwSneiZNQyN3JchCK8+nbGFsFPdKTSbISsYa
	RXKUwr/BbrOOt3tbSH9a95Nxs4kw+Z4atLkYS0YUJwqzE4QGc70cLvNwrc3UOulo9oqTHE
	wGitU7yr6k0MMTy968m8lmZLe8LPd03Ie4g9BvoXE9qiR8uzu0pWmIIVhQBWzyheHuUwAF
	x4KgIqp2CXI5aPuHMr00DQ918KT+gxrUwkAI7+0nRzrpwlKMz26cZC5hCmNjmw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51C4620007;
	Tue, 30 May 2023 08:01:23 +0000 (UTC)
Message-ID: <7ba8d298-82c6-d670-2f59-a0ff8f5c944d@bootlin.com>
Date: Tue, 30 May 2023 10:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] overview-manual: concepts.rst: Fix a typo
Content-Language: en-US
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
References: <20230530063751.905344-1-daniel.ammann@bytesatwork.ch>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230530063751.905344-1-daniel.ammann@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 May 2023 08:01:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3977

Hi Daniel,

On 30.05.23 at 08:37, Daniel Ammann wrote:
> Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
> ---
>   documentation/overview-manual/concepts.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 6db515e50..668e00256 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1941,7 +1941,7 @@ Thanks to this, the depending tasks will keep a previously recorded
>   task hash, and BitBake will be able to retrieve their output from
>   the Shared State cache, instead of re-executing them. Similarly, the
>   output of further downstream tasks can also be retrieved from Shared
> -Shate.
> +State.
>   
>   If the output hash is unknown, a new entry will be created on the Hash
>   Equivalence server, matching the task hash to that output.

Oops, this one was my fault.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


