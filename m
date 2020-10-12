Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web12.34358.1602481466207934042
 for <docs@lists.yoctoproject.org>;
 Sun, 11 Oct 2020 22:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: naokihayama@lineo.co.jp)
Received: from naokihayama-desktop (unknown [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 6E9A38035CE48;
	Mon, 12 Oct 2020 14:44:24 +0900 (JST)
Received: by naokihayama-desktop (Postfix, from userid 1000)
	id 50DA450040FF; Mon, 12 Oct 2020 14:44:24 +0900 (JST)
From: "Naoki Hayama" <naoki.hayama@lineo.co.jp>
To: docs@lists.yoctoproject.org
Cc: Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [PATCH] sphinx: Fix typo
Date: Mon, 12 Oct 2020 14:44:15 +0900
Message-Id: <20201012054415.30242-1-naoki.hayama@lineo.co.jp>
X-Mailer: git-send-email 2.17.1

Fix some typos.
s/necesary/necessary/
s/overriden/overridden/

Signed-off-by: Naoki Hayama <naoki.hayama@lineo.co.jp>
---
 documentation/dev-manual/dev-manual-common-tasks.rst            | 2 +-
 documentation/ref-manual/ref-variables.rst                      | 2 +-
 .../test-manual/test-manual-understand-autobuilder.rst          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index bef8bf840..43fe972ef 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -9477,7 +9477,7 @@ been parsed. The variables include those from the configuration as well:
 
 In the output of ``bitbake -e``, each variable is preceded by a
 description of how the variable got its value, including temporary
-values that were later overriden. This description also includes
+values that were later overridden. This description also includes
 variable flags (varflags) set on the variable. The output can be very
 helpful during debugging.
 
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 316e8aabf..94e839926 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -4660,7 +4660,7 @@ system and gives an overview of their function and contents.
          MACHINEOVERRIDES =. "qemuall:"
 
       This
-      override allows variables to be overriden for all machines emulated
+      override allows variables to be overridden for all machines emulated
       in QEMU, like in the following example from the ``connman-conf``
       recipe:
       ::
diff --git a/documentation/test-manual/test-manual-understand-autobuilder.rst b/documentation/test-manual/test-manual-understand-autobuilder.rst
index de267776c..244433376 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.rst
+++ b/documentation/test-manual/test-manual-understand-autobuilder.rst
@@ -164,7 +164,7 @@ Cloning repositories from scratch each time they are required was slow
 on the Autobuilder. We therefore have a stash of commonly used
 repositories pre-cloned on the Workers. Data is fetched from these
 during clones first, then "topped up" with later revisions from any
-upstream when necesary. The cache is maintained by the Autobuilder
+upstream when necessary. The cache is maintained by the Autobuilder
 Worker Janitor. See :ref:`test-manual/test-manual-understand-autobuilder:Autobuilder Worker Janitor`.
 
 .. _test-autobuilder-worker-janitor:
-- 
2.17.1

