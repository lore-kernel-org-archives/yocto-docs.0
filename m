Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E676DC7EE30
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 09:05:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.11258.1750842347646115553
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 02:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=tw0bWhr0;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wx1WWahyg4kBpujOCO81vQgjNdt+SIcTKwj7r2KVq+c=; b=tw0bWhr0XwS9oPsAfjnTE/b032
	8wzfbtYilwWtMq2oAjfnQE20fdul6iyK1vPw7Fcqmeq4vWCov1nj3bkL6V1ny04C4toiCeY43BZHS
	Bv1eyxxaYvcTbZrLxq9es5wQfHvKTnH+rIlsRMoAJJJvw6+ShjWT8dpi8bmDT+kx0YLNZ/KASa3rZ
	1qy4eu+Zo0KzCD0/fq3YTDuac2Eb6vMhW1Z8T7afMJJoh8W0I4SM9KvpfN5d/9+Y8WxdNueDSxBxU
	LTzf5hhKauVuYvYlD1whVqZ1bB3x+5x4sWzXhPdSpuWqY/zdDqJkNvR8Mn/zo4q+9w+4pyVoHXcwK
	B9kcXw5Q==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:39910 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uUM4Z-00000000FHb-465g
	for docs@lists.yoctoproject.org;
	Wed, 25 Jun 2025 05:05:46 -0400
Date: Wed, 25 Jun 2025 05:05:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: update list of recipe files showing version
 numbers
Message-ID: <043d203c-8d28-1f3d-7082-70e69919423e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 25 Jun 2025 09:05:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7222


Update the short list of recipe files showing examples of proper
naming, and replace obsolete "irssi" example with example using "_git"
as a version.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index c49881efe..0f3ae0f1c 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -188,13 +188,14 @@ the recipe.
    Use lower-cased characters and do not include the reserved suffixes
    ``-native``, ``-cross``, ``-initial``, or ``-dev`` casually (i.e. do not use
    them as part of your recipe name unless the string applies). Here are some
-   examples:
+   examples (which includes the use of the string "git" as a special case of a
+   version identifier):

    .. code-block:: none

-      cups_1.7.0.bb
-      gawk_4.0.2.bb
-      irssi_0.8.16-rc1.bb
+      cups_2.4.12.bb
+      gawk_5.3.2.bb
+      psplash_git.bb

 Running a Build on the Recipe
 =============================

