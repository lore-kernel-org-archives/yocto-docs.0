Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA980C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 08:53:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.9991.1654592036054884657
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 01:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F53Rb8ih;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3711160010;
	Tue,  7 Jun 2022 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654592033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmRH9EEPPL830S3RjcC2YbfMgfx9+Y8cegQTUYqqpfM=;
	b=F53Rb8ihnnBgki8kftfMGv3Za9zsEyLkZYNK2FIonh43Iik6yt2R/DTkbzpSjyhY+B61bs
	+oktQCkKX6BvK/z9L+wqGWXB3Qhuy8yJ+OTudGACk2ZoQY5a9Or5eownjM/yAXakuAEICs
	gjTg8/IKycmVO91eKU6suCVJ5IJxRnRxZziCCRrD9TKnvR1xtif8sHxf15LNA0RKFYYeTB
	e6KMSanMJ8Cmu10n6J1/KNEmqPV37X888QMCBUV/hXah5VnXzp3H8dA3s9bHayqCSfxeeY
	oaT3jdxgqRKHzrL0dQbOP0B4A62L6cFkSMME322QS6uulNiHSKYn182mlX2F/Q==
Message-ID: <2bc6854a-25c4-f3c3-95df-dcb55b0835f8@bootlin.com>
Date: Tue, 7 Jun 2022 10:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [yocto] [PATCH v2 1/2] manuals: SYSTEMD_SERVICE allows multiple
 services
Content-Language: en-US
To: Paulo Neves <ptsneves@gmail.com>, yocto@lists.yoctoproject.org
References: <20220603163521.146659-1-ptsneves@gmail.com>
 <20220607084254.2694011-1-ptsneves@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220607084254.2694011-1-ptsneves@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Jun 2022 08:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2967


On 6/7/22 10:42, Paulo Neves wrote:
> State that SYSTEMD_SERVICE allows for multiple space
> separated systemd services
>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 367b4674e..42178d556 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7656,6 +7656,8 @@ system and gives an overview of their function and contents.
>        When inheriting the :ref:`systemd <ref-classes-systemd>` class,
>        this variable specifies the systemd service name for a package.
>  
> +      Multiple services can be specified, each one separated by a space.
> +
>        When you specify this file in your recipe, use a package name
>        override to indicate the package to which the value applies. Here is
>        an example from the connman recipe::


Merged into master-next too.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


