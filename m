Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.31394.1631546658833964025
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 08:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0B9DEC000B;
	Mon, 13 Sep 2021 15:24:16 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] ref-manual: add overlayfs class
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, docs@lists.yoctoproject.org
References: <20210822201454.125952-1-uvv.mail@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2a80dade-3b16-a91b-fcb2-342e5f377888@bootlin.com>
Date: Mon, 13 Sep 2021 17:24:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210822201454.125952-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Slava,

On 8/22/21 10:14 PM, Vyacheslav Yurkov wrote:
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  documentation/ref-manual/classes.rst | 49 ++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 3af023895..ca6430034 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1710,6 +1710,55 @@ one such example. However, being aware of this class can reduce the
>  proliferation of different versions of similar classes across multiple
>  layers.
>  
> +.. _ref-classes-overlayfs:
> +
> +``overlayfs.bbclass``
> +=======================
> +
> +It's often desired in Embedded System design to have a read-only rootfs.
> +But a lot of different applications might want to have a read-write access to
> +some parts of a filesystem. It can be especially useful when your update mechanism
> +overwrites the whole rootfs, but you want your application data to be preserved
> +between updates. The :ref:`overlayfs <ref-classes-overlayfs>` class provides a way
> +to achieve that by means of ``overlayfs`` and at the same time keeping the base
> +rootfs read-only.
> +
> +To use this class, set a mount point for a partition overlayfs is going to use as upper
> +layer in your machine configuration. Underlying file system can be anything that
> +is supported by overlayfs. This has to be done in your machine configuration::
> +
> +  OVERLAYFS_MOUNT_POINT[data] = "/data"
> +
> +.. note::
> +
> +  * QA check fails to catch file existence if you redefine this variable in your recipe!
> +  * Only existence of the systemd mount unit file is checked, not its content.
> +  * To get more details on overlayfs, its internals and supported operations, please refer
> +    to the official documentation of the `Linux kernel <https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html>`_
> +
> +The class assumes you have a ``data.mount`` systemd unit defined elsewhere in your BSP
> +(e.g. in ``systemd-machine-units`` recipe) and it's installed to the image.
> +
> +Then you can specify writable directories on a recipe basis (e.g. in my-application.bb)::
> +
> +  OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> +
> +To support several mount points you can use a different variable flag. Assuming we
> +want to have a writable location on the file system, but not interested where the data
> +survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs`` file system.
> +
> +In your machine configuration::
> +
> +  OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +
> +and then in your recipe::
> +
> +  OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
> +
> +.. note::
> +
> +   The class does not support ``/etc`` directory itself, because ``systemd`` depends on it
> +
>  .. _ref-classes-own-mirrors:
>  
>  ``own-mirrors.bbclass``

Thanks for the code, for the documentation patch and its update.

I just added minor (mostly grammar) tweaks, but after those:

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Now merged into "master-next".

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

