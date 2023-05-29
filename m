Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E385C7EE29
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 07:57:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.44961.1685347057579368530
 for <docs@lists.yoctoproject.org>;
 Mon, 29 May 2023 00:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Fn5aeNJa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685347055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05a5b5zTclBIxVyQeVmLnDS7fGLM0ZMjknXTAGCF9Qk=;
	b=Fn5aeNJaaVO1Q7ZiYY02qpCPIRux1R60insDVDIuCyLj6OKaEI9030gm2LcqRlWTS1Gue0
	MDk0nnGbzveYaIxTTlamC9+w+HfwzpuHb/VO+WrpkXD1aOjRibng6XqdCZ0GPJL9JtypMK
	bmZ6s22fd/6Urndfg/tZCZl7NeY6l8EFNPHy3UDx8tXtLJBQcjdrTpjSzy8UFt70WlmVMa
	hxzE/gcTkWJL7RSZEhY0AkepGZB8Bjorrh6t/5gfbdHGn1qJ9Y5GQQsG1vdkFDUOanTCEJ
	XsO2oZI0gn5fqpOBPBAOV2F13YCf/DbZPFu+pYeXV7apUynXcDzMxNXURArDMA==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 012CB20002;
	Mon, 29 May 2023 07:57:34 +0000 (UTC)
Message-ID: <da674118-a3f3-0aed-0105-3060c99aa55d@bootlin.com>
Date: Mon, 29 May 2023 09:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.2.1
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230529072718.1703166-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230529072718.1703166-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 May 2023 07:57:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3974

Hi Lee

On 29.05.23 at 09:27, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.2.rst          |   1 +
>   .../migration-guides/release-notes-4.2.1.rst  | 206 ++++++++++++++++++
>   2 files changed, 207 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.2.1.rst
>
> diff --git a/documentation/migration-guides/release-4.2.rst b/documentation/migration-guides/release-4.2.rst
> index ae52d939c..2757f8927 100644
> --- a/documentation/migration-guides/release-4.2.rst
> +++ b/documentation/migration-guides/release-4.2.rst
> @@ -7,3 +7,4 @@ Release 4.2 (mickledore)
>   
>      migration-4.2
>      release-notes-4.2
> +   release-notes-4.2.1


Thanks for the release and its notes!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


