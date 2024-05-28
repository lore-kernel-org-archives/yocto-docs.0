Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F05C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 15:35:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.25336.1716910494234049976
 for <docs@lists.yoctoproject.org>;
 Tue, 28 May 2024 08:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Bg+XSriL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF19A40006;
	Tue, 28 May 2024 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716910492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ve8ezN2pseFqqRd0kPubVsWXhCjWbQP07PFxNnRu+z0=;
	b=Bg+XSriLHZBOmNAwmoJgSaeo95LRN25lF9fgn8TvVn2KmwWP44RRihgktY5RcQ3YOxKLL8
	HOSeu6TSutVBFeqya2zHk+ruKlx3TEDD94WKQBHoEDBGCCGM4Gj4wdAeK5Zd101efwZAqK
	I8S3uVxWXGpFARag2tlXSKx6pJaNk15AyRZ39LOxZ4AY+uFjb1ezbrPyFBLhlKzyGmMPjq
	yhcRZmkOZa2AsAeEiesBZj34LQdZ1gPOtPTMudLxPaNxcvLjhHXoGu7ppfxXq1cQKQQF+j
	nokquyuZfAh6AoDO16JQfs267yfJVbB8fsP5jsymftGEO2HKej588bmUvibPmw==
Message-ID: <3dd82352-ed61-428b-b2d7-061a1b1f350f@bootlin.com>
Date: Tue, 28 May 2024 17:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org, Andrew Murray <amurray@thegoodpenguin.co.uk>
Subject: Re: [docs] [PATCH v2] migration-notes: add release notes for 5.0.1
To: chee.yang.lee@intel.com
References: <20240524102513.2361094-1-chee.yang.lee@intel.com>
 <CALqELGzHtWCj1AzFDAtuzfTbq4WgyJ1zmjNYRf6dDkxdPrEURA@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CALqELGzHtWCj1AzFDAtuzfTbq4WgyJ1zmjNYRf6dDkxdPrEURA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 May 2024 15:35:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5262

Lee, Andrew,

Thank you for the patch and review!

On 5/24/24 at 12:31, Andrew Murray wrote:
> On Fri, 24 May 2024 at 11:26, Lee Chee Yang via lists.yoctoproject.org
> <chee.yang.lee=intel.com@lists.yoctoproject.org> wrote:
>> From: Lee Chee Yang <chee.yang.lee@intel.com>
>>
>> add release notes for 5.0.1 (rc2).
>>
>> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
>> ---
> Reviewed-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
>
> Andrew Murray

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

Now that 5.0.1 has been released, I removed "rc2" in the commit message.
Lee, are you sure there was no CVE fixed by the release?

Happy to take an update if necessary.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


