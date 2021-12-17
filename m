Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A88C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 13:36:03 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.6183.1639748146314421329
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 05:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:60634 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1myDOk-0003dL-FF
	for docs@lists.yoctoproject.org; Fri, 17 Dec 2021 08:35:45 -0500
Date: Fri, 17 Dec 2021 08:35:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: trying (again) to clarify pkg_postinst[_ontarget]
Message-ID: <f63931-692c-7af-251c-6f6dfdb0451e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 13:36:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2302


  i know i once asked about this (probably on oe-core list), but i was
reading this section in the dev manual,

http://docs.yoctoproject.org/dev-manual/common-tasks.html#post-installation-scripts

and i think it needs work, or i just have no idea how to read it
properly, so let me ask some really dumb, basic questions.

  first, IIRC, once upon a time, such a script had the option of being
run at image install time, or on-target install time (depending on i
think whether the script exited with 0 or 1 or something like that).
those days are gone, and the new design is to use one of:

  pkg_postinst
  pkg_postinst_ontarget

fair enough, but in the old days, such a script might check the value
of ${D} to see if it was running in the image context, or on-target
context, and obviously run differently. given the current setup with
those two distinct routines, is there any purpose in such a script
*ever* checking the value of ${D} anymore? that is, is it safe to
assume that the first version above is run in image context, and the
second in on-target context? or is there still some obscure reason to
need to check?

  i ask as i see this in base-passwd_3.5.29.bb:

    pkg_postinst:${PN}-update () {
    #!/bin/sh
    if [ -n "$D" ]; then
            exit 0
    fi
    ${sbindir}/update-passwd
    }

  how does one interpret that? or is just a holdover from the old
days? certainly that section in the docs is not going to help a reader
understand the (still) numerous references to ${D} in some of those
scripts.

rday

