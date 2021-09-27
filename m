Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04768C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 10:13:04 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.29165.1632737583180682687
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 03:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:60384 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mUnd6-0006Hj-LN
	for docs@lists.yoctoproject.org; Mon, 27 Sep 2021 06:13:01 -0400
Date: Mon, 27 Sep 2021 06:12:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: standard of "populate_sysroot" or "do_populate_sysroot"?
Message-ID: <6bbc3a50-168f-6739-8f65-af92cd4ff61@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 27 Sep 2021 10:13:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1890


  perusing sphinx content for ref-manual/classes.rst, and noticed the
following (line 2383):



``staging.bbclass``
===================

The ``staging`` class installs files into individual recipe work
directories for sysroots. The class contains the following key tasks:

-  The :ref:`ref-tasks-populate_sysroot` task,
   which is responsible for handing the files that end up in the recipe
   sysroots.

-  The
   :ref:`ref-tasks-prepare_recipe_sysroot`
   task (a "partner" task to the ``populate_sysroot`` task), which    <====
   installs the files into the individual recipe work directories (i.e.
   :term:`WORKDIR`).

The code in the ``staging`` class is complex and basically works in two
stages:

-  *Stage One:* The first stage addresses recipes that have files they
   want to share with other recipes that have dependencies on the
   originating recipe. Normally these dependencies are installed through
   the :ref:`ref-tasks-install` task into
   ``${``\ :term:`D`\ ``}``. The ``do_populate_sysroot`` task   <====
   copies a subset of these files into ``${SYSROOT_DESTDIR}``. This
   ... snip ...



  note the two slightly different references to the same task:

  - ``populate_sysroot``
  - ``do_populate_sysroot``

is there a consensus as to whether task names should be given with the
leading "do_" when referenced in documentation?

rday

