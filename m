Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB87C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 12:42:44 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.14816.1752064954934243137
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 05:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Et+LHQbi;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sn7pr0ZAeQtKGhtyqxFWujx2uo6koW1Z+XOFSjinxjU=; b=Et+LHQbiYT8KpoVJiVscbRqMGB
	KVFcGB4AJJ6cTSeBuZUX9Jf3YlnAb8N8D1gI9mVV9blWHhlFtJtcnjSuiG88mHFJ5OF/S9I3RZGd9
	2PZCMmcf68PSGJII9lVSVCBWVHZyKymNFsAhS4lxtIXPtTOFnktAF+6cCCIgvX74XRfhdnTzeIG4t
	JNtLpDk9Qx9+2W0LV/vNSIKAJtLvuLU/lxwe9XsKsWH9F43D57bwd0uFZ8iXOf5Pv1KEaLcFq40EP
	x34ZFOXRI/wiVTQy0ETcSszifHxRVHatQtwNgNDYBU94Dya8TbZaMCSeFq5L51GJJGO1+eo41kgdx
	YBh19urw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:56972 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZU86-0000000AgiN-09k2
	for docs@lists.yoctoproject.org;
	Wed, 09 Jul 2025 08:42:33 -0400
Date: Wed, 9 Jul 2025 08:42:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: now i'm confused about OVERRIDES
Message-ID: <164f071c-7019-7d77-c49a-f0ba3e87c502@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 12:42:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7294


  i'm reading the BB manual here:

https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#examples

and, first, i think OVERRIDES are complex enough to need an entire
section all to themselves, to be explained in detail with actual
examples ripped from the OE code base. but here's the confusion.

  i distinctly recall a while back that i asked about the (possibly
misleading) differences between these two statements:

  A:foo:append
  A:append:foo

and i was sure that the consensus was that the "proper" syntax was:

  A:append:foo

that is, it was extremely unlikely that the developer really meant to
use:

  A:foo:append

even though, in most cases, those statements would have the same
ultimate effect, they could potentially behave differently.

  so the "proper" form seems to be the preferred form, except for this
pile of assignments to RDEPENDS in the meta-raspberrypi layer:

https://git.yoctoproject.org/meta-raspberrypi/tree/recipes-kernel/linux/linux-raspberrypi_6.12.bb

is that syntax deliberate in the sense that it *had* to be done that
way?

  and don't get me started on the complexity one finds in the
meta-xilinx layer:

EXTRA_OECONF:append:xilinx-standalone:arm:class-target:baremetal-multilib-tc = " \

  like i said, i think OVERRIDES needs a more thorough explanation in
the docs to cover some of this stuff.

rday

