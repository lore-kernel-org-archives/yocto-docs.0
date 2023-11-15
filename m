Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF87C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 10:03:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.9930.1700042600092553260
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 02:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PnncwqtG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 446C2E0006;
	Wed, 15 Nov 2023 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700042597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TvcQDItRnQh0Haz7qjva3LKhDYmisSJxdgaht8RULLQ=;
	b=PnncwqtGqu6tPVx+UvMPWy4LUktNY152iVlLFWJaqGhjoUsW5hD0bPB8jIrQy11e12kAld
	qkG4xp95UVepUw5HOJbqKzwNKHHCn5fQ4/fBDImPHvMB/RLEvM0AJMXb9KPa1ia0sZsCBw
	mhE+m3XJXwWXiRNsGMin9ww7v1X3GENe8f8weD5qt20FNODWt9TgKHooD+5q4RQNh4KnFW
	Dyk/T0mGWwcrP0NeJEHfdojcV0/mHfbkz3Pj+qxj7z9gE3fZnOOpU2SbB7zgRj0dmaI7W7
	TcuYKnFgZg1W1zyTzpX8EbJtaLKkT+55o84QtdpN7Q872i+1IlC8huE3FeNGYA==
Message-ID: <2b26d0ca-0366-42e4-b320-e9b2d2be90f0@bootlin.com>
Date: Wed, 15 Nov 2023 11:03:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 4.0.14
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20231115010001.921311-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231115010001.921311-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Nov 2023 10:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4630

Hi Lee

On 15.11.23 at 02:00, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.14.rst | 227 ++++++++++++++++++


Thanks for the release notes!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next, and will submit to the kirkstone branch too.

Cheers
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


