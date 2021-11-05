Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84234C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 15:50:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.7474.1636127409178363521
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 08:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 536BEE000D;
	Fri,  5 Nov 2021 15:50:07 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] ref-manual: update overlayfs class
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, docs@lists.yoctoproject.org
References: <20211102135614.19552-1-uvv.mail@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <4b70f623-b316-5ee1-e439-a5ccab05d8d0@bootlin.com>
Date: Fri, 5 Nov 2021 16:50:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102135614.19552-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Nov 2021 15:50:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2093

Hi Slava,

On 11/2/21 2:56 PM, Vyacheslav Yurkov wrote:
> Describe how to use a generated helper service to set up a proper
> systemd dependency chain.
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  documentation/ref-manual/classes.rst | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 9b1ead66b..5bc4472e3 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1742,7 +1742,8 @@ Then you can specify writable directories on a recipe basis (e.g. in my-applicat
>  
>  To support several mount points you can use a different variable flag. Assuming we
>  want to have a writable location on the file system, but do not need that the data
> -survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs`` file system.
> +survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs``
> +file system.
>  
>  In your machine configuration::
>  
> @@ -1752,6 +1753,19 @@ and then in your recipe::
>  
>    OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
>  
> +On a practical note, your application recipe might require multiple
> +overlays to be mounted before running to avoid writing to the underlying
> +file system (which can be forbidden in case of read-only file system)
> +To achieve that :ref:`overlayfs <ref-classes-overlayfs>` provides a ``systemd``
> +helper service for mounting overlays. This helper service is named
> +``${PN}-overlays.service`` and can be depended on in your application recipe
> +(named ``application`` in the following example) ``systemd`` unit by adding
> +to the unit the following::
> +
> +  [Unit]
> +  After=application-overlays.service
> +  Requires=application-overlays.service
> +
>  .. note::
>  
>     The class does not support the ``/etc`` directory itself, because ``systemd`` depends on it.


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


