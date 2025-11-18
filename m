Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3DCCEDDA1
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 15:31:41 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15267.1763479895995183006
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 07:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=y3uegO4k;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jS80aMCJQMqmFO0GIQnQ84hqWP/Mn6brdSeKN+oDJGo=; b=y3uegO4kalnImP+q+iyIwCr3OV
	4MUMN/57hH/ouxEpDrABgSPVyZUkldPn+EUXSIIoWhk464kIekXJyGP0t/4GShO2d5pWodjqEd1lZ
	nPG6n+vhjROE0u2UoaM7yThgPHU8r3bV7ylGYO8GTuYqx5kSs7Aif4qWDrW4I4Bk+r+pkA/Tjf9b/
	GU9D0OEKX2mzZsO9zYndXuLJE/r37TDpHLBq51dYDHxDuWCwjwnu2hqaMljHWo3YrHrHtz+x3H4Zw
	OR8Zts1tkr3BTVSG7AqXjGMPVwKDpVfOfYfDZLsJTiI9jNHREdpLkjfc32uCpgGoz3zhaAr+A/ubC
	KudeRKhQ==;
Received: from [147.129.179.166] (port=57308 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLNg2-0000000HVAG-2wpH
	for docs@lists.yoctoproject.org;
	Tue, 18 Nov 2025 10:31:33 -0500
Date: Tue, 18 Nov 2025 10:30:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: confused about "PN" setting with BBCLASSEXTEND and devupstream
Message-ID: <15607e48-862f-48b0-20b8-0b223f7b6540@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 18 Nov 2025 15:31:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8072


  i've never had occasion to use BBCLASSEXTEND and devupstream:target
so this is probably a trivial question.

  from a typical linux-yocto recipe, i see the following snippet:

# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
# get the <version>/base branch, which is pure upstream -stable, and the same
# meta SRCREV as the linux-yocto-standard builds. Select your version using the
# normal PREFERRED_VERSION settings.
BBCLASSEXTEND = "devupstream:target"
SRCREV_machine:class-devupstream ?= "f6cf124428f51e3ef07a8e54c743873face9d2b2"
PN:class-devupstream = "linux-yocto-upstream"
KBRANCH:class-devupstream = "v6.12/base"

  note how the override feature is used to assign the name
"linux-yocto-upstream", which would then of course be selected using
PREFERRED_VERSION.

  but what about recipes that use that feature but *don't* set PN
similarly? for example, the lttng-modules recipe contains:

BBCLASSEXTEND = "devupstream:target"
SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13;protocol=https"
SRCREV:class-devupstream = "7584cfc04914cb0842a986e9808686858b9c8630"
SRCREV_FORMAT ?= "lttng_git"

  ok, so ... what is the specifier for selecting the devupstream
variant? i don't see that explained.

rday

