Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805A0C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 10:02:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.16024.1753437740857834872
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 03:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=0Q5aoIQj;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AqBADC3dkrqADmzC8wQiAWT1HRk4TqlxEIZV3ypzK9Y=; b=0Q5aoIQjxzDneaCtecyIYEbV8b
	HLnefp5lxtJzpY9C5MxsKVNGzCgXEqqVWiNk5+dLvkdIycar0fq0kyqK3eb9k3iV4dOKFiAvzT2l9
	x3i79qlbqo2ykhtq53B/L1+oJBkfGmjPM50k4wYYdVSDdrmrkTAveFIr+KX2/VpbePKBIt2p1RUQo
	tkwsL/c5WVVFj1OpBiEyL5Y/Axg6RrriolwqsrzliIRv0eG73NNvlCz0kObb5U6OmUR505FZLc+IR
	Hg4kuTbg696EDT2bkaWsDUoCTVGkBBIb5rmtYdrblpOWsbMgMAn3RTo1RJ36gB1rm6c5uS1+dZtTq
	UqPn8Y8g==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:40382 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ufFFo-00000000YRN-1TjZ
	for docs@lists.yoctoproject.org;
	Fri, 25 Jul 2025 06:02:19 -0400
Date: Fri, 25 Jul 2025 06:02:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] variables.rst: remove references to obsolete tar packaging
Message-ID: <26fc08c0-b3ba-dbd1-af40-6de560fc8769@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 25 Jul 2025 10:02:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7384


The tar packaging format was removed some time ago. Also, add some
minor grammatical tweaking.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d079e4b59..7e4f7e58a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4242,13 +4242,13 @@ system and gives an overview of their function and contents.
       variable.

    :term:`IMAGE_PKGTYPE`
-      Defines the package type (i.e. DEB, RPM, IPK, or TAR) used by the
+      Defines the package type (i.e. DEB, RPM or IPK) used by the
       OpenEmbedded build system. The variable is defined appropriately by
-      the :ref:`ref-classes-package_deb`, :ref:`ref-classes-package_rpm`,
-      or :ref:`ref-classes-package_ipk` class.
+      one of the :ref:`ref-classes-package_deb`, :ref:`ref-classes-package_rpm`,
+      or :ref:`ref-classes-package_ipk` classes.

       The :ref:`ref-classes-populate-sdk-*` and :ref:`ref-classes-image`
-      classes use the :term:`IMAGE_PKGTYPE` for packaging up images and SDKs.
+      classes use the :term:`IMAGE_PKGTYPE` for packaging images and SDKs.

       You should not set the :term:`IMAGE_PKGTYPE` manually. Rather, the
       variable is set indirectly through the appropriate
@@ -4257,12 +4257,6 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system uses the first package type (e.g. DEB, RPM,
       or IPK) that appears with the variable

-      .. note::
-
-         Files using the ``.tar`` format are never used as a substitute
-         packaging format for DEB, RPM, and IPK formatted files for your image
-         or SDK.
-
    :term:`IMAGE_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system creates the final image output files. You can specify

