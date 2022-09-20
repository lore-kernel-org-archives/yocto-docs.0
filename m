Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53D3C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 08:13:06 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9270.1663661576088823961
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 01:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d8WLvnPN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2B50040003;
	Tue, 20 Sep 2022 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0XyNSyVr5+2uvNV/5tSsZW9ulCiLHVOSCFoY9nntHQ=;
	b=d8WLvnPN0MI8K/ofaOqBaoFxKyyxlmJhe8/bXl2WLPgByOC9VmnERTE8WVKCESbOHKxZO3
	/pGfN9U6zN7fFPbQawKsNfqSC05pEvrq/QWxhNdk52NqCP4Iga3rmzg6mXTVcKktZvOIM3
	coW+3dusCnQeLTFEBGB7m5jUAF/8YFGYSsq2TA/Io7vRTUEpNQxDw7aKllC6dudXhPJMNd
	8tszKFzn4eK3sSzYZoJ44+B4na10JneBIjz+KpT9qmoJhQ/PmEnfTEQd3kRnDrupX+ljWf
	vKyXPliz2rePiLDVhze8Qx7oTpOLfBZ7HqnrcE7EvLNSgyGssHZNvrSU6V23RA==
Message-ID: <cab69782-69f6-14f5-7a13-d9016432328c@bootlin.com>
Date: Tue, 20 Sep 2022 09:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [doc][PATCH v3 2/2] kernel-dev/common.rst: remove
 SRC_URI:append from examples
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>, docs@lists.yoctoproject.org
References: <20220920074548.17466-1-mikko.rapeli@linaro.org>
 <20220920074548.17466-2-mikko.rapeli@linaro.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220920074548.17466-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 08:13:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3183

Hello Mikko

On 9/20/22 08:45, Mikko Rapeli wrote:
> It's better to use SRC_URI += to append patches etc. If anything
> is added via :append, that can only be removed with :remove which
> makes the changes rather permanent compared to light weight +=
> amendmends.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/kernel-dev/common.rst | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> index 16ef6453bd..fb8d7cd029 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -360,9 +360,9 @@ home directory:
>   
>         FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>   
> -      SRC_URI:append = " file://patch-file-one.patch"
> -      SRC_URI:append = " file://patch-file-two.patch"
> -      SRC_URI:append = " file://patch-file-three.patch"
> +      SRC_URI += "file://patch-file-one.patch"
> +      SRC_URI += "file://patch-file-two.patch"
> +      SRC_URI += "file://patch-file-three.patch"
>   
>      The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
>      enable the OpenEmbedded build system to find patch files. For more
> @@ -1002,7 +1002,7 @@ Section.
>      contents::
>   
>         FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> -      SRC_URI:append = " file://0001-calibrate.c-Added-some-printk-statements.patch"
> +      SRC_URI += "file://0001-calibrate.c-Added-some-printk-statements.patch"
>   
>      The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
>      enable the OpenEmbedded build system to find the patch file.
> @@ -1875,7 +1875,7 @@ build.
>   2. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
>      recipe's :term:`SRC_URI` statement::
>   
> -      SRC_URI:append = " file://test.scc"
> +      SRC_URI += "file://test.scc"
>   
>      The leading space before the path is important as the path is
>      appended to the existing path.
> @@ -1884,7 +1884,7 @@ build.
>      :term:`KERNEL_FEATURES` statement to specify the feature as a kernel
>      feature::
>   
> -      KERNEL_FEATURES:append = " test.scc"
> +      KERNEL_FEATURES += "test.scc"
>   
>      The OpenEmbedded build
>      system processes the kernel feature when it builds the kernel.


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next too.

Will you send further commit message updates to the other patches in 
these series?

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


