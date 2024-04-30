Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F532C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:11:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.27574.1714511483068622433
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 14:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NSmmNDvC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDC86C0002;
	Tue, 30 Apr 2024 21:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714511481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlUplsl7VLPwPj7cqR7jJ0BJDUj3xWHD06nHV76YlbM=;
	b=NSmmNDvCOXVERGqA/EPpNm+GtSnBJldbIDBX2RQ5bo8ocoywjURQTpf/dKSwCl4yNEE6Fz
	0VWqWv53E3+aY/geIOcGCgHoRosjGzYvJO8dWh8VAfm9kyx3Bik27Jv8thcTropBtY1RbQ
	OyIIpTJBpeU7sUFy4BGUah5GZzeJ1E6+Qoo5mKsTR4BFvMcDYfx4MI6DNidJed7vjNxCvq
	LPU0SRdEzI5D0OB6HPbVmMEmSCQYQAjcxwHgG60Gct2ChNhXTK47L6YubREkbKDHZTMSZy
	ti7zpBltZnLHsgue78M65wsqVJUqFDEl0LGvZ154clqeCu9cmZXSH+SiidJc/g==
Message-ID: <f0cb72f0-2799-4696-9291-30d85fbb0559@bootlin.com>
Date: Tue, 30 Apr 2024 23:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] release-notes-5.0: update Repositories /
 Downloads section
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240430140017.1741751-1-chee.yang.lee@intel.com>
 <20240430140017.1741751-2-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240430140017.1741751-2-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Apr 2024 21:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5184

Hi Lee

On 4/30/24 at 16:00, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>


Thanks for these updates.
For both patches:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


