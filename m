Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6664CC54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:43:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.38194.1708335773764389446
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Feb 2024 01:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VBK4oqP9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE0176000C;
	Mon, 19 Feb 2024 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708335772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qthhaqq2XhJGCat4thBYevGkuRRDLQ18XmRiaRzJvM=;
	b=VBK4oqP9t8PaGy2dvvI3oQcIaxxDxGnySpWM2JN7ns/tFh3fkZpaYt4D8lzUWNeqN71c20
	KRNWDTxTAVFM3knx1pqGvjdZGLV/y/Y945kUwj8UNoR+fzwFzrvilyQQk6m8IlSYTS7u5j
	ucY4gFhtg2WywENSORY1ZywOZqkj5ZyeA6EgcdW3ufSOCVdguRQp46ic51f4U1ugPqBGIZ
	0F6ElW8tEFYdqBEcUHL/R6hQzS+WiQDhL4hXH2mlEONzLcbBDYs9jHRQ1WQzaXX6g62UFo
	VukgAd1/WSMc95IjiuRTiXshxn7Gs6DQEsz+t7JWETtIcB67BH5IkP3M5Kbllg==
Message-ID: <177444b9-1f93-4d6b-8a73-0eb9f0c27533@bootlin.com>
Date: Mon, 19 Feb 2024 10:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 4.3.3
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240219052235.3608147-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240219052235.3608147-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Feb 2024 09:43:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4842

Hi Lee,

On 2/19/24 at 06:22, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.3.rst          |   1 +
>   .../migration-guides/release-notes-4.3.3.rst  | 199 ++++++++++++++++++
>   2 files changed, 200 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.3.3.rst


Many thanks for the new release notes!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next" and "nanbield".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


