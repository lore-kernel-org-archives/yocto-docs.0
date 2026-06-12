Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C20CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 17:49:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76262.1781286565042026734
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 10:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=jdZKB99a;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AvJ8+qzqykXH7gGZqMDBTKZ8VS4T0YRGEh2JwssV8w4=; b=jdZKB99alNEM21R4pYlrO1uTUC
	kmaUtXnb0V/QnIZGTOpnC251dN3ttdaNwsnyPDw8Edgm56I7m/G/Qa7IdiWnuIlzKx93dZpRopT+Q
	CkiveHjlx5Eb531dzAuMbJH5xYZ2WBKzPsh4GCuFqLhuq7NaTpnkpCN/jcIqDnltH2s/57BEh2O6F
	EkxtwmDFjdx2qAKosCNPUo6QZGHYM2W3HeRCDZjWK6d4OUhFCaX5SG8Sau1a1pYMnZ1ni6IklYkEF
	LYnoQUgfUVpHwvFu2eAxTKMXUmWNrnAFUVJXKqH9fsAdOPMNw4SGBEHq3izalA4GjzbYFqFLRGRu0
	4vY90S7A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47956 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wY60O-0000000ErSV-3Sk6
	for docs@lists.yoctoproject.org;
	Fri, 12 Jun 2026 13:49:23 -0400
Date: Fri, 12 Jun 2026 13:49:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: improving the ptest section
Message-ID: <d4f52ae1-8aef-e8ab-4ba2-e2bdcac0ae58@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 17:49:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9711


  going over the ptest section in the docs:

https://docs.yoctoproject.org/test-manual/ptest.html

and i can see a couple potential improvements but i'll ask a couple
questions first to make sure i did not misunderstand the code and my
testing.

  first, section 3.1 advises that to add ptests to your image, you
need to add those *two* lines. let's back up a second and consider
just the first line:

  DISTRO_FEATURES:append = " ptest"

if you add "ptest" to DISTRO_FEATURES, that means that all of the
ptest-enabled recipes will build and package their "xxx-ptest"
packages and install them under /tmp/deploy/<backend>, correct? but if
you stop there, all that means is that your build will have gone to
all that trouble, only for no ptests to be installed in your image.
and people will think, "why would i do that and then not go on to
install those packages in my image?". which is a perfectly reasonable
question ... unless that setting had been set for you without you
knowing it, which is *exactly* what happens if you build with a DISTRO
of "nodistro", since the defaultsetup.conf file in OE-core includes
default-distrovars.inc, which includes the line:

  DISTRO_FEATURES_DEFAULTS ?= " \
    acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
    wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
    gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan \
    "
which explains why *my* build created all these ptest packages i did
not ask for. so as a first fix, i would explain that to simply *build*
all ptest packages, that feature needs to be set, but it *might*
already be set depending on your build configuration, so it would be
worth mentioning the possibility of *removing* that feature if you
don't want it.

  and second, in addition to simply installing *all* of the ptest
packages, it should be mentioned how to install only *some* of them,
with something like:

  IMAGE_INSTALL:append = " fubar-ptest"

those are two immediate improvements i can see. thoughts?

rday


