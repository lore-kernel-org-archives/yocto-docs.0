Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913B2C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 15:48:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.14253.1638978479997235592
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 07:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CFDBC20010;
	Wed,  8 Dec 2021 15:47:57 +0000 (UTC)
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH] documentation: conf.py: add knob for loading
 appropriate objects.inv
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20211203103315.57685-1-foss@0leil.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <913b368e-5cf5-88c0-351f-1338a19a5ce5@bootlin.com>
Date: Wed, 8 Dec 2021 16:47:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211203103315.57685-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 15:48:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2233

Hi Quentin,

On 12/3/21 11:33 AM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> Yocto Project releases use a specific Bitbake release. Currently the
> bitbake: mapping is pointing to the current master version of Bitbake
> documentation. This is an issue if some links disappear over time and
> someone is still building old documentation (which is the case on the YP
> autobuilder for example). Also, the documentation at the current master
> version of Bitbake might not be correct for the Yocto Project version
> associated with the doc the user is currently looking at, potentially
> causing confusion.
>
> In master branch, nothing needs to be done. For release branches, the
> bitbake_version variable needs to be set accordingly. See
> https://wiki.yoctoproject.org/wiki/Releases for the mapping.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  documentation/conf.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 8e0847938..1bea18032 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -17,6 +17,7 @@ import sys
>  import datetime
>  
>  current_version = "dev"
> +bitbake_version = "" # Leave empty for development branch
>  
>  # String used in sidebar
>  version = 'Version: ' + current_version
> @@ -90,7 +91,7 @@ extlinks = {
>  
>  # Intersphinx config to use cross reference with Bitbake user manual
>  intersphinx_mapping = {
> -    'bitbake': ('https://docs.yoctoproject.org/bitbake/', None)
> +    'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
>  }
>  
>  # Suppress "WARNING: unknown mimetype for ..."

Excellent idea ! Thanks for the patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

I'll take care of adapting and applying it on the currently supported
release branches (dunfell, hardknott, honister). I'll do that directly
in the branches, but let me know if I should submit patches first.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


