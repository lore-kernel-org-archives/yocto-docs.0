Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E2AC04FF8
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 18:28:03 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.1601.1713464882895309616
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 11:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id C919F11FBF;
	Thu, 18 Apr 2024 14:28:01 -0400 (EDT)
Received: from localhost.localdomain (unknown [24.75.208.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 289B61232C;
	Thu, 18 Apr 2024 14:28:01 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] release-notes: add a few more new features
Date: Thu, 18 Apr 2024 11:27:55 -0700
Message-Id: <cc26bc98e5e739c38641388aaeb5b9e23337eb08.1713464653.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713464653.git.bluelightning@bluelightning.org>
References: <cover.1713464653.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Apr 2024 18:28:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5167

Add some features I missed earlier (patchtest, Toaster, hash
equivalence enhancements, screenshot-based UI test,
USERADD_DEPENDS).

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/release-notes-5.0.rst    | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/docum=
entation/migration-guides/release-notes-5.0.rst
index 4bd9125d17..f53f5459af 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -25,6 +25,10 @@ New Features / Enhancements in 5.0
=20
    -  :term:`TARGET_DBGSRC_DIR`: specifies the target path to debug sour=
ce files
=20
+   -  :term:`USERADD_DEPENDS`: provides a way to declare dependencies on=
 the users
+      and/or groups created by other recipes, resolving a long-standing =
build
+      ordering issue
+
 -  Architecture-specific enhancements:
=20
    -  ``genericarm64``: a new :term:`MACHINE` to represent a 64-bit Gene=
ral Arm
@@ -155,6 +159,12 @@ New Features / Enhancements in 5.0
=20
 -  Testing:
=20
+   -  Move `patchtest` to the core (as ``scripts/patchtest``, test cases=
 under
+      ``meta/lib/patchtest/tests``) and make a number of improvements to=
 enable
+      it to validate patches submitted on the mailing list again. Additi=
onally,
+      make it work with the original upstream version of
+      `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`__.
+
    -  Add an optional ``unimplemented-ptest`` QA warning to detect upstr=
eam
       packages with tests, that do not use ptest.
=20
@@ -163,6 +173,9 @@ New Features / Enhancements in 5.0
=20
    -  ``oeqa``, ``oe-selftest``: add test cases for Maturin (SDK and run=
time).
=20
+   -  Proof-of-concept of screenshot-based runtime UI test
+      (``meta/lib/oeqa/runtime/cases/login.py``)
+
    -  Enable ptests for ``python3-attrs``, ``python3-pyyaml``, ``xz``
=20
 -  Utility script changes:
@@ -191,8 +204,6 @@ New Features / Enhancements in 5.0
       extra tasks if the system load is too high, especially in distribu=
tions
       where ``/proc/pressure`` is disabled.
=20
-   -  Add garbage collection to remove unused unihashes from the databas=
e.
-
    -  ``taskexp_ncurses``: add ncurses version of ``taskexp``, the depen=
dency
       explorer originally implemented with GTK.
=20
@@ -208,6 +219,17 @@ New Features / Enhancements in 5.0
    -  ``git-make-shallow`` script: add support for Git's ``safe.bareRepo=
sitory=3Dexplicit``
       configuration setting.
=20
+   -  Hash equivalence gained a number of scalability improvements inclu=
ding:
+
+      -  Support for a wide range of database backends through `SQLAlche=
my`
+
+      -  Support for hash equivalence server and client to communicate o=
ver websockets
+
+      -  Support for per-user permissions in the hashserver, and on the =
client side
+         specifying credentials via the environment or .netrc
+
+      -  Add garbage collection to remove unused unihashes from the data=
base.
+
 -  devtool improvements:
=20
    -  Introduce a new ``ide-sdk`` plugin to generate a configuration to =
use
@@ -255,6 +277,12 @@ New Features / Enhancements in 5.0
       incremental update can be configured with :term:`CVE_DB_INCR_UPDAT=
E_AGE_THRES`
       variable.
=20
+-  Toaster Web UI improvements:
+
+   - Numerous bugfixes, and additional input validation
+
+   - Add `pytest` support and add/update test cases
+
 -  Prominent documentation updates:
=20
    -  Documentation for using the new ``devtool ide-sdk`` command and fe=
atures.
--=20
2.25.1


