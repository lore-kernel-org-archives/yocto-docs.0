Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F23DC83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 11:26:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.11772.1753270006314385268
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 04:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=WCwx50Rm;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aLD8BtYaHyvVvBejJrEO1T1KoDMrqQ+7XtuGq+g66WA=; b=WCwx50RmOSaa9hTo24lDJESxRY
	1nwx8HffDXVGPcdE4zsZBRPCxw/nIPJqG+o7AqiP+wkbxXVr0Kk1odbpFZot0xpLcYSDhmzhl1owd
	yrG4RbjgQw2dd3XmUkMw1hjFUCvDXk+D8pP8mVWvkTsN0MPN/TLZC0vzV6PnYQFZNDjqRSsD0BQIs
	AcMjm5NWlcLGqEpKC8yvA6wssQ4UBDV0qTHVU1qTUPhRdiznT55rD/Vo7jzoMt2DKaIoJnUft9+S2
	hs+h5lzDlOnvxomK+Wv5Ox/lEi0LIyAuPYmSmKR7PGJsj7/vvY14sktxeH0p2X2stubqUBO6A+mXc
	13w2qqlA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:59108 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ueXcM-00000009eKe-2onW
	for docs@lists.yoctoproject.org;
	Wed, 23 Jul 2025 07:26:44 -0400
Date: Wed, 23 Jul 2025 07:26:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: odd that *all* meta-virt "xen" recipes set DEFAULT_PREFERENCE =
 "-1"
Message-ID: <4daccede-f781-1e3d-3d26-13a8185418a2@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 23 Jul 2025 11:26:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7365


  here:

https://git.yoctoproject.org/meta-virtualization/tree/recipes-extended/xen

it seems a bit odd that all three versions of the xen recipe (4.19,
4.20 and git) contain the line:

  DEFAULT_PREFERENCE ??= "-1"

this seems to violate the spirit of that variable, which is to
discourage *some* of the versions of a given recipe. is this
considered reasonable usage of that variable?

rday

