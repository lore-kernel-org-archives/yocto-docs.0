Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82095C43458
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 19:56:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7163.1782590187596078681
 for <docs@lists.yoctoproject.org>;
 Sat, 27 Jun 2026 12:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=g0omwGy6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+iVBPHJEz3dWNa+ftNA5RJVpQ0qMcIX3cJ4Oj6HxpGU=; b=g0omwGy6zN9ugdY6MJiZrP2Uab
	cipZGHm+vu+weJM4J8tOrYlw2tWsWd73vtWXVzPV+AScMlil9ts35NtWbSMCRJ40bJ3ELTczE8uiY
	B+sVE+SyfaGgfwSlhvnNQzmnBt71euqHPvZSW6Rn/BttCrMlwUR/aIaqCPNN6byLHmaFwCE73JqCJ
	NqqE0ovDAYlSFok5KCpR3+TMmVVES8Q3p7PZi5N9QrsZuLfziQWE8P3qDLsVkcJWyxK0sS6A4ecPb
	rgB3/AaZj2dip+SAvrBKz46PaM7s1mW8Sgqy8tMZLrT2KMW3yHgiK20Eh23m0hnk1xHB8CASYXgWW
	JnLbQ4Iw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46986 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wdZ8X-00000006Ui5-3oxN
	for docs@lists.yoctoproject.org;
	Sat, 27 Jun 2026 15:56:26 -0400
Date: Sat, 27 Jun 2026 15:56:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should docs warn about setting DISTRO to ""?
Message-ID: <bd6848e2-a8c5-a460-f61e-62693ce7a1db@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 27 Jun 2026 19:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9919


  just being pedantic again ... doc for DISTRO:

https://docs.yoctoproject.org/ref-manual/variables.html#term-DISTRO

notes:

"If the DISTRO variable is blank, a set of default configurations are
used, which are specified within meta/conf/distro/defaultsetup.conf
also in OpenEmbedded-Core (OE-Core)."

suggesting that this is acceptable. but from bitbake.conf:

# An empty distro leads to :: entries in OVERRIDES and FILEOVERRIDES which
# is a bad idea. Setting a dummy value is better than a ton of anonymous python.
DISTRO ??= "nodistro"

should the ref manual entry also suggest that setting this to "" is
also a bad idea?

rday

