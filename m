Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0123EC7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 06:10:48 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.9060.1750831839090547501
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 23:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=q6Zun8bm;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553bcf41440so1254382e87.3
        for <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 23:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750831837; x=1751436637; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HD6PVbDJ1uvB8ncn/T2oTbMJovbyL1ETPq3ViP+Z1o=;
        b=q6Zun8bmVrRvW0LJloT13b+PdUrF3MwsxXjN8EkQvwjKloTv8Ha1ogHThb3wK90Tln
         GbVRjJJwN36Pu71k2bw7VJpv7mnlI9aesttF7UCK5tUS3FRqJ2OIH10BV2kMXXGBBqcV
         hDz2zyf++Q3ptdiAGzkgH+w8CtasLPVhNMD4nM0bQR6Zh6u2s7eOyopkwzCpD1SX+cuL
         +B4LKLIB37lQeof3aW+aXS16QOe3SLhglaNBMDOYKmjmDs0QEp7BbOW/12KEY1x2VlAY
         5sTQ3V6ycfcfvxw9whMoG5q8zvq8OwvF2U5xN9/zCQkClyPJzpltgECmPRXXKyH4ejW5
         RqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750831837; x=1751436637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HD6PVbDJ1uvB8ncn/T2oTbMJovbyL1ETPq3ViP+Z1o=;
        b=hAZNr6JjUHIIDRYbQ99TE36pCdZEYs87OuVoCZ66dhtN+Ewkn86orTP2wpsowNoRRl
         wW+Uv62XlZ0M7Tkx6OVs9eVripE3WecK9h5TCuCxSjlIG7j6KhOFOjKkNerTAKrrjD3+
         LirNtZVx1S6pVN+XdFvgN3Zq6ryA/ydYRyfvDVGSLH2zrwKC5PxoOhPTUmkdx0xdEM9V
         XQrlok28hsDVzNAh+quzHcHKKYd7N0z/muTmU8uLTsP37XSA6Td/by+6LDloEUBeU50T
         e1GO18bowxDdDxBD+cnz5z+WmrQUG/rIavqifBmUAGe+gXLD6axVV8vtuMFQDil06H58
         q/rw==
X-Gm-Message-State: AOJu0YwEEJi8BWKbVZm4fU+0mEzgfBzyEXbKFVRssyrqtxYp/58dJ+BM
	X2mR/abOJkqXNqt1P+gRbmLS1mOG3Tah/cB6xrCe4JqkQMTORjIJbiQLyQVS3FAl3zI=
X-Gm-Gg: ASbGncuPAoTtjI+yltEY9BUACILaYeoSCaOQyFBce4c62ax66Ft4Rl23knlfHUx9crs
	TCniO5aB44n1q1CcaeLROXU+d+xbmpdc85worlWVgTFfTEf1Rj0HgwpcOpF4Zbv23LsDl6jmJLH
	j2vtj7TLbyKcM+gc+QW5FBxPDeKGu6zbfilCIi/XZDfjjSmgwz8dzvbLdDpcwfWwEyRQbk3KJdd
	+RejRU3X18o/7c1G3OgEb6ZNLHNG76Hn3AT8DTn9HqgiB9Z8sc1Nh8cNQJEj2MO8LN3j0D4nYT2
	6i3hVsmBWm4gdTalFXNXR4eLvDbRagEWXOY2RyYF5v7blQA2veHXVKCDwGLShtqDAwEUBevjAfh
	94sgW6GOaAMXDI0vc1Ig=
X-Google-Smtp-Source: AGHT+IGxUvwcSCJ3S794lJfsYUczHhdB7ekoywOcHpnvX6eF5LNPpUVPHr39WISh8V8Q6g2jlPZcLA==
X-Received: by 2002:a05:6512:3d23:b0:553:a339:2c34 with SMTP id 2adb3069b0e04-554fdfac201mr435914e87.44.1750831836940;
        Tue, 24 Jun 2025 23:10:36 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414ced5sm2050930e87.87.2025.06.24.23.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 23:10:36 -0700 (PDT)
Date: Wed, 25 Jun 2025 09:10:35 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [docs] [PATCH] Add a document on limiting host resources
Message-ID: <aFuS2wzR9hm3Y9CO@nuoska>
References: <20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Jun 2025 06:10:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7218

Hi,

On Tue, Jun 24, 2025 at 04:42:15PM +0200, Antonin Godard via lists.yoctoproject.org wrote:
> Add a "Limiting the Host Resources Usage" document to share the
> different techniques that can be used to limit the host resources usage.
> We do have a document to document how to speed up a build, so this
> document comes right after.
> 
> [YOCTO #15111]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/dev-manual/index.rst              |  1 +
>  documentation/dev-manual/limiting-resources.rst | 85 +++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
> 
> diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
> index 63736e0ab..4abfa59e9 100644
> --- a/documentation/dev-manual/index.rst
> +++ b/documentation/dev-manual/index.rst
> @@ -22,6 +22,7 @@ Yocto Project Development Tasks Manual
>     building
>     multiconfig
>     speeding-up-build
> +   limiting-resources
>     libraries
>     prebuilt-libraries
>     devtool
> diff --git a/documentation/dev-manual/limiting-resources.rst b/documentation/dev-manual/limiting-resources.rst
> new file mode 100644
> index 000000000..df8208bdc
> --- /dev/null
> +++ b/documentation/dev-manual/limiting-resources.rst
> @@ -0,0 +1,85 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Limiting the Host Resources Usage
> +*********************************
> +
> +While you sometimes need to :doc:`speed up a build
> +</dev-manual/speeding-up-build>`, you may also need to limit the resources used
> +by the :term:`OpenEmbedded Build System`, especially on shared infrastructures
> +where multiple users start heavy-load builds.
> +
> +This document aims at giving the different configuration variables available to
> +limit the resources used by the build system. These variables should be set from
> +a :term:`configuration file` and thus take effect over the entire build environment.
> +For each variable, also see the variable description in the glossary for more
> +details.
> +
> +-  :term:`BB_NUMBER_THREADS`:
> +
> +   This sets a hard limit on the number of threads :term:`BitBake` can run at the
> +   same time. Lowering this value will set a limit to the number of
> +   :term:`BitBake` threads, but will not prevent a single task from starting more
> +   compilation threads (see :term:`PARALLEL_MAKE`).
> +

I would add here or to intro that confusingly, CPU load caused by too much parallellism
may not be the problem but running out of physical RAM which trigger kernel
out-of-memory killer to kill processes related to builds causing very
odd looking failures in build logs. The oom killer actions are visible in build host
kernel dmesg logs, but only there. Thus if machines has low physical RAM
to CPU thread ratio, say less than 2 Gb, then limiting both BB_NUMBER_THREADS
and PARALLEL_MAKE can help.

Cheers,

-Mikko

> +-  :term:`BB_NUMBER_PARSE_THREADS`:
> +
> +   Like :term:`BB_NUMBER_THREADS`, but this variable sets a limit to the number
> +   of threads using during parsing of the environment (before executing tasks).
> +
> +-  :term:`PARALLEL_MAKE`:
> +
> +   This variable should be set in the form of ``-jN``, where ``N`` is a positive
> +   integer. This integer controls the number of threads used when starting
> +   ``make``. Note that this variable is not limited to the usage of ``make``,
> +   but extends to the compilation commands defined by the
> +   :ref:`ref-classes-meson`, :ref:`ref-classes-cmake` and such classes.
> +
> +   If you have identified a recipe that you want to limit separately from the
> +   rest, it is also possible to achieve with the following syntax::
> +
> +      PARALLEL_MAKE:pn-linux-yocto = "-j4"
> +
> +   The above example will limit the number of threads using by ``make`` for the
> +   ``linux-yocto`` recipe to 4.
> +
> +-  :term:`PARALLEL_MAKEINST`:
> +
> +   Like :term:`PARALLEL_MAKE`, but this variable controls the number of threads
> +   used during the :ref:`ref-tasks-install` task.
> +
> +-  :term:`BB_PRESSURE_MAX_CPU`, :term:`BB_PRESSURE_MAX_IO` and
> +   :term:`BB_PRESSURE_MAX_MEMORY`:
> +
> +   This variable controls the limit of pressure (as defined by
> +   https://docs.kernel.org/accounting/psi.html) on the system, and will
> +   limit the number of :term:`BitBake` threads dynamically depending on the
> +   current pressure of the system.
> +
> +   These variable take a positive integer between 1 (extremely low limit) and
> +   1000000 (value unlikely ever reached). Setting an extremely low value, such
> +   as 2, is not desirable as it will result in :term:`BitBake` limiting the
> +   number of threads to 1 most of the time.
> +
> +   However, having a low value at the beginning makes sense to get a sense of a
> +   reasonable value to set for your system. Indeed, :term:`BitBake` will print
> +   message on the console in the following format each time the current pressure
> +   exceeds of the limit set by the above variables::
> +
> +      Pressure status changed to CPU: True, IO: False, Mem: False (CPU: 1105.9/2.0, IO: 0.0/2.0, Mem: 0.0/2.0) - using 1/64 bitbake threads
> +
> +   Take a look at the value between parenthesis: ``CPU: 1105.9/2.0, IO: 0.0/2.0,
> +   Mem: 0.0/2.0``. They correspond to the current pressure value for the CPU, IO
> +   and memory respectively. Monitoring these values during a build should tell
> +   you what a reasonable value for your host system is.
> +
> +-  :term:`BB_LOADFACTOR_MAX`:
> +
> +   This variable will limit the number of threads :term:`BitBake` will start
> +   by monitoring the current load of the host system. :term:`BitBake` will print
> +   the following when the limit set by :term:`BB_LOADFACTOR_MAX` is reached::
> +
> +      Load average limiting set to True as load average: 0.7188262939453125 - using 37/64 bitbake threads
> +
> +   This variable has no effect when any of :term:`BB_PRESSURE_MAX_CPU`,
> +   :term:`BB_PRESSURE_MAX_IO` or :term:`BB_PRESSURE_MAX_MEMORY` is set, as it
> +   was designed for system that do not have pressure information available.
> 
> ---
> base-commit: 85e58c4fc5d1be9a2ea9ed6b813d0168e3162dab
> change-id: 20250417-resource-limiting-12fe772af904
> 
> Best regards,
> --  
> Antonin Godard <antonin.godard@bootlin.com>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7215): https://lists.yoctoproject.org/g/docs/message/7215
> Mute This Topic: https://lists.yoctoproject.org/mt/113808179/7159507
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


