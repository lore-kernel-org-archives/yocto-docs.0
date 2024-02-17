Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B4EC48BC4
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 11:07:17 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.7912.1708168036111354469
 for <docs@lists.yoctoproject.org>;
 Sat, 17 Feb 2024 03:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=HKjHWA3T;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id EEB03240029
	for <docs@lists.yoctoproject.org>; Sat, 17 Feb 2024 12:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708168034; bh=DK2NGbTjksg+LzVQOzyIQM3C7FGdiSz2aBC5K0OgAaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=HKjHWA3TtlHr7uEalHMy9maF9Tm/SAaLaXtCVpZ4iPU1zud51H3gyjzMZ2mQJK2gm
	 woBg0R6R0RnH4ku7wK/glS6O69MRArVtUGFHqlSwQ+IlGV98V8HQzWtPzZcC/HZCqu
	 pTsm4OtwKWHA7vhwcbNB+V1EKeNMmiLR4YtkrKVKhXufCupLpHXEsFIlxqT2kszpW6
	 CtzhOZsZQ3cQI6fLkecsEKiE5BnhhCQYvVU/2cfB51I7VJ21fbs7V3cW6ao68MhdD8
	 RmaAe6BoVvN5/fTlDQptuL8lD3rtmtFXxCgVpbTGUPpvPx2yKdhYyHLzaT7EbOmQYz
	 Esnaq+65JKxTg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TcQxD6nCTz6tw8;
	Sat, 17 Feb 2024 12:07:11 +0100 (CET)
From: simone.p.weiss@posteo.com
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2] bitbake: doc: Add section for variable context
Date: Sat, 17 Feb 2024 11:07:03 +0000
Message-Id: <20240217110704.49901-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 17 Feb 2024 11:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4840

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

This is inspired by the same section in the yocto-docs. It aims to provid=
e
information in what contexts(recipes, .conf, bbclass,...) a variable is u=
sually
used. For that I tried to group similar variables, so that a short overvi=
ew is
given. This was inspired by [YOCTO #14072], but of course does not implem=
ent a
warning if a variable is used in an unintended context.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 ...bake-user-manual-ref-variables-context.rst | 89 +++++++++++++++++++
 doc/index.rst                                 |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 doc/bitbake-user-manual/bitbake-user-manual-ref-varia=
bles-context.rst

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables-co=
ntext.rst b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables-con=
text.rst
new file mode 100644
index 00000000..8252889e
--- /dev/null
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables-context.r=
st
@@ -0,0 +1,89 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+****************
+Variable Context
+****************
+
+Variables might only have an impact or can be used in certain contexts. =
Some
+should only be used in global files like ``.conf``, while others are int=
ended only
+for local files like ``.bb``. This chapter aims to describe some importa=
nt variable
+contexts.
+
+.. _ref-varcontext-configuration:
+
+BitBake's own configuration
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+Variables starting with ``BB_`` usually configure the behaviour of BitBa=
ke itself.
+For example, one could configure:
+
+- System resources, like disk space to be used (:term:`BB_DISKMON_DIRS`)=
,
+  or the number of tasks to be run in parallel by BitBake (:term:`BB_NUM=
BER_THREADS`).
+
+- How the fetchers shall behave, e.g., :term:`BB_FETCH_PREMIRRORONLY` is=
 used
+  by BitBake to determine if BitBake's fetcher shall search only
+  :term:`PREMIRRORS` for files.
+
+Those variables are usually configured globally.
+
+BitBake configuration
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+There are variables:
+
+- Like :term:`B` or :term:`T`, that are used to specify directories used=
 by
+  BitBake during the build of a particular recipe. Those variables are
+  specified in ``bitbake.conf``. Some, like :term:`B`, are quite often
+  overwritten in recipes.
+
+- Starting with ``FAKEROOT``, to configure how the ``fakeroot`` command =
is
+  handled. Those are usually set by ``bitbake.conf`` and might get adapt=
ed in a
+  ``bbclass``.
+
+- Detailing where BitBake will store and fetch information from, for
+  data reuse between build runs like :term:`CACHE`, :term:`DL_DIR` or
+  :term:`PERSISTENT_DIR`. Those are usually global.
+
+
+Layers and files
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Variables starting with ``LAYER`` configure how BitBake handles layers.
+Additionally, variables starting with ``BB`` configure how layers and fi=
les are
+handled. For example:
+
+- :term:`LAYERDEPENDS` is used to configure on which layers a given laye=
r
+  depends.
+
+- The configured layers are contained in :term:`BBLAYERS` and files in
+  :term:`BBFILES`.
+
+Those variables are often used in the files ``layer.conf`` and ``bblayer=
s.conf``.
+
+Recipes and packages
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Variables handling recipes and packages can be split into:
+
+- :term:`PN`, :term:`PV` or :term:`PF` for example, contain information =
about
+  the name or revision of a recipe or package. Usually, the default set =
in
+  ``bitbake.conf`` is used, but those are from time to time overwritten =
in
+  recipes.
+
+- :term:`SUMMARY`, :term:`DESCRIPTION`, :term:`LICENSE` or :term:`HOMEPA=
GE`
+  contain the expected information and should be set specifically for ev=
ery
+  recipe.
+
+- In recipes, variables are also used to control build and runtime
+  dependencies between recipes/packages with other recipes/packages. The
+  most common should be: :term:`PROVIDES`, :term:`RPROVIDES`, :term:`DEP=
ENDS`,
+  and :term:`RDEPENDS`.
+
+- There are further variables starting with ``SRC`` that specify the sou=
rces in
+  a recipe like :term:`SRC_URI` or :term:`SRCDATE`. Those are also usual=
ly set
+  in recipes.
+
+- Which version or=C2=A0provider of a recipe should be given preference =
when
+  multiple recipes would provide the same item, is controlled by variabl=
es
+  starting with ``PREFERRED_``. Those are normally set in the configurat=
ion
+  files of a ``MACHINE`` or ``DISTRO``.
diff --git a/doc/index.rst b/doc/index.rst
index 3ff8b158..ee1660ac 100644
--- a/doc/index.rst
+++ b/doc/index.rst
@@ -13,6 +13,7 @@ BitBake User Manual
    bitbake-user-manual/bitbake-user-manual-intro
    bitbake-user-manual/bitbake-user-manual-execution
    bitbake-user-manual/bitbake-user-manual-metadata
+   bitbake-user-manual/bitbake-user-manual-ref-variables-context
    bitbake-user-manual/bitbake-user-manual-fetching
    bitbake-user-manual/bitbake-user-manual-ref-variables
    bitbake-user-manual/bitbake-user-manual-hello
--=20
2.39.2


