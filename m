Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEA7C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:24:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10344.1647613450781911829
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=asdZ+I6D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A9DF640004;
	Fri, 18 Mar 2022 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647613449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3jyZNDhUI01jcGuas8Spefvf3BSgW9qPkaC8l1Cngg=;
	b=asdZ+I6D10jK+N/8yVPh0CRSUHmzffhsD5vZiHkiTuCdQxOkIgrDmvnbtPs0aNiDu1i/p7
	o5qSKoA4OLCg5mZpQglCmqyLeywOmcNApNl9Walt+Ki7p+NR0f5ucucYk2k93RAgEqGbEF
	TJhNgT7yxAeiS5cOKAGgAaAHv3v2CdRIw5uLR/bowcehpoQP5xE8xJY8iQ+N/TAup983ks
	NFr35EfhluLjTvovnOOhaxWHCKAjaQMJ1kZwd20uz9PELRq6vFxjtuMfuWv2Q3yUhuAFa4
	ajEF/DlXpGsprxzOBrEl6b55/2W+bElSmhmQWmeuElyBgi8GWaGj/U9Vo1wXeQ==
Message-ID: <e4a525ea-5e2f-08f9-3f7e-5d7eb92faa05@bootlin.com>
Date: Fri, 18 Mar 2022 15:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] poky.yaml: Drop POKYVERSION and YOCTO_POKY
 references
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220318120008.1061207-1-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220318120008.1061207-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:24:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2631

Hi Richard,

On 3/18/22 13:00, Richard Purdie wrote:
> We don't publish tarballs using this version any more, it has been
> removed everywhere. Remove the obsolete references in the docs,
> adapting references accordingly. The tarballs now are just created
> with their sha256 checksum which we don't want or need to reference
> in the docs.


Thanks for the welcome simplification!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


