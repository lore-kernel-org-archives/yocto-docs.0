Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.5000.1631966240329431467
 for <docs@lists.yoctoproject.org>;
 Sat, 18 Sep 2021 04:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:58732 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mRYy8-00031Q-Jz
	for docs@lists.yoctoproject.org; Sat, 18 Sep 2021 07:57:18 -0400
Date: Sat, 18 Sep 2021 07:57:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: extend explanation of PACKAGE_DEBUG_SPLIT_STYLE
Message-ID: <b9acb74f-7823-f8cc-f6f4-9d45fd5dace8@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


The current explanation of this variable seems incomplete, so be a
bit more verbose to make sure the reader understands the packaging
possibilities.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5caada626..a46ea186e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5064,33 +5064,39 @@ system and gives an overview of their function and contents.
       ":ref:`package.bbclass <ref-classes-package>`" section.

    :term:`PACKAGE_DEBUG_SPLIT_STYLE`
-      Determines how to split up the binary and debug information when
-      creating ``*-dbg`` packages to be used with the GNU Project Debugger
-      (GDB).
-
-      With the :term:`PACKAGE_DEBUG_SPLIT_STYLE` variable, you can control
-      where debug information, which can include or exclude source files,
-      is stored:
-
-      -  ".debug": Debug symbol files are placed next to the binary in a
-         ``.debug`` directory on the target. For example, if a binary is
-         installed into ``/bin``, the corresponding debug symbol files are
-         installed in ``/bin/.debug``. Source files are placed in
-         ``/usr/src/debug``.
-
-      -  "debug-file-directory": Debug symbol files are placed under
-         ``/usr/lib/debug`` on the target, and separated by the path from
-         where the binary is installed. For example, if a binary is
-         installed in ``/bin``, the corresponding debug symbols are
-         installed in ``/usr/lib/debug/bin``. Source files are placed in
-         ``/usr/src/debug``.
-
-      -  "debug-without-src": The same behavior as ".debug" previously
-         described with the exception that no source files are installed.
-
-      -  "debug-with-srcpkg": The same behavior as ".debug" previously
-         described with the exception that all source files are placed in a
-         separate ``*-src`` pkg. This is the default behavior.
+      Determines how to split up and package debug and source information
+      when creating debugging packages to be used with the GNU Project
+      Debugger (GDB). In general, based on the value of this variable,
+      you can combine the source and debug info in a single package,
+      you can break out the source into a separate package that can be
+      installed independently, or you can choose to not have the source
+      packaged at all.
+
+      The possible values of :term:`PACKAGE_DEBUG_SPLIT_STYLE` variable:
+
+      -  "``.debug``": All debugging and source info is placed in a single
+         ``*-dbg`` package; debug symbol files are placed next to the
+         binary in a ``.debug`` directory so that, if a binary is installed
+         into ``/bin``, the corresponding debug symbol file is installed
+         in ``/bin/.debug``. Source files are installed in the same ``*-dbg``
+         package under ``/usr/src/debug``.
+
+      -  "``debug-file-directory``": As above, all debugging and source info
+         is placed in a single ``*-dbg`` package; debug symbol files are
+         placed entirely under the directory ``/usr/lib/debug`` and separated
+         by the path from where the binary is installed, so that if a binary
+         is installed in ``/bin``, the corresponding debug symbols are installed
+         in ``/usr/lib/debug/bin``, and so on. As above, source is installed
+         in the same package under ``/usr/src/debug``.
+
+      -  "``debug-with-srcpkg``": Debugging info is placed in the standard
+         ``*-dbg`` package as with the ``.debug`` value, while source is
+         placed in a separate ``*-src`` package, which can be installed
+         independently.  This is the default setting for this variable,
+         as defined in Poky's ``bitbake.conf`` file.
+
+      -  "``debug-without-src``": The same behavior as with the ``.debug``
+         setting, but no source is packaged at all.

       You can find out more about debugging using GDB by reading the
       ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) remotely`" section

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
