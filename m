Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030CAC54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 10:22:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.48783.1748341333368475621
 for <docs@lists.yoctoproject.org>;
 Tue, 27 May 2025 03:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=m7Y9lCqX;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dzUmB+o+vKyW4tyg8yaoBHSbODUvK1LrLT8+77xyY+o=; b=m7Y9lCqXGyuIY78MAy5YSlIv4G
	srCor1ryJ9GiJP9dN1B/0Z+bFKkbTMaTQgcp6Kf1qCrjpF3WRlFFl9QxGnVxVGwWHKcE0yybz0lMc
	fY7V+nPMLukNx+8r4nGCbjpnhilns0MsOBNT++9kejrK4nyI//XbYBcKp1O786+es9nfXfXLz8SiT
	Xt6jsdTN67AC1d3qbOZzjVqbGBf+LdeSBNJ2DJabWdS7MrBV8NImee7EA/dRrACGx7Ag8jBir5wxM
	vyLDaNyTq+vsF5CrpL8DJAxIKorD71Yh5YDhZYgytKVh14491CB8osegESIrzFoWj14GtHzb2urx7
	LrMiN23Q==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:37208 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uJrRh-0000000D70F-2Z2D;
	Tue, 27 May 2025 06:22:12 -0400
Date: Tue, 27 May 2025 06:22:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH] Add an introductory section on how to use site.conf
 file
In-Reply-To: <CANNYZj8yR9PxuNhixiUE1rDgLP62wDUnj56+F8s_31BQGsCwRA@mail.gmail.com>
Message-ID: <b87b7b66-49d6-08b5-b11a-686648af8868@crashcourse.ca>
References: <27c9b177-1e6f-4be3-9ecc-312d0f133fb0@crashcourse.ca> <CANNYZj8yR9PxuNhixiUE1rDgLP62wDUnj56+F8s_31BQGsCwRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 10:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6943

On Tue, 27 May 2025, Alexander Kanavin wrote:

> On Mon, 26 May 2025 at 12:49, Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> > +Reducing duplication by using a global "site.conf" file
> > +=======================================================
> > +
> > +As you start building multiple images, you will probably notice that you are frequently
> > +adding a lot of common content to the new ``local.conf`` in each build directory;
> > +this can get tedious and repetitive, but there is a way to centralize all of that
> > +common content and pull it into each of your new builds.
> > +
> > +If your build's ``conf/`` directory contains a file named ``site.conf``, that file
> > +will be included in the build's processing before the ``local.conf`` file; this
> > +means you can create a single ``site.conf`` file somewhere outside of your build
> > +directories and, after creating a new build directory, you can either copy or
> > +symlink that file into the ``conf/`` directory, where its contents will be processed
> > +before that build's ``local.conf`` (so that you can always set build-specific configuration
> > +in ``local.conf`` which will override the more general settings).
> > +
> > +As a simple example, here's a ``site.conf`` file that will configure, for each
> > +build that includes it, settings for a local mirror, that all your builds will
> > +be based on ``systemd``, and that you want to build ``.deb`` packages for each build::
> > +
> > +  SCONF_VERSION = "1"
> > +  SOURCE_MIRROR_URL ?= "file:///(where downloaded tarballs are)"
> > +  INHERIT += "own-mirrors"
> > +  BB_GENERATE_MIRROR_TARBALLS = "1"
> > +
> > +  INIT_MANAGER = "systemd"
> > +
> > +  PACKAGE_CLASSES = "package_deb"
> > +
> > +Again, if a ``site.conf`` file exists, it will be processed before that build's
> > +``local.conf`` file, so that any build is free to override ``site.conf`` settings
> > +with any build-specific settings in ``local.conf``.
>
> This is too verbose, repeats itself, and is not really correct. I have
> to say I'm firmly against this as it's currently written.
>
> site.conf is intended for settings that are specific to the build host
> machine (resource constraints, locations for downloads and sstate) or
> the network its on (proxies, mirrors).
>
> Anything that is about yocto build itself should go somewhere else,
> e.g. openembedded template, or a config fragment, or distro settings.
> If you want systemd and deb packaging for all of your builds, then it
> definitely a mydistro.conf item.

  OK, fair enough, maybe the quick build doc doesn't need something
this specific. So let's drop it.

rday

