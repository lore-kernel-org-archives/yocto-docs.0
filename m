Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A82FC3527B
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.30643.1650898850509598701
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 08:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kA0ix3Ex;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 07E311C000A;
	Mon, 25 Apr 2022 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650898847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bpasL/er7HHuruQc6ftgDF7l5Z+Q/rbaFd1nFLFDZdY=;
	b=kA0ix3ExQkHFlyCgnMWpzIeheMJr0/+PL2FVUbSzk3Mye+r5brMd6T8AADQQOgqiJU6EQe
	+hz+k2tDzOjbk9PX2gl/9Z00u0o7YDnCxXVEEw+FNf0Ole/6hVvxy0ah3jclVcth2b3VNv
	8HifbQjjw6MAHW8FvzkFx2CxWd0XOYMeFHuM9ltXy/tvWN7Dd27IzH1cNrsvMhxNIZGrVv
	dobcUPOWgNZDWjuCU7oHytYnYwue2ECnl+RHQyPyt5dwEPSEs4rOec2YLEraeS8j+bhGiI
	ZlI8RHFNT7jLXgExtZ1xF9MpXz4eoIz1vckYVQWT4iJ5IkCKH3qChqbPnRucTQ==
Message-ID: <f2c79713-d6e6-37a2-7f67-575cf935111a@bootlin.com>
Date: Mon, 25 Apr 2022 17:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
 shivams@gmail.com, john.kaldas.enpj@gmail.com
Subject: Re: [docs][PATCH V3] Improvements for gdbserver configuration
Content-Language: en-US
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>, docs@lists.yoctoproject.org
References: <20220419114548.12921-1-sundeep.kokkonda@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220419114548.12921-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2858

Hi Sundeep,

Many thanks for the patch and the updates!

On 4/19/22 13:45, Sundeep KOKKONDA wrote:
> [Yocto #13722]
> The Yocto bug reports a few improvements in the gdbserver configuration which improves the configuration of gdb more easier for novice users.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 9d4aaa5a6..5c4f0028a 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -10181,6 +10181,7 @@ debugger.
>     an image recipe::
>  
>        IMAGE_INSTALL:append = " gdbserver"
> +      EXTRA_IMAGE_FEATURES:append = " tools-debug"


Isn't the EXTRA_IMAGE_FEATURES setting sufficient here? If I understand
correctly, you should remove the "IMAGE_INSTALL" setting and then remove
the "or in an image recipe:" text, because EXTRA_IMAGE_FEATURES is meant
to be used in a configuration file.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


