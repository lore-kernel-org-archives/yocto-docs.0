Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D30EB64DC
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 08:51:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.8598.1689843063039929730
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 01:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HBc455lv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9C241C0007;
	Thu, 20 Jul 2023 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689843061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXYxSVOKG8uQoC6t6/9ji8tY4lCGZZZFFwoMWAWRy0s=;
	b=HBc455lva1P8bXkmp/FWTnoPmexGoeTUD/MRL8Q4i2DD4vc69ALSiJmM8PUlTzha0yQdZo
	sF5/VhH86e+plNlGwBp9lvUlPQZQXdm2YX5rX49VNKLC1hRM63mqcrkK7IF3bkyfCur+Eh
	F3XauEl7TXJTL7GigP2apakPTw9rV8LdW9Ezz3dEjW1JE6QJkUAadR1Wqhwj6LlLqixSl6
	NR+u3Tl+6aSpod7FkqQhTozqA8hwyaJeD6KeYOfcdVzqqFvUthTbavAnJ2QGtxVMYJ3Kb9
	DMhqS2jrVoyFy+MSzwXYRIO+q8sQImyovBq2+2jbuyDRmF3XjWRnBZwHMrRSBQ==
Message-ID: <609349b4-666f-c071-6472-d0b99219ad8a@bootlin.com>
Date: Thu, 20 Jul 2023 10:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.2.2
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230720030303.1601126-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230720030303.1601126-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Jul 2023 08:51:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4067

Hi Lee

On 20.07.23 at 05:03, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.2.rst          |   1 +
>   .../migration-guides/release-notes-4.2.2.rst  | 330 ++++++++++++++++++
>   2 files changed, 331 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.2.2.rst


Thanks for the release and the release notes update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

I'll also update the "mickledore" branch.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


