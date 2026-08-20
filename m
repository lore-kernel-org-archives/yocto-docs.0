Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B105C5DF88
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 10:53:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4387.1787223235590431838
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 03:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=yX/PuDHh;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tS0yN1uD8g77eJzbQHcLYU2aIgfDP/TYQe3mt62Kpwo=; b=yX/PuDHhwcjmiLC0bno8OSZqZI
	sXlHD6gTdx/NmRrxDJ2OksP2achtUIx34/kBu2mJ96ljDSZAGWxC/A7Mq7tchzwaWhS2fV+a0grjs
	11cAjBT7qBibQyMrH1PpC1DYLkvH9TH+HcE5tVMbCA+T+rjDwpSXIqigP2H5DTwtCJERKuWllD5Yy
	nRzbXMS0vebBKcT7VBhPA8q4QhO8H1MLTm5lbgc2pct1QvJX3EDVDh82pw5R54F55Mpt1KG0xGLh7
	isCtI0myPML6CDVKd0Bo0+XxPCCG5jHLfwC/ysvELgxpBLsgAhHGTuh+9gHihEKQjm9Aq5S/kUc01
	0s/OUJKw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:49490 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wx0PA-0000000Gued-3te3
	for docs@lists.yoctoproject.org;
	Thu, 20 Aug 2026 06:53:53 -0400
Date: Thu, 20 Aug 2026 06:52:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what is purpose of "$(O)" in top-level docs Makefile?
Message-ID: <e8f1d965-bdfb-4246-5352-bb071bc936f1@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 20 Aug 2026 10:53:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10299


  almost certainly a dumb question but was perusing the top-level docs
Makefile and read at the bottom:


# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%:
        $(SOURCEDIR)/set_versions.py
        @$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

  it's unclear to me what the point of $(O) is if it's supposed to be
a "shortcut" for $(SPHINXOPTS) when they're both incorporated in that
build command. can someone clarify what is going on here?

rday

