Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1B3C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 16:58:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.51660.1669395523545162995
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Nov 2022 08:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gJoa3ZiV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 52D1E1C0005;
	Fri, 25 Nov 2022 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669395521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7j+PkR4puLc4kZR4SLKujU1mvXFBUQP0Bk5vbgvtiQQ=;
	b=gJoa3ZiV+T3Z1JzSb8ZZCPyqAdl3/z+1OfiBphWZPva9c9maq8gzbpyQGVsOtpaOnTHrBT
	NcroJzREPXyYo+50ypSs1L4JuZh07daU8g/M53HASgnOVkwQTh6GgYM/vatROYw1AGJXOk
	mFFD5WSJgtd0bA6odbjbOPLlLZjx6Mdsp6c2cUQ0ygHIrW5IidF8luCvyZav2IPnEfQXhT
	7CoPUfGhx3IcxAyHOcfPGRkL6Uo6Qy9sBoUdJYrLOtOcVupreJeFiY/yrpBzmBVV3m0HZ0
	z+Xut4H/2/elXPpLkJdDV1C15BmQvENBbdK/pgWXOblzDoBKR/NbkigmKTJ5Fg==
Message-ID: <33d15962-aa85-0229-ee59-d0badedd3fb5@bootlin.com>
Date: Fri, 25 Nov 2022 17:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [patch v2] migration-guides: add release-notes for 4.1.1
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20221125100105.1646449-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221125100105.1646449-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Nov 2022 16:58:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3508

Hi Lee,

On 11/25/22 11:01, Lee Chee Yang wrote:
> +
> +yocto-docs
> +
> +-  Repository Location: :yocto_git:`/yocto-docs`
> +-  Branch: :yocto_git:`langdale </yocto-docs/log/?h=langdale>`
> +-  Tag: :yocto_git:`yocto-4.1.1 </yocto-docs/log/?h=yocto-4.1.1>`
> +-  Git Revision: :yocto_git:`8e0841c3418caa227c66a60327db09dfbe72054a </yocto-docs/commit/?id=8e0841c3418caa227c66a60327db09dfbe72054a>`

Many thanks for the patch (and for the release!!!) and for having used 
the ":oe_git:" and ":yocto_git:" macros for the last section.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


