Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B27ECD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 17:17:07 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2923.1781630218996297599
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 10:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=gBmpGp2X;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n2FeNCC2i+GpXjGu8tP6RGDOplVDFKoFFeaTE5jO0Ho=; b=gBmpGp2X3wfVIoRjsZZsIaG9F6
	nj/C1RHV6LQl85eDFkK5BqW/fTPW1x3/PmVFzJdH962gKm1xBydHxPIsGq6kqTDSi5ZU7JyuPGRI3
	NeoHauCoAMBPN03lScDLgj8eTxYytrqy9bIOmug4J64NFIszN9oDfFdRoTD7SkRPbdtKhauw2l+xy
	kibztd61KCjEVAyQm5tBrrr5wWvRs4JAMtROEEV2jEqGXVMc2slIlsiG3GJeP3/GUcEWWqCy+xrUs
	Q0udAxtLvvtJirEp+34L8JB6CE5P5d+0TA31wqdqBrkRpAHOVdLj7vwlu5q+As/+cAauDvTinrGRQ
	zkDsiPYA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:60218 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZXP8-00000007T9U-2ihy
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 13:16:51 -0400
Date: Tue, 16 Jun 2026 13:16:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: document RM_WORK_EXCLUDE_ITEMS variable
Message-ID: <101ababc-0c13-4310-9d9b-734b88407a54@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 17:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9761


Add an explanation of the RM_WORK_EXCLUDE_ITEMS variable to both the
Reference Manual variables and classes sections.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 95e07f85a..ba87a5cd4 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2614,6 +2614,13 @@ which can also be set in your ``local.conf`` file. Here is an example::

    RM_WORK_EXCLUDE += "busybox glibc"

+Finally, if you are using this class for a recipe but want to prevent
+:term:`BitBake` from deleting specific folders or files in that recipe's
+:term:`WORKDIR` (other than ``temp``), you can preserve those folders or
+files with the :term:`RM_WORK_EXCLUDE_ITEMS` variable as follows::
+
+   RM_WORK_EXCLUDE_ITEMS += "items_to_keep"
+
 .. _ref-classes-rootfs*:

 ``rootfs*``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index df3666f1c..44a302bd4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8433,6 +8433,12 @@ system and gives an overview of their function and contents.
       specifies a list of recipes whose work directories should not be removed.
       See the ":ref:`ref-classes-rm-work`" section for more details.

+   :term:`RM_WORK_EXCLUDE_ITEMS`
+      With :ref:`ref-classes-rm-work` enabled, this variable specifies
+      a list of files or folders --- relative to the recipe's :term:`WORKDIR` ---
+      to be preserved.
+      See the ":ref:`ref-classes-rm-work`" section for more details.
+
    :term:`ROOT_HOME`
       Defines the root home directory. By default, this directory is set as
       follows in the BitBake configuration file::

