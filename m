Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0291C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 09:28:36 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3407.1700126913476021019
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Nov 2023 01:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OrsWQtpi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F6DAC000E;
	Thu, 16 Nov 2023 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700126911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gkg4w96o7rndPpKq0KpgGVssw19REhkHvG7HynPiiB8=;
	b=OrsWQtpihgvCq/48Efx4Wr698YcdrDxX+JRhodXJ15OVzQHpB44lbKIDXEHVksFJYlh7fK
	QXm93ET2nESdseAFn/i+dGtPS5NZ/KECoceiVAKjJx9QdG8HyqbN8XyNlFkhiSIiCyTd/4
	Z8/8Uz8MH4QqkrOfUf80uJBLHGV+BBqsKIMHWFMkBwnWVCzAvcnsPdsbIA4cEEneURK8Zj
	AmXiT2BcQpoPEwQZRjSHXo6/eesbcWI51hfBuu5oi4TJ3uHE56QwuxtoT3yMyCc9dEjFzi
	Z2U6DblErc/D5iL/cRfiU/LI90veR3NL1zeGLFTMa0Taf0+Jj50Q05Xmpmci+A==
Message-ID: <68d14c08-ec97-4a60-89ad-883307b3a18c@bootlin.com>
Date: Thu, 16 Nov 2023 10:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 4.2.4
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20231116071836.1287839-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231116071836.1287839-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Nov 2023 09:28:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4636

Hi Lee

On 16.11.23 at 08:18, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> release notes based on 4.2.4 rc3.
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.2.rst          |   1 +
>   .../migration-guides/release-notes-4.2.4.rst  | 364 ++++++++++++++++++
>   2 files changed, 365 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.2.4.rst

Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master next (and soon mickledore)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


