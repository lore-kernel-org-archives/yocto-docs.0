Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EDECDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 14:08:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12420.1782396490437189857
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 07:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=q0KDyM/o;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8aHmsqM6rqkdu0vdRCfDnUWjBOq4/9nTcV44LEPK5jE=; b=q0KDyM/oZVOi0Iy3VRKLFtwvg5
	QQXAmT7xCUektqX8XiXhi2GJ5FJ30X95t71189ngnr8d9ewbh+un7KubUj8NqBk78SV6DwvSYITmS
	u7l1BfImbp80+0InZBTMIyVPBulV+hxsXYLLhWSD0sOH/WwNKMAslZcfHAxxBWHm1HNweaPnpuA4u
	b8AvHbVTlkYWvfVdgIC0A1Q0d2jWvoWi/kMdn/UPqDcaj7lmWC9/vODxT5CCN6/vDVmAURWVmguT6
	RFFLkNNvIimqPGYXZAX2tm/1VkxmUt7Plm9ZAg8h9ml5APNrlrwiinmwfM4oygjmH1omJfYdyVRFu
	NCwLT7Sg==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:51652 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wckkQ-00000000dcJ-2gQ4
	for docs@lists.yoctoproject.org;
	Thu, 25 Jun 2026 10:08:08 -0400
Date: Thu, 25 Jun 2026 10:07:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: why does ptest for cpio and quilt need to "chgrp" to ptest?
Message-ID: <6869149f-ded1-0105-c94e-dcbd595609eb@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 14:08:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9898


  currently writing some additional documentation for ptest and poring
over the class and recipes and ran across something i had not noticed
before.

  the ptest-runner recipe, near the end, creates a "ptest" account:

# Create a non-root user that test suites can use easily
inherit useradd
USERADD_PACKAGES = "${PN}"
USERADD_PARAM:${PN} = "--system --no-create-home --home / --user-group ptest"

  ok, so that suggests that *some* ptests will want to, what, run
under the "ptest" user or group? so i kept looking and, first, in
"ptest.bbclass", there's this in the middle of do
_install_ptest_base():

    do_install_ptest
    chown -R root:root ${D}${PTEST_PATH}

ok, so the ptest directory for any ptest-enabled recipe will be
"root:root", meaning that a non-root account will have no ability to
write anything under there.

  but the cpio recipe (as is quilt) is a special case as it contains
the following:

# ptest.bbclass currently chowns the ptest directory explicitly, so we need to
# change permission after that has happened so the ptest user can write a
# temporary directory.
do_install_ptest_base:append() {
    chgrp -R ptest ${D}${PTEST_PATH}/
    chmod -R g+w ${D}${PTEST_PATH}/
}

  so i guess the ptest for cpio wants to write under the ptest
directory; hence the need for "chgrp" to "ptest". i'm not sure what is
going on here since i see only two recipes -- cpio and quilt -- that
do this. i am unclear on the relationship between the user and group
under which ptest-runner is running, and what about cpio *requires*
its ptest directory to have a group of "ptest".

  i just find it odd that ptest-runner creates a "ptest" account, but
only two OE recipes take advantage of it.

rday

