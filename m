Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED9DC001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 08:31:45 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9291.1689755503771254217
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 01:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xvb4Lxa/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03ED21BF210;
	Wed, 19 Jul 2023 08:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689755501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akNMxwrKwuVlieQ151wYDn8Ep6TA1AY8uPGr7YwFzaU=;
	b=Xvb4Lxa/XDdZYim0RumW+Zh+pon5iodCpYxzyf7y6ZBn2SpZTIWcEdneYLzUbt9kjNSjm0
	t6u1YiaxXTzxOiDiKlyenrl22uBulU+7jpbOMaue5BmSWwjjBOTkrj8tet8JvF6h4O0ku+
	3kBTe4Y1q3ixwZP3P2CrUXLNn01VNA8o0MVBl0rUwhFJb7UJXUFPlwIBk2M1lXeWzhxYD+
	p5R1zf7GGQer/zkNyl0E1cgvYr+lS62zJtEBkj2JRNve+qh66Sx8MomVRrBwoB9YTQU6TK
	TiehqjNzG9/lybcLGKoeJWKEPHQeCZmQWdedjscyU423BUvmJM3aIG1efne9Ig==
Message-ID: <189d4577-3402-f3fa-af03-0ac8e3af70fa@bootlin.com>
Date: Wed, 19 Jul 2023 10:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.0.11
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230719025931.1561357-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230719025931.1561357-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Jul 2023 08:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4064

Hi Lee

On 19.07.23 at 04:59, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.11.rst | 214 ++++++++++++++++++
>   2 files changed, 215 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.11.rst


Many thanks for the release notes. Everything looks good!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


