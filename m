Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F36C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 13:30:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.8044.1646746236971972456
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 05:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mUHemdsw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ECF4A20005;
	Tue,  8 Mar 2022 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646746235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j6FrPyoU4860nChwmf2tKZwM4J2aCWttb8haORDnfwo=;
	b=mUHemdswHVrMYwDptZnGicfXeEw5Ip/+M06JKpmFm6U6U4e0HOUAeibOhIiFtARJQ07xsz
	+Od55LWbT3VDKqsJl32ucWi+mXwrb/lxEbjmqngpRvpJuPPA61hv/lYOwEptqS1byHlVje
	9TtON6CuaOHL6RibY1DocetA8zF5j0l2K3nSPyLDVDf6+G1H6ikdBZQn3AHSYlq/8e2Q1o
	kRSV2gUPEHS4q2G90NlkLxnNO+iH5bsCeQ9s3nJryXtp3RqwiwZ3rnyLM+Z02sUJrGLilF
	GV0hY3JZ9uqn3yr8gfG6wSJ5BcYj5/wQa0DEQCIg+b13E+g7Mcx5UxEaZUWqgw==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] doc: brief-yoctoprojectqs: update video tutorial
Date: Tue,  8 Mar 2022 14:30:32 +0100
Message-Id: <20220308133032.580327-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 13:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2541

Replace a 10 year-old introduction to the Yocto Project
by the most recent one from Behan Webster and Tom King (Dec. 2021).

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index b01fb4d40b..ad5d8a950c 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -424,12 +424,12 @@ information including the website, wiki pages, and user manuals:
    development documentation, and access to a rich Yocto Project
    Development Community into which you can tap.
 
--  **Developer Screencast:** The `Getting Started with the Yocto Project -
-   New Developer Screencast Tutorial <https://vimeo.com/36450321>`__
-   provides a 30-minute video created for users unfamiliar with the
-   Yocto Project but familiar with Linux build hosts. While this
-   screencast is somewhat dated, the introductory and fundamental
-   concepts are useful for the beginner.
+-  **Video Seminar:** The `Introduction to the Yocto Project and Bitbake, Part 1
+   <https://youtu.be/yuE7my3KOpo>`__ and
+   `Introduction to the Yocto Project and Bitbake, Part 2
+   <https://youtu.be/iZ05TTyzGHk>`__ videos offer a video seminar
+   introducing you to the most important aspects of developing a
+   custom embedded Linux distribution with the Yocto Project.
 
 -  **Yocto Project Overview and Concepts Manual:** The
    :doc:`/overview-manual/index` is a great
-- 
2.25.1


