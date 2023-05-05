Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E2EC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:10:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.29936.1683299434003628763
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 08:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d4gl6A42;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B74C16000C;
	Fri,  5 May 2023 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683299432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRMOmsELKJsKgBHjsH/8opk7pLWjqOUBVhA+cebuQy0=;
	b=d4gl6A42dZ+QTRtnX3mD661UjoL63SWWGycY+5HEI/JDIPIEuCO2p8eHG+lgIOLOQb8CWZ
	d3YJYJ2qwb56ytApvOc1Fe2uXWQWrMiWrFMGtrNjVjj0prfQKJzw6BWjjuDVD0jd3EAgeX
	XDWp+kwNKnOXs0Z+IwUt+vjfbXX+WdYlz0TI1ACMGEJ4H/uJZ+6MPvALYw0xBvyHFBqj0b
	8cRUXoUWp4bA1tcPmM9SYOzpiAGioOBD9g3P/t86cHmjBlwBQda4ymWqXSU71wo7YTDLuE
	RNZLGTasRsnFA0Gh1ZFYDlA7aQ9YHODZ2yXIvJlMtU4Kho+hWfO+HFyuPlZ64A==
Message-ID: <8fb8bcff-dcd6-b08f-fc2b-a870d7ff15ab@bootlin.com>
Date: Fri, 5 May 2023 17:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] ref-manual: classes: kernel: document
 automatic defconfig usage
Content-Language: en-US
To: luca.ceresoli@bootlin.com
References: <20230505091006.1888595-1-luca.ceresoli@bootlin.com>
 <20230505091006.1888595-2-luca.ceresoli@bootlin.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230505091006.1888595-2-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 15:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3915


On 05.05.23 at 11:10, Luca Ceresoli via lists.yoctoproject.org wrote:
> Since a very long time the kernel bbclass uses a defconfig file from
> SRC_URI automatically. Document this feature.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


Hi Luca,

That's great to document this behavior. Good catch!
For both patches: Reviewed-by: Michael Opdenacker 
<michael.opdenacker@bootlin.com>
... and merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


