Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E83CD4F2C
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 08:50:31 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66112.1781254222262582009
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 01:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=my82M+t7;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vg8ZU1//BOkdzqG9/GFgu4tpIAvXBdBxGq7w3JVTybk=; b=my82M+t7Z0OcjJuLvM1qVZd+jm
	7ARYWa+bv6x82H8eCJY8WPoD5dsS13aqmLq/6zrSrQn4oAYz3+SdoCDQKUuAjVZ4dLh/smSWWogol
	4gtKPS4XJaArxXuxy3uLkCl9W8wRMU51J9G+C/EIcUTa7OU463tijw2uzx1C+Si3DsfmpPdGd4rg/
	ksaLF0vwEC8UbpdeqBJH7xs8quVkSgUc0qTdRANwo9L+8FyOZa6ZhGRdCbMkMb5/E1aw3V9fy9+yx
	RcTD3vS1OazKcT0JHosVzw34noHsRp+vSCfVmw/rvOfdzGXxLZZ2CUIVfniLFjKCg7CNUP93pMCM7
	ZdDx4vLw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:60280 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXxaj-0000000Dqv1-2qX1
	for docs@lists.yoctoproject.org;
	Fri, 12 Jun 2026 04:50:18 -0400
Date: Fri, 12 Jun 2026 04:50:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: correct inaccurate explanation of buildhistory
 setup
Message-ID: <50ea53c0-245a-177b-52e3-c9813a99504d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 08:50:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9703


At the moment, the introduction to the buildhistory class suggests
that the developer needs to add the line:

  BUILDHISTORY_COMMIT = "1"

to their config file. Obviously, this is untrue since it is already
set to that by default in the buildhistory.bbclass file so remove that
directive but clarify that there is a reason why they might want to
subsequently set it zero.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index c3c7ccbb2..3c1dca2a2 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -33,13 +33,10 @@ The remainder of this section describes the following:
 Enabling and Disabling Build History
 ====================================

-Build history is disabled by default. To enable it, add the following
-:term:`INHERIT` statement and set the :term:`BUILDHISTORY_COMMIT` variable to
-"1" at the end of your ``conf/local.conf`` file found in the
-:term:`Build Directory`::
+Build history is disabled by default. To enable it, simply add the following
+:term:`INHERIT` statement at the end of your ``conf/local.conf`` file::

    INHERIT += "buildhistory"
-   BUILDHISTORY_COMMIT = "1"

 Enabling build history as
 previously described causes the OpenEmbedded build system to collect
@@ -52,9 +49,27 @@ build output information and commit it as a single commit to a local
    particularly for images, and increases the amount of disk space used
    during the build.

-You can disable build history by removing the previous statements from
+You can disable build history by removing that INHERIT statement from
 your ``conf/local.conf`` file.

+.. note::
+
+   To enable basic build history, you need only add the line::
+
+      INHERIT += "buildhistory"
+
+   to your local configuration, but the subsequent generation of that history
+   is actually controlled by the :term:`BUILDHISTORY_COMMIT` variable
+   which is, by default, already conditionally set to "1" in the
+   ``buildhistory.bbclass`` file::
+
+      BUILDHISTORY_COMMIT ?= "1"
+
+   so there is no need for you to set that variable yourself. However, as
+   you will see later in this section, you can inherit that class file
+   yet set that variable to zero if you don't want the history but
+   still want some of the other information produced by this feature.
+
 Understanding What the Build History Contains
 =============================================


