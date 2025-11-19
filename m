Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6F6CF394B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:04:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10682.1763568262434244890
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 08:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=p+Z5el/X;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qup9FMMDWhF/GcNCpdj1GfF7cwFQJrLVs/TTGKZxCgQ=; b=p+Z5el/XE90uNmhBG6LvIkPdpj
	2x7gJl4YzOpQYKmZX1xB1EJMoW7qhYiVZ/aWYOEAfMTTDIZWicJtI8sTO+4KqXm7Dk34Qeox2jYWS
	ZeNsHM5WOBi46IdUQU6W8dDIp/hah6MIOV1eL8acPHS4+ez2Vd+hWmbssrebRCQ1rUQVEe1rbKZat
	EyS9gkvg64G8o19NZ8UnYp+bONIieQns/5PgjGsxgs/UM8Y01MNbF4x8tLh5WJChhnircjUfWp8AU
	/f+/TP50TF3Tu5f0FK2KDLaDbCvkKstusy0dORO3fEZtEG170MiFJsdhb4JyUhSGZcDn9REaM8ngY
	71E/8XqA==;
Received: from [147.129.179.166] (port=37962 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLkfH-00000003YH5-1Oju
	for docs@lists.yoctoproject.org;
	Wed, 19 Nov 2025 11:04:18 -0500
Date: Wed, 19 Nov 2025 11:04:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: thoughts on a refactored "Use Git to Clone bitbake-setup" section
Message-ID: <2049e12f-12f7-dad3-c14f-c5fd384a98b9@crashcourse.ca>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 16:04:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8091


  ok, after all that chaos this morning and getting some
clarifications, i'm looking at this section:

https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/#use-git-to-clone-bitbake-setup

and i think it needs to be broken into two sections to read more
smoothly.

  first, i think at that location, we need a much shorter section
called something like, "Getting and configuring bitbake-setup on your
system," without even getting into the "init" subcommand, since
readers really need to understand the default behaviour of
bitbake-setup, so here's my idea.

  it starts with telling the reader to "git clone" the bitbake
repository (which supplies the bitbake-setup command) but,
importantly, it makes it clear that they can clone it anywhere they
want, after which they will extend their search PATH with the location
of bitbake-setup so that that command can be called from wherever they
are, and here's why that's important:

  it's because that command is location-dependent and since it can be
called from any number of current working directories, it needs to be
on your search path. and why is it location dependent? because, by
default, it does its processing in your current working directory
(something that will affect all of the subsequent commands).

  and that (short) section could end with the reader, after setting
all that up, demonstrating that by 'cd'ing to different directories
and running:

  $ bitbake-setup settings list

to see how the output changes.  that's it for that section -- just
setting up the command and making sure the reader truly understands
how it is affected by the current working directory. the *next*
section can then get into "init", and settings defaults and so on, but
the above is critical for the reader to understand.

  thoughts?

rday


