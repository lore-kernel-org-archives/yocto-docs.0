Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B849C38A2E
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4275.1665393876799544918
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Q1XnY40c;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 1EBF720EC328; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1EBF720EC328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=k4bQ7u+DbpGAp0EdP9C/YAyaWLYIZ+GXoWyhLYuymwc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q1XnY40cPSA1D2RhAzigqsfNT0kjIR0IhSodr8KzkGXaUHZMT/cvVIFXVCvCLvUwa
	 jnz0toWr9DyU8XE+4EjCJdbYlJ3sTmEPTxtnB00aykFhboKXO3cu24aI1QuyQ9djdB
	 qCgI61BAO5ENN/btSijfBav/+KvQe6pqEwqpSOOQ=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 07/34] ref-manual: add a note to ssh-server-dropbear feature
Date: Mon, 10 Oct 2022 02:23:53 -0700
Message-Id: 
 <3932338cd5958a3ca684b1a23a60f7dc0a985c40.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3311

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a note regarding the 4.1 change to add openssh-sftp-server as a
recommends from ssh-server-dropbear.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/features.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 5e853ca..9dc73db 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -322,6 +322,21 @@ these valid features is as follows:
 
 -  *ssh-server-dropbear:* Installs the Dropbear minimal SSH server.
 
+   .. note::
+
+      As of the 4.1 release, the ``ssh-server-dropbear`` feature also
+      recommends the ``openssh-sftp-server`` package, which by default
+      will be pulled into the image. This is because recent versions of
+      the OpenSSH ``scp`` client now use the SFTP protocol, and thus
+      require an SFTP server to be present to connect to. However, if
+      you wish to use the Dropbear ssh server `without` the SFTP server
+      installed, you can either remove ``ssh-server-dropbear`` from
+      ``IMAGE_FEATURES`` and add ``dropbear`` to :term:`IMAGE_INSTALL`
+      instead, or alternatively still use the feature but set
+      :term:`BAD_RECOMMENDATIONS` as follows::
+
+         BAD_RECOMMENDATIONS += "openssh-sftp-server"
+
 -  *ssh-server-openssh:* Installs the OpenSSH SSH server, which is more
    full-featured than Dropbear. Note that if both the OpenSSH SSH server
    and the Dropbear minimal SSH server are present in
-- 
1.8.3.1


