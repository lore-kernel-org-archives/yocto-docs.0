Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.4004.1617133836147467389
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 12:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fHeTwCzP;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so8208955pjg.5
        for <docs@lists.yoctoproject.org>; Tue, 30 Mar 2021 12:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v2ScORCa8BIKIijsYYlUunp3xMBUlu8+gDsGBAvXFqQ=;
        b=fHeTwCzPehBZZCLJreRIrrpVteRvhiGo8Xfb8zi7jIKNo/nXEEhHU/I2VY1BxkNwQf
         1iVdhd08z9ondFb8IsYdWzhZ7zvBlTplmxD99VhcW1slwzeOz8Sh8vQiZreASy2ejX2X
         d2VW/X9jlf0HQIYl3P0DpgeVrzqpbR48lPRN/mdO5LNhC779dtzs+P+I4/o4+21sH9iK
         E3VOtDMWSviMYj06QWjll2viZ6q/ESYwJy/lIFz099ADdsoT7ifrQuVYW7shytUp5z1I
         YWJNqkAanT4x2YFlG6iGUU8Eg8DXotHdE98CQIJqvypRTGV0APWHDob5cQhhFCbIKwRu
         1nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=v2ScORCa8BIKIijsYYlUunp3xMBUlu8+gDsGBAvXFqQ=;
        b=XRpLDojzNDY5HFh1oCUTwk5ep3C2PVBqpjBn1KQKzVV5H5jV/xr0dsRAYoh1d8emsc
         vR85Y4TpS4VWB570x70gzhseDFCxQoeABWDcMqqJewV1GL+NKROYso4Pju9QssjpSOFP
         X4QCTePT/dBjs2/cT4AbHvl1U0/+jfeGT2Pr/Zg9gJbu9c7jruY2Ns+N7NMYVPlI9yHi
         9M49jXmLwHoIXuTqsnt6HNBxdoeN2HXsnS7Do1IyhBNLPa6mAbzTk1Y8/LZK/oIxtQTM
         CpMMOIcUr8KFXO0NYu8lzs70hgJSKzW3M2/pLMwGyTWmXMXhUUyjnoGuTYNl/s5+fC/K
         POZA==
X-Gm-Message-State: AOAM533L0+vgT98vhkFsrzooPM+N6/FFyR+yjOq2r+54n9JJpOExJkjP
	wBSZEoZISX0wtpA9OAtqgh+zbRkZP9qlVw==
X-Google-Smtp-Source: ABdhPJwX6dHwnATrTOyCa/ziGM3XILwFFsGjXEtOu3lAaIegiRYdcFtNHRlZgOz9WMs5RxWi9IjZGQ==
X-Received: by 2002:a17:902:b088:b029:e6:e1d8:20cc with SMTP id p8-20020a170902b088b02900e6e1d820ccmr34750823plr.27.1617133835075;
        Tue, 30 Mar 2021 12:50:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d828:cc50:358c:26a2? ([2601:646:9200:a0f0:d828:cc50:358c:26a2])
        by smtp.gmail.com with ESMTPSA id j188sm21065456pfd.64.2021.03.30.12.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 12:50:34 -0700 (PDT)
Subject: Re: [docs] [PATCH 1/1] YP overview manual: style improvements
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20210330151905.13402-1-michael.opdenacker@bootlin.com>
 <20210330151905.13402-2-michael.opdenacker@bootlin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <7d197ec8-75b8-5010-bca8-f9174961609f@gmail.com>
Date: Tue, 30 Mar 2021 12:50:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330151905.13402-2-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/30/21 8:19 AM, Michael Opdenacker wrote:
> - A few style improvements
> - Fix a few typos
> - Fix one of these typos happening in ref-manual/migration-2.1.rst
>    too
> 

thanks, this looks great, I was curious if the formatting piece will be 
automatic for display, right ? or do we need some work in that direction 
too.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/overview-manual/yp-intro.rst | 54 +++++++++++-----------
>   documentation/ref-manual/migration-2.1.rst |  2 +-
>   2 files changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index 176e5b24c..b146db5e4 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -41,9 +41,9 @@ Features
>   The following list describes features and advantages of the Yocto
>   Project:
>   
> --  *Widely Adopted Across the Industry:* Semiconductor, operating
> -   system, software, and service vendors exist whose products and
> -   services adopt and support the Yocto Project. For a look at the Yocto
> +-  *Widely Adopted Across the Industry:* Many semiconductor, operating
> +   system, software, and service vendors adopt and support the Yocto
> +   Project in their products and services. For a look at the Yocto
>      Project community and the companies involved with the Yocto Project,
>      see the "COMMUNITY" and "ECOSYSTEM" tabs on the
>      :yocto_home:`Yocto Project <>` home page.
> @@ -53,8 +53,8 @@ Project:
>      create and supply BSPs that support their hardware. If you have
>      custom silicon, you can create a BSP that supports that architecture.
>   
> -   Aside from lots of architecture support, the Yocto Project fully
> -   supports a wide range of device emulation through the Quick EMUlator
> +   Aside from broad architecture support, the Yocto Project fully
> +   supports a wide range of devices emulated by the Quick EMUlator
>      (QEMU).
>   
>   -  *Images and Code Transfer Easily:* Yocto Project output can easily
> @@ -78,10 +78,10 @@ Project:
>      you need for embedded devices. You only add the feature support or
>      packages that you absolutely need for the device. For devices that
>      have display hardware, you can use available system components such
> -   as X11, GTK+, Qt, Clutter, and SDL (among others) to create a rich
> -   user experience. For devices that do not have a display or where you
> -   want to use alternative UI frameworks, you can choose to not install
> -   these components.
> +   as X11, Wayland, GTK+, Qt, Clutter, and SDL (among others) to create
> +   a rich user experience. For devices that do not have a display or
> +   where you want to use alternative UI frameworks, you can choose to
> +   not build these components.
>   
>   -  *Comprehensive Toolchain Capabilities:* Toolchains for supported
>      architectures satisfy most use cases. However, if your hardware
> @@ -431,11 +431,14 @@ activities using the Yocto Project:
>   
>      During a build, it can be necessary to perform operations that
>      require system administrator privileges. For example, file ownership
> -   or permissions might need definition. Pseudo is a tool that you can
> -   either use directly or through the environment variable
> +   or permissions might need to be defined. Pseudo is a tool that you
> +   can either use directly or through the environment variable
>      ``LD_PRELOAD``. Either method allows these operations to succeed as
>      if system administrator privileges exist even when they do not.
>   
> +   Thanks to Pseudo, the Yocto Project never needs root privileges to
> +   build images for your target system.
> +
>      You can read more about Pseudo in the "`Fakeroot and
>      Pseudo <#fakeroot-and-pseudo>`__" section.
>   
> @@ -574,11 +577,11 @@ Development Methods
>   The Yocto Project development environment usually involves a
>   :term:`Build Host` and target
>   hardware. You use the Build Host to build images and develop
> -applications, while you use the target hardware to test deployed
> +applications, while you use the target hardware to execute deployed
>   software.
>   
>   This section provides an introduction to the choices or development
> -methods you have when setting up your Build Host. Depending on the your
> +methods you have when setting up your Build Host. Depending on your
>   particular workflow preference and the type of operating system your
>   Build Host runs, several choices exist that allow you to use the Yocto
>   Project.
> @@ -593,7 +596,7 @@ Project.
>      system running Linux as its native operating system allows you to
>      develop software by directly using the
>      :term:`BitBake` tool. You can
> -   accomplish all aspects of development from a familiar shell of a
> +   accomplish all aspects of development from a regular shell in a
>      supported Linux distribution.
>   
>      For information on how to set up a Build Host on a system running
> @@ -622,7 +625,7 @@ Project.
>      section in the Yocto Project Development Tasks Manual.
>   
>   -  *Windows Subsystem For Linux (WSLv2):* You may use Windows Subsystem
> -   For Linux v2 to set up a build host using Windows 10.
> +   For Linux v2 to set up a Build Host using Windows 10.
>   
>      .. note::
>   
> @@ -631,8 +634,7 @@ Project.
>         still decide to use WSL please upgrade to WSLv2.
>   
>      The Windows Subsystem For Linux allows Windows 10 to run a real Linux
> -   kernel inside of a lightweight utility virtual machine (VM) using
> -   virtualization technology.
> +   kernel inside of a lightweight virtual machine (VM).
>   
>      For information on how to set up a Build Host with WSLv2, see the
>      ":ref:`dev-manual/start:setting up to use windows subsystem for linux (wslv2)`"
> @@ -641,10 +643,9 @@ Project.
>   -  *Toaster:* Regardless of what your Build Host is running, you can use
>      Toaster to develop software using the Yocto Project. Toaster is a web
>      interface to the Yocto Project's :term:`OpenEmbedded Build System`.
> -   The interface
> -   enables you to configure and run your builds. Information about
> -   builds is collected and stored in a database. You can use Toaster to
> -   configure and start builds on multiple remote build servers.
> +   The interface allows you to configure and run your builds. Information
> +   about builds is collected and stored in a database. You can use Toaster
> +   to configure and start builds on multiple remote build servers.
>   
>      For information about and how to use Toaster, see the
>      :doc:`/toaster-manual/index`.
> @@ -816,9 +817,9 @@ helpful for getting started:
>      isolate information used when building for multiple architectures.
>      Layers are hierarchical in their ability to override previous
>      specifications. You can include any number of available layers from
> -   the Yocto Project and customize the build by adding your layers after
> -   them. You can search the Layer Index for layers used within Yocto
> -   Project.
> +   the Yocto Project and customize the build by adding your own layers
> +   after them. You can search the Layer Index for layers used within
> +   Yocto Project.
>   
>      For more detailed information on layers, see the
>      ":ref:`dev-manual/common-tasks:understanding and creating layers`"
> @@ -851,7 +852,7 @@ helpful for getting started:
>      BitBake is similar to the ``make`` tool.
>   
>      During a build process, the build system tracks dependencies and
> -   performs a native or cross-compilation of the package. As a first
> +   performs a native or cross-compilation of each package. As a first
>      step in a cross-build setup, the framework attempts to create a
>      cross-compiler toolchain (i.e. Extensible SDK) suited for the target
>      platform.
> @@ -878,7 +879,8 @@ helpful for getting started:
>      subtle meanings. For example, the packages referred to in the
>      ":ref:`ref-manual/system-requirements:required packages for the build host`"
>      section in the Yocto Project Reference Manual are compiled binaries
> -   that, when installed, add functionality to your Linux distribution.
> +   that, when installed, add functionality to your host Linux
> +   distribution.
>   
>      Another point worth noting is that historically within the Yocto
>      Project, recipes were referred to as packages - thus, the existence
> diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
> index 861d04861..4a5acc45c 100644
> --- a/documentation/ref-manual/migration-2.1.rst
> +++ b/documentation/ref-manual/migration-2.1.rst
> @@ -134,7 +134,7 @@ or that mention ``do_rootfs``, you might need to update those changes.
>   In particular, if you had added any tasks after ``do_rootfs``, you
>   should make edits so that those tasks are after the
>   :ref:`ref-tasks-image-complete` task rather than
> -after ``do_rootfs`` so that the your added tasks run at the correct
> +after ``do_rootfs`` so that your added tasks run at the correct
>   time.
>   
>   A minor part of this restructuring is that the post-processing
> 
> 
> 
> 
> 
