Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB3CCD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 18:02:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.45580.1712253754412753394
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 11:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dwo4QSEI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35E4060006;
	Thu,  4 Apr 2024 18:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712253752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3bJ+31hRQ8S0HeR+7+eDx8DKfZPUUV7iOSiwiks+ao=;
	b=dwo4QSEInumJ60rMTCSCk6/HIhPZ86OsWmqTMjBrig7G0CpFOjHmMzuNrCe0bBSbzkWkvM
	os4pGePI7XK55N1W+jCijVzIuF83yJ+LUeymMTgQflhG3HeJYVJ6WUMqNNdHjN/r/NB4CW
	rNMiB2Hwz014rNAAssK8Kq56ROnWUZ71nGevc2K5b/R3TlZHZVyOLUZbcs51LzcfVG1LkZ
	oAn6aVeCX1Fyc3QkJlT9TkG8madscQOA1a4TB2YK2sCwHBvgyGj+rwlOeGokm/krjo+q7d
	3IjqSU9pGewz2QQMFJCi7jRmMbFyGS3Nv7FArq4EqiC4Nv3ZslJ6Maad2I3dhg==
Message-ID: <db48bf11-5de7-49bb-bdc6-84fbae40dd05@bootlin.com>
Date: Thu, 4 Apr 2024 20:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v1 4/5] migration: add Go language changes
To: joaomarcos.costa@bootlin.com
References: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
 <20240404165620.2248838-5-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240404165620.2248838-5-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Apr 2024 18:02:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5066

Hi João

On 4/4/24 at 18:56, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.0.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
> index a9075c298..302d7fe5a 100644
> --- a/documentation/migration-guides/migration-5.0.rst
> +++ b/documentation/migration-guides/migration-5.0.rst
> @@ -52,6 +52,10 @@ See :ref:`all supported distributions <system-requirements-supported-distros>`.
>   Go language changes
>   ~~~~~~~~~~~~~~~~~~~
>   
> +The ``linkmode`` flag was dropped from ``GO_LDFLAGS`` for
> +nativesdk/cross-canadian. Also, dynamic linking was disabled for the whole set

Did you mean ``nativesdk/cross-canadian``?
What was the commit?

> +of (previously) supported architectures in ``goarch`` class.


s/in ``goarch``/in the ``goarch``
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


