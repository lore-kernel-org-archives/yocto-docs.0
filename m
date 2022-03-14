Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD3CC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 21:50:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.2797.1647294613592611837
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Mar 2022 14:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DYAcr1xO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5898840004;
	Mon, 14 Mar 2022 21:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647294611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPUdMSWeP1FYzXHwI+1Px4ahi9CxgrYGCq9kPXujzrg=;
	b=DYAcr1xOo+cG735y8zpbfJZhgyBBRvFUuq4QaMeHaYJ/YYTWU4Yxns9bM2d+flJts7Fhb9
	HUmWoETOzuM6S00RgqtTrPawCk9PGVCvjEMf8aYeP3gnE4Tsgk//ZloMhPGmjEHjaW9BXm
	lo/04J97Q6z7DRS/QTKgTQboYh7HRPlx/v/NMBYiSvyxC5BIcZTY6bO0BYePMa4ADamrGz
	UCflSPeQ4vI1mxcTc8lgnbuvA41jDtSpgmz2zQNiR31jfmh8sq8u4f4kr9fjQvcu9U3CcB
	s7Ey08/NmdorhJ6uu6En9xba35WybUTrT5PTv4jwCXtn56knQ1pXS+L/eatBYw==
Message-ID: <9fa36a19-5cac-3005-9a53-bd43598d76d1@bootlin.com>
Date: Mon, 14 Mar 2022 22:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] Update documentation for Python packaging changes
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, docs@lists.yoctoproject.org
References: <20220314170750.1858689-1-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220314170750.1858689-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Mar 2022 21:50:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2604

Hi Ross,

On 3/14/22 18:07, Ross Burton wrote:
> A number of classes and variables have been renamed, so update the
> documentation as needed.


Many thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


