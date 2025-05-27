Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB337C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 10:06:58 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.48526.1748340415099675426
 for <docs@lists.yoctoproject.org>;
 Tue, 27 May 2025 03:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IiZQq5yx;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6faa63da2bcso21343756d6.2
        for <docs@lists.yoctoproject.org>; Tue, 27 May 2025 03:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748340414; x=1748945214; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmgX0Vax+gHxxv+OusEk61+1g9X0dDKk7TcwDa3ajyQ=;
        b=IiZQq5yxUWgmsmFiEWT4/NbuMIPO0TCNY/5ZQwEc0AXjR8o6sDUxIwwyMNHkSou+vj
         pcaiJ2l1DN9rWKpY+X2PCHZewmGTjRS8mfK2OqcsVyDnSvpwE09ZFeJdXXChXvnIYwOb
         63PfGyx5Fk9Ryq7eM9RWXEsU5XyD7o0MkyvG4WSDc/a2moU7wjMC8MVCRX2xaPxc7TN/
         iP2Rh3fFi0tGPxz4w8CaPl5ctxRMbPvJjZsFB0Oy+3E8uHuqDfYgjeitclIFnB0GAiRG
         Gtk5eIQMTVaYPTkNoDsuxKVWzcyBsdluHTdiksBKI6g+FiwkwlChjmsYWL88QGPelVOg
         zEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748340414; x=1748945214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmgX0Vax+gHxxv+OusEk61+1g9X0dDKk7TcwDa3ajyQ=;
        b=cTpf0Gf3m5cOXnzv0PSXPloflinWLjwdqIauhcgRH+5BM3H1OmJe0uTaK07FN5j1Iy
         zzG0GVP5MGdiZXvVltNI9q/pMFg2xm6hE3/1369+tjPbQetgDTTO0SjtArWAwWZOJFfF
         6NsVVdtQYu+N+z/EbJQ4/HbVKiFQGkti+ZsaqwMVJcvnA3vf+eNT9u7FY5njo/iwCvGD
         UbyDcIo/hqLiuEN9Ik2e3py57JDWew8I6YHHR5VOmRhNEsS2Pc56RRoBVj7XkzsL++PN
         z8yYabTzYbzOxIyehQWoYbnV5JXRnF6Bt+82lOxSXEWEhm0HvNqpy18Af5XQx7mX6mvN
         PLtA==
X-Gm-Message-State: AOJu0YyVRjzdO3i9b1i15xTC9B48Ofu0h8+JJSCt87BvuQ08UcEssn3I
	asg+z1ff77pKrNQepND1aO84LDo9UBOQhETfjyf5B0q7YnCW6lBs9B5TmRX/Zuv3aOggNp+OSH7
	3qm8zPnBt9ftJzUpoUEDOe9YAbKlKWfQ=
X-Gm-Gg: ASbGncv8AaOGfPeaunffjrFzG8SYBzfe/9MxnX9y6xCFw1nju8DK/LRmQItX7eBG0vB
	0yy9hG81SNicTVi9+qGAO1Uwz5k8GE0v4PgXkIEPB1I9c5uegRg6rYXhQ+zPUdhMn71Tdky9tLH
	uxKbAv3kxvvkrlLV7FhR10xAliGcjaHNn61VaRDnOSxTdPU3F7dTwC4dH7dtKi1snGmGk=
X-Google-Smtp-Source: AGHT+IFx6PwbQ4xeSvMGZ0zatSutiNbZevt/TgmByktI76D6qr3TACs0IGGdcREDEx/IF/XxBnxwnGVYyFTABoUjQd8=
X-Received: by 2002:a05:6214:c27:b0:6e8:e828:820d with SMTP id
 6a1803df08f44-6fa9d281404mr236468746d6.36.1748340414023; Tue, 27 May 2025
 03:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <27c9b177-1e6f-4be3-9ecc-312d0f133fb0@crashcourse.ca>
In-Reply-To: <27c9b177-1e6f-4be3-9ecc-312d0f133fb0@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 May 2025 12:06:43 +0200
X-Gm-Features: AX0GCFvQIVs6f1B7RTh-WH9qsfnhOPUEOUNP1AFzy68ceR0aI6s45Kp-5hC_2-k
Message-ID: <CANNYZj8yR9PxuNhixiUE1rDgLP62wDUnj56+F8s_31BQGsCwRA@mail.gmail.com>
Subject: Re: [docs][PATCH] Add an introductory section on how to use site.conf file
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 10:06:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6942

On Mon, 26 May 2025 at 12:49, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
> +Reducing duplication by using a global "site.conf" file
> +=======================================================
> +
> +As you start building multiple images, you will probably notice that you are frequently
> +adding a lot of common content to the new ``local.conf`` in each build directory;
> +this can get tedious and repetitive, but there is a way to centralize all of that
> +common content and pull it into each of your new builds.
> +
> +If your build's ``conf/`` directory contains a file named ``site.conf``, that file
> +will be included in the build's processing before the ``local.conf`` file; this
> +means you can create a single ``site.conf`` file somewhere outside of your build
> +directories and, after creating a new build directory, you can either copy or
> +symlink that file into the ``conf/`` directory, where its contents will be processed
> +before that build's ``local.conf`` (so that you can always set build-specific configuration
> +in ``local.conf`` which will override the more general settings).
> +
> +As a simple example, here's a ``site.conf`` file that will configure, for each
> +build that includes it, settings for a local mirror, that all your builds will
> +be based on ``systemd``, and that you want to build ``.deb`` packages for each build::
> +
> +  SCONF_VERSION = "1"
> +  SOURCE_MIRROR_URL ?= "file:///(where downloaded tarballs are)"
> +  INHERIT += "own-mirrors"
> +  BB_GENERATE_MIRROR_TARBALLS = "1"
> +
> +  INIT_MANAGER = "systemd"
> +
> +  PACKAGE_CLASSES = "package_deb"
> +
> +Again, if a ``site.conf`` file exists, it will be processed before that build's
> +``local.conf`` file, so that any build is free to override ``site.conf`` settings
> +with any build-specific settings in ``local.conf``.

This is too verbose, repeats itself, and is not really correct. I have
to say I'm firmly against this as it's currently written.

site.conf is intended for settings that are specific to the build host
machine (resource constraints, locations for downloads and sstate) or
the network its on (proxies, mirrors).

Anything that is about yocto build itself should go somewhere else,
e.g. openembedded template, or a config fragment, or distro settings.
If you want systemd and deb packaging for all of your builds, then it
definitely a mydistro.conf item.

Alex

