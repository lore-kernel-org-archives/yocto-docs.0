Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1288EC7EE2F
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:02:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.22650.1677679375480269254
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 06:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TR4QUMX5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E9F121BF204;
	Wed,  1 Mar 2023 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677679373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7f4IIryxVUjCitcWjfLM00ixNrwgE8Rz0mhDJVdwaSc=;
	b=TR4QUMX5ROAbQNtlfEnp+gFjT7FAfE6aHYEAVtVoy/uvSlChOfV/0ENgexYX179qpMQRob
	X6MUN7HisXXw16SOd129PkByNsDnKoLfbDtBUvzc3W981K4pLDKIF3CcL4r/8FIIrDFyVo
	Hh//zfDqD5ta/CvE1mSrq82w2Mn4u5sW/P8yU65hb8lNK5NE6U4AFAO5drF7VozunJVHw1
	d5+nQhdN7PXEb7qjYEzv5Slv3TVylsFK6QmN6HNI84YPMi4b9wNCQoRdEYOuIyO6iNoqY8
	rsYOWtt2BY9tYZFDcD8B5T46p9sgMXbb9tTX3GuBr37IujhziuG+WjQ63wHO2w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: simplify internal references
Date: Wed,  1 Mar 2023 15:02:49 +0100
Message-Id: <20230301140249.394381-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 14:02:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3768

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Use a target when available or a direct reference
to a section in the same document.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 6 +++---
 documentation/ref-manual/release-process.rst   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 32e64d02a2..8e62c21425 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -189,7 +189,7 @@ external source tree.
    run your application. If dependent packages (e.g. libraries) do not
    exist on the target, your application, when run, will fail to find
    those functions. For more information, see the
-   ":ref:`ref-manual/devtool-reference:deploying your software on the target machine`"
+   ":ref:`devtool-deploying-your-software-on-the-target-machine`"
    section.
 
 By default, ``devtool add`` uses the latest revision (i.e. master) when
@@ -555,7 +555,7 @@ Removing Your Software from the Target Machine
 Use the ``devtool undeploy-target`` command to remove deployed build
 output from the target machine. For the ``devtool undeploy-target``
 command to work, you must have previously used the
-":ref:`devtool deploy-target <ref-manual/devtool-reference:deploying your software on the target machine>`"
+":ref:`devtool deploy-target <devtool-deploying-your-software-on-the-target-machine>`"
 command::
 
    $ devtool undeploy-target recipe target
@@ -599,7 +599,7 @@ The ``devtool status`` command has no command-line options::
    $ devtool status
 
 Following is sample output after using
-:ref:`devtool add <ref-manual/devtool-reference:adding a new recipe to the workspace layer>`
+:ref:`devtool add <devtool-adding-a-new-recipe-to-the-workspace>`
 to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory::
 
    $ devtool status
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 19e8040638..085d56a608 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -15,7 +15,7 @@ Major and Minor Release Cadence
 The Yocto Project delivers major releases (e.g. &DISTRO;) using a six
 month cadence roughly timed each April and October of the year.
 Following are examples of some major YP releases with their codenames
-also shown. See the ":ref:`ref-manual/release-process:major release codenames`"
+also shown. See the "`Major Release Codenames`_"
 section for information on codenames used with major releases.
 
   - 2.2 (Morty) 
-- 
2.37.2


