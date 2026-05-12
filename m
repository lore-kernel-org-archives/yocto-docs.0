Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FB1CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:57:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72541.1778583470559848640
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 03:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZuEI2BpB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vz9pq5rbmX6a2qacNu2z6BZ/Y9n2Dym3X/p+nq1IQtE=; b=ZuEI2BpBPQFJ4M8nvrnif6gBes
	YentDJvMsuu2CodyUGFvuhhGwnrhoprzPM5QShxSVEIi+sxRRxWiu8NiS+lMEz1wqgcXllZEs/HO8
	GozuAY6tvwoq9v0a/9zHU/Aqg/s4UtJUo+T/MGaUgzhmNOplbyH2kOX7zGQJSo4RoG6FvL7yOGtzJ
	bxm6EYer4saf2PLpLuD7SC4cxzgcdZJv8ygAuCMJqDVsdy33la1txRF0skPvAAMi9cCFzNDSQDm41
	wVtJFq4zWvyzC6Y14hh15vJiSgeyTSqLGbv+nhzMgjkMxBdqh2S/1FPo/a5iuu4skfoVdSpWsKspZ
	jydI1gQA==;
Received: from [147.129.179.166] (port=42900 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMko8-00000007SYC-06Mh
	for docs@lists.yoctoproject.org;
	Tue, 12 May 2026 06:57:49 -0400
Date: Tue, 12 May 2026 07:00:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: add a few more basic Git commands
Message-ID: <aacf3c4c-0a65-661b-35b7-91828cf5cd33@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 10:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9462


To the Git basic commands section, add:

  - git grep
  - git clean
  - git reset

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 7408a4c62..fc347f8b5 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -568,10 +568,20 @@ descriptions and strategies on how to use these commands:
    This report lists all commits regardless of whether you have pushed
    them upstream or not.

+-  *git grep:* Looks for specified patterns in the tracked files in the
+   working tree, blobs registered in the working tree, or blobs in given
+   tree objects.
+
 -  *git diff:* Displays line-by-line differences between a local
    working file and the same file as understood by Git. This command is
    useful to see what you have changed in any given file.

+-  *git clean:* Cleans the working tree by recursively removing files
+   that are not under version control, starting from the current
+   directory.
+
+-  *git reset:* Resets the current HEAD to the specified state.
+
 Licensing
 =========


