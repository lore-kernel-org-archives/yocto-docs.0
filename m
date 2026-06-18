Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF79CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:05:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18102.1781784340429398299
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 05:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=rfBZ7VWF;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=000hYssuaYT6YPzVye43HJKARF2V9ZLw+GP23tp9Csw=; b=rfBZ7VWFI8RKMJrO1B8nK9xzVs
	M7bHPtCMuaHH1Ok7RYFqwLnht+jBiKdLXCPePhWGcVMVewluwb3z2TaMzlp3AfIYRwhu12j/KeseV
	z2nyf9ztwuv/sean9U9W5i+JdmSFHP8OAGZAtFTQ5tZJ+Mis0fgGpAPivF3FjFdSidnBBJUqecLWq
	zPz8ylLuXe28oHkVLx9h2n4orbs3NB4GIbfqeGMri1/touoZ1ia9YbznVebYCo9q02HYynO+Q939C
	Gh8kax/39dKUC04R+HEDvQ/w+Z506tHOs2zwWZfHSpbMm2Cs//Xdcpcd25AqXerL1dxrqPnByqYJG
	JsFR4JcQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:46704 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1waBV4-000000006Zb-1sFd;
	Thu, 18 Jun 2026 08:05:39 -0400
Date: Thu, 18 Jun 2026 08:05:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] should the dev manual "libraries" sections explain
 "oe_libinstall"?
In-Reply-To: <DJAI1K5XJBDD.3QTRALTBOKL1I@bootlin.com>
Message-ID: <939a7e34-075b-da1c-1ea5-94272fdf9603@crashcourse.ca>
References: <3b08f39f-86c4-ce11-0761-8ef793c0fbdd@crashcourse.ca> <DJAI1K5XJBDD.3QTRALTBOKL1I@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 12:05:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9778

On Tue, 16 Jun 2026, Antonin Godard wrote:

> On Thu Jun 11, 2026 at 1:26 PM CEST, Robert P. J. Day wrote:
> >
> >   while the "Working with Pre-Built Libraries" section:
> >
> > https://docs.yoctoproject.org/dev-manual/prebuilt-libraries.html
> >
> > explains the "oe_soinstall" utility, i see nothing anywhere in the
> > docs that explains the similar "oe_libinstall" utility, for which
> > there are a few examples scattered around, such as mtd-utils:
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb
> >
> >   does this deserve a mention?
>
> Yes please

after a quick check, maybe it's not worth documenting this utility
-- google AI suggests the following:

  oe_libinstall is a legacy shell helper function in the OpenEmbedded
  / Yocto Project build framework used to install a library and all
  its compiled variants (such as .a, .so, .la, and .lai files) into a
  specified destination directory.

  Historically, it was primarily utilized during the do_stage task
  (which has since been deprecated) or inside custom do_install tasks
  to automate the handling of multi-format library files.

  ...

  If you are writing modern Yocto/OpenEmbedded recipes, you should
  avoid using oe_libinstall.

  The Modern Way: Standard build systems like Autotools, CMake, or
  Meson handle library generation and staging automatically via
  oe_runmake install.

so is it still worth documenting something that is legacy and
deprecated? or would it make more sense to upgrade the recipes to not
use this utility anymore?

rday

