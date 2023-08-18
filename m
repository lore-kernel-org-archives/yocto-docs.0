Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84900C001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 09:43:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.7885.1692351830630829773
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 02:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LIRMrnNy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 972F01C000B;
	Fri, 18 Aug 2023 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692351828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pI0KCHckkbz34F4hJzLLTzoDLPh+LQSDZOEBu/MLyyM=;
	b=LIRMrnNyQvH9z6MNcFeBpXC7IVVJxV1bx7yfPZJDMdvfSgizp/5H3rx/9RIxzOncaJ5+dP
	Qlsm8BXRkXDkcCxCXMarj6iOR7NEAJapOBl28YmwolnMYJmjX2v9czyoTDoNpcBQEJlEHx
	2x3mF/3lgRfSpJfPAJ5cSqqJI5uWq0iot44fb0JT4ya8Wl+D5BOeaNufkR+Xn5++KWfuAA
	lPD/2TQoDozGegTYCLRHJr+CKveryw5NqLn8oqIlxAQTsybeTg4DDWNB/1XxxlgaoKPomw
	J81MxNl7ngHxI8RJrzQWAdKRBntGdn0UaA7zKXFO/UKbGk+qA/KlSUI9mSjMaw==
Message-ID: <f8f30927-8b62-a73c-4476-025da04925a5@bootlin.com>
Date: Fri, 18 Aug 2023 11:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/5] Add packagefeed class documentation.
Content-Language: en-US
To: Charlie Johnston <charlie.johnston@ni.com>
References: <20230817155143.2578874-1-charlie.johnston@ni.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230817155143.2578874-1-charlie.johnston@ni.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 09:43:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4164

Hi Charlie

On 17.08.23 at 17:50, Charlie Johnston wrote:
> Alongside adding the new packagefeed recipe class to oe-core, the documentation needs updated as well.
> This patchset adds documentation for the new class, task, and variables and then updates existing
> references to the package-index task and package feeds as applicable.
>
> Patch set was tested via a local build to confirm no warnings or errors and hand-tested in a browsers
> to ensure proper formatting.
>
> As mentioned above, this patch set is dependent on the oe-core patchset being accepted.


Many thanks for these great updates!
There were just 3 trailing whitespaces in Patch 1, but everything looks 
good.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

No need to update. I fixed the whitespaces in my branch. Unless a new 
iteration is necessary.
Don't hesitate to ping me when your changes make it to openembedded-core.

Thanks again,
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


