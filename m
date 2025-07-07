Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946CEC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 19:16:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.762.1751915783258831900
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 12:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=h7xXMqD/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zHYxtefZ0HarVj3Aus4ewWuF6Fs4pcuFjpSbReJwtXY=; b=h7xXMqD/APzqfjGJlkyOXn8kz0
	501ERzgdrjoypDD8JSprirqGz+CWxmjq8orWa8zQ2SWLU0PzPerFacaWC4xllYVazzZHCfO2HBhfP
	Mmz8EeFG6n8PNFtSWCUNyQ8hJW8qmwEWpjFsCrUjOrm9fiw9hA0ffWuKWw53aH7bTZKkic+jdUZIL
	7QqMrW8img8NOIR8oO37UqagkmSe713HuVPXKwYvNBmluCUbty+tMANBmgGSud+OE46jPQAiTU1Eg
	lnqgBkIgVczQ24e7OCw8JiUbFym8FLnKqxKOxu88q5+x8gKATUO7btbqLIxs2iMZHsYP5yf3Y0jl3
	Sd2Zw3hw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:41024 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uYrK4-00000004QgD-1zqv
	for docs@lists.yoctoproject.org;
	Mon, 07 Jul 2025 15:16:18 -0400
Date: Mon, 7 Jul 2025 15:16:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: a couple random thoughts about YP docs and examples
Message-ID: <d2261e4d-bfe5-3c97-a580-ed25d69e228c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 07 Jul 2025 19:16:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7270


  reading the bitbake manual (although this could just as well apply
to YP docs in general), my first general nitpick is the number of
awkwardly contrived examples that involve contrived variable names.
consider this section on the ":remove" directive:

https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#removal-override-style-syntax

why use variables FOO and FOO2 and arbitrary numeric strings when
there are so many meaningful examples in the OE code base that would
make actual sense, such as:

  meta/recipes-bsp/grub/grub2.inc:CFLAGS:remove = "-O2"
  meta/recipes-bsp/grub/grub2.inc:TUNE_CCARGS:remove = "-mfpmath=sse"

Examples like that actually suggest to the reader *why* one might want
to remove strings from various variables related to various recipes.

  Also, I don't see any mention in that section about override-related
removal that would be useful to explain, stuff like:

meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:DEPENDS:remove:riscv32 = "libunwind"
meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:DEPENDS:remove:riscv64 = "libunwind"
meta-poky/conf/distro/poky-tiny.conf:PACKAGECONFIG:remove:pn-opkg-utils = "python"

In short, we should be using actual examples from the OE code base as
examples, and we should try to be complete.

rday


