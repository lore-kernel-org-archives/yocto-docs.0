Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49987C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 09:32:25 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.12980.1702373539415103953
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Dec 2023 01:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YAzA2R+c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90957C000A;
	Tue, 12 Dec 2023 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702373536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDz0Z90YN1iiTisXmi70XFXUzKN+huEEMtG+mZ7WarQ=;
	b=YAzA2R+cLuZBKmaGIIDmR0yLctxhDLOyr0vACKbWTTNzOsInMO2aO/EDDqElKcwIgm281b
	l1Jh6/k9qWV1hi2CJauLhbyGWZT3hD5SV6MWOOHqo7od4KJxXcd79R3dPRtqquf4eKwMbo
	5ldzylrMfKmd/3zbZM2iJWM4ClME/kKGxQbDbBPVoxemmELCn7mjAHOqJGEE8gmOd034ke
	s5FmhOiC0l80Vaji2970qLfkZFg5lCRReO6Y84jeCUjDljOekWI5FB3GWGVRg3Zkrw085B
	xTl7D2QEhTce4I2Oj84+7vUQkJzpdjWMEymErNJaleWmOusAX67t3k7oZR82AA==
Message-ID: <729fec73-76bd-4589-8f5c-017a924721a2@bootlin.com>
Date: Tue, 12 Dec 2023 10:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] release-notes-4.3.1: reword a fixes
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20231212013920.2725397-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231212013920.2725397-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Dec 2023 09:32:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4677

Hi Lee
Thanks for the update.

On 12.12.23 at 02:39, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> reword a fixes with to align with the final release notes.
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   documentation/migration-guides/release-notes-4.3.1.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/migration-guides/release-notes-4.3.1.rst b/documentation/migration-guides/release-notes-4.3.1.rst
> index 377cdb43f..cea9c538a 100644
> --- a/documentation/migration-guides/release-notes-4.3.1.rst
> +++ b/documentation/migration-guides/release-notes-4.3.1.rst
> @@ -19,7 +19,6 @@ Security Fixes in Yocto-4.3.1
>   Fixes in Yocto-4.3.1
>   ~~~~~~~~~~~~~~~~~~~~
>   
> --  Remove references to apm in :term:`MACHINE_FEATURES`
>   -  baremetal-helloworld: Pull in fix for race condition on x86-64
>   -  base: Ensure recipes using mercurial-native have certificates
>   -  bb-matrix-plot.sh: Show underscores correctly in labels
> @@ -54,6 +53,7 @@ Fixes in Yocto-4.3.1
>   -  machine: drop obsolete SERIAL_CONSOLES_CHECK
>   -  manuals: correct "yocto-linux" by "linux-yocto"
>   -  manuals: improve description of :term:`CVE_STATUS` and :term:`CVE_STATUS_GROUPS`
> +-  manuals: Remove references to apm in :term:`MACHINE_FEATURES`
>   -  manuals: update linux-yocto append examples
>   -  manuals: update list of supported machines
>   -  migration-4.3: additional migration items


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


