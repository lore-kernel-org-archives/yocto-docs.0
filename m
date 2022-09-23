Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62189C04A95
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:52:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.570.1663955568323015832
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bw5fk+PS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F350A40004;
	Fri, 23 Sep 2022 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qhR3BxC1Q2f54EJ94DshHZbXhpARGoD0SVPkcyl7KYA=;
	b=bw5fk+PSsIZSzqWWzUx6GslvNYYmkF2fuuy3PWjUa9WQtUJCGmS2AMxXTMRgWM9FnZUPXO
	c4wvRJGsTP7ltQ9J12GuHYyQlXRP4LuqUwxw2XHfSylckLEfE9s1hUwL4/wFdg8ioodlEM
	2hK+z6EohsGBWd5pTwfRduEqIs3s6IFVZE663Qv2smpI8bhRmM/909hmso/o0pJwsbSAta
	zZQVCvfXABCqX/hshmGx+bI5rkLT0IP4IWigiU1DRdrY6z+cvgG9NVvUk2lcTcw4USHdJ3
	6lbXtojbyBHbOswn+dgZvr9m/hgaQD4sRAihoage9iHif4Y3DESkrj1NwblX0Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 03/30] manuals: add references to the "do_build" task
Date: Fri, 23 Sep 2022 19:51:52 +0200
Message-Id: <20220923175219.6652-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:52:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3218

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/dev-manual/common-tasks.rst        | 4 ++--
 documentation/migration-guides/migration-3.4.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 09304d4b6a..7b20234991 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9635,8 +9635,8 @@ Running Specific Tasks
 Any given recipe consists of a set of tasks. The standard BitBake
 behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
 ``do_configure``, ``do_compile``, :ref:`ref-tasks-install`, ``do_package``,
-``do_package_write_*``, and ``do_build``. The default task is
-``do_build`` and any tasks on which it depends build first. Some tasks,
+``do_package_write_*``, and :ref:`ref-tasks-build`. The default task is
+:ref:`ref-tasks-build` and any tasks on which it depends build first. Some tasks,
 such as ``do_devshell``, are not part of the default build chain. If you
 wish to run a task that is not part of the default build chain, you can
 use the ``-c`` option in BitBake. Here is an example::
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index bc2c75d42e..bf0887a8bd 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -206,7 +206,7 @@ Package/recipe splitting
 Image / SDK generation changes
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- Recursive dependencies on the ``do_build`` task are now disabled when
+- Recursive dependencies on the :ref:`ref-tasks-build` task are now disabled when
   building SDKs. These are generally not needed; in the unlikely event
   that you do encounter problems then it will probably be as a result of
   missing explicit dependencies that need to be added.
-- 
2.34.1


