Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355CEC47422
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 13:40:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.11443.1704980393028473931
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jan 2024 05:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rg7QzJ21;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5DA2FF80B;
	Thu, 11 Jan 2024 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704980391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tHcTeN8IPgtg+IS7emJX608dx5CuUriD03S0/wvkFn8=;
	b=Rg7QzJ21MLUzVY1l74I4V8pqyp0ZlPKZbleGbi2AFeWIt/CbMfW7Lt0yEnPEs9cdwPOaj3
	g13FRLupdLWvcILgjRWUHhy8rg4ItX6VXmJbGAsFdIFZcGcIRfJytVkqOA3Y8o9+0pR5Rk
	L2RxnecrYybBSLxnPUL+egk/OAvGAlDQBA58+92hfbW/bmRVtpTedbP096urjXqnUcglCI
	OR6KyxHT1Z4FHo7JBOGX3Z7hAR1AlWkWAQSJZY7ak3lE3u3gHAFqqmTSJId42w7G8ByVoT
	iWV4Y6xeplbOpLe1dvmthrn8gplJv0dMRYkGZNDnsoQnjBq7EAolUyeovuIPIg==
Message-ID: <ca691acf-3944-4000-837c-e8c9eae241f1@bootlin.com>
Date: Thu, 11 Jan 2024 14:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [patch v2] migration-guide: add release notes for 4.3.2
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240111015203.794366-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240111015203.794366-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Jan 2024 13:40:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4761

Hi Lee

On 11.01.24 at 02:52, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
> v2: add gstreamer1.0: Fix :cve_mitre:`2023-44446`
>
>   .../migration-guides/release-4.3.rst          |   1 +
>   .../migration-guides/release-notes-4.3.2.rst  | 247 ++++++++++++++++++
>   2 files changed, 248 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.3.2.rst

Thanks for this update.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Updated in master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


