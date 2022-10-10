Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB4DC47080
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4266.1665393876804569002
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=rHm9T4q5;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 97CE32034CAB; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 97CE32034CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=bHl6mkL/+ViKepNBgPphFsxxlzzEkJuEnIa7a1jLSmU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rHm9T4q5xtTIgJrMiq8xthQyzlQJTfSiQW3pCU/sP648vZhdBPPcKxsu9eAmPGnR1
	 v6eBIu7gETWteltLyBtFrJG1r/E8O2eBsLRzw8FZfOa0ttJ7diRGIE8ZCq1g2RJb96
	 cgy2gkKmlJxk1sVdE2OutHVnZT5X6ghy/5QFFsQU=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 17/34] ref-manual: add info on buildtools-make-tarball
Date: Mon, 10 Oct 2022 02:24:03 -0700
Message-Id: 
 <ca1f1cd15307cd97fa4ccba564a7c8ba7f4f29e6.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3317

From: Paul Eggleton <paul.eggleton@microsoft.com>

This is not perfect, but at least covers the use case and the new
tarball that we are providing. Note that the --make-only option to
install-buildtools is a currently pending patch.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/system-requirements.rst | 26 +++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 014c9a5..d6545d6 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -222,8 +222,13 @@ resolve this by installing a ``buildtools-extended`` tarball that
 contains additional tools, the equivalent of the Debian/Ubuntu ``build-essential``
 package.
 
+For systems with a broken make version (e.g. make 4.2.1 without patches) but
+where the rest of the host tools are usable, you can use the ``buildtools-make``
+tarball instead.
+
 In the sections that follow, three different methods will be described for
-installing the ``buildtools`` or ``buildtools-extended`` toolset.
+installing the ``buildtools``, ``buildtools-extended`` or ``buildtools-make``
+toolset.
 
 Installing a Pre-Built ``buildtools`` Tarball with ``install-buildtools`` script
 --------------------------------------------------------------------------------
@@ -258,6 +263,13 @@ installer and automatically installs the tools for you:
       $ cd poky
       $ scripts/install-buildtools
 
+   Alternatively if your host development system has a broken ``make``
+   version such that you only need a known good version of ``make``,
+   you can use the ``--make-only`` option:
+
+      $ cd poky
+      $ scripts/install-buildtools --make-only
+
 2. Source the tools environment setup script by using a command like the
    following::
 
@@ -292,6 +304,10 @@ steps:
 
       $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
 
+   An example for the make-only installer::
+
+      $ sh ~/Downloads/x86_64-buildtools-make-nativesdk-standalone-&DISTRO;.sh
+
    During execution, a prompt appears that allows you to choose the
    installation directory. For example, you could choose the following:
    ``/home/your-username/buildtools``
@@ -337,6 +353,10 @@ installer:
 
       $ bitbake buildtools-extended-tarball
 
+   or to build the make-only tarball::
+
+      $ bitbake buildtools-make-tarball
+
    .. note::
 
       The :term:`SDKMACHINE` variable in your ``local.conf`` file determines
@@ -360,6 +380,10 @@ installer:
 
       $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
 
+   or for the make-only installer::
+
+      $ sh ~/Downloads/x86_64-buildtools-make-nativesdk-standalone-&DISTRO;.sh
+
    During execution, a prompt appears that allows you to choose the
    installation directory. For example, you could choose the following:
    ``/home/your_username/buildtools``
-- 
1.8.3.1


