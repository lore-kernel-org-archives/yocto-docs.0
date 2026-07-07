Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8D7C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 18:50:25 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5161.1783450217489975623
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 11:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=NZ8Uno4I;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BetbSbqvJGEiVDftCqfYquwU43CGvlDRTtJIPWFoYT0=; b=NZ8Uno4IDPudxkCHInUmzAaCZT
	4begycWZzbR/EkmWNXoc7fDFMYrhNJ7NMbD4lAuYgL4F3Az+dtteyHCQhGricRgh8FSLixO7DUHAL
	FSBmDwghQQ7Ue8PCxfZyhLiQnOw+IkgU5okFaWmbR6Mq0vql6Ny3mbyMrRzYNU0JthnM11iiPRyzK
	UoLmoqxrBl1sBwJ+3NVMDuF4Akgi1VqoT91CH2OCG2V867tsnmtdgdiOjDadNzvh9/zVz2CLzQ62n
	1TjqBLSSP8naBN+pUz5hV3q7RLyjKnh9yhbeF9IFOIf9SThLtyMIsh/dQSYuNqWDs0zdFS+yqOoUw
	XcZva/5A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:40814 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1whAry-00000001Ndg-2iTT
	for docs@lists.yoctoproject.org;
	Tue, 07 Jul 2026 14:50:15 -0400
Date: Tue, 7 Jul 2026 14:49:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: some variables in kernel-artitact-names.bbclass not in glossary
Message-ID: <45d0bf0c-1a78-6cdc-6d88-d7f70bead8cf@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 07 Jul 2026 18:50:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10040


crawling through the kernel code and tasks and classes and here:

https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/kernel-artifact-names.bbclass

there are some variables that are not in the variables glossary:

  KERNEL_ARTIFACT_LINK_NAME
  KERNEL_ARTIFACT_BIN_EXT
  KERNEL_DTB_BIN_EXT
  KERNEL_FIT_BIN_EXT

in fact, there are several references in the glossary to
KERNEL_ARTIFACT_LINK_NAME, but not by ref, just with monospaced font,
so it seems like it merits an entry.

  and, no, i can't submit a patch since i'm still learning how these
things are used.

rday

