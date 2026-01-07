Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EF7D0D160
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:15:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12821.1767809717990273350
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 10:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=qgfDhKyw;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sP3DwsP5gfYp3R9Wh16CO+1mi5VQWR6Homz7vAR2q9k=; b=qgfDhKywxN40vmACQyboA3s9LY
	3idK9lBKfgHXxiEHQWhfsU0M2rild5zxUB+3tnoWI0bQeSQFL6oIBm8u6JfseAYLRBXLLSa6wP85B
	gFVbjfycMtSqKOedfzEhH7jzL+z31mawVUe89MsnqEhMiuhGnIehudRMlN11L5253lANePfwiRcxG
	FOI3SuDZoaEsS39cqsba4zCawdoxzB4SeJJSBLXLS4vJ2eAZ2N3ypcRyKIEWqqQjKAG8JqGcmIhXj
	7t3dpZ9E0I40+eQNpzuhz6JK/c/jmrIjPjSYnC+oTRYKyI2oCSPfQmaTRWdEpW07Up0qD/7ao0xR8
	UP7JJ/Ig==;
Received: from [147.129.179.166] (port=48226 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdY3r-0000000G7jG-1JfI
	for docs@lists.yoctoproject.org;
	Wed, 07 Jan 2026 13:15:16 -0500
Date: Wed, 7 Jan 2026 13:18:13 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: questions about documenting conditional syntax (overrides)
Message-ID: <a4d00d27-a3e5-4cf5-e9ef-22c52c1c2b39@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 18:15:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8415


  i've never been crazy about how overrides are explained here:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#conditional-syntax-overrides

but it seems that there are advanced usages of overrides that are not
mentioned.

  first, there doesn't seem to be any mention of using multiple
overrides; here's a sample snippet from meta-oe's rsyslog recipe:

  # Disable for powerpc64 with musl
  VALGRIND:libc-musl:powerpc64 = ''
  VALGRIND:libc-musl:powerpc64le = ''

that appears to incorporate two separate overrides. can there be an
arbitrary number of overrides in an assignment? does order matter?

  an even weirder example is from meta-freescale's gstreamer plugins
bbappend file:

# The i.MX8 uses KMS instead of the Vivante specific framebuffer API.
# The i.MX7 does not have a GPU, except for ULP.
# This leaves the i.MX6 - with the vendor BSP - as the remaining use case for viv-fb.
#
# (Note that viv-fb is about the _windowing system_. Vivante direct texture support
# does not depend on the viv-fb feature. It used to, but that was actually a bug
# which was fixed in GStreamer 1.22.5. Since then, the direct texture support is
# detected by Meson by checking for direct texture symbols like "glTexDirectVIV".)
PACKAGECONFIG_GL:imxgpu2d:append:mx6-nxp-bsp = " viv-fb"
PACKAGECONFIG_GL:imxgpu2d:append:mx7-nxp-bsp = " viv-fb"

  wow ... an append operation between two overrides? pretty sure that
combination is not covered in the docs. :-)

rday

