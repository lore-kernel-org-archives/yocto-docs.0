Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC43C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 09:22:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12921.1702372958232132316
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Dec 2023 01:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZHwnWBNh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DBCCFF80F;
	Tue, 12 Dec 2023 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702372955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqOHhbmpESYJRw7Zz58fgK4ofOfXGjfydeXbZ17m1yQ=;
	b=ZHwnWBNhgMHuE7JDRf+hugr0ny8NigX65Swa7wsAc6qRbG2VEwpSDX5D1gAmDtUDiQF/Ft
	BSRv2VGU+FMkWWa9q7muRt8goRyW3tS04J2wiZy8ASZ7Pd4HrUEnfC+o/VCIUnFesJbXsX
	Juh15zz7H3/xjIKQBmYhC0u1zoRB++8bANuec6ENxM84KKeGRPKlih6Bo3EuBS8PYKGptQ
	jd7MrrCL6otvKoCagaYjLdM33liNoG3sWAp6yvsaYOOZ/eCh+XrlkinJgAaQk2hS4AcGIF
	O3jguoIBwa3AbYiLj84RvpP0eSSaD7kiRatj9ifr7exf56ofY+rKGlqgHMXXBg==
Message-ID: <f51875f0-4411-4e1b-af12-d8a0d9a2c5f9@bootlin.com>
Date: Tue, 12 Dec 2023 10:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH v3] manuals: document minidebuginfo
Content-Language: en-US
To: ecordonnier@snap.com
References: <20231211100141.504795-1-ecordonnier@snap.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231211100141.504795-1-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Dec 2023 09:22:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4676


On 11.12.23 at 11:01, Etienne Cordonnier via lists.yoctoproject.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>   documentation/dev-manual/debugging.rst | 15 +++++++++++++++
>   documentation/ref-manual/features.rst  |  3 +++
>   2 files changed, 18 insertions(+)


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Many thanks for the new version!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


