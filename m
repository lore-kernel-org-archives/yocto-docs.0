Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06251C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 16:47:17 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by mx.groups.io with SMTP id smtpd.web09.30.1664988430708926468
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 09:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ONkUj2mY;
 spf=pass (domain: bootlin.com, ip: 217.70.178.240,
 mailfrom: michael.opdenacker@bootlin.com)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C9EB9C1357
	for <docs@lists.yoctoproject.org>; Wed,  5 Oct 2022 16:42:35 +0000 (UTC)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F201C2000B;
	Wed,  5 Oct 2022 16:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664988152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoCRaIj5v5uM7GArKBzqNURwdr9ArHGGOb8GaZ2Bss8=;
	b=ONkUj2mYjBMKVAF5ULExFXNgLFPnn/ZC2eF7ZNhERQAMEGvcCLv7RSvHU4erk3LHHe+Ir8
	1YXwrMfEs3tpatM+chnaPqFBQ4DlTU1NTHuU5OUJUnW+tLfkZN8ZQSFUxvJJEnI5+4D8jr
	V8qMDmlYNF1ixyvGh1/CNraTAFq1rJrV4jgvsDTZP8l9QjcQG6KOahMQWn4jzXuCWra6Cx
	qeC3HiuU9ZDlXejVa7aQ5anWlf5B+QK5HEg8piIFzmxVvzu/plApa5xyO4lG80Y8UYWVrp
	DVZU3AcACJeU4+OPRwrFjvO50T/nFKCg4zWoB22TuoJrwip4nhJGB5igUdYjdg==
Message-ID: <7997dacc-7ce4-abb0-783a-3f0d1837f4b3@bootlin.com>
Date: Wed, 5 Oct 2022 18:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v4 2/5] classes.rst: document
 openssl-native.bbclass
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20221005093007.326744-1-mikko.rapeli@linaro.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221005093007.326744-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Oct 2022 16:47:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3285

Mikko, Quentin,


Thanks for the patch and documentation review.
Indeed, it's great to get documentation updates together with the code.

On 05.10.22 11:30, Mikko Rapeli wrote:
> It sets various environment variables correctly for openssl-native.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/ref-manual/classes.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> v4: updated to :ref: syntax and simplified text
>
> v3: no changes
>
> v2: moved doc changes to separate patch
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 11e0d472e8..8a10e51eb7 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1672,6 +1672,16 @@ one such example. However, being aware of this class can reduce the
>   proliferation of different versions of similar classes across multiple
>   layers.
>   
> +.. _ref-classes-openssl-native:
> +
> +``openssl-native.bbclass``
> +==================


Oops, here Sphinx complains that you don't have enough "=" characters to 
match the title length:
/home/mike/work/git/git.yoctoproject.org/yocto-docs/documentation/ref-manual/classes.rst:1678: 
WARNING: Title underline too short.

Fixed.

> +
> +The :ref:`openssl-native <ref-classes-openssl-native>` class supports using
> +the native version of ``openssl`` built by the Yocto Project instead of the
> +one provided by the build host distribution. For full certificate checking
> +users should also add ``ca-certificates-native`` to :term:`DEPENDS`.
> +
>   .. _ref-classes-overlayfs:


Looks good to me otherwise.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

... and waiting for the corresponding patches to be merged in OE-core 
before merging the change in the documentation.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


