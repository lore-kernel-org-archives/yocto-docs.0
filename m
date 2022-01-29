Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BABC433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 02:26:08 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.1492.1643423166494245554
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 18:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=X7csu0Et;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643423167;
  x=1674959167;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ihQttyuc1khJM7nv8DS5pPVs6lvkOY/BaE6JHw0scuI=;
  b=X7csu0EtDaOjWK4gaWfIKiZVlnUxkMELHMPjkc4JmzgeLwWPlToO8VF0
   VMmoGB4jXT/nXBouDn8xR5SecD8xHhNEfeMNEHyttCu8CyDv/UdY5999r
   VJh4novJVXd7DPZP7TGtD6C3+epLsL5VDKl/guhB8IPQpfqa07D1MjtoV
   iPaTELmEzYt9eR09cywSXhxoJNl+b+FaegooRI3Nmjpbyf7kTpFc4nAMO
   +z1wpAI2sQecSTnFlT5Ommqlr2xvNnwwgd6lJI2OVfTB6EV7WcvVl/xU1
   3slzaBhQPRR/adWIM/+DCudy5fonLhVsZTNKUTS4+jrE2MtMD3kZes1ja
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH 1/2] manuals: Remove unnecessary \n from SSTATE_MIRRORS
 examples
Date: Sat, 29 Jan 2022 03:26:01 +0100
Message-ID: <20220129022602.17304-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 29 Jan 2022 02:26:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2452

Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
entries) there is no need to separate the entries in SSTATE_MIRRORS
with "\n".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/overview-manual/concepts.rst | 2 +-
 documentation/ref-manual/variables.rst     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 5698d93759..a6bd32a987 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1904,7 +1904,7 @@ Behind the scenes, the shared state code works by looking in
 shared state files. Here is an example::
 
    SSTATE_MIRRORS ?= "\
-       file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
+       file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
        file://.* file:///some/local/dir/sstate/PATH"
 
 .. note::
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b0621168ae..456d9ce098 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7198,7 +7198,7 @@ system and gives an overview of their function and contents.
       following maps the local search path ``universal-4.9`` to the
       server-provided path server_url_sstate_path::
 
-         SSTATE_MIRRORS ?= "file://universal-4.9/(.*) http://server_url_sstate_path/universal-4.8/\1 \n"
+         SSTATE_MIRRORS ?= "file://universal-4.9/(.*) http://server_url_sstate_path/universal-4.8/\1"
 
       If a mirror uses the same structure as
       :term:`SSTATE_DIR`, you need to add "PATH" at the
@@ -7207,7 +7207,7 @@ system and gives an overview of their function and contents.
       ::
 
          SSTATE_MIRRORS ?= "\
-             file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
+             file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
              file://.* file:///some-local-dir/sstate/PATH"
 
    :term:`SSTATE_SCAN_FILES`

