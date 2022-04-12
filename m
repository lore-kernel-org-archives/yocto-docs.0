Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B8AC48BCD
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.8157.1649749574733659634
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Apr 2022 00:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iUo5rUEh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4DFCA1C001A;
	Tue, 12 Apr 2022 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649749572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmMG0mRkj4cy0kDUjWbj3iRdB34bHjCZhmQVcdn4eI4=;
	b=iUo5rUEh5s83q8oIZjHchAHPs+d04La30pUBroXO526FJQqP9L0lERy+7o/iBbZokuZU69
	0rzKNB6EHNP+s0wzTPkyskPBoS6z9XnfcTcH9Uyv7uXEfNwUEjcpcnsM+k01zQe4hvXltA
	r+gef0sB9OdBzqUrBfVSPil4E0d/tpl90MxqK3VPXvDCJDYSpaW6+P7U6d3HU1JO2j1O5k
	uMw/wx7B6deU4JVzscxitWCqcXR+D8LJGEttJneMgOaFJTwhRncVArLNuuBJ8eg4YCVets
	J6iA1fPBSJYsSYX5loP23q0czEwAN4WszVhTzyNZpN+nTKLG0Be/NiH5K1FXvQ==
Message-ID: <261d22da-6ed8-f789-caf7-8d618abd565c@bootlin.com>
Date: Tue, 12 Apr 2022 09:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH] migration-guide: Kirkstone is now 4.0
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220411111724.2076095-1-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220411111724.2076095-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Apr 2022 16:46:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2760

Hi Richard

On 4/11/22 13:17, Richard Purdie wrote:
> Update the docs to reflect that kirkstone is 4.0, not 3.5.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/migration-guides/index.rst           |  2 +-
>  .../{migration-3.5.rst => migration-4.0.rst}       |  4 ++--
>  rename documentation/migration-guides/{migration-3.5.rst => migration-4.0.rst} (98%)
>
> diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
> index d45ba31e7..20c6ab9d4 100644
> --- a/documentation/migration-guides/index.rst
> +++ b/documentation/migration-guides/index.rst
> @@ -12,7 +12,7 @@ to move to one release of the Yocto Project from the previous one.
>  .. toctree::
>  
>     migration-general
> -   migration-3.5
> +   migration-4.0
>     migration-3.4
>     migration-3.3
>     migration-3.2
> diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-4.0.rst
> similarity index 98%
> rename from documentation/migration-guides/migration-3.5.rst
> rename to documentation/migration-guides/migration-4.0.rst
> index 8a4c56874..202999ece 100644
> --- a/documentation/migration-guides/migration-3.5.rst
> +++ b/documentation/migration-guides/migration-4.0.rst
> @@ -1,8 +1,8 @@
> -Release 3.5 (kirkstone)
> +Release 4.0 (kirkstone)
>  =======================
>  
>  This section provides migration information for moving to the Yocto
> -Project 3.5 Release (codename "kirkstone") from the prior release.
> +Project 4.0 Release (codename "kirkstone") from the prior release.
>  
>  Recipe changes
>  --------------


Thank you for the patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next"

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


