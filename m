Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9831CC43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 10:16:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.39723.1656324975695276696
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 03:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ibC0ke08;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6C748240012;
	Mon, 27 Jun 2022 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656324973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2k+AWTCM+vv06KA6k/uv3bQER1ktTieXKIugSjdWlE=;
	b=ibC0ke08MWsmTomUAJ+iQKtkqpCzS2cKORLXb9y29HzlHQwSBHjKbqr218yly3lh3Zz5aT
	ze66A1pvff/9GDIDKQEstjXJmLNjnmcHDb+McGqBRuF6JNjOvWGrqD+LyU6BoUFRIYfSaD
	JLyiffmmJK8jTHCMKv4sJ/yoRILF38dlWzf7sFZ5kyCvqOuDOQ9ckXt8cTam+qgRx1TZTN
	CdHdP12ALRxrWB2Cp7gaTXFxXPERorJIOdT8q4PWshnK9xdF2Hc+G/RWdknQJ/7hWcCe70
	2sQ7nFVvzBB7B+VOSqcl6T+rIhG0Xk6A4J/Vf43kb0rHX2xIEGrIUEjeRCpSEw==
Message-ID: <c6bd958f-ea49-4023-7807-fa8a89f785a2@bootlin.com>
Date: Mon, 27 Jun 2022 12:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] ref-manual: Add documentation for
 INCOMPATIBLE_LICENSE_EXCEPTIONS
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 docs@lists.yoctoproject.org
References: <20220625161346.31894-1-pkj@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220625161346.31894-1-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jun 2022 10:16:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3032

Hi Peter,

On 6/25/22 18:13, Peter Kjellerstedt wrote:
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   documentation/migration-guides/migration-4.0.rst | 2 +-
>   documentation/ref-manual/variables.rst           | 8 ++++++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
> index a8e6b4c331..79e53f89ac 100644
> --- a/documentation/migration-guides/migration-4.0.rst
> +++ b/documentation/migration-guides/migration-4.0.rst
> @@ -45,7 +45,7 @@ The following variables have changed their names:
>   - ``SSTATE_DUPWHITELIST`` became ``SSTATE_ALLOW_OVERLAP_FILES``
>   - ``SYSROOT_DIRS_BLACKLIST`` became :term:`SYSROOT_DIRS_IGNORE`
>   - ``UNKNOWN_CONFIGURE_WHITELIST`` became :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
> -- ``WHITELIST_<license>`` became ``INCOMPATIBLE_LICENSE_EXCEPTIONS``
> +- ``WHITELIST_<license>`` became :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
>   
>   In addition, ``BB_STAMP_WHITELIST``, ``BB_STAMP_POLICY``, ``INHERIT_BLACKLIST``,
>   ``TUNEABI``, ``TUNEABI_WHITELIST``, and ``TUNEABI_OVERRIDE`` have been removed.
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 28267101d8..e471d4fe12 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3544,6 +3544,14 @@ system and gives an overview of their function and contents.
>            remove dependencies on or provide alternatives to components that
>            are required to produce a functional system image.
>   
> +   :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
> +      Specifies a space-separated list of package and license pairs that
> +      are allowed to be used even if the license is specified in
> +      :term:`INCOMPATIBLE_LICENSE`. The package and license pairs are
> +      separated using a colon. Example::
> +
> +         INCOMPATIBLE_LICENSE_EXCEPTIONS = "gdbserver:GPL-3.0-only gdbserver:LGPL-3.0-only"
> +
>      :term:`INHERIT`
>         Causes the named class or classes to be inherited globally. Anonymous
>         functions in the class or classes are not executed for the base


Many thanks for the patch. Good catch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next for inclusion in master soon.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


