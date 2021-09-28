Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAB9C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 09:14:04 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.11486.1632820442707227013
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 02:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:57144 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mV9BZ-0003HU-DG
	for docs@lists.yoctoproject.org; Tue, 28 Sep 2021 05:14:01 -0400
Date: Tue, 28 Sep 2021 05:13:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: possibly rewriting the "shared state" section (and others?)
Message-ID: <f08d3e1d-97f5-d29-4764-e019205bbf47@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 09:14:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1896


  pursuant to my tripping over a typo in the shared state section:

http://docs.yoctoproject.org/overview-manual/concepts.html#shared-state-cache

  it seems like that section (and many others) are unnecessarily
cumbersome far too early, in the sense of explaining the underlying
mechanics before simply telling the reader how to do something. case
in point: you need to read to almost the end of the whole section to
see a simple example of how to use SSTATE_MIRRORS.

  it seems like it should be the other way around -- "how can i save
all my sstate elsewhere on my disk to save piles of time?". here's an
example. *then* you back up and get into the intricacies. so let me
ask a couple (admittedly trivial) questions to make sure i grok this
and i'll ponder submitting some changes.

  in the sense of saving sstate-cache elsewhere on disk, it appears
that doing a simple "cp -a" or "mv" will do it, at which time i can
just set SSTATE_MIRRORS appropriately.

  first question: if i start from scratch and build a generic image
like "core-image-base", then save all sstate elsewhere, set
SSTATE_MIRRORS, delete tmp/ and build again, should i get *all* of my
build content from sstate? (unless there are recipes that explicitly
indicate they must be re-run no matter what?) i'm going to test this
right away building systemd-based core-image-base for aarch64 to see
what happens.

  second: as i extend my image, i will occasionally add a recipe that
has no saved sstate, so it will be built and sstate saved locally in
SSTATE_DIR in the build directory. if i want to add that to my global
sstate, is it just a matter of a simple "rsync" or something similar?

  last: i am simply assuming that it's probably a bad idea to set
SSTATE_DIR and SSTATE_MIRRORS to the same location trying to be
clever, because i'd want to have a mostly read-only SSTATE_MIRRORS to
be shared among developers, and not allow everyone to dump stuff in
there arbitrarily.

  thoughts?

rday

