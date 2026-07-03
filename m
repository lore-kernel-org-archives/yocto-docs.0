Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5D5C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 12:50:11 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91658.1783083009423739183
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 05:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=M2hYi0el;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6vO2Zlb2QZbIz3StY7u1Tihg/CxAwsgWyJha8RGQzVo=; b=M2hYi0elIf5dVVXH7jy4SA/Fjb
	UphC0tRYlgzuaVkPKrFZQ3x4n+m3ZYIHqyk7oWsi6pRAxT6/N0kCgo1TbfOt4Gf/xcoAMPKfWnaAA
	L/odVAaIDgGYZHJLBHNjHByKLVbW3TQnzJXp01svEHd4FpcQPtBGKh/xgC0KNNaEkvIimZD/jCf2l
	4l3KN3xWKIj2LeRubSFx+5hD49qDpximRNSs5xcLhQmXiLYJxGDJBDnYCbfd3Qb4Y0cIOdj8ue9Ds
	br24hLDfpX2q1X54SR0pZKIB2RT+LoSaShLPR1ERnuFo1fTryiKnL6Z8oc/A/h1EEyZNwrurlUA0j
	HHVsvuxw==;
Received: from bras-base-otwaon0916w-grc-40-70-27-65-4.dsl.bell.ca ([70.27.65.4]:50970 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wfdLF-000000073d8-1RVa
	for docs@lists.yoctoproject.org;
	Fri, 03 Jul 2026 08:50:06 -0400
Date: Fri, 3 Jul 2026 08:49:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should KERNEL_VERSION_SANITY_SKIP be in variables glossary?
Message-ID: <785cb893-125d-ad25-38cb-0c9fc90ca439@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 12:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10030


i see the opening of the corresponding task in kernel.bbclass:

  do_kernel_version_sanity_check() {
        if [ "x${KERNEL_VERSION_SANITY_SKIP}" = "x1" ]; then
                exit 0
        fi

and i see that that variable is set in linux-yocto-dev.bb. should it
be mentioned in the variables glossary as being of general usage?

rday

