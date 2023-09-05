Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE31C83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 05:29:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.14937.1693891738917285233
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Sep 2023 22:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Tx81THtT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C96F3FF808;
	Tue,  5 Sep 2023 05:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693891736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3G0GCNDWxscttxevBQfFg1YMC7ZvIQX0yhSO+p1yPeo=;
	b=Tx81THtT7NG1sx8lgKWKraQZIWGgqtb7f2maHiy0grdEAQYaKdqjDb99kav59FPnblXdVx
	/yqiVynQ1GiyQAa8wbNYSX1VxqFV67c3VMmMxNdfv5qhSXhqJvj3Ok6SaBCvBqUi3/xE1J
	7LfJLq/Htksku+ko7+6JjWT4YAT/zF8GVQIum46pCwgrHdxfEIBmwIGw5nSF3d8UtwiGft
	ddNsSbYmGKqGQqRXWJMxkAnyNQs+VgsEGMGQwGpudQAtAnKMCH/rHGyGSIgjLFwuxejUzN
	0VaAsyBWmFrcvQCiStySgZvWzQhPJ9ZVq/cJQzm5QDy2PlSJh+QWz7Rc1WXEwg==
Message-ID: <bdd026a8-39b5-4f9a-b50d-7f06bef1d466@bootlin.com>
Date: Tue, 5 Sep 2023 07:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 4.0.12
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230824144847.850298-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230824144847.850298-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Sep 2023 05:29:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4185

Hi Lee

Many thanks for the release notes!

On 24.08.23 at 16:48, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.12.rst | 277 ++++++++++++++++++
>   2 files changed, 278 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.12.rst
>
> diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
> index 1f08c8844..688ea7ae0 100644
> --- a/documentation/migration-guides/release-4.0.rst
> +++ b/documentation/migration-guides/release-4.0.rst
> @@ -18,3 +18,4 @@ Release 4.0 (kirkstone)
>      release-notes-4.0.9
>      release-notes-4.0.10
>      release-notes-4.0.11
> +   release-notes-4.0.12
> diff --git a/documentation/migration-guides/release-notes-4.0.12.rst b/documentation/migration-guides/release-notes-4.0.12.rst
> new file mode 100644
> index 000000000..3dbbfcbed
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.0.12.rst
> @@ -0,0 +1,277 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-4.0.12 (Kirkstone)
> +------------------------------------------
> +
> +Security Fixes in Yocto-4.0.12
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  bind: Fix :cve:`2023-2828` and :cve:`2023-2911`
> +-  cups: Fix :cve:`2023-34241`
> +-  curl: Added :cve:`2023-28320` Follow-up patch
> +-  dbus: Fix :cve:`2023-34969`
> +-  dmidecode: fix :cve:`2023-30630`
> +-  ghostscript: fix :cve:`2023-36664`
> +-  go: fix :cve_mitre:`2023-24531`, :cve:`2023-24536`, :cve:`2023-29400`, :cve:`2023-29402`, :cve:`2023-29404`, :cve:`2023-29405` and :cve:`2023-29406`
> +-  libarchive: Ignore :cve:`2023-30571`
> +-  libcap: Fix :cve:`2023-2602` and :cve:`2023-2603`
> +-  libjpeg-turbo: Fix :cve:`2023-2804`
> +-  libpcre2: Fix :cve:`2022-41409`
> +-  libtiff: fix :cve:`2023-26965`
> +-  libwebp: Fix :cve:`2023-1999`
> +-  libx11: Fix :cve:`2023-3138`
> +-  libxpm: Fix :cve:`2022-44617`
> +-  ninja: Ignore :cve:`2021-4336`
> +-  openssh: Fix :cve:`2023-38408`
> +-  openssl: Fix :cve:`2023-2975`, :cve:`2023-3446` and :cve:`2023-3817`
> +-  perl: Fix :cve:`2023-31486`
> +-  python3: Ignore :cve:`2023-36632`
> +-  qemu: Fix :cve:`2023-0330`, :cve_mitre:`2023-2861`, :cve_mitre:`2023-3255` and :cve_mitre:`2023-3301`
> +-  sqlite3: Fix :cve:`2023-36191`
> +-  tiff: Fix :cve:`2023-0795`, :cve:`2023-0796`, :cve:`2023-0797`, :cve:`2023-0798`, :cve:`2023-0799`, :cve:`2023-25433`, :cve:`2023-25434` and :cve:`2023-25435`
> +-  vim: CVE-2023-2609 :cve:`2023-2610`


You forgot one ":cve:" macro in the last line, but I fixed it.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "master-next".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


