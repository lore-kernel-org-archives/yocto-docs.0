Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1098DCCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:43:00 +0000 (UTC)
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
 by mx.groups.io with SMTP id smtpd.web10.11017.1761759778898880167
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 10:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cxZMj3PprzVGd;
	Wed, 29 Oct 2025 18:42:57 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cxZMj0tJMzG7x;
	Wed, 29 Oct 2025 18:42:57 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 29 Oct 2025 18:42:42 +0100
Subject: [PATCH 3/3] dev-manual: debugging: use bitbake-getvar in Viewing
 Variable Values section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251029-bitbake-e-v1-3-c06ad212db9e@cherry.de>
References: <20251029-bitbake-e-v1-0-c06ad212db9e@cherry.de>
In-Reply-To: <20251029-bitbake-e-v1-0-c06ad212db9e@cherry.de>
To: docs@lists.yoctoproject.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 17:43:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7905

From: Quentin Schulz <quentin.schulz@cherry.de>

We should recommend using bitbake-getvar command wherever possible as
its output is much less confusing and overwhelming than bitbake -e.

Unfortunately, bitbake-getvar currently doesn't list Python tasks or
functions, unlike bitbake -e, so keep the latter for some corner cases.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/dev-manual/debugging.rst | 34 ++++++++++++++++++++--------=
------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-m=
anual/debugging.rst
index 6c45ccf65..9ee153d95 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -111,17 +111,17 @@ occurred in your project. Perhaps an attempt to :re=
f:`modify a variable
 <bitbake-user-manual/bitbake-user-manual-metadata:modifying existing
 variables>` did not work out as expected.
=20
-BitBake's ``-e`` option is used to display variable values after
-parsing. The following command displays the variable values after the
-configuration files (i.e. ``local.conf``, ``bblayers.conf``,
+BitBake's ``bitbake-getvar`` command is used to display variable values =
after
+parsing. The following command displays the variable value for :term:`OV=
ERRIDES`
+after the configuration files (i.e. ``local.conf``, ``bblayers.conf``,
 ``bitbake.conf`` and so forth) have been parsed::
=20
-   $ bitbake -e
+   $ bitbake-getvar OVERRIDES
=20
-The following command displays variable values after a specific recipe h=
as
-been parsed. The variables include those from the configuration as well:=
:
+The following command displays the value of :term:`PV` after a specific =
recipe
+has been parsed::
=20
-   $ bitbake -e recipename
+   $ bitbake-getvar -r recipename PV
=20
 .. note::
=20
@@ -135,19 +135,25 @@ been parsed. The variables include those from the c=
onfiguration as well::
    the recipe datastore, which means that variables set within one task
    will not be visible to other tasks.
=20
-In the output of ``bitbake -e``, each variable is preceded by a
-description of how the variable got its value, including temporary
-values that were later overridden. This description also includes
-variable flags (varflags) set on the variable. The output can be very
+In the output of ``bitbake-getvar``, the line containing the value of th=
e
+variable is preceded by a description of how the variable got its value,
+including temporary values that were later overridden. This description =
also
+includes variable flags (varflags) set on the variable. The output can b=
e very
 helpful during debugging.
=20
 Variables that are exported to the environment are preceded by
-``export`` in the output of ``bitbake -e``. See the following example::
+``export`` in the output of ``bitbake-getvar``. See the following exampl=
e::
=20
    export CC=3D"i586-poky-linux-gcc -m32 -march=3Di586 --sysroot=3D/home=
/ulf/poky/build/tmp/sysroots/qemux86"
=20
-In addition to variable values, the output of the ``bitbake -e`` and
-``bitbake -e``=C2=A0recipe commands includes the following information:
+Shell functions and tasks can also be inspected with the same mechanism:=
:
+
+   $ bitbake-getvar -r recipename do_install
+
+For Python functions and tasks, ``bitbake -e recipename`` can be used in=
stead.
+
+Moroever, the output of the ``bitbake -e`` and ``bitbake -e``=C2=A0recip=
e commands
+includes the following information:
=20
 -  The output starts with a tree listing all configuration files and
    classes included globally, recursively listing the files they include

--=20
2.51.0


