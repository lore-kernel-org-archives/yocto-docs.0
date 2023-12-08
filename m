Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C87C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 08:19:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.15815.1702023543297462505
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Dec 2023 00:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eBaimDa/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1C3420003;
	Fri,  8 Dec 2023 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702023541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FqgbDIS6PcP+U79PxFjqdo4zrwUdt+/zGwMBrcjYtps=;
	b=eBaimDa/1/ontv9p/eCR2oZQNaFQRxJ5KXWWyXBWAmwv/upJDC6XG4C6P3GLs6uwNwXJtx
	NU9y2/0aIj0yKXkPKmqyC3nHJBNCnCdPeXYS6hviUk7oRLSEU1tcBs/TQ1eVP5I1lKNjMK
	AO044ElLlRu1i0VQj4OFoAdhT0gNLOAzOzBxQshEwbxXkKCF8cP7urOaFgdAmItCmlRmRA
	hceO2tZL/q0ufF5JP4JwdifoYDMkk3Cv5kf0QNr+sSHXtdhhhrrJ/e8pHfQuDj79CrmFy4
	klcuacFJ6lgmPCg46a2rb2z5Y5EZgxJgT+wmbzqk76Rha+HYLeEO7rhxC1JKdw==
Message-ID: <def95fe3-0675-4deb-82be-4f9e47c5ba67@bootlin.com>
Date: Fri, 8 Dec 2023 09:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH v2] manuals: document minidebuginfo
Content-Language: en-US
To: ecordonnier@snap.com
References: <20231207140828.3201054-1-ecordonnier@snap.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231207140828.3201054-1-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Dec 2023 08:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4670

Hi Etienne,

Many thanks for your contribution. Happy to learn about MiniDebugInfo!

See my comments below, mostly about formatting issues. I could fix it by 
myself if you lack time, but this way you know this for future patches :)

On 07.12.23 at 15:08, Etienne Cordonnier via lists.yoctoproject.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>   documentation/dev-manual/debugging.rst | 15 +++++++++++++++
>   documentation/ref-manual/features.rst  |  3 +++
>   2 files changed, 18 insertions(+)
>
> diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
> index fea2cb30a..12694b01b 100644
> --- a/documentation/dev-manual/debugging.rst
> +++ b/documentation/dev-manual/debugging.rst
> @@ -1173,6 +1173,21 @@ To support this kind of debugging, you need do the following:
>      Consider that this will reduce the application's performance and is
>      recommended only for debugging purposes.
>   
> +Enabling Minidebuginfo
> +======================
> +
> +Enabling the DISTRO_FEATURES minidebuginfo adds a compressed ELF section ".gnu_debugdata"


Use :term:`DISTRO_FEATURES`
and ``.gnu_debugdata``

> +to all binary files, containing only function names, and thus increasing the size of the
> +binaries only by 5 to 10%. For comparison, full debug symbols can be 10 times as big as
> +a stripped binary, and it is thus not always possible to deploy full debug symbols.
> +Minidebuginfo data allows, on the one side, to retrieve a call-stack using
> +gdb (command backtrace) without deploying full debug-symbols to the target. It also


Use ``gdb`` (to refer to the command) or GDB (to refer to the program) 
as in other parts of the manual.

Replace "debug-symbols" by "debugging symbols"?

> +allows to retrieve a symbolicated call-stack when using systemd-coredump to manage


Use ``systemd-coredump``

> +coredumps (commands "coredumpctl list" and "coredumpctl info").

Use ``coredumpctl list`` and ``coredumpctl info``

> +
> +This feature was created by Fedora, see https://fedoraproject.org/wiki/Features/MiniDebugInfo for
> +more details.
> +
>   Other Debugging Tips
>   ====================
>   
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index dd14339bc..1320c3a58 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -161,6 +161,9 @@ metadata, as extra layers can define their own:
>   -  *keyboard:* Include keyboard support (e.g. keymaps will be loaded
>      during boot).
>   
> +-  *minidebuginfo:* Add minimal debug symbols :ref:`(minidebuginfo)<dev-manual/debugging:enabling minidebuginfo>`


Use "debugging symbols" as in the change above?

> +   to binary files containing, allowing coredumpctl and gdb to show symbolicated stack traces.


Use ``coredumpctl`` and ``gdb``.
Thanks again
Cheers
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


