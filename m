Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6A6C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 15:17:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.1171.1635866227639310391
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 08:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C6003FF809;
	Tue,  2 Nov 2021 15:17:05 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] ref-manual: improve documentation for
 SDKMACHINE
To: Ross Burton <ross@burtonini.com>, docs@lists.yoctoproject.org
References: <20211102125026.2425438-1-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <624ba8c0-f01d-877c-5a60-29709fe0d9e6@bootlin.com>
Date: Tue, 2 Nov 2021 16:17:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102125026.2425438-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 15:17:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2066

Hi Ross,

On 11/2/21 1:50 PM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/ref-manual/variables.rst | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index b9e97719b..9eea8081c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6756,17 +6756,15 @@ system and gives an overview of their function and contents.
>           $ bitbake -c populate_sdk imagename
>  
>     :term:`SDKMACHINE`
> -      The machine for which the SDK is built. In other words, the SDK is
> -      built such that it runs on the target you specify with the
> -      :term:`SDKMACHINE` value. The value points to a corresponding ``.conf``
> -      file under ``conf/machine-sdk/``.
> -
> -      You can use "i686" and "x86_64" as possible values for this variable.
> -      The variable defaults to "i686" and is set in the local.conf file in
> -      the Build Directory.
> -      ::
> -
> -         SDKMACHINE ?= "i686"
> +      The machine for which the SDK is built. In other words, the SDK is built
> +      such that it runs on the target you specify with the :term:`SDKMACHINE`
> +      value. The value points to a corresponding ``.conf`` file under
> +      ``conf/machine-sdk/`` in the enabled layers, for example ``aarch64``,
> +      ``i586``, ``i686``, ``ppc64``, ``ppc64le``, and ``x86_64`` are
> +      :oe_git:`available in OpenEmbedded-Core </openembedded-core/tree/meta/conf/machine-sdk>`.
> +
> +      The variable defaults to :term:`BUILD_ARCH` so that SDKs are built for the
> +      architecture of the build machine.
>  


Thanks for the updated patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
.... and merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


