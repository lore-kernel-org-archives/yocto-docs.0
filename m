Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2356DC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 13:58:33 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.6292.1639749508760585464
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 05:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:60638 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1myDkj-0007kI-6t
	for docs@lists.yoctoproject.org; Fri, 17 Dec 2021 08:58:27 -0500
Date: Fri, 17 Dec 2021 08:58:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what is the purpose of "postinst_intercept delay_to_first_boot"?
Message-ID: <12915c50-473c-77ca-195-e2e2259b5c2f@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 13:58:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2304


  last Q: section in dev manual,
http://docs.yoctoproject.org/dev-manual/common-tasks.html#post-installation-scripts,
reads:

"To delay script execution until boot time, you must explicitly mark
post installs to defer to the target. You can use
pkg_postinst_ontarget() or call postinst_intercept delay_to_first_boot
from pkg_postinst()."

  ok, but if one can use the well-defined former mechanism, what is
the point of the second mechanism? if there is a difference, that
section does not explain to the reader what it is.

  and that should do it.

rday

