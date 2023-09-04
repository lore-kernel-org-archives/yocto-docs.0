Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B017CC83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 09:43:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.44844.1693820607433362878
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Sep 2023 02:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I7SBKsU/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FC7FE0008;
	Mon,  4 Sep 2023 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693820604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMKXnbQl1VFZv75N2DlYgkYlKwXtTYvhEKDrE09YzdQ=;
	b=I7SBKsU/GOCPTS+fXo0TK0rU8GYoN3WWxx39qTqOUvf68yuJBbtXbaL8Y0Yywuo+VbE5Tf
	F2b+g5a5Rj8NdO1P3srCbodfaiAiW4c1gZejhNbDvKsftOjt3Mwt/Ij0kUKUbw2f9iDM5d
	55Xh2sdSFbt5AReXZzUkPKjlcDbPETBpT5AXCcpsYij1CEQDa8NdQjYdzseglr/nr2eKz7
	fUlQhkoNCnV/uEohBDRKdVLOxwXinfGjnjdG3K8qL1Jk3biMrMRhCMHjMZWFMa6nSV9Lc/
	2StnKPnmuy9ngqUFV8+vFoGQacEqZRuyDJw3BOAQut5QiodZhCy1coNI64cPHA==
Message-ID: <b1b034c9-5207-f9b3-a2d2-5d2fa8174482@bootlin.com>
Date: Mon, 4 Sep 2023 11:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.2.3
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230901064205.1528588-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230901064205.1528588-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Sep 2023 09:43:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4181

Hi Lee

On 01.09.23 at 08:42, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.2.rst          |   1 +
>   .../migration-guides/release-notes-4.2.3.rst  | 263 ++++++++++++++++++
>   2 files changed, 264 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.2.3.rst


Many thanks for the release notes!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next", and will submit a patch for the "mickledore" 
branch soon too.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


