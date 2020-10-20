Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.1387.1603217696557516971
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 11:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a4Zvvx1X;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id x7so3348271wrl.3
        for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2020 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k+qEArZU/eKwf1+CXLmgce9dwReg+K9ug43uMSShcbU=;
        b=a4Zvvx1Xzgr2IGpFuckg++6oLAZYO7kf+cMh8Wtm+GvW/ZBEEy7jlTlmntRh2urtSK
         U7i+TCcqO9t7Ci2O4gp29fM9jrJfMpaCkCAJIpWYurgpByH5Vf22XRd77XCCGooJNxpX
         15Ytuk/nLmE1sDJ3ZaxV5lOTzUmqqHeYWvB6zr3mS5lcWh4xDrBi/jSRRbbfDh4aQ66B
         6jtRdVlryggigTwmgWyif1jV05JXaJYZeX+ig0jSaWAvMqzfubR+VG+ZyzqG7DyuMSAa
         26/0LhEL07lTN/mWEnuGm2fOXsQ5HiPEpIWRPSlG/ZVaTqh9wi7ujjurOcHa897qv/43
         9QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k+qEArZU/eKwf1+CXLmgce9dwReg+K9ug43uMSShcbU=;
        b=nHocD1q7oQJ0qS1F80pJ4IDIv5moSw9Hg+YEat396eP34nRXrxtzHkkJ44SPtjp2NN
         Lq1thZgLWzuPqNqIw4AfLEl48Q/LS+5e0GA24fOaVmw1jbMmQylJid/k3LnandWnd1DE
         j5e0bsiAyNSrr0PzXoGrApswKc5JmMkHgzlt1tlN9aok2LX71uhLhbPOvN6AxZf7k2OV
         ZDK2rgzfvQ6N8yYSYIyLFNrbqnNsAwtm5AJw38nen14st/3L78nQrRksfBwWP4hFC7Cm
         4od5zcEqVVqi0nyGMQFuWUsEl2B5OMN3KmSPUzZSwUiU/fxf0tqbhjCRPL8Z3HFKonyA
         TA4w==
X-Gm-Message-State: AOAM532XTgxZHZaENhRjpmy940qidHwcujN/bwwbyoYp7j3Z2CWmMNjl
	iyXqk9HhU1CHgq6wNP1d6ppf4btK8lGTZhix0q5L0Ly3
X-Google-Smtp-Source: ABdhPJz2Kq6kEnIbmAsdf7aSyjgDdLJbKwvX2G0Vizpi652Fc+40wKRkJq6qN4vVzR4W0D2iJeNEFX/6KThgsSxWXCs=
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr4814746wrs.303.1603217694566;
 Tue, 20 Oct 2020 11:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201020170326.14313-1-JPEWhacker@gmail.com>
In-Reply-To: <20201020170326.14313-1-JPEWhacker@gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Tue, 20 Oct 2020 13:14:43 -0500
Message-ID: <CAJdd5Gb0L4Yhwmsawp4K+muy92SW+Y3tLYA7sv9CnM108GWwFQ@mail.gmail.com>
Subject: Re: [docs][PATCH] kernel-dev: Add FAQ for how to use a vanilla kernel
To: docs@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2020 at 12:03 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Adds a FAQ with explicit directions about how to build a vanilla kernel
> for a machine.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/kernel-dev/kernel-dev-faq.rst | 49 +++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/kernel-dev-faq.rst
> index 70bf4a2d4..929cc4aad 100644
> --- a/documentation/kernel-dev/kernel-dev-faq.rst
> +++ b/documentation/kernel-dev/kernel-dev-faq.rst
> @@ -79,3 +79,52 @@ following:
>
>     APPEND += "printk.time=y initcall_debug debug"
>
> +How do I use a vanilla Linux kernel with my machine?
> +----------------------------------------------------
> +
> +The simplest way to use a vanilla kernel is with the ``linux-yocto`` kernel
> +maintained by openembedded-core. Using this kernel is as simple as adding the
> +following to your machine.conf file:
> +::
> +
> +   # Use a defconfig provided by the kernel. If you are going to provide your
> +   # own defconfig in SRC_URI as show below, you'll need to omit this line
> +   KBUILD_DEFCONFIG = "multi_v7_defconfig"
> +
> +   # Use default value for all symbols. This is usually what you want when
> +   # providing a defconfig
> +   KCONFIG_MODE = "alldefconfig"
> +
> +   # Make linux-yocto provide the kernel
> +   PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
> +
> +   # If you want to use a specific version of the upstream kernel, uncomment
> +   # and set this line, otherwise omit it to use the latest stable kernel
> +   #PREFERRED_VERSION_linux-yocto = "5.8.%"
> +
> +You will also need to add a .bbappend in your BSP layer to amend the
> +linux-yocto recipe (e.g. recipes-kernel/linux/linux-yocto_%.bbappend):
> +::
> +
> +    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +    # Uncomment this line to provide your own defconfig file in your BSP layer:
> +    # SRC_URI_append_my-machine = " file://defconfig"
> +
> +    # Marks the recipe as compatible with your machine. Be sure to replace
> +    # my-machine with the name of your machine
> +    COMPATIBLE_MACHINE .= "|my-machine"
> +
> +You can also apply patches and config fragements in the bbappend if desired,
> +see :ref:`kernel-dev/kernel-dev-common:applying patches` and
> +:ref:`kernel-dev/kernel-dev-common:changing the configuration` in the Kernel
> +dev manual. It is recommended that you use ``_append_my-machine`` to prevent
> +these changes from inadverently leaking into other machine configurations
> +
> +.. note::
> +    You will notice that this is will still pull the kernel source from `the
> +    Yocto Kernel git repo
> +    <https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/>`_, however it is
> +    using the default value for :term:`KBRANCH` (e.g. ``"v5.8/standard/base"``)
> +    which is an exact mirror of the upstream kernel.

This is a lie. I thought it was the upstream mirror, but it's not.
v5.8/base is the mirror and this one has a few extra patches.

> +
> --
> 2.28.0
>
