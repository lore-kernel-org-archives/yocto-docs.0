Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844D7C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 09:54:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.40591.1702893251052148859
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 01:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QVZJF1+b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70C456000B;
	Mon, 18 Dec 2023 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702893248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkZxgih6EyVZJfiQU43Q1XaWLNA4LFxwFBPyBJopIgg=;
	b=QVZJF1+boKNoSSHSxFzqNJp+FLe8UhOK7RBS+tsZIRFTePUUX0mdFDGUkVAhraaXgrI3za
	I1KaxY47xJ/iNRFYm613EKSe3EQ606u23RshGFhWMTP5WAXtL7a299LcMFpxjR+6Z+Y4Ha
	LvOUdVrGC91v9jsbxGBtPC+YXfesmE4h7Evd9Y7GBV/RGiOMBjHIxwanYzpGRiMwOkkU04
	tVgkBUHI+vSMGhVpuasjLNR2TO89Io8mbhRPXK7do3Ry4ERM5+caN0yG4HO+KqY0Hrelqx
	yUm5Ewin85SoJ84dK/Ydt68IyuNI+8eIFeuLUfGO/jHviGgm2Rus25szacB7nw==
Message-ID: <4e2e29ee-1006-47cc-97c5-ec83550b2765@bootlin.com>
Date: Mon, 18 Dec 2023 10:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: ypa.takayasu.ito@gmail.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.0.15
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20231218071724.2934824-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231218071724.2934824-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 09:54:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4682

Hi Lee

Many thanks for the new release notes!

Just one comment below...

On 18.12.23 at 08:17, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.15.rst | 189 ++++++++++++++++++
>   2 files changed, 190 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.15.rst
>
> diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
> index 748eab3bd..09fb8ca04 100644
> --- a/documentation/migration-guides/release-4.0.rst
> +++ b/documentation/migration-guides/release-4.0.rst
> @@ -21,3 +21,4 @@ Release 4.0 (kirkstone)
>      release-notes-4.0.12
>      release-notes-4.0.13
>      release-notes-4.0.14
> +   release-notes-4.0.15
> diff --git a/documentation/migration-guides/release-notes-4.0.15.rst b/documentation/migration-guides/release-notes-4.0.15.rst
> new file mode 100644
> index 000000000..301cc3f45
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.0.15.rst
> @@ -0,0 +1,189 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-4.0.15 (Kirkstone)
> +------------------------------------------
> +
> +Security Fixes in Yocto-4.0.15
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  avahi: Fix :cve:`2023-1981`, :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`, :cve:`2023-38472` and :cve:`2023-38473`
> +-  binutils: Fix :cve:`2022-47007`, :cve:`2022-47010` and :cve:`2022-48064`
> +-  bluez5: Fix :cve:`2023-45866`
> +-  ghostscript: Ignore GhostPCL :cve:`2023-38560`
> +-  gnutls: Fix :cve:`2023-5981`
> +-  go: Ignore :cve:`2023-45283` and :cve:`2023-45284`
> +-  grub: Fix :cve:`2023-4692` and :cve:`2023-4693`
> +-  gstreamer1.0-plugins-bad: Fix :cve_mitre:`2023-44429`
> +-  libsndfile: Fix :cve:`2022-33065`
> +-  libwebp: Fix :cve:`2023-4863`
> +-  openssl: Fix :cve:`2023-5678`
> +-  python3-cryptography: Fix :cve:`2023-49083`
> +-  qemu: Fix :cve:`2023-1544`
> +-  sudo: CVE-2023-42456 :cve_mitre:`2023-42465`

Oops, you forgot a ":cve:" macro here. Fixed.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


