Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C97DC77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:56:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.867.1684950971210918887
 for <docs@lists.yoctoproject.org>;
 Wed, 24 May 2023 10:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ia6eiW7V;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9B6B1E0002;
	Wed, 24 May 2023 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684950969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kIMVbCSA1ErDjxCV/F5+/Ye00oiNe9iTDV5+KsBIoUc=;
	b=Ia6eiW7VhhKAinkByiORWzdQ/BUUEB7rrNdJNnwyWYGytbqNRhZtyuRg9ZE91fedJOwj2C
	WVfA3M7eal5bk7wH0jdyAu6Agg6Lzciylij64+mEDiXzDzHjbTa/GHAkOksBkMnTf2hxzM
	BkzFTl1wr05NhOXNoX/fPmXf54oC0E0SWanjEJXTCxcK2AI7NVGU8OEKImB8u8suYmyIgh
	tSyH2EsXho3ss26La3jnQog1ZHFPJsh/5bXiv1hcbKPHUB2ICdVp7xX6xUM83wbxRMIm/S
	kT+7rg0vCRhdA5Gv11R6ER+EFNkoEp/Qgqw3WLWWDDFhmOtpKfOnALJ4Ps6NeA==
Message-ID: <2abfc400-b326-c9f6-7204-291cb37152a8@bootlin.com>
Date: Wed, 24 May 2023 19:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.0.10
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230524093437.1050032-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230524093437.1050032-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 May 2023 17:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3961

Hi Lee

Many thanks for these release notes!

On 24.05.23 at 11:34, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.10.rst | 180 ++++++++++++++++++


I fixed a few CVE links, but otherwise, everything was fine.
Merged in master-next.
Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


