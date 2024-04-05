Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EEAC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:04:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.14710.1712329491803859446
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 08:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=crfPaRDU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F4D240008;
	Fri,  5 Apr 2024 15:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712329490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/BTX2ddYlXos3EAnZpvEkwWNDWLfq7WyrPe46gKqOkM=;
	b=crfPaRDU6C33JZwjdf4NUXQ8vop0vib8ppyAlFydXYcE3H5oFGl6AoyVPkkUi5W01EtPjH
	zfQg2ou70KhMsckpJppuWL0LnwWviSqNA9hkheeIy9VxCVIdfUYJGOSbAYhu4OOHuXagEt
	qupHdAdEBRsznVXZxJHgcSBHz3r2wHrFk4Huk4AINH7xen9TlwSEncF5Js8CnlDaoE+iY2
	1dQMqjV4lluHiv8da+a3TYDm62vTwTFuC29wYE/qCfsnLBmXKBB4bFTD5pRBwvR7UIc67D
	zmwEseiKuK/I9ln8Ymo8VcG5rMj3z99efS56IVB7QMTh+V8r5qC9rU+QUHpzlA==
Message-ID: <01284350-4414-4632-a676-adc35127d702@bootlin.com>
Date: Fri, 5 Apr 2024 17:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v1 6/6] migration: replace dashes by colons
To: joaomarcos.costa@bootlin.com
References: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
 <20240405143453.2281900-7-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240405143453.2281900-7-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 15:04:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5082

Hi João,

On 4/5/24 at 16:34, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.0.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
> index 301b7a3d2..888a1c60d 100644
> --- a/documentation/migration-guides/migration-5.0.rst
> +++ b/documentation/migration-guides/migration-5.0.rst
> @@ -90,11 +90,11 @@ Removed variables
>   The following variables have been removed:
>   
>   -  ``DEPLOY_DIR_TAR``.
> --  ``PYTHON_PN`` - Python 2 has been removed, leaving Python 3 as the sole
> +-  ``PYTHON_PN``: Python 2 has been removed, leaving Python 3 as the sole
>      major version. Therefore, an abstraction to differentiate both versions is
>      no longer needed.
>   -  ``oldincludedir``.
> --  ``USE_L10N`` - previously deprecated, and now removed.
> +-  ``USE_L10N``: previously deprecated, and now removed.
>   -  ``CVE_SOCKET_TIMEOUT``.
>   
>   .. _migration-5.0-removed-recipes:

Thanks, but don't show us your fixes to your own code. In the git 
history, we want only "clean" commits whenever possible.

You should squash 4/6 and 6/6 into 1/6.

Actually, your commits could all be grouped into a single one, as they 
touch the same file. It's better not to have too many commits.

Except for 5/6, I'll take care of squashing it into the commit it fixes.
So, rebase your changes against master-next in a few minutes.

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


