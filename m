Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3E1C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 14:06:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.9172.1675865211621621377
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 06:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Inp1HQgX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EF7E7E000E;
	Wed,  8 Feb 2023 14:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675865209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1S9prwmtzBeE6MVSQ1lghJtKlMlaTR4J4b3PzqEtV7c=;
	b=Inp1HQgXJ0K3vKF2OdII/aTkwwgbWno0sypgxjlSLa8pZgExFBcjQb+mXlMl3pN7EjN19l
	c/VaWiymZhWtnKM+c1r+i7XhXhQDNVTUYfEcDe2TPodVqr9xZaVgqkiZBeOGBhHOnuXrEA
	D3WLud6fEl54NOoUQz3cJM3h+Oe1R0uh8NBdeK6Vo6d3J+LD659LagmfpbDG6KUTD6Q9i5
	w7HXr9cHtZ9f/5d3fXv/CCyqtO5FZYfd7C66Kac8/9hktYwmcgHlQn/GSBtK8hoOGECTWv
	NvLBBJnUiC+H1ieLfFDGR+SDHg3LHccXmtmbDBztB0SYoAE9wbWbOgPmVF3Jhg==
Message-ID: <2bd947dc-102c-0a83-1de8-1e8870f2148a@bootlin.com>
Date: Wed, 8 Feb 2023 15:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release-notes for 4.0.7
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230205134830.808950-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230205134830.808950-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Feb 2023 14:06:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3645

Hi Lee

On 05.02.23 at 14:48, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.7.rst  | 241 ++++++++++++++++++
>   2 files changed, 242 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.7.rst


Thanks for the release notes!
See my comments below...

>
> diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
> index 8ca849883..87ba768a2 100644
> --- a/documentation/migration-guides/release-4.0.rst
> +++ b/documentation/migration-guides/release-4.0.rst
> @@ -13,3 +13,4 @@ Release 4.0 (kirkstone)
>      release-notes-4.0.4
>      release-notes-4.0.5
>      release-notes-4.0.6
> +   release-notes-4.0.7
> diff --git a/documentation/migration-guides/release-notes-4.0.7.rst b/documentation/migration-guides/release-notes-4.0.7.rst
> new file mode 100644
> index 000000000..3499ba3fa
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.0.7.rst
> @@ -0,0 +1,241 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-4.0.7 (Kirkstone)
> +-----------------------------------------
> +
> +Security Fixes in Yocto-4.0.7
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Here we're missing a "~" character. Sphinx complains:
WARNING: Title underline too short.

I'll fix all of these, no problem. I just wanted to let you know for 
next time.

> +
> +-  binutils: Fix :cve:`2022-4285`
> +-  curl: Fix :cve:`2022-43551` and :cve:`2022-43552`

Oops, https://nvd.nist.gov/vuln/detail/CVE-2022-43552 doesn't exist!
I'll use https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-43552 
instead.

That's a case when a CVEID is marked as "reserved" (see 
https://www.cve.org/ResourcesSupport/FAQs#pc_cve_recordsreserved_signify_in_cve_record).

> +-  ffmpeg: Fix :cve:`2022-3109` and :cve:`2022-3341`
> +-  go: Fix :cve:`2022-41715` and :cve:`2022-41717`
> +-  libX11: Fix :cve:`2022-3554` and :cve:`2022-3555`
> +-  libarchive: Fix :cve:`2022-36227`
> +-  libksba: Fix :cve:`2022-47629`
> +-  libpng: Fix :cve:`2019-6129`
> +-  libxml2: Fix :cve:`2022-40303` and :cve:`2022-40304`
> +-  openssl: Fix :cve:`2022-3996`
> +-  python3-git: Fix :cve:`2022-24439`
> +-  python3-setuptools: Fix :cve:`2022-40897`
> +-  python3-wheel: Fix :cve:`2022-40898`
> +-  qemu: Fix :cve:`2022-4144`
> +-  sqlite: Fix :cve:`2022-46908`
> +-  systemd: Fix :cve:`2022-45873`
> +-  vim: Fix :cve:`2023-0049`, :cve:`2023-0051`, :cve:`2023-0054` and :cve:`2023-0088`
> +-  webkitgtk: Fix :cve:`2022-32886`, :cve:`2022-32891` and :cve:`2022-32912`

Oops, similar issue here too: 
https://nvd.nist.gov/vuln/detail/CVE-2022-32891 doesn't exist.
I'll use https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-32891 
instead.

By the way, I also added the missing line for python3, reported by 
Takayasu Ito.

I'll quickly post a V2.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


