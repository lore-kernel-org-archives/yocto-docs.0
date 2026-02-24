Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DC5F3C9B9
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:33:04 +0000 (UTC)
Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch [84.16.66.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24551.1771950777985246838
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 08:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=nYEl2QfM;
 spf=pass (domain: 0leil.net, ip: 84.16.66.171, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fL3DS1RjmzgXm;
	Tue, 24 Feb 2026 17:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1771950776;
	bh=CfYxGmPxIknzfbIgB2IxJDRQJtI4Dk3qfj2S9vBFgW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nYEl2QfMI8xN5I5FxLBxQekb/zKl+i12t2yS3cTJ1pEGGzmftk/DL56tbQRRiHcuR
	 eJNBebNEtHrw1VuKmx/0tZpAKO6NZ4AjNMP3cG9R0cLDrS4dQC/41gQpAvcdvldfnT
	 4My5kRmpSf5dZQufUmkQjMHO38cKeTlZTbEYqd+9vld0wLmUUy6XKLXqlxZ3fMjfQ/
	 3GfelYWfPxekF+RhyuqP9WdxVuIbDXayESTWbGqG50u75cbPTJDc0EiBpxRtKSXRU+
	 hGQgQmx8k82ISwWHvKXSodEiSLPQWZrWNZ+MySLlE3h1ibUC/Z2YfjQJkRnm0qmJtA
	 7JithyIProrsw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fL3DR5f6zzYQD;
	Tue, 24 Feb 2026 17:32:55 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 24 Feb 2026 17:32:36 +0100
Subject: [PATCH v5 1/4] Makefile: use python3 -m sphinx instead of
 sphinx-build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-fix-make-multi-target-v5-1-7ebf281618b4@cherry.de>
References: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
In-Reply-To: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 16:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8977

From: Quentin Schulz <quentin.schulz@cherry.de>

sphinx-build is a "script"[1][2] which is then made available on the
system as a binary, upon installing the sphinx package.

You can have multiple instances of sphinx installed, e.g. system-wide
via the traditional distro package manager or in a venv. In the case of
a venv, if you have sphinx already installed in your host system, source
the venv activate script and then install sphinx via pip inside the
venv, sphinx-build command will still point at the sphinx from the host
system. The work-around is either to run the venv activate script again,
run `hash -r` or `rehash` in your current shell, or call python3 -m
sphinx instead of the Python script.

Let's do the latter as it's the easiest/least-user-facing solution.

This works because python3 interpreter will be the one from the venv,
and it sets the appropriate paths for loading modules (use only packages
from the venv by default, or prefer them if --system-site-packages is
passed).

[1] https://github.com/sphinx-doc/sphinx/blob/v9.1.0/pyproject.toml#L99
[2] https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#creating-executable-scripts

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index e144a50b4..5d9fda501 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -4,7 +4,7 @@
 # You can set these variables from the command line, and also
 # from the environment for the first two.
 SPHINXOPTS     ?= -W --keep-going -j auto
-SPHINXBUILD    ?= sphinx-build
+SPHINXBUILD    ?= python3 -m sphinx
 # Release notes are excluded because they contain contributor names and commit messages which can't be modified
 VALEOPTS       ?= --no-wrap --glob '!migration-guides/release-notes-*.rst'
 SOURCEDIR      = .
@@ -16,8 +16,8 @@ DESTDIR        = final
 SVG2PNG        = rsvg-convert
 SVG2PDF        = rsvg-convert
 
-ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
-$(error "The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed")
+ifeq ($(shell if $(SPHINXBUILD) --version >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
+$(error "Sphinx was not found. Make sure you have it installed")
 endif
 
 # Put it first so that "make" without argument is like "make help".

-- 
2.53.0


