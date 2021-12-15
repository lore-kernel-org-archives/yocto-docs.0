Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590F7C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.2570.1639594460463516905
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 10:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9D7631BF206;
	Wed, 15 Dec 2021 18:54:18 +0000 (UTC)
Subject: Re: [docs] [PATCH 1/2] ref-manual: add overlayfs-etc class
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, docs@lists.yoctoproject.org
References: <20211215171138.127272-1-uvv.mail@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <bb095fe1-4de6-e07d-a981-241410226e46@bootlin.com>
Date: Wed, 15 Dec 2021 19:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215171138.127272-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 01:44:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2278

Hi Slava,

Thanks for the documentation update patch!
See my comments below.

On 12/15/21 6:11 PM, Vyacheslav Yurkov wrote:
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  documentation/ref-manual/classes.rst | 41 ++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 2c191f407..a5b01c2cf 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1769,6 +1769,47 @@ to the unit the following::
>  .. note::
>  
>     The class does not support the ``/etc`` directory itself, because ``systemd`` depends on it.
> +   In order to get ``/etc`` in overlayfs see :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` 
> +
> +.. _ref-classes-overlayfs-etc:
> +
> +``overlayfs-etc.bbclass``
> +=========================
> +
> +In order to have ``/etc`` directory in overlayfs a special handling at early 

s/to have/to have the/

> +boot stage is required.  The idea is to supply a custom init script that mounts
> +``/etc`` before launching actual init program, because the latter already


s/actual init program/the actual init program/

> +requires ``/etc`` to be mounted
> +
> +.. note::
> +
> +   This class must not be inherited directly. Use corresponding IMAGE_FEATURE
Oops, you forgot the "S" in "IMAGE_FEATURES". You may say:

Use :term:`IMAGE_FEATURES` or :term:`EXTRA_IMAGE_FEATURES`.

What about directly adding an example too?
> +
> +Your machine configuration should define at least device, mount point, and file system type
> +you are going to use for ``overlayfs``::


s/at least device/at least the device/

> +
> +  OVERLAYFS_ETC_MOUNT_POINT = "/data"
> +  OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p2"
> +  OVERLAYFS_ETC_FSTYPE ?= "ext4"
> +
> +To control more mount options you should consider setting mount options
> +(``defaults`` is used by default)::
> +
> +  OVERLAYFS_ETC_MOUNT_OPTIONS = "wsync"
> +
> +The class provides two options for ``/sbin/init`` generation:
> +
> +* Default option is to rename original ``/sbin/init`` to ``/sbin/init.orig`` and

s/Default/The default/

s/original/the original/

> +  place generated init under original name, i.e. ``/sbin/init``. It has an advantage

s/generated init/the generated init/

s/original name/its original name/

> +  that you won't need to change any kernel parameters in order to make it work,
> +  but it poses a restriction that package-management can't be used, becaause updating


s/becaause/because/

> +  init manager would remove generated script


s/generated script/the generated script/

> +* If you are would like to keep original init as is, you can set::


s/If you are would like/If you wish/

> +
> +   OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "0"
> +
> +  Then generated init will be named ``/sbin/preinit`` and you would need to extend your


/s/generated init/the generated init/

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


