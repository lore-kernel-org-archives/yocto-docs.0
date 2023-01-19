Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1001EC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 15:58:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.49153.1674143926651409410
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 07:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KW9zJO3U;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 58B75C0012;
	Thu, 19 Jan 2023 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674143924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9xnixSQCWpt2vdolY3uhcCV3sFJvDUD5Ivi2JnSNjg8=;
	b=KW9zJO3Uvk5lAgkVwAiyIf6n/jQcHNwOmDx56mBac59qlYkMKpWvYhkFPUdVgeRZpc5tjb
	Mnq5CUmYWTNQHAUGCkrCA9rztoseiLIVvlA++qWIsgUJdaIdTgW70zeORrlglEitRKg2nD
	DvhOIp71kvKBqPtvmmwgjeZ8uz6zlxqW96fD7G8tJE+B8YsL72e42PeG2w6Zl/j7XPclT/
	Cr6bGQ7TRGhhJr8jmPJGMXnfR2wXYLzzh6C05Whr/2SoianaEvHaMQoQGenwKLRRvpdRNd
	LwzxaBLRo71DoiH98BonumVo+a1BIXe1FQIeHD/XmCOq4ISSEgftbHdjJERW5w==
Message-ID: <5537e5b9-2803-b9a7-812a-69f32fc3109a@bootlin.com>
Date: Thu, 19 Jan 2023 16:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release-notes for 4.1.2
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230118061617.2948348-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230118061617.2948348-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Jan 2023 15:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3618

Hi Lee,

Thanks for the patch!

On 18.01.23 at 07:16, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.1.rst          |   1 +
>   .../migration-guides/release-notes-4.1.2.rst  | 284 ++++++++++++++++++
>   2 files changed, 285 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.1.2.rst

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into master-next.

Could you just update (if possible) your scripts to add the SPDX header 
line at the beginning of such files?
.. SPDX-License-Identifier: CC-BY-SA-2.0-UK

Thanks again
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


