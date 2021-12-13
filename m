Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24965C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:58:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.12853.1639411093319495394
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 07:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 78521C0002;
	Mon, 13 Dec 2021 15:58:10 +0000 (UTC)
Subject: Re: [docs] [yocto-docs][dunfell 1/1] documentation: prepare for
 3.1.13 release
To: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
References: <cover.1639408799.git.steve@sakoman.com>
 <ab25582a2b64f294bc397894113a3438b48ad544.1639408799.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <62c35ec8-121b-b4f5-39b8-504aee1b533e@bootlin.com>
Date: Mon, 13 Dec 2021 16:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <ab25582a2b64f294bc397894113a3438b48ad544.1639408799.git.steve@sakoman.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Dec 2021 15:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2246

Hi Steve,

On 12/13/21 4:24 PM, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  documentation/conf.py                    | 2 +-
>  documentation/poky.yaml                  | 8 ++++----
>  documentation/releases.rst               | 1 +
>  documentation/sphinx-static/switchers.js | 2 +-
>  4 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 0790b50a7..0d61afc9d 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -16,7 +16,7 @@ import os
>  import sys
>  import datetime
>  
> -current_version = "3.1.12"
> +current_version = "3.1.13"
>  bitbake_version = "1.46"
>  
>  # String used in sidebar
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index af041e373..ec0ecadb1 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,11 +1,11 @@
> -DISTRO : "3.1.12"
> +DISTRO : "3.1.13"
>  DISTRO_NAME_NO_CAP : "dunfell"
>  DISTRO_NAME : "Dunfell"
>  DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.12"
> +YOCTO_DOC_VERSION : "3.1.13"
>  YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
> -DISTRO_REL_TAG : "yocto-3.1.12"
> -POKYVERSION : "23.0.12"
> +DISTRO_REL_TAG : "yocto-3.1.13"
> +POKYVERSION : "23.0.13"
>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
> diff --git a/documentation/releases.rst b/documentation/releases.rst
> index 3e27406ea..50803e383 100644
> --- a/documentation/releases.rst
> +++ b/documentation/releases.rst
> @@ -21,6 +21,7 @@
>  - :yocto_docs:`3.1.10 Documentation </3.1.10>`
>  - :yocto_docs:`3.1.11 Documentation </3.1.11>`
>  - :yocto_docs:`3.1.12 Documentation </3.1.12>`
> +- :yocto_docs:`3.1.13 Documentation </3.1.13>`
>  
>  ==========================
>   Previous Release Manuals
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> index 87160d8ba..65e4d261f 100644
> --- a/documentation/sphinx-static/switchers.js
> +++ b/documentation/sphinx-static/switchers.js
> @@ -3,7 +3,7 @@
>  
>    var all_versions = {
>      'dev': 'dev (3.3)',
> -    '3.1.12': '3.1.12',
> +    '3.1.13': '3.1.13',
>      '3.0.4': '3.0.4',
>      '2.7.4': '2.7.4',
>    };


Many thanks for this update.
I'll merge it when 3.1.13 is out, as we discussed with Anuj when the
3.4.1 release was prepared for. If we apply this change too early,
before a new released is tagged, we end up with a link to a
documentation version that is not generated yet.

I'll take care of changing the commit subject to "documentation: update
for 3.1.13 release".
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


