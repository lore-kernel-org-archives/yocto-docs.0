Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A19CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:45:43 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9712.1780670741809200435
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 07:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=0FmIgEjk;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7jZC7apoA8OJVB0qGAhu3nNjkv6StXxyKMpzeoDvDI8=; b=0FmIgEjkXCqgC9tLNj0YBfcnSu
	acgaqna2hRbP8/63p9AWaMbD/w8aDYKbNugyG26+LjKJGk5H9/JOldoJOGsdLw1o8EAAtOGPl8A4j
	DaDHmXjka3xumckW2+/8POUhs83exz9X79USdt4qmC9RKPWbSMc88/88P3JXnx32Iz3qKX6fm1GGR
	YjcHYI8HlaMjcjk3D3CGwtthzo1v2MMLg3L6MZvYJgCBLO7tHD10g/sDKNOV8RMH++sTifdaSMlyd
	1yNqfs3IQYG4zR8TdUDz3ovj/AWUl43Zjr5Vo4kIHeDhtML8YDgE9cMuJQlNqa/GXZ6St8Xh3SWq+
	cpr0zNxw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:59110 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVVnm-0000000DtoU-2ONl
	for docs@lists.yoctoproject.org;
	Fri, 05 Jun 2026 10:45:40 -0400
Date: Fri, 5 Jun 2026 10:45:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] overview-manual: update deploy.bbclass snippet
Message-ID: <9071d45b-8364-46c0-7454-262341a5c63f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 14:45:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9611


The current contents of deploy.bbclass is slightly different so update
the code snippet and the subsequent explanation of that snippet.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 76ace6fcf..bfd110c69 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1776,7 +1776,8 @@ adding shared state wrapping to a task is as simple as this
        sstate_setscene(d)
    }
    addtask do_deploy_setscene
-   do_deploy[dirs] = "${DEPLOYDIR} ${B}"
+   do_deploy[dirs] = "${B}"
+   do_deploy[cleandirs] = "${DEPLOYDIR}"
    do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"

 The following list explains the previous example:
@@ -1821,9 +1822,16 @@ The following list explains the previous example:
    information, see the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:setscene`"
    section in the BitBake User Manual.

--  The ``do_deploy[dirs] = "${DEPLOYDIR} ${B}"`` line creates ``${DEPLOYDIR}``
-   and ``${B}`` before the :ref:`ref-tasks-deploy` task runs, and also sets the
-   current working directory of :ref:`ref-tasks-deploy` to ``${B}``. For more
+-  The ``do_deploy[dirs] = "${B}"`` line creates the directory ``${B}``
+   before the :ref:`ref-tasks-deploy` task runs, and also sets the
+   current working directory of :ref:`ref-tasks-deploy` to ``${B}``.
+   (If the directory already exists, it is left as is.) For more
+   information, see the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:variable flags`"
+   section in the BitBake User Manual.
+
+-  The ``do_deploy[cleandirs] = "${DEPLOYDIR}"`` line creates the *empty*
+   directory ``${DEPLOYDIR}`` before the :ref:`ref-tasks-deploy` task runs.
+   (If the directory already exists, it is deleted and recreated empty.) For more
    information, see the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:variable flags`"
    section in the BitBake User Manual.



