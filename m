Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1119EC678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 11:10:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.12838.1677755445297483742
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 03:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IxBk0sS0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 950BFC0004;
	Thu,  2 Mar 2023 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677755443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnKIXRJW4peUstJZ1jgpGPpNTlaFQpi0l/0Op91UxfE=;
	b=IxBk0sS0pKalRp5guDUmV3HKOS8qgbJWK+diMLTq9hQJNjkiqXDjkRGlycjhj6ToE8cHXG
	W3fXsOHbgHHC6P9yCHdLemhluOtWduPe1uNy1PUcUisBa08aFagVNIFrArogiQb3VJEbiK
	OPgftcwPUMREZA+1GibHq9OuDqIiMfxhI+mj15kSietRktDolCHMkq4UBSuRuZ+W0ixCg5
	NX7n5CgEDNPPk6pim+L+TQzkLuwp8M7ViIRPKc6cHVlFb18EYcjBQ+CWh+FpDSbQBNR6yG
	SNqJJtafF6rQgIvHZBd4wH8++CyaGQnd5DIihr9Um7xwUobi1Rzi/k1/Jq9aZg==
Message-ID: <cef2e53b-7538-7e74-5568-f44af4292983@bootlin.com>
Date: Thu, 2 Mar 2023 12:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 1/1] ref-manual: Add info on "mixin" layers
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>
References: <20230301164815.208527-1-yoann.congal@smile.fr>
 <20230301164815.208527-2-yoann.congal@smile.fr>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230301164815.208527-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Mar 2023 11:10:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3772

Hi Yoann,

Many thanks for the update!

On 01.03.23 at 17:48, Yoann Congal wrote:
> This is heavily inspired from:
> https://wiki.yoctoproject.org/wiki/index.php?title=Stable_Release_and_LTS&oldid=84847#LTS_.E2.80.9CMixin.E2.80.9D_repositories
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   documentation/ref-manual/release-process.rst | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
> index 19e804063..fa057e055 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -97,6 +97,23 @@ through the same release process as do point releases. You can find more
>   information about stable branch maintenance at
>   :yocto_wiki:`/Stable_branch_maintenance`.
>   
> +.. note::
> +
> +   In some circumstances, a layer can be created by the community in order to
> +   add a specific feature or support a new version of some package for an LTS
> +   release.  This is called a "mixin" layer. These are thin and specific
> +   purpose layers which can be stacked with an LTS release to "mix" a specific
> +   feature into that build. These are created on an as-needed basis and
> +   maintained by the people who need them.
> +
> +   Policies on testing these layers depend on how widespread their usage is and
> +   determined on a case-by-case basis. You can find some "mixin" layers in the
> +   :yocto_git:`meta-lts-mixins </meta-lts-mixins>` repository. While the Yocto
> +   Project provides hosting for those repositories, it does not provides
> +   testing on them. Other "mixin" layers may be released elsewhere by the wider
> +   community.
> +
> +


Perfect.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


