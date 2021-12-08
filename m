Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE6EC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 15:19:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.13449.1638976769224626736
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 07:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6F21C40012;
	Wed,  8 Dec 2021 15:19:27 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: dev-manual: common-tasks: highlight creating
 your own layer is not required
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20211203173955.77512-1-foss@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c2972275-66cd-d72a-1912-632e03e3de66@bootlin.com>
Date: Wed, 8 Dec 2021 16:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211203173955.77512-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 15:19:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2232

Hi Quentin,

On 12/3/21 6:39 PM, Quentin Schulz wrote:
> Three's been some feedback saying that people actually missed that
> paragraph and thought creating the layer by hand was the only way to do
> it instead of leveraging bitbake-layers create-layer tool.
>
> Let's try to make it a bit more obvious one does not need to create the
> layer by hand by putting the paragraph into a note.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/dev-manual/common-tasks.rst | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 3eead147a..2f5a02f4c 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -24,15 +24,17 @@ section in the Yocto Project Overview and Concepts Manual.
>  Creating Your Own Layer
>  -----------------------
>  
> -It is very easy to create your own layers to use with the OpenEmbedded
> -build system, as the Yocto Project ships with tools that speed up creating
> -layers. This section describes the steps you perform by hand to create
> -layers so that you can better understand them. For information about the
> -layer-creation tools, see the
> -":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
> -section in the Yocto Project Board Support Package (BSP) Developer's
> -Guide and the ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
> -section further down in this manual.
> +.. note::
> +
> +   It is very easy to create your own layers to use with the OpenEmbedded
> +   build system, as the Yocto Project ships with tools that speed up creating
> +   layers. This section describes the steps you perform by hand to create
> +   layers so that you can better understand them. For information about the
> +   layer-creation tools, see the
> +   ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
> +   section in the Yocto Project Board Support Package (BSP) Developer's
> +   Guide and the ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
> +   section further down in this manual.
>  
>  Follow these general steps to create your layer without using tools:


Thanks for the patch. Good idea.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again
Michael.--

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


