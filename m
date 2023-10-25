Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F34C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 10:04:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.40076.1698228292638984609
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 03:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dShpwAJ3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EE3360007;
	Wed, 25 Oct 2023 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698228290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IjnpaF748VhRmWbNcdUZoo/vQcd6nztDMKais4qYpYo=;
	b=dShpwAJ3wbWX+ADaqXNnIm2ipUScscJb4vukVoG8QdtyWnd0Q6VMA5vfl0btmuvV36vbYV
	BbiTJdg7gQvF2EI4haFO0zQ96BUTnpoS4SNIHRrXCgscBsXbIxcl2fqVB5va2SgE+wn61g
	A8a56zKfFyYUHer34TBpyq38wfre8KxLgday+I3KQCca2uQIcpwCrXojyq1Psq8QJYBUHt
	xaUle+K8s8iDJs1sxAexXSfZ6XAF9irJq6srqFZzEiokd7QeoBYB4HnZijOxQyeeUh/Hg4
	0n2ArK8bqK2zuXBmqNmAnICwOlkoF45m5DQlZC2OgFlHZmSNHYRpjgIJRRgnBA==
Message-ID: <81e73703-c821-49aa-b555-565da895de10@bootlin.com>
Date: Wed, 25 Oct 2023 12:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: add systemd-resolved to distro
 features
Content-Language: en-US
To: eero.aaltonen@vaisala.com
References: <20231024182824.50108-1-eero.aaltonen@vaisala.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231024182824.50108-1-eero.aaltonen@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Oct 2023 10:04:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4495

Hi Eero,

On 24.10.23 at 20:28, Eero Aaltonen via lists.yoctoproject.org wrote:
> From: Eero Aaltonen <eero.aaltonen@vaisala.com>
>
> systemd-resolved is a distro feature added in poky commit
> 6f30e3586eb1b8e853cf23dd039f258d0dc0bc6b
>
> Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
> ---
>   documentation/ref-manual/features.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index d6307f1a2..eb210bb7b 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -225,6 +225,10 @@ metadata, as extra layers can define their own:
>      reduced shell overhead, and other features. This ``init`` manager is
>      used by many distributions.
>   
> +-  *systemd-resolved:* Include support and use ``systemd-resolved`` as the
> +   main DNS name resolver in ``glibc`` Name Service Switch. This is a DNS
> +   resolver daemon from ``systemd``.
> +
>   -  *usbgadget:* Include USB Gadget Device support (for USB
>      networking/serial/storage).
>   


Many thanks for the documentation patch and the new code too!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.


Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


