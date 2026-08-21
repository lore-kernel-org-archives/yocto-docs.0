Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FD6C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 08:25:52 +0000 (UTC)
Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch [83.166.143.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2993.1787300742338093109
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 01:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=VlD6xwZd;
 spf=pass (domain: 0leil.net, ip: 83.166.143.174, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hRD034rlKz62l;
	Fri, 21 Aug 2026 10:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1787300739;
	bh=QCypIh4oaPy6N+oKMHsWPpQQMhTARS9ILHa+gwlEqms=;
	h=From:Date:Subject:To:Cc:From;
	b=VlD6xwZdXT+aKs4rLsE0GuyAi0y3EcbzwDb6JDhJkq8ZmtCFcnEKMpAPD5nDuyfoC
	 zcM33hf3N1kCe2wi5ZuAzkynqaAmmnHinWzpDppIXTgVxL2yRef7pSK5LDYK7Usl26
	 PjrIWjKXMX51fqU4cEZpnDokwfICK3bE9ZRuROgGgtnFz5FPjXzwhnmwK/CqjTxiHf
	 NqXOQWB9igWD2omqAGCB1b4p5bJkROqL44MWCcY25SkO6GycLKrV/OqK68+hT7KYZV
	 0jMIKk4KsMP+Mth1znDHZW47a05qAV8WArttMuu7SFTCOXMWA9t3iVPCEe8cFcuEIz
	 /PPWb/SrLG0lg==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hRD0266FYzZ6X;
	Fri, 21 Aug 2026 10:25:38 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 21 Aug 2026 10:25:18 +0200
Subject: [PATCH] README: update instructions for installing vale and
 sphinx-lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-pipenv-vale-sphinx-lint-v1-1-f108b7e3e739@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1hPQCqV6lWEWVaNGJFMaLYJ4d
 zvj8i3+P0EpMim0xQmREit/JaN6FdDPXiZCHrLBlMaWzlQYOJAkTH4l1DCzHLiybGgaOza171z
 tLOQ6RBr5+J/fn8e6dwv1228H13UDU+Hf0XsAAAA=
X-Change-ID: 20260821-pipenv-vale-sphinx-lint-296f93ab8386
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 08:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10308

From: Quentin Schulz <quentin.schulz@cherry.de>

pip install won't work on recent Debian distros (and Debian-based ones
I'm assuming as well) and will suggest using pipx instead.

In any case, pip and pipx aren't actually that user-friendly to us for
the simple reason the instructions to build the documentation, c.f.
documentation/tools/host_packages_scripts/pip3_docs.sh, make use of a
virtual environment which doesn't have access to the host system's
Python modules (missing --system-site-packages). So you would need to
chose between building the docs and running vale/sphinx-lint but not
both at the same time.

Instead, update the instructions to use pipenv for stylecheck and
sphinx-lint make targets such that there's a setup in which one can
build the docs AND run those commands without doing some back and forth
between venvs or host packages and the venv.

Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Closes: https://lore.kernel.org/yocto-docs/959e65b6-e7eb-bcc3-992f-bed7276c8449@crashcourse.ca/
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/Pipfile |  2 ++
 documentation/README  | 27 +++++++++++++++++----------
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/documentation/Pipfile b/documentation/Pipfile
index 67fce078d..f415cbf3f 100644
--- a/documentation/Pipfile
+++ b/documentation/Pipfile
@@ -4,6 +4,8 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
+sphinx-lint = "*"
+vale = "*"
 
 [packages]
 sphinx = "*"
diff --git a/documentation/README b/documentation/README
index 4701357c3..a3301b662 100644
--- a/documentation/README
+++ b/documentation/README
@@ -119,6 +119,13 @@ dependencies in a virtual environment:
  $ pipenv install
  $ pipenv run make html
 
+Note: if you decide to use Pipenv for installing the dependencies, don't forget
+to prefix all the make commands below with "pipenv run ". The make commands
+which already start with "pipenv run " don't need to be prefixed a second time
+but require you to use Pipenv for them to run and aren't available when
+following the instructions from
+https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#required-packages-for-the-build-host.
+
 Style checking the Yocto Project documentation
 ==============================================
 
@@ -127,19 +134,19 @@ to validate the text style.
 
 To install Vale:
 
- $ pip install vale
+ $ pipenv install --dev
 
 To run Vale:
 
- $ make stylecheck
+ $ pipenv run make stylecheck
 
 Style checking the whole documentation might take some time and generate a
 lot of warnings/errors, thus one can run Vale on a subset of files or
 directories:
 
-  $ make stylecheck VALEDOCS=<file>
-  $ make stylecheck VALEDOCS="<file1> <file2>"
-  $ make stylecheck VALEDOCS=<dir>
+  $ pipenv run make stylecheck VALEDOCS=<file>
+  $ pipenv run make stylecheck VALEDOCS="<file1> <file2>"
+  $ pipenv run make stylecheck VALEDOCS=<dir>
 
 Lint checking the Yocto Project documentation
 =============================================
@@ -149,19 +156,19 @@ the project uses sphinx-lint (https://github.com/sphinx-contrib/sphinx-lint).
 
 To install sphinx-lint:
 
- $ pip install sphinx-lint
+ $ pipenv install --dev
 
 To run sphinx-lint:
 
- $ make sphinx-lint
+ $ pipenv run make sphinx-lint
 
 Lint checking the whole documentation might take some time and generate a
 lot of warnings/errors, thus one can run sphinx-lint on a subset of files
 or directories:
 
-  $ make sphinx-lint SPHINXLINTDOCS=<file>
-  $ make sphinx-lint SPHINXLINTDOCS="<file1> <file2>"
-  $ make sphinx-lint SPHINXLINTDOCS=<dir>
+  $ pipenv run make sphinx-lint SPHINXLINTDOCS=<file>
+  $ pipenv run make sphinx-lint SPHINXLINTDOCS="<file1> <file2>"
+  $ pipenv run make sphinx-lint SPHINXLINTDOCS=<dir>
 
 Checking for broken links in the Yocto Project documentation
 ============================================================

---
base-commit: 3660b8085a5e790c1ea8bf75236fff4b216fe19c
change-id: 20260821-pipenv-vale-sphinx-lint-296f93ab8386

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


