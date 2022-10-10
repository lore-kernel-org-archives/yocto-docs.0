Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEE5C3A59D
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4268.1665393876874075270
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ndxTAYnw;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 5AC0C20EC338; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5AC0C20EC338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=Ai0E1kiSts6Bt63KD8Fpkk9gToGMDNCfbX+9g+pzPUw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ndxTAYnwFvVOaJnOBavUebph8Ejnx/79jEC7YWNbGdJPxqGoq4QBEOGUiT11Ekxxl
	 +P93X1sv5tWCIy80AS2Vcwvdo12qptEV7qCpsGP0kdCkZHyXbABoqRgjnSHV1d7pXP
	 GuPodLIMjTMQCWlkeA0yQtVoqBri2JhmN7GUVV28=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 12/34] ref-manual: add SDK_TOOLCHAIN_LANGS
Date: Mon, 10 Oct 2022 02:23:58 -0700
Message-Id: 
 <69782be19b894e094ad23f68bbd51570a20df274.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3313

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ab39fa8..0c6bd80 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6854,6 +6854,10 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
+   :term:`SDK_TOOLCHAIN_LANGS`
+      Specifies programming languages to support in the SDK, as a
+      space-separated list. Currently supported items are ``rust`` and ``go``.
+
    :term:`SDK_UPDATE_URL`
       An optional URL for an update server for the extensible SDK. If set,
       the value is used as the default update server when running
-- 
1.8.3.1


